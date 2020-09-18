# frozen_string_literal: true

require 'json'
require 'stringio'

WORD = /[a-zA-Z_]\w*/

DECLARATION  = "declaration"
DEFINITION   = "definition"
FOOTER       = "footer"
SUB_TYPES    = "sub-types"
METHOD_CLASS = "class-methods"
METHOD_INSTN = "instance-methods"
MEMBERS      = "members"
CONSTANTS    = "constants"
VARIANTS     = "variants"

def must_be_after c_name, last, type, *set
	unless set.include? last
		set  = set.map do |v| v || "beginning" end.join ", "
		last = last || "beginning"
		raise "#{c_name}: #{type} must be after #{set} (was after #{last})"
	end
end

def mod_chapter chapter
	c_name    = "#{chapter["parent_names"].join ">"}>#{chapter["name"]}"
	c_content = chapter["content"]

	if c_content.include? "<!-- api-"
		pairs = c_content.split /<!-- api-([-a-z]+) -->/

		last = nil

		backlinks = {}
		output = String.new

		output << pairs.shift

		for type, content in pairs.each_slice 2
			case type
			when DECLARATION
				must_be_after c_name, last, type, nil
				output <<
					"<details><summary>Show declaration</summary>\n\n```csharp\n" <<
					content.strip <<
					"\n```\n</details>\n\n"
			when DEFINITION
				must_be_after c_name, last, type, nil, DECLARATION
				output << content
			when FOOTER
				output << content
			when SUB_TYPES
				must_be_after c_name, last, type, DEFINITION
				output <<
					"## Sub-Types\n\n" <<
					content
			when METHOD_CLASS, METHOD_INSTN, MEMBERS, CONSTANTS, VARIANTS
				after = [SUB_TYPES, DEFINITION]
				case type
				when METHOD_CLASS, VARIANTS
				when METHOD_INSTN
					after << METHOD_CLASS
				when MEMBERS
					after << METHOD_CLASS << METHOD_INSTN
				when CONSTANTS
					after << METHOD_CLASS << METHOD_INSTN << MEMBERS
				end
				must_be_after c_name, last, type, *after
				links = []
				pfx =
					case type
					when METHOD_CLASS, METHOD_INSTN then "mthd-"
					when MEMBERS,      CONSTANTS    then "memb-"
					when VARIANTS                   then "enum-"
					end
				title =
					case type
					when METHOD_CLASS then "Class Methods"
					when METHOD_INSTN then "Instance Methods"
					when MEMBERS      then "Instance Members"
					when CONSTANTS    then "Constants"
					when VARIANTS     then "Variants"
					end
				content.gsub! /\\#-((?:(?!-#).)+)-#/m do |_|
					match = $1.strip
					match.gsub! /^[^{}]+$/ do |match|
						%(<dd>\n\n#{match}\n\n</dd>)
					end
					match.gsub! /(.*){(#{WORD})}(.*)/ do |_|
						id = pfx + $2
						links.push [$2, "#" + id]
						%(<span id="#{id}"></span>\n<dt>\n<code class="language-csharp">\n\n#{$1}<a href="##{id}">#{$2}</a>#{$3}\n\n</code>\n</dt>)
					end
					%(<dl class="api">#{match}\n\n</dl>)
				end
				links = links.sort.map do |a|
					name = a[0]
					link = a[1]
					backlinks[name] = link
					%(<a href="#{link}">#{name}</a>)
				end
				output <<
					"## " << title << "\n\n" <<
					content <<
					"<details><summary>Overview of #{title.downcase}</summary><p>#{links.join ", "}</p></details>\n\n"
			else
				raise "#{c_name}: unknown api block #{type}"
			end

			last = type
		end

		output.gsub! /\\\[(#{WORD})\]/ do |_|
			if link = backlinks[$1]
				%([#{$1}](#{link}))
			else
				raise "#{c_name}: unknown backlink '#{$1}' in API documentation"
			end
		end

		chapter["content"] = output
	end

	for section in chapter["sub_items"]
		mod_chapter section["Chapter"]
	end
end

if ARGV == %w"supports html"
	exit 0
else
	data = JSON.parse STDIN.read
	meta = data[0]
	data = data[1]
	for section in data["sections"]
		mod_chapter section["Chapter"]
	end
	puts JSON.generate data
end

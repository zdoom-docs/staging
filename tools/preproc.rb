# frozen_string_literal: true

require 'json'
require 'stringio'

WORD = /[a-zA-Z_]\w*/

def mod_chapter chapter
	content = chapter["content"]

	if content.include? "<!-- api-"
		pairs = content.split /<!-- api-([-a-z]+) -->/

		backlinks = {}
		output = String.new

		output << pairs.shift

		for type, content in pairs.each_slice 2
			case type
			when "declaration"
				output <<
					"<details><summary>Show declaration</summary>\n\n```csharp\n" <<
					content.strip <<
					"\n```\n</details>\n\n"
			when "definition"
				output << content
			when "sub-types"
				output <<
					"## Sub-Types\n\n" <<
					content
			when "class-methods", "instance-methods", "constants", "members",
			     "variants"
				links = []
				pfx =
					case type
					when "class-methods", "instance-methods" then "mthd-"
					when "constants",     "members"          then "memb-"
					when "variants"                          then "enum-"
					end
				title =
					case type
					when "class-methods"    then "Class Methods"
					when "instance-methods" then "Instance Methods"
					when "constants"        then "Constants"
					when "members"          then "Instance Members"
					when "variants"         then "Variants"
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
				raise "unknown api block #{type}"
			end
		end
		output.gsub! /\\\[(#{WORD})\]/ do |_|
			if link = backlinks[$1]
				%([#{$1}](#{link}))
			else
				raise "unknown backlink '#{$1}' in API documentation"
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

# frozen_string_literal: true

require 'json'
require 'stringio'

WORD    = /[a-zA-Z_]\w*/
HEADING = /\s{,3}(\#{1,6})\s+(.+)\s*$/ # NOTE: does not match trailing #

API_PATTERN = /<!-- api-([-a-z]+) -->/
TOC_PATTERN = /<!-- (toc) -->/

DECLARATION  = "declaration"
DEFINITION   = "definition"
FOOTER       = "footer"
SUB_TYPES    = "sub-types"
METHOD_CLASS = "class-methods"
METHOD_INSTN = "instance-methods"
MEMBERS      = "members"
CONSTANTS    = "constants"
VARIANTS     = "variants"

Heading = Struct.new :level, :title, :link

def must_be_after c_name, last, type, *set
	unless set.include? last
		set  = set.map do |v| v || "beginning" end.join ", "
		last = last || "beginning"
		raise "#{c_name}: #{type} must be after #{set} (was after #{last})"
	end
end

def mod_chapter_pattern c_content, pattern
	pairs = c_content.split pattern

	output = String.new
	output.concat pairs.shift

	last = nil
	for match, content in pairs.each_slice 2
		result = yield content, match, last
		output.concat result
		last = match
	end

	output
end

def mod_chapter_api c_name, c_content
	backlinks = {}

	mod_chapter_pattern c_content, API_PATTERN do |content, type, last|
		case type
		when DECLARATION
			must_be_after c_name, last, type, nil
			<<~_end_
			<details><summary>Show declaration</summary>

			```csharp
			#{content.strip}
			```
			</details>

			_end_
		when DEFINITION
			must_be_after c_name, last, type, nil, DECLARATION
			content
		when FOOTER
			content
		when SUB_TYPES
			must_be_after c_name, last, type, DEFINITION
			<<~_end_
			## Sub-Types

			#{content}
			_end_
		when METHOD_CLASS, METHOD_INSTN, MEMBERS, CONSTANTS, VARIANTS
			after = [SUB_TYPES, DEFINITION]
			case type
			when METHOD_CLASS, VARIANTS
			when METHOD_INSTN
				after.push METHOD_CLASS
			when MEMBERS
				after.push METHOD_CLASS, METHOD_INSTN
			when CONSTANTS
				after.push METHOD_CLASS, METHOD_INSTN, MEMBERS
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
			content.gsub! /#-((?:(?!-#).)+)-#/m do |_|
				match = $1.strip
				match.gsub! /^[^{}]+$/ do |match|
					<<~_end_
					<dd>

					#{match}

					</dd>
					_end_
				end
				match.gsub! /(.*){(#{WORD})}(.*)/ do |_|
					id = pfx + $2
					links.push [$2, "#" + id]
					<<~_end_
					<span id="#{id}"></span>
					<dt>
					<code class="language-csharp">

					#{$1}<a href="##{id}">#{$2}</a>#{$3}

					</code>
					</dt>
					_end_
				end
				<<~_end_
				<dl class="api">#{match}

				</dl>
				_end_
			end
			links.sort!.map! do |a|
				name = a[0]
				link = a[1]
				backlinks[name] = link
				%(<a href="#{link}">#{name}</a>)
			end
			summary = "<summary>Overview of #{title.downcase}</summary>"
			<<~_end_
			## #{title}

			#{content}<details>#{summary}<p>#{links.join ", "}</p></details>

			_end_
		else
			raise "#{c_name}: unknown api block #{type}"
		end
	end.gsub /\\\[(#{WORD})\]/ do |_|
		if link = backlinks[$1]
			%([#{$1}](#{link}))
		else
			raise "#{c_name}: unknown backlink '#{$1}' in API documentation"
		end
	end
end

def mod_chapter_toc c_name, c_content
	mod_chapter_pattern c_content, TOC_PATTERN do |content, _, _|
		headings = []

		c_content.scan HEADING do |level, title|
			num  = headings.count do |hd| hd.title == title end
			link = title.downcase.gsub " ", "-"
			link = if num > 0 then link + "-#{num}" else link end
			hd   = Heading.new level.length - 1, title, link
			headings.push hd
		end

		output = String.new "<div class=toc>\n\n"

		for hd in headings
			if (level = hd.level - 1) >= 0
				output.concat "#{"   " * level}1. [#{hd.title}](##{hd.link})\n"
			end
		end

		output.concat "\n</div>\n"

		output + content
	end
end

def mod_chapter chapter
	c_name    = "#{chapter["parent_names"].join ">"}>#{chapter["name"]}"
	c_content = chapter["content"]

	if c_content.include? "<!-- api-"
		c_content = mod_chapter_api c_name, c_content
	end

	if c_content.include? "<!-- toc -->"
		c_content = mod_chapter_toc c_name, c_content
	end

	chapter["content"] = c_content

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

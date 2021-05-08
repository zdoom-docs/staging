# frozen_string_literal: true

require 'json'
require 'stringio'

WORD    = /[a-zA-Z_]\w*/
HEADING = /\s{,3}(\#{1,6})\s+(.+)\s*$/ # NOTE: does not match trailing #
API_PAT = /^<!-- api-([-a-z]+) -->$/
TOC_PAT = /^<!-- toc -->$/

DECLARTN = "declaration"
DEFINITN = "definition"
FOOTER   = "footer"
SUB_TYPS = "sub-types"
MTHD_CLS = "class-methods"
MTHD_INS = "instance-methods"
MEMBERS  = "members"
CONSTNTS = "constants"
VARIANTS = "variants"

Heading = Struct.new :level, :title, :link
Offset  = Struct.new :file, :line, :colu, :strn

def raise_ofs ofs, msg
	raise "#{ofs.file} line #{ofs.line}: #{msg}\n#{ofs.strn.chomp}\n#{" " * ofs.colu[0]}^#{"~" * (ofs.colu[1] - ofs.colu[0] - 1)}"
end

def must_be_after ofs, last, type, *set
	unless set.include? last
		set  = set.map do |v| v || "beginning" end.join ", "
		last = last || "beginning"
		raise_ofs ofs, "#{type} must be after #{set} (was after #{last})"
	end
end

def chapter_pat chapter, pattern
	output = String.new
	cur_dt = String.new
	cur_md = nil
	cur_ln = nil
	spring = Proc.new do ||
		if cur_md
			ofs = Offset.new chapter["path"], cur_ln, cur_md.offset(0), cur_md[0]
			output.concat yield cur_dt, cur_md[1], ofs
		end
		cur_dt.clear
	end

	for ln, lnum in chapter["content"].lines.each_with_index
		if (md = ln.match pattern)
			spring.()
			cur_ln = lnum + 1
			cur_md = md
		elsif cur_md
			cur_dt.concat ln
		else
			output.concat ln
		end
	end

	spring.()

	output
end

def mod_chapter_api chapter
	backlinks = {}
	last      = nil

	chapter["content"] = chapter_pat chapter, API_PAT do |ret, type, ofs|
		case type
		when DECLARTN
			must_be_after ofs, last, type, nil
			ret = <<~_end_
			<details><summary>Show declaration</summary>

			```zsc
			#{ret.strip}
			```
			</details>

			_end_
		when DEFINITN
			must_be_after ofs, last, type, nil, DECLARTN
		when FOOTER
			# nothing
		when SUB_TYPS
			must_be_after ofs, last, type, DEFINITN
			types = ret.split(",\n").map do |type| type.chomp end
			types.delete("")
			ret = types.reduce(%(<div class="toc types">\n\n)) do |s, type|
				s + "* <span class=code>[#{type}]</span>\n"
			end + "\n</div>\n\n"
		when MTHD_CLS, MTHD_INS, MEMBERS, CONSTNTS, VARIANTS
			after = [SUB_TYPS, DEFINITN]
			case type
			when MTHD_CLS, VARIANTS
			when MTHD_INS
				after.push MTHD_CLS
			when MEMBERS
				after.push MTHD_CLS, MTHD_INS
			when CONSTNTS
				after.push MTHD_CLS, MTHD_INS, MEMBERS
			end
			must_be_after ofs, last, type, *after
			links = []
			pfx =
				case type
				when MTHD_CLS, MTHD_INS then "mthd-"
				when MEMBERS,  CONSTNTS then "memb-"
				when VARIANTS           then "enum-"
				end
			title =
				case type
				when MTHD_CLS then "Class Methods"
				when MTHD_INS then "Instance Methods"
				when MEMBERS  then "Instance Members"
				when CONSTNTS then "Constants"
				when VARIANTS then "Variants"
				end
			ret.gsub! /#-((?:(?!-#).)+)-#/m do |_|
				match = $1.strip
				match.gsub! /^((?:(?!\{#{WORD}\}).|\n)+)$/ do |match|
					<<~_end_
					<dd>

					#{match.strip}

					</dd>
					_end_
				end
				match.gsub! /(.*){(#{WORD})}(.*)/ do |_|
					id = pfx + $2
					links.push [$2, "#" + id]
					<<~_end_
					<dt id="#{id}">
					<code class="language-zsc">

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
			links.sort!
			link_spans = links.map do |a|
				name = a[0]
				link = a[1]
				backlinks[name] = link
				%(<span class=code><a href="#{link}">#{name}</a></span>)
			end.join ", "
			link_refs = links.map do |a|
				"[#{a[0]}]: #{a[1]}\n"
			end.join
			summary = "<summary>Overview of #{title.downcase}</summary>"
			ret = <<~_end_
			## #{title}

			#{ret}<details>#{summary}<p>#{link_spans}</p></details>

			#{link_refs}
			_end_
		else
			raise_ofs ofs, "unknown api block '#{type}'"
		end
		last = type
		ret
	end
end

def mod_chapter_toc chapter
	headings = []

	chapter["content"].scan HEADING do |level, title|
		num  = headings.count do |hd| hd.title == title end
		link = title.downcase.gsub " ", "-"
		link = if num > 0 then link + "-#{num}" else link end
		hd   = Heading.new level.length - 1, title, link
		headings.push hd
	end

	chapter["content"] = chapter_pat chapter, TOC_PAT do |content|
		headings.reduce(%(<div class="toc contents">\n\n)) do |s, hd|
			if (level = hd.level - 1) >= 0
				s + "#{"   " * level}1. [#{hd.title}](##{hd.link})\n"
			else
				s
			end
		end + "\n</div>\n\n" + content
	end
end

def mod_chapter_lnk chapter
	chapter["content"].gsub! /\[`([a-zA-Z][a-zA-Z0-9._]*)`\]/ do |match|
		links = $1.split(".").map do |s| "[" + s + "]" end
		"<span class=code>#{links.join "."}</span>"
	end
end

def mod_chapter chapter
	mod_chapter_api chapter
	mod_chapter_toc chapter
	mod_chapter_lnk chapter

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

# frozen_string_literal: true

require 'json'

WORD    = /[a-zA-Z_]\w*/
HEADING = /^ {,3}(\#{1,6})\s+(.+)\s*$/
API_PAT = /^<!-- api-([-a-z]+) -->$/
TOC_PAT = /^<!-- toc -->$/
DBG_PAT = /^<!-- debug-print -->$/

API_DECL = /#-((?:(?!-#).)+)-#/m
API_SBLK = /#\{((?:(?!\}#).)+)\}#/m
API_NNAM = /^((?:(?!\{#{WORD}\}).|\n)+)$/
API_NAME = /(.*){(#{WORD})}(.*)/

CONSTNTS = "constants"
DECLARTN = "declaration"
DEFINITN = "definition"
FLAGS    = "flags"
FOOTER   = "footer"
MEMBERS  = "members"
MTHD_CLS = "class-methods"
MTHD_INS = "instance-methods"
PROPS    = "properties"
STATES   = "states"
SUB_TYPS = "sub-types"
VARIANTS = "variants"

Offset = Struct.new :file, :line, :colu, :strn

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
	last = nil

	chapter["content"] = chapter_pat chapter, API_PAT do |ret, type, ofs|
		case type
		when DECLARTN
			must_be_after ofs, last, type, nil
			ret = ret.strip
			raise_ofs ofs, "declaration must end with `;'" unless ret.end_with? ?;
			ret = <<~_end_
			<details><summary>Show declaration</summary>
			<pre><code class="language-zsc">#{ret.strip}</code></pre>
			</details>

			_end_
		when DEFINITN
			must_be_after ofs, last, type, nil, DECLARTN
		when SUB_TYPS
			must_be_after ofs, last, type, DEFINITN
			types = ret.split(",\n").map do |type| type.chomp end
			types.delete("")
			ret = %(<div class="toc types">\n\n) + types.map do |type|
				"* [`#{type}`]"
			end.join("\n") + "\n</div>\n\n"
		when
			MTHD_CLS,
			VARIANTS,
			MTHD_INS,
			MEMBERS,
			CONSTNTS,
			PROPS,
			FLAGS,
			STATES
			pri =
				case type
				when MTHD_CLS then 0
				when MTHD_INS then 1
				when MEMBERS  then 2
				when CONSTNTS then 3
				when PROPS    then 4
				when FLAGS    then 5
				when STATES   then 6
				when VARIANTS then 7
				end
			after = [SUB_TYPS, DEFINITN]
			after.push MTHD_CLS if pri > 0
			after.push MTHD_INS if pri > 1
			after.push MEMBERS  if pri > 2
			after.push CONSTNTS if pri > 3
			after.push PROPS    if pri > 4
			after.push FLAGS    if pri > 5
			after.push STATES   if pri > 6
			after.push VARIANTS if pri > 7
			must_be_after ofs, last, type, *after

			pfx =
				case type
				when MTHD_CLS, MTHD_INS then "mthd-"
				when MEMBERS,  CONSTNTS then "memb-"
				when PROPS,    FLAGS    then "prop-"
				when VARIANTS           then "enum-"
				when STATES             then "stat-"
				end
			title =
				case type
				when MTHD_CLS then "Class Methods"
				when VARIANTS then "Variants"
				when MTHD_INS then "Instance Methods"
				when MEMBERS  then "Instance Members"
				when PROPS    then "Properties"
				when FLAGS    then "Flags"
				when CONSTNTS then "Constants"
				when STATES   then "States"
				end

			links = []

			ret.gsub! API_SBLK do |_|
				slns = $1.lines
				slns.shift if slns.first == "\n"

				shead = slns.shift
				slns.shift if slns.first == "\n"

				sblk = slns.join

				<<~_end_
				<pre><code class="language-zsc">#{shead.strip}
				{</code></pre>
				#{sblk.strip}
				<pre><code class="language-zsc">} // #{shead.strip}</code></pre>
				_end_
			end if type == STATES

			ret.gsub! API_DECL do |_|
				match = $1.strip

				case type
				when STATES
					label = nil
					decl = String.new
					desc = nil
					for ln in match.lines
						ln = ln.chomp
						if ln == ""
							desc = String.new
						elsif desc != nil
							desc.concat ln, "\n"
						elsif label == nil
							label = ln.delete_suffix ":"
						else
							decl.concat ln, "\n"
						end
					end
					a = [label, {link: label, id: "state-" + label}]
					links.push a
					match = <<~_end_
					<dt id="#{a[1][:id]}">
					<pre><code class="language-zsc"><a href="##{a[1][:id]}">#{a[0]}</a>:
					#{decl.chomp}</code></pre>
					</dt>
					<dd>

					#{desc.strip}

					</dd>
					_end_
				else
					match.gsub! API_NNAM do |match|
						%(<dd>\n\n#{match.strip}\n\n</dd>)
					end
					match.gsub! API_NAME do |_|
						link = $2
						link = "b" + link if type == FLAGS
						id = pfx + link
						a = [$2, {link: link, id: id}]
						links.push a
						<<~_end_
						<dt id="#{a[1][:id]}">
						<code class="language-zsc">

						#{$1}<a href="##{a[1][:id]}">#{a[0]}</a>#{$3}

						</code>
						</dt>
						_end_
					end
				end
				%(<dl class="api">) + match + "\n\n</dl>"
			end

			links.sort!
			link_spans = links.map do |a| %(<code class="borderless"><a href="##{a[1][:id]}">#{a[0]}</a></code>) end.join ", "
			link_refs  = links.map do |a| "[#{a[1][:link]}]: ##{a[1][:id]}\n" end.join

			ret = <<~_end_
			## #{title}

			#{ret}<details><summary>Overview of #{title.downcase}</summary><p>#{link_spans}</p></details>

			#{link_refs}
			_end_
		when FOOTER
			# do nothing
		else
			raise_ofs ofs, "unknown api block '#{type}'"
		end
		last = type
		ret
	end
end

def mod_chapter_toc chapter
	hd_title = {}
	hd_order = []

	chapter["content"].scan HEADING do |level, title|
		num  = hd_title[title] && hd_title[title].count
		link = title.downcase.gsub " ", "-"
		link = if num then link + "-#{num}" else link end
		hd   = { level: level.length - 1, title: title, link: link }
		hd_title[title] = [] unless hd_title[title]
		hd_title[title].push hd
		hd_order.push hd
	end

	toc =
		hd_order.reduce(%(<div class="toc contents">\n\n)) do |s, hd|
			if (level = hd[:level] - 1) >= 0
				s + "#{"   " * level}1. [#{hd[:title]}](##{hd[:link]})\n"
			else
				s
			end
		end + "\n</div>\n\n"

	chapter["content"] = chapter_pat chapter, TOC_PAT do |content|
		toc + content
	end
end

def mod_chapter_lnk chapter
	chapter["content"].gsub! /\[`([a-zA-Z][a-zA-Z0-9._]*)`\]/ do |match|
		links = $1.split(".").map do |s| "[" + s + "]" end
		%(<code class="borderless">#{links.join "."}</code>)
	end
end

def mod_chapter_dbg chapter
	chapter["content"] = chapter["content"].sub DBG_PAT do |_|
		"\n\n" + chapter["content"].gsub(/^/, "\t")
	end
end

def mod_chapter chapter
	mod_chapter_api chapter
	mod_chapter_toc chapter
	mod_chapter_lnk chapter
	mod_chapter_dbg chapter

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

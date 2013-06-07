module TracksHelper

	def ugly_lyrics(lyrics)
		music = CGI.unescapeHTML('&#9835;')
		lines = lyrics.split("\r\n")
		new_lines = lines.map do |line|
			"#{music} #{h(line)}"
		end
		lyrs = new_lines.join('<br />')
		lyrs.html_safe
	end

end

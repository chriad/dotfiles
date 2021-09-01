#!/bin/bash
# bang-bang-conf 2021
/usr/local/bin/youtube-dl 'https://www.youtube.com/playlist?list=PLofFli6PGTsAwAglxHXhiHYwh3ZJf8QGX' --config-location <(echo "
-i
-c
-o '/media/chriad/lenovo/YOUTUBE-PLAYLISTS/%(channel)s/%(playlist)s-alt/%(title)s.%(ext)s'
--no-overwrites
--write-info-json
--write-thumbnail
--write-description
--add-metadata
--write-auto-sub
--sub-lang en
--metadata-from-title '%(playlist)s - (?P<title>.+) by (?P<artist>.+)'
--xattrs
--skip-download
--exec 'rename -d -e s/\!\!Con\ 2021\ \-// -e s/\ by// {}'
") 


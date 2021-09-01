#!/bin/bash
# Download playlist tracked by ytcc
/usr/local/bin/youtube-dl `ytcc -o xsv subscriptions -a name,url | grep 'Mastering'|cut -f2 -d','` --config-location <(echo "
-s
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


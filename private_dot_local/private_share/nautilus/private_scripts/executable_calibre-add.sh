IFS_BAK=$IFS
IFS="
"

for line in $NAUTILUS_SCRIPT_SELECTED_FILE_PATHS; do
    xattr=$(xattr -p user.xdg.origin.url "$line")
    if [[ -z $xattr ]]; then
      flatpak run --command=calibredb com.calibre_ebook.calibre add "$line"
    else
      flatpak run --command=calibredb com.calibre_ebook.calibre add --identifier=uri:"$xattr" "$line"
    fi
    gio trash "$line"
    notify-send $line

done

IFS=$IFS_BAK

IFS_BAK=$IFS
IFS="
"

for line in $NAUTILUS_SCRIPT_SELECTED_FILE_PATHS; do
    flatpak run --command=calibredb com.calibre_ebook.calibre add "$line"
    gio trash "$line"
    notify-send $line

done

IFS=$IFS_BAK

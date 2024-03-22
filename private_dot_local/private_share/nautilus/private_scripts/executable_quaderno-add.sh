IFS_BAK=$IFS
IFS="
"

for line in $NAUTILUS_SCRIPT_SELECTED_FILE_PATHS; do
    cp "${line}" /home/chriad/quaderno-todo/upload
    notify-send $line
done

IFS=$IFS_BAK

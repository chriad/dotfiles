IFS_BAK=$IFS
IFS="
"

for line in $NAUTILUS_SCRIPT_SELECTED_FILE_PATHS; do
  csvformat -t -D, "${line}" > "${line%txt}"csv
	# notify-send $line

done

IFS=$IFS_BAK

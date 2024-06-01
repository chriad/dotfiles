#!/usr/bin/env bash

# single song selected: select this file
# playlist selected: sync all in playlist
# select on album, push whole album, but without parent folder. To also sync folder, use adb-push-album-quodlibet.sh

# TODO check if android daemon connected over tcp/ip
output=$(/usr/lib/android-sdk/platform-tools/adb push --sync "${@}" /storage/emulated/0/Podcasts | tail -n 1)
notify-send -t 2000 --app-name="quodlibet" "adb push" "${output}"

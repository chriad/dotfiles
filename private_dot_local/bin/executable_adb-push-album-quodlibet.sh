#!/usr/bin/env bash

flatpak-spawn --host adb push --sync "${1}" /sdcard/Audiobooks

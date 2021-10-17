#!/bin/bash
# GPLv3 appears here
# gnu.org/licenses/gpl-3.0.md

# vars
SYMRC=.bashrc.d
SYMDIR=$HOME/$SYMRC
SYMFILE=flatpak_aliases

# exit on errors
set -e

# this is where the aliases lives
if [ ! -d $SYMDIR ]; then
    mkdir "${SYMDIR}"
    touch "${SYMDIR}"/"${SYMFILE}"
fi

sourcer() {
    echo 'Run this command to update your shell:'
    echo ". ${SYMDIR}/${SYMFILE}"
}

lister() {
    cat "${SYMDIR}"/"${SYMFILE}"
}

adder() {
    grep "alias ${ARG}\=" "${SYMDIR}"/"${SYMFILE}" && i=1
    [[ $VERBOSE ]] && echo "$i"

    if [ $i > 0 ]; then
        echo "Alias for ${ARG} already exists:"
        grep "alias ${ARG}=" "${SYMDIR}"/"${SYMFILE}"
        exit
    else
        echo "alias ${ARG}='${COMMAND}'" >> "${SYMDIR}"/"${SYMFILE}"
        [[ $VERBOSE ]] && echo "Alias for ${ARG} added"
        sourcer
    fi

    unset i
}

remover() {
    echo "Removing stuff."
    sed -i "/alias ${ARG}\=/d" "${SYMDIR}"/"${SYMFILE}"
    sourcer
}

# arg parse
while [ True ]; do
    if [ "$1" = "--help" -o "$1" = "-h" ]; then
        echo " "
        echo "$0 add --command 'flatpak run org.gnu.emacs' emacs \# create symlink for emacs"
        echo "$0 add --command 'flatpak run org.gnu.emacs -fs' emacs-fs \# create symlink for emacs in fullscreen"
        echo "$0 remove emacs \# remove emacs symlink"
        echo "$0 list         \# list all active flatpak symlinks"
        echo " "
        exit
    elif [ "$1" = "--verbose" -o "$1" = "-v" ]; then
        VERBOSE=1
        shift 1
    elif [ "$1" = "list" ]; then
        MODE="list"
        shift 1
    elif [ "$1" = "add" ]; then
        MODE="add"
        shift 1
    elif [ "$1" = "remove" ]; then
        MODE="remove"
        shift 1
    elif [ "$1" = "--command" -o "$1" = "-c" ]; then
        COMMAND="${2}"
        shift 2
    else
        break
    fi
done

#create array, retain spaces
ARG=( "${@}" )

case $MODE in
    add)
        adder
        ;;
    list)
        lister
        ;;
    remove)
        remover
        ;;
    *)
        echo "You must specify an action <list|add|remove>"
        exit 1
esac

# jar file is not executable
dra--update-epubcheck() {
    # no uninstall necessary, only new symlink
    p="/media/chriad/ext4/SOFTWARE"
    dra download --select "epubcheck-{tag}.zip" -o $p/epubcheck-current.zip w3c/epubcheck
    unzip $p/epubcheck-current.zip
    pa=`unzip -Z -1 epubcheck-current.zip "*/epubcheck.jar"`
    ln -sf $p/$pa ~/.local/bin/
    rm $p/epubcheck-current.zip
    # chmod +x ludusavi
    # mv ludusavi "$HOME"/.local/bin/
}

# dra--deb-release mcdope/pam_usb
dra--deb-release() {
    local repo="${1}"
    dra_untag=`dra untag $repo | sed 1d`
    dra download --output /media/chriad/ext4/SOFTWARE --select $dra_untag $repo
    # TODO
    # dpkg -i ...
}


# dra--update-anki() {
#     p="/media/chriad/ext4/SOFTWARE"
#     dra download --select "anki-{tag}-linux-qt6.tar.zst" -o $p/anki-current.tar.zst ankitects/anki
#     unzip $p/epubcheck-current.zip
#     pa=`unzip -Z -1 epubcheck-current.zip "*/epubcheck.jar"`
#     ln -sf $p/$pa ~/.local/bin/
#     rm $p/epubcheck-current.zip
#     # chmod +x ludusavi
#     # mv ludusavi "$HOME"/.local/bin/
# }

# jar file is not executable
dra--update-epubcheck() {
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

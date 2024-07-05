epub--subchaps() {
# epub--subchaps "<h3" 30dbcc04-39fd-11ef-99bd-1f6b256040d8.epub
    zipgrep "${1}" "${2}"
}

epub--remove-blank-beginners() {
    grep -v "^ .*" "${1}"
}

epub--sort() {
    dos2unix "${1}"
    csplit \
        --quiet \
        --prefix=split- \
        --suffix-format=%02d.txt \
        --suppress-matched \
        "${1}" /^$/ {*}
    rm "${1}"
    for f in *.txt ; do head -n 1 "${f}" >> 1.txt; echo "${f}" >> 2.txt; done
    x=`paste 1.txt 2.txt | sort -k1 | cut -f2 | tr '\n' ' '`
    for i in $x;do cat $i >> output.txt;done
    rm 1.txt 2.txt split-*
    sed -i '/^[[:space:]]*$/d' output.txt
    sed -i 's/.*\(\.xhtml:\|\.html:\)[ \t]*//g' output.txt
    links2 -dump output.txt | egrep -v '^$' > res.txt
}

links2--textify-html-toc() {
    # toc downloaded as html node
    links2 -dump "${1}" | egrep -v '^$' | sed -e 's/^[ \t]*//' | grep --only-matching --extended-regexp "^[0-9]{1,2}.*"
}

chdump() {
    links2 -dump "${1}" > chapters.txt
    cp chapters.txt chaps.txt
}

sed--remove-leading-whitespaces() {
    sed -e 's/^[ \t]*//' "${1}"
}

sed--remove-empty-lines() {
    sed '/^[[:space:]]*$/d'
}

epub--sed-remove-epubzip-file-prefix() {
    sed 's/.*\(\.xhtml:\|\.html:\)[ \t]*//g'
}

epub--list-file-sizes() {
    zipinfo -l --h --t "${1}" |tr -s ' ' | cut -f4 -d' ' |sort -n|numfmt --to=iec-i
}

# use in top book dir in calibre
epub--extract-images-here() {
    unzip -j "${1}" OEBPS/images/* -d data/IMAGES
}

epub--subchaps-pipeline() {
    # epub--subchaps-pipeline "<h3" <file.epub>
    epub--subchaps "${1}" "${2}" | epub--sed-remove-epubzip-file-prefix | html2text -style pretty | sed--remove-empty-lines
    
}

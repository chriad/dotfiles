# helper
pdf--cpdf-dumped-toc-to-txt() {
    csvcut -c 2 -d" " -q'"' -p, "${1}"
}

# pdf--toc-to-chaps <file.pdf>
pdf--toc-to-chaps() {
    cpdf -list-bookmarks "${1}" | csvcut -c 2 -d" " -q'"' -p, > chaps.txt
    
}

pdftk--d() {
    pdf="$1"
    pdftk "$pdf" dump_data_utf8 >"${pdf%pdf}"outline.txt
}

pdftk--u() {
    pdf="$1"
    pdftk "$pdf" update_info_utf8 "${pdf%pdf}"outline.txt output "${pdf%pdf}"out.pdf
}


pdf--pdftoc2txt() {
    env _JAVA_AWT_WM_NONREPARENTING=1 java -jar /home/chriad/.local/bin/pdfbox-app-3.0.0-alpha2.jar export:text --input="${1}"
}

# --objstm          parse stream of /ObjStm objects
pdf--pdfid-objstm() { pdf-parser.py --type /ObjStm --filter --raw "$1" | pdfid.py --force; }

pdf--extract-cover() {
    convert -thumbnail x300 -background white -alpha remove "${1}"[0] cover.png
}

pdf--thumbnail() {
    pdftoppm -f 1 -l 1 -scale-to 1024 -png  $1 thumb
}

# pdfx--extract-urls ()
# {
#     pdfx -v "$1" -o urls.txt
# }

# TODO combine with jq and fzf and invoke firefox on candidate
pdfx--browse-refs-json() {
    pdfx -v --json "${1}" |jid '.references'
}

# TODO first -remove-annotations from target?
cpdf--graft-annots() {
    source="$1"
    target="$2"
    cpdf -copy-annotations "$source" "$target" -o "${target%pdf}"grafted.pdf
}

cpdf--dump-annot-to-file() {
    pdf="$1"
    cpdf -list-annotations-json "$pdf" > "${pdf%pdf}"annots.json
}

cpdf--repair() {
    pdf="${1}"
    cpdf "${pdf}" -gs gs -gs-malformed-force -o "${pdf%pdf}"repaired.pdf
}

ocrmypdf--rasterize() {
    pdf="${1}"
    ocrmypdf --tesseract-timeout 0 --force-ocr "${pdf}" "${pdf%pdf}"rasterized.pdf
    
}

ocrmypdf--gartenfreund() {
    pdf="$1"
    ocrmypdf -l deu --force-ocr "$pdf" "${pdf%pdf}"ocr.pdf
}

ocrmypdf--unjbig2() {
    pdf="$1"
    ocrmypdf --optimize 0 --skip-text "${pdf}" "${pdf%pdf}"no-jbig2.pdf
}

pdf--convert-grayscale() {
    # https://superuser.com/questions/104656/convert-a-pdf-to-greyscale-on-the-command-line-in-floss
    source="$1"
    ghostscript \
        -dAutoRotatePages=/None \
        -sOutputFile="${source%pdf}greyscaled".pdf \
        -sDEVICE=pdfwrite \
        -sColorConversionStrategy=Gray \
        -dProcessColorModel=/DeviceGray \
        -dCompatibilityLevel=1.4 \
        -dNOPAUSE \
        -dBATCH \
        "$source"
}

pdf--drop-pdfimages () {
    # pdfimages -all -p -f 11 -l 30 <file>.pdf ./images/image-
    mkdir images
    pdfimages -p "$1" ./images/image-
}

pdf--thumbnail() {
    pdftoppm -f 1 -l 1 -scale-to 1024 -png  $1 thumb
}


pdf--cpdf-extract-images() {
    mkdir -p cpdf-extracted-images
    cpdf -extract-images "${1}" -im magick -o cpdf-extracted-images/%%%
}

# termpdf--preview-page() {
#     pdfgrep --with-filename --page-number --ignore-case --recursive "${1}" |fzf --delimiter : --nth 1 --nth 2 --preview='termpdf -n {2} {1}'
#     }

pdf--extract-image-pages() {
    # do not convert any images, write all in native format
    pdf="${1}"
    start="${2}"
    end="${3}"
    if [ -n "${3}"]; then end=$start; fi
    pdfimages -f $start -l $end -j -jp2 -jbig2 -ccitt -p "${pdf}" "${pdf%pdf}"
}

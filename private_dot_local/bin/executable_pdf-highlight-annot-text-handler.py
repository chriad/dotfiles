#!/usr/bin/env python

import fitz
import argparse
# from PIL import Image

parser = argparse.ArgumentParser(
                    description='Extract highlighted text from a pdf.')

parser.add_argument('infile')
args = parser.parse_args()

doc = fitz.open(args.infile)

pages = doc.pages() # generator
[print(str.replace(p.get_text(sort=True,clip=annot.rect), "\n\n", "　") + '\t') for p in doc.pages() for annot in p.annots()]

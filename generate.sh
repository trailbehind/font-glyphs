#!/bin/bash
set -e

for family in fonts/*; do
  for f in $family/*.ttf; do
    echo "Generating glyphs for $f"
    tmpdir=`mktemp -d`
    ./node_modules/.bin/build-glyphs $f $tmpdir

    style=`basename $f .ttf | cut -d - -f2`
    style_dir="glyphs/`basename $family`/$style"
    mkdir -p $style_dir
    mv $tmpdir/* $style_dir
  done
done


mkdir glyphs-merged

BASE_FONT=glyphs/Arimo
for weight in "Regular" "Bold" "BoldItalic" "Italic"; do
#copy glyphs from base, if file is has data
  mkdir glyphs-merged/$weight
  for i in $BASE_FONT/$weight/*; do
    SIZE=`du -k $i | cut -f1`
    if (( $SIZE > 4 )); then
      echo using base $i
      cp $i glyphs-merged/$weight/
    fi
  done

#Now fill in glyphs from fallback fonts
  for s in glyphs/noto glyphs/noto-i18n; do
    if [ -e $s/$weight ]; then
      for i in $s/$weight/*; do
        if [ ! -f glyphs-merged/$weight/`basename "$i"` ]; then
          SIZE=`du -k $i | cut -f1`
          if (( $SIZE > 4 )); then
            echo using fallback $i
            cp $i glyphs-merged/$weight/
          fi
        fi
      done
    fi
  done

#now fill in any missing glyphs from base
  for i in $BASE_FONT/$weight/*; do
    SIZE=`du -k $i | cut -f1`
    if [ ! -f glyphs-merged/$weight/`basename "$i"` ]; then
      echo using fillin $i
      cp $i glyphs-merged/$weight/
    fi
  done
done

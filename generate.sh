#!/bin/bash
set -e

for family in fonts/*; do
  for f in $family/*.ttf; do
    tmpdir=`mktemp -d`
    ./node_modules/.bin/build-glyphs $f $tmpdir

    pushd "$tmpdir"
    for i in *.pbf; do
      SIZE=`du -k $i | cut -f1`
      if (( $SIZE <= 4 )); then
        # echo removing $f/$i
        rm $i
      fi
    done
    popd

    style=`basename $f .ttf | cut -d - -f2`
    style_dir="glyphs/`basename $family`/$style"
    mkdir -p $style_dir
    mv $tmpdir/* $style_dir
  done
done


mkdir glyphs-merged

BASE_FONT=glyphs/Arimo
for weight in "Regular" "Bold" "BoldItalic" "Italic"; do
  cp -r $BASE_FONT/$weight glyphs-merged
  for s in glyphs/noto glyphs/noto-i18n; do
    if [ -e $s/$weight ]; then
      for i in $s/$weight/*; do
        if [ ! -f glyphs-merged/$weight/`basename "$i"` ]; then
          echo using $i
          cp $i glyphs-merged/$weight/
        fi
      done
    fi
  done
done

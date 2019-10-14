#!/bin/bash
set -e

# Generate glyphs for noto, which is used as fallback for all other font families
if [ ! -e glyphs-noto ]; then
  for weight in "Regular" "Bold" "BoldItalic" "Italic"; do
    for f in noto/unhinted/NotoSans*-${weight}.ttf; do
      # skip ui variants
      if [[ $f =~ (.*)UI-${weight}.ttf ]]; then
        echo skipping $f
        continue
      fi
      echo "Generating glyphs for $f"
      tmpdir=`mktemp -d`
      ./node_modules/.bin/build-glyphs $f $tmpdir
      style=`basename $f .ttf | cut -d - -f2`
      style_dir="glyphs-noto/$style"
      mkdir -p $style_dir
      for i in $tmpdir/*.pbf; do
        SIZE=`du -k $i | cut -f1`
        if (( $SIZE > 4 )); then
          mv $i $style_dir
        fi
      done # *.pbf
    done # *${weight}.ttf
  done # weight
fi

# Generate glyphs for all font families
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

# Remove merged glyphs so they can be regenerated
if [ -e glyphs-merged ]; then
  rm -rf glyphs-merged
fi

# Merge fallback into main font
for BASE_PATH in glyphs/*; do
  FAMILY=`basename $BASE_PATH`
  for WEIGHT in "Regular" "Bold" "BoldItalic" "Italic"; do
    if [ ! -d ${BASE_PATH}/${WEIGHT} ]; then
      echo "${FAMILY}/${WEIGHT} does not exist, skipping"
      continue
    fi
  #copy glyphs from base, if file has data
    mkdir -p glyphs-merged/${FAMILY}-${WEIGHT}
    for i in $BASE_PATH/${WEIGHT}/*.pbf; do
      SIZE=`du -k $i | cut -f1`
      if (( $SIZE > 4 )); then
        echo using base $i
        cp $i glyphs-merged/${FAMILY}-${WEIGHT}/
      fi
    done
  #Now fill in glyphs from fallback fonts
    if [ -e glyphs-noto/${WEIGHT} ]; then
      for i in glyphs-noto/${WEIGHT}/*.pbf; do
        if [ ! -f glyphs-merged/${FAMILY}-${WEIGHT}/`basename "$i"` ]; then
          SIZE=`du -k $i | cut -f1`
          if (( $SIZE > 4 )); then
            echo using fallback $i
            cp $i glyphs-merged/${FAMILY}-${WEIGHT}
          fi
        fi
      done
    fi
  #now fill in any missing glyphs from base
    for i in $BASE_PATH/${WEIGHT}/*; do
      SIZE=`du -k $i | cut -f1`
      if [ ! -f glyphs-merged/${FAMILY}-${WEIGHT}/`basename "$i"` ]; then
        echo using fillin $i
        cp $i glyphs-merged/${FAMILY}-${WEIGHT}/
      fi
    done
  done # for WEIGHT
done # for BASE_PATH

# Arimo is special
for WEIGHT in "Regular" "Bold" "BoldItalic" "Italic"; do
  mv glyphs-merged/arimo-${WEIGHT} glyphs-merged/${WEIGHT}
done

#!/bin/bash
set -e

mkdir -p \
  "glyphs/Arimo/Regular" \
  "glyphs/Arimo/Bold" \
  "glyphs/Arimo/Bold Italic" \
  "glyphs/Arimo/Italic" \
  "glyphs/Noto Sans/Bold" \
  "glyphs/Noto Sans/Bold Italic" \
  "glyphs/Noto Sans/Italic" \
  "glyphs/Noto Sans/Regular"

./node_modules/.bin/build-glyphs fonts/arimo/Arimo-Regular.ttf                       "glyphs/Arimo/Regular"
./node_modules/.bin/build-glyphs fonts/arimo/Arimo-Bold.ttf                          "glyphs/Arimo/Bold"
./node_modules/.bin/build-glyphs fonts/arimo/Arimo-BoldItalic.ttf                    "glyphs/Arimo/Bold Italic"
./node_modules/.bin/build-glyphs fonts/arimo/Arimo-Italic.ttf                        "glyphs/Arimo/Italic"
./node_modules/.bin/build-glyphs fonts/noto/hinted/NotoSans-Bold.ttf                 "glyphs/Noto Sans/Bold"
./node_modules/.bin/build-glyphs fonts/noto/hinted/NotoSans-BoldItalic.ttf           "glyphs/Noto Sans/Bold Italic"
./node_modules/.bin/build-glyphs fonts/noto/hinted/NotoSans-Italic.ttf               "glyphs/Noto Sans/Italic"
./node_modules/.bin/build-glyphs fonts/noto/hinted/NotoSans-Regular.ttf              "glyphs/Noto Sans/Regular"

for f in glyphs/*/*; do
  pushd "$f"
  for i in *.pbf; do
    SIZE=`du -k $i | cut -f1`
    if (( $SIZE <= 4 )); then
      echo removing $f/$i
      rm $i
    fi
  done
  popd
done

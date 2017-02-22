set -e

mkdir -p \
  "glyphs/Arimo Regular" \
  "glyphs/Arimo Bold" \
  "glyphs/Arimo Bold Italic" \
  "glyphs/Arimo Italic" \
  "glyphs/Noto Sans Bold" \
  "glyphs/Noto Sans Bold Italic" \
  "glyphs/Noto Sans Italic" \
  "glyphs/Noto Sans Regular"

./node_modules/.bin/build-glyphs fonts/arimo/Arimo-Regular.ttf                       "glyphs/Arimo Regular"
./node_modules/.bin/build-glyphs fonts/arimo/Arimo-Bold.ttf                          "glyphs/Arimo Bold"
./node_modules/.bin/build-glyphs fonts/arimo/Arimo-BoldItalic.ttf                    "glyphs/Arimo Bold Italic"
./node_modules/.bin/build-glyphs fonts/arimo/Arimo-Italic.ttf                        "glyphs/Arimo Italic"
./node_modules/.bin/build-glyphs fonts/noto/hinted/NotoSans-Bold.ttf                 "glyphs/Noto Sans Bold"
./node_modules/.bin/build-glyphs fonts/noto/hinted/NotoSans-BoldItalic.ttf           "glyphs/Noto Sans Bold Italic"
./node_modules/.bin/build-glyphs fonts/noto/hinted/NotoSans-Italic.ttf               "glyphs/Noto Sans Italic"
./node_modules/.bin/build-glyphs fonts/noto/hinted/NotoSans-Regular.ttf              "glyphs/Noto Sans Regular"

cp fonts/arimo/LICENSE.txt "glyphs/Arimo Regular"
cp fonts/arimo/LICENSE.txt "glyphs/Arimo Bold"
cp fonts/arimo/LICENSE.txt "glyphs/Arimo Bold Italic"
cp fonts/arimo/LICENSE.txt "glyphs/Arimo Italic"
cp fonts/noto/LICENSE   "glyphs/Noto Sans Bold"
cp fonts/noto/LICENSE   "glyphs/Noto Sans Bold Italic"
cp fonts/noto/LICENSE   "glyphs/Noto Sans Italic"
cp fonts/noto/LICENSE   "glyphs/Noto Sans Regular"

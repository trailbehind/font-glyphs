set -e

mkdir -p \
  "glyphs/Roboto Black" \
  "glyphs/Roboto Black" \
  "glyphs/Roboto Black Italic" \
  "glyphs/Roboto Bold" \
  "glyphs/Roboto Bold Italic" \
  "glyphs/Roboto Italic" \
  "glyphs/Roboto Light" \
  "glyphs/Roboto Light Italic" \
  "glyphs/Roboto Medium" \
  "glyphs/Roboto Medium Italic" \
  "glyphs/Roboto Regular" \
  "glyphs/Roboto Thin" \
  "glyphs/Roboto Thin Italic" \
  "glyphs/Roboto Condensed Bold" \
  "glyphs/Roboto Condensed Bold Italic" \
  "glyphs/Roboto Condensed Italic" \
  "glyphs/Roboto Condensed Light" \
  "glyphs/Roboto Condensed Light Italic" \
  "glyphs/Roboto Condensed Regular"

./node_modules/.bin/build-glyphs fonts/roboto/hinted/Roboto-Black.ttf                "glyphs/Roboto Black"
./node_modules/.bin/build-glyphs fonts/roboto/hinted/Roboto-BlackItalic.ttf          "glyphs/Roboto Black Italic"
./node_modules/.bin/build-glyphs fonts/roboto/hinted/Roboto-Bold.ttf                 "glyphs/Roboto Bold"
./node_modules/.bin/build-glyphs fonts/roboto/hinted/Roboto-BoldItalic.ttf           "glyphs/Roboto Bold Italic"
./node_modules/.bin/build-glyphs fonts/roboto/hinted/Roboto-Italic.ttf               "glyphs/Roboto Italic"
./node_modules/.bin/build-glyphs fonts/roboto/hinted/Roboto-Light.ttf                "glyphs/Roboto Light"
./node_modules/.bin/build-glyphs fonts/roboto/hinted/Roboto-LightItalic.ttf          "glyphs/Roboto Light Italic"
./node_modules/.bin/build-glyphs fonts/roboto/hinted/Roboto-Medium.ttf               "glyphs/Roboto Medium"
./node_modules/.bin/build-glyphs fonts/roboto/hinted/Roboto-MediumItalic.ttf         "glyphs/Roboto Medium Italic"
./node_modules/.bin/build-glyphs fonts/roboto/hinted/Roboto-Regular.ttf              "glyphs/Roboto Regular"
./node_modules/.bin/build-glyphs fonts/roboto/hinted/Roboto-Thin.ttf                 "glyphs/Roboto Thin"
./node_modules/.bin/build-glyphs fonts/roboto/hinted/Roboto-ThinItalic.ttf           "glyphs/Roboto Thin Italic"
./node_modules/.bin/build-glyphs fonts/roboto/hinted/RobotoCondensed-Bold.ttf        "glyphs/Roboto Condensed Bold"
./node_modules/.bin/build-glyphs fonts/roboto/hinted/RobotoCondensed-BoldItalic.ttf  "glyphs/Roboto Condensed Bold Italic"
./node_modules/.bin/build-glyphs fonts/roboto/hinted/RobotoCondensed-Italic.ttf      "glyphs/Roboto Condensed Italic"
./node_modules/.bin/build-glyphs fonts/roboto/hinted/RobotoCondensed-Light.ttf       "glyphs/Roboto Condensed Light"
./node_modules/.bin/build-glyphs fonts/roboto/hinted/RobotoCondensed-LightItalic.ttf "glyphs/Roboto Condensed Light Italic"
./node_modules/.bin/build-glyphs fonts/roboto/hinted/RobotoCondensed-Regular.ttf     "glyphs/Roboto Condensed Regular"

cd glyphs
tar -czvf Roboto.tar.gz Roboto*
cd -
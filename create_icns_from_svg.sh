#!/bin/zsh

if [ "$#" -ne 2 ]; then
 echo "Incorrect Arguments, Usage: $0 /path/to/icon.svg name"
 exit 1
fi

SVG_PATH="$1"
NAME="$2"

mkdir -p $NAME.iconset

declare -A SIZES=(
 ["icon_16x16.png"]="16"
 ["icon_16x16@2x.png"]="32"
 ["icon_32x32.png"]="32"
 ["icon_13x32@2x.png"]="64"
 ["icon_128x128.png"]="128"
 ["icon_128x128@2x.png"]="256"
 ["icon_256x256.png"]="256"
 ["icon_256x256@2x.png"]="512"
 ["icon_512x512.png"]="512"
 ["icon_512x512@2x.png"]="1024"
)

for filename size in ${(kv)SIZES}; do
 rsvg-convert -h $size -w $size "$SVG_PATH" > "$NAME.iconset/$filename"
done

iconutil -c icns $NAME.iconset

rm -r $NAME.iconset



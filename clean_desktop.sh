#!/bin/zsh

DESKTOP="/Users/philipqueen/Desktop"
SCREENSHOTS="$DESKTOP/Desktop/Screenshots"
if [[ ! -d $SCREENSHOTS ]]; then
	echo "Directory $SCREENSHOTS does not exist.";
	exit 1;
fi

for file in $DESKTOP/*(.); do
	FILENAME=${file#$DESKTOP/};
	if [[ $FILENAME[1,11] == "Screen Shot" ]]; then
		mv "$file" "$SCREENSHOTS/$FILENAME";
		echo "moved $FILENAME to $SCREENSHOTS";
	fi
done
	

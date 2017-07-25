#!/bin/bash
file="$1"
if [ -z "$file" ]; then
        echo "Missing file argument!"
        exit 1
fi

filename=$(basename "$file")
fileextension="${filename##*.}"
filename="${filename%.*}"
filedir=$(dirname "$file")
echo "Filename: $filename"
echo "Extension: $fileextension"
echo "Filedir: $filedir"
ffmpeg -i $file 2>&1 | grep 'Chapter' | grep 'start' | grep ', end' | awk "{
        chapter=\$2
        # replace : with nil
        gsub(/:/, \"\", chapter)
        start=\$4
        # remove everything but 0-9.
        gsub(/[^0123456789\.]/, \"\", start)
        end=\$6
        command=sprintf(\"ffmpeg -i $file -ss %s -to %s -acodec copy -vcodec copy $filedir/$filename-%s.$fileextension\n\", start, end, chapter)
        print(command)
        system(command)
}"

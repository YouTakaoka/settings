#!/bin/bash

PROGRAM1="$1"
PROGRAM2="$2"

text=""
while read i; do
    if [ "$i" = "" ]; then
        echo -e "$text"
        out1=$(echo -e "$text" | $PROGRAM1)
        echo "out1: $out1"
        out2=$(echo -e "$text" | $PROGRAM2)
        echo "out2: $out2"

        if [ "$out1" != "$out2" ]; then
            echo "different!"
            exit
        fi

        text=""
    fi
    text="${text}${i}\n"
done

echo "finish."

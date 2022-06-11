#!/bin/bash

while read -r line; do
    if test -z "$line"; then
        echo "desktop"
    else
        echo "$line"
    fi
done < <(xtitle -s)

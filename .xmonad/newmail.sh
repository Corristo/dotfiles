#!/bin/bash
mailcolor="#2aa198"
OIFS="$IFS"
IFS=$'\n'
outputstring=""
for d in ~/.mail/**; do
    newmailCount=0;
    for f in $(echo "$d/**/new/"); do
        escapedFileName="$(printf %q $f)"
        newmail=`find $f -type f | wc -l`
        ((newmailCount+=$newmail));
    done
    if [ $newmailCount -gt 0 ]
    then
        outputstring+=$(echo "$(basename $d) <fc=$mailcolor>$newmailCount</fc> ")
    else
        outputstring+=$(echo "$(basename $d) - ")
    fi
done
echo "$outputstring"
IFS=$OIFS

#!/bin/sh

options="-monochrome"

if [ $# -eq 1 ]
then
        offset=$1
else
        offset=0
fi

while true
do
date=$(date -d@$(echo 86400*\(7045+$offset\) | bc) +%Y-%m-%d)
echo "#$offset from $date : http://dilbert.com/strips/comic/$date/"
curl -Ss http://dilbert.com$(curl -Ss http://dilbert.com/strips/comic/$date/ | grep img | grep -m1 str_strip | sed 's/^.*src="\([^"]*\)".*$/\1/') | display $options
offset=$(echo $offset+1 | bc)
done

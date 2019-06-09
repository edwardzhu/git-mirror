#!/bin/bash
input=$GIT_LIST
for f in *.git; do
	if [ -d "$f" ]; then
		cd $f && git fetch origin && git lfs fetch --all && git fetch --tags && cd ..
	fi
done
while IFS= read -r line
do
	echo "$line"
	folder=$(basename $line)
	if [ ! "$(find "$folder" -mindepth 1 -print -quit 2>/dev/null)" ]; then
		git clone --mirror $line && \
		cd $folder && git lfs fetch --all && cd .. && \
		echo "Cloned: $line"
	fi
done < "$input"

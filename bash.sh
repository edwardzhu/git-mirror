#!/bin/bash
input=$GIT_LIST
proxy=$PROXY
[ -z "$proxy" ] || (git config --global http.proxy "$proxy" && git config --global https.proxy "$proxy" && echo "Set the proxy: $proxy")
for f in *.git; do
	if [ -d "$f" ]; then
		cd $f && git fetch origin && git lfs fetch --all && git fetch --tags; cd ..
	fi
done
while IFS= read -r line
do
	echo "$line"
	folder=$(basename $line | tr -d '\r')
	if [ ! "$(find "$folder" -mindepth 1 -print -quit 2>/dev/null)" ]; then
		git clone --mirror $line && \
		cd $folder && git lfs fetch --all; cd .. && \
		echo "Cloned: $line"
	fi
done < "$input"

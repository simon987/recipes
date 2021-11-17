#!/usr/bin/env bash


hugo new --kind recipe recipes/"$1"

curl "$2" > /tmp/tmpimg
convert /tmp/tmpimg content/recipes/"$1"/images/image.jpg


hugo server &

vim content/recipes/"$1"/index.md

kill %1

git status

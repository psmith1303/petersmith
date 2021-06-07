#!/bin/bash
#
DESCRIPTION="${@:-"A new post"}"

echo "The commit message is:    " \"${DESCRIPTION}\"
echo "The working directory is :" `pwd`

git add . &&  \
git add -u && \
git commit -m "${DESCRIPTION}" && \
git push origin master

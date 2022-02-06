#!/bin/bash
#
DESCRIPTION="${@:-"A new post"}"

echo "Started at: " `date`
echo "The commit message is:    " \"${DESCRIPTION}\"
echo "The working directory is :" `pwd`

git add . &&  \
sleep 2 && \
git add -u && \
sleep 2 && \
git commit -m "${DESCRIPTION}" && \
sleep 2 && \
git push origin master
sleep 2 && \
rm -fr .git/index.lock

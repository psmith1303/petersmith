#!/bin/bash
#
DESCRIPTION="${@:-"A new post"}"

echo "Started at: " `date`
echo "The commit message is:    " \"${DESCRIPTION}\"
echo "The working directory is :" `pwd`

git add . &&  \
sleep 3 && \
git add -u && \
sleep 3 && \
git commit -m "${DESCRIPTION}" && \
sleep 3 && \
git push origin master
sleep 3 && \
rm -fr .git/index.lock
rm -fr .git/refs/remotes/origin/master.lock

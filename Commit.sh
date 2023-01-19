#!/bin/bash
#
DESCRIPTION="${@:-"A new post"}"

echo "Started at: " `date`
echo "The commit message is:    " \"${DESCRIPTION}\"
echo "The working directory is :" `pwd`

rm -fr .git/index.lock

git add -A &&  \
sleep 3 && \
echo "git commit " && \
git commit -m "${DESCRIPTION}" && \
sleep 3 && \
echo "git push origin master" && \
git push origin master
sleep 3 && \
rm -fr .git/index.lock
rm -fr .git/refs/remotes/origin/master.lock

#!/bin/sh

FILENAME="responses.json"
### find . -name ${FILENAME} -delete

echo webmention.io-backup -t ${WEBMENTION_KEY} -d petersmith.org -cd content -f ${FILENAME}  -jf2 -tlo=false -p -ts
webmention.io-backup -t ${WEBMENTION_KEY} -d petersmith.org -cd content -f ${FILENAME}  -jf2 -tlo=false -p -ts

#
# Now fix the pesy hypens in the poperty names
#
find . -name ${FILENAME} -exec sed -i  '
s/\(^ *\)"like-of":/\1"like_of":/
s/\(^ *\)"mention-of":/\1"mention_of":/
s/\(^ *\)"in-reply-to":/\1"in_reply_to":/
s/\(^ *\)"wm-/\1"wm_/' {} \;

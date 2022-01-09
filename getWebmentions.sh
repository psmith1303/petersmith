#!/bin/sh


FILENAME="data/mentions.json"
rm -fr ${FILENAME}

webmention.io-backup -t -y4QezN6pCs5CNVshkMHaQ -d petersmith.org -f ${FILENAME}  -jf2 -tlo=false -p 

#
# Now fix the pesy hypens in the poperty names
#
sed -i  '
s/\(^ *\)"like-of":/\1"like_of":/
s/\(^ *\)"mention-of":/\1"mention_of":/
s/\(^ *\)"in-reply-to":/\1"in_reply_to":/
s/\(^ *\)"wm-/\1"wm_/' ${FILENAME}

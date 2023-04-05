#!/bin/bash

#
# move through my content a rename it all -- let's just do my blog
#
SRCDIR=/mnt/c/Users/psmith/Dropbox/psmith/Code/Websites-source/petersmith/content/notecards
DESTDIR=/mnt/c/Users/psmith/Dropbox/psmith/Zettelkasten


cd ${SRC}

for SOURCE in [12]*
do
    YEAR=${SOURCE:0:4}
    MONTH=${SOURCE:4:2}
    DAY=${SOURCE:6:2}
    HOUR=${SOURCE:9:2}
    MINUTES=${SOURCE:11:2}
    SLUG=${SOURCE:14:99}
    FILENAME=${SLUG%.org}

    DESTDIR="${DEST}/${YEAR}"
    TARGETDIR="${DESTDIR}/${YEAR}${MONTH}${DAY}${HOUR}${MINUTES}-${FILENAME}"
    TARGETFILE="${TARGETDIR}/index.org"

    echo "Testing: ${DESTDIR}"
    if [ ! -d ${DESTDIR} ]
    then
	echo mkdir ${DESTDIR}
	mkdir ${DESTDIR}
    fi
    echo ${TARGETDIR}
    mkdir ${TARGETDIR}

    echo "#+date: ${YEAR}-${MONTH}-${DAY}T${HOUR}:${MINUTES}:00+1300" >> $TARGETFILE
    echo "#+lastmod: ${YEAR}-${MONTH}-${DAY}T${HOUR}:${MINUTES}:00+1300" >> $TARGETFILE
    echo "#+categories[]: Zettel" >> $TARGETFILE
    echo "#+tags[]: \n" >> $TARGETFILE

    cat ${SOURCE} >> $TARGETFILE
done

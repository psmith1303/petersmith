#!/usr/bin/env bash
# Copyright Robbi Nespu <contact@robbi.my> , 2022
# License: MIT

# This script is used to archive my website to the Internet Archive.
# Modified for my site - 2022-12-19 by Peter Smith

# Fetch RSS and read the first 10 URLs send send it to the Wayback Machine
urls1=$(curl -s https://petersmith.org/index.xml | grep "<link>" | head -n 10 | awk -F"<guid>" '{print $2} ' | awk -F"</guid>" '{print $1}')
for i in $urls1
    do  archivenow --ia "$i"
done

# Same like previous but for the IndieWeb RSS
urls2=$(curl -s https://robbinespu.gitlab.io/indieweb/index.xml | grep "<link>" | head -n 10 | awk -F"<guid>" '{print $2} ' | awk -F"</guid>" '{print $1}')
for i in $urls2
    do  archivenow --ia "$i"
done

# Archive the main website
archivenow --ia "https://petersmith.org/"
echo "Done!"

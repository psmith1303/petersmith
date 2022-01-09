#!/usr/bin/env python3

import os
import time
import hashlib

try:
    import simplejson as json
except ImportError:
    import json



def process_mentions(target_file: str, destination: str) -> None:
    with open(target_file, "r") as read_file:
        mentions = json.load(read_file)

    for mention in mentions:
        if mention["type"] == "entry":
            target = mention["wm-target"]
            md5target = hashlib.md5(target.encode())
            filename = destination +md5target.hexdigest() +".json"

            if os.path.exists(filename):
                print("Skipping ", filename)
            else:
                with open(filename, "w") as outfile:
                    print("Writing", target, "saving to", filename)
                    json.dump(mention, outfile)


if __name__ == "__main__":
    target_file = "mentions.jf2"
    destination = "./data/"
    process_mentions(target_file, destination)

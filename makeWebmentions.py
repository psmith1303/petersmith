import json

f = open('export.json')
data = json.load(f)

for link in data:
    filename = link["text"].lower().replace(" ", "-").replace("?",  "").replace("/", "-")
    with open(filename + ".md", "w") as md_file:
        md_file.write('---\n')
        md_file.write('title: "' + link["text"].encode('utf-8') + '"\n')
        md_file.write('date: ' + link["date"] + '\n')
        md_file.write('link: ' + link["href"] + '\n')
        md_file.write('---')
        md_file.close()

        f.close()

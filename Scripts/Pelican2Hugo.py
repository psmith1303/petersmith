import os

# NOTE: assumes 'Category: ' is the last values in heading of a pelican
# markdown
#
# Remember to go to Windows and do "ren *.md *.markdown" before running
# this script

old_dir = 'C:/Users/psmi045/GoogleDrive/psmith/Programming/Websites-source/petersmith-blog/content/'
new_dir = 'C:/Users/psmi045/GoogleDrive/psmith/Programming/Websites-source/petersmith/content/blog/'

files = os.listdir(old_dir)

for f in files:
    if f.endswith('.md'):
        finished_header = False
        with open(old_dir+f, 'r') as in_f:
            with open(new_dir + f, 'w') as out_f:
                out_f.write('+++\n')
                lines = in_f.readlines()
                for line in lines:
                    if finished_header:
                        out_f.write(line)
                    elif line.startswith('Title: '):
                        _, title = line.split(':', 1)
                        title = title.strip()
                        title = title.replace('"', "'")
                        out_f.write('title = "'+title+'"\n')
                    elif line.startswith('Date: '):
                        _, date = line.split(':', 1)
                        date = date.strip()
                        date = date.replace(" ", "T")
                        date = date[:16]
                        out_f.write('date = "'+date+':00+12:00"\n')
                    elif line.startswith('Author: '):
                        continue
                    elif line.startswith('Summary: '):
                        continue
                    elif line.startswith('Slug: '):
                        _, slug = line.split(':', 1)
                        slug = slug.strip()
                        out_f.write('slug = "'+slug+'"\n')
                    elif line.startswith('Category: '):
                        _, tags = line.split(':', 1)
                        tags = tags.strip().split(',')
                        tags = ['"'+tag.strip()+'"' for tag in tags]
                        tags = ', '.join(tags)
                        out_f.write('categories = ['+tags+']\n')
                    elif line.startswith('Tags: '):
                        out_f.write('type = "post"\n')
                    elif line.strip() == "":
                        out_f.write('draft = "False"\n')
                        out_f.write('+++\n')
                        finished_header = True
                    else:
                        out_f.write(line)

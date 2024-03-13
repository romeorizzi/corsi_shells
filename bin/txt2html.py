#!/usr/bin/env python3

import os
from sys import argv, stderr, exit
from pathlib import Path

usage=f"Usage: {argv[0]} filename.txt [filename.html]\n    If the optional argument is omitted then the output is writte on a file named `filename.txt.html`\n    The filename arguments can specify whole paths of files in other folders than where you stand when issuing the command."

UTIL_FOLDER = os.path.join("/","home","romeo",".bin")
TEMPLATE_NAME = "template_HTML_importing_txt_file.html"

if len(argv) not in {2,3}:
    print(usage, file=stderr)
    exit(1)

txt_file_fullname = argv[1]
if len(argv) == 3:
    html_file_fullname = argv[2]
else:
    path = os.path.dirname(txt_file_fullname)
    txt_filename = os.path.split(txt_file_fullname)[-1]
    html_filename = f"{txt_filename}.html"
    html_file_fullname = os.path.join(path,html_filename)    
    # print(f"html_file_fullname={html_file_fullname}")

with open(txt_file_fullname,"r") as content_file:
    original_txt_content = content_file.read()
print(os.path.join(UTIL_FOLDER, TEMPLATE_NAME))
with open(os.path.join(UTIL_FOLDER, TEMPLATE_NAME),"r") as template_file:
    template = template_file.read()

production = template % {'FILETXT_CONTENT':original_txt_content}

print(f"txt_file_fullname={txt_file_fullname}")
# print(f"original_txt_content={original_txt_content}")
# print(f"production={production}")
print(f"html_file_fullname={html_file_fullname}")

production
with open(html_file_fullname,"w") as fout:
    fout.write(production)

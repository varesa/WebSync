#!/usr/bin/env python3

from urllib import request
import re

def get_id():
    file = open("/boot/NAYTON_NIMI.txt", "r")
    id = file.readline().strip()
    file.close()
    print("ID: " + id)
    return id

def get_matrix():
    s = request.urlopen('https://nastori-net.directo.fi/ohjeet/matriisi/')
    content = str(s.read())
    s.close()

    result = re.search(r'\[\[(.*)\]\]', content)
    if result is not None:
        matrix = result.group(1)
    else:
        print("Search failed")

    cleaned = re.sub('<br/>', r'\n', matrix)
    cleaned = re.sub(r'<.*?>','', cleaned)

    matrix = {}
    id = None

    for line in cleaned.splitlines():
        line = line.strip()

        if len(line) < 2:
            continue

        if line[0] == "=":
            id = line[1:]
            matrix[id] = []
            print("New ID in matrix: " + id)
        elif line[0] == "-":
            matrix[id].append(line[1:])
            print('New page for ID "' + id + '": ' + line[1:])
    return matrix

def write_list(list):
    print(list)
    file = open("urls.txt", "w")
    for url in list:
        file.write(url + '\n')
    file.close()
    
id = get_id()
m = get_matrix()
try:
    pages = m[id]
    assert (len(pages) != 0)
    write_list(pages)
except:
    print("No pages found for id: " + id)

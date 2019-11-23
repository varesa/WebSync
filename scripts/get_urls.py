#!/usr/bin/env python3

from urllib.request import urlopen
import os
import ssl

def get_id():
    file = open("/boot/NAYTON_NIMI.txt", "r")
    id = file.readline().strip()
    file.close()
    print("ID: " + id)
    return id

def get_pages(id):
    content = []
    if not os.path.exists('/boot/HTTPS_INSECURE'):
        urls = urlopen('https://nastori2.esav.fi/get_pages/?device=' + id)
    else:
        urls = urlopen('https://nastori2.esav.fi/get_pages/?device=' + id,
                context=ssl._create_unverified_context())

    for line in urls:
        content.append(line.decode('UTF-8'))
    return content

def write_list(list):
    print(list)
    file = open("urls.txt", "w")
    file.write(str(''.join(list)))
    file.close()

id = get_id()
pages = get_pages(id)
write_list(pages)

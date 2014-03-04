#!/usr/bin/env python3

from urllib.request import urlopen

def get_id():
    file = open("/boot/NAYTON_NIMI.txt", "r")
    id = file.readline().strip()
    file.close()
    print("ID: " + id)
    return id

def get_pages(id):
    content = []
    for line in urlopen('http://nastori.finbit.dy.fi/get_pages/?device=' + id):
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
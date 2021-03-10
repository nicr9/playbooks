#! /usr/bin/env python3
import os

library = os.getenv('CALIBRE_LIBRARY_DIR', '/opt/calibre/library')
imports = os.getenv('CALIBRE_IMPORT_DIR', '/opt/calibre/import')

print(f'Importing from {imports} to {library}...')

total = 0
for root, dirs, files in os.walk(imports):
    for book in files:
        path = os.path.join(root, book)
        print(f'* {path}')
        # TODO: figure out how to import book
        os.remove(path)
        total += 1

print(f'Imported {total} files')

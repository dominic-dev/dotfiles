#!/usr/bin/env python3

from enum import Enum
import json
import os.path
import hashlib
import time
from subprocess import call, check_output

# Load config
with open("settings.json") as f:
    CONFIG = json.load(f)
HASH_PATH = ".hashes"
BUF_SIZE = 65536 # 64kb chunks


def generate_hash(path):
    sha1 = hashlib.sha1()
    with open(os.path.expanduser(path), 'rb') as f:
        while True:
            data = f.read(BUF_SIZE)
            if not data:
                break
            sha1.update(data)
    return sha1.hexdigest()


class HashList(dict):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        if os.path.isfile(HASH_PATH):
            self._read()
        else:
            self._update()
            self._write()

    def _update(self):
        """ Update the hashlib in memory with the actual hashes """
        self.clear()
        h = hashlib.sha1()
        for f in CONFIG["files"]:
            self[f] = generate_hash(f)

    def _write(self):
        """ Write the hashlist from memory to file """
        with open(HASH_PATH, 'w') as f:
            data = json.dumps(self)
            f.write(data)

    def _read(self):
        """ Read the hashlist from file in to memory """
        with open(HASH_PATH) as f:
            data = json.load(f)
            self.clear()
            for key, value in data.items():
                self[key] = value

class GitStatus(Enum):
    UNCHANGED = 0
    CHANGED = 1

class BackupHelper:
    def __init__(self):
        self.list = HashList()
        self.changed_files = []

    def get_git_status(self):
        output = check_output(["git", "status"],
                          cwd=os.path.expanduser(CONFIG["git_directory"]))
        print(output)

    def get_changed_files(self):
        self.changed_files = []
        sha1 = hashlib.sha1()
        for actual_path in CONFIG["files"]:
            stored_path = os.path.join(CONFIG["backup_directory"],
                                os.path.basename(actual_path))
            changed = False
            try:
                stored_hash = generate_hash(stored_path)
            except FileNotFoundError:
                changed = True
            else:
                actual_hash = generate_hash(actual_path)
                if actual_hash != stored_hash:
                    changed = True
            finally:
                if changed:
                    self.changed_files.append(actual_path)
        return self.changed_files

    def backup(self):
        # Copy files
        for f in self.changed_files:
            call(['cp', os.path.expanduser(f),
                  os.path.expanduser(CONFIG["backup_directory"])])
        # Git
        commands = [
            ["git", "add", "."],
            ["git", "ci", "-am", "'update'"],
            ["git", "push"]
        ]
        for c in commands:
            call(c)


def main():
    b = BackupHelper()
    # b.get_git_status()
    # exit()
    print("Checking ...")
    changed_files = b.get_changed_files()
    if not changed_files:
        print("No changes detected.")
    else:
        print("Changes found in the following files:")
        [print("\t{}".format(path)) for path in changed_files]
        user_input = input("Do you wish to backup? (y/n): ")
        if user_input.lower()[0] == "y":
            print("Starting backup sequence ...", end='')
            b.backup()
            print(" done. ")
        else:
            print("Bakup aborted.")

if __name__ == "__main__":
    main()

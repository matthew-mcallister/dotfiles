#!/usr/bin/env python3
import sys
import os
import glob
import shutil

def main(args):
    """Puts all the dot files in their proper places"""

    home = os.path.expanduser("~")
    for f in glob.glob("*"):
        if not f.startswith(".") and not f.endswith(".py"):
            path = home + "/." + f
            print(path)

            if os.path.lexists(path):
                os.remove(path)

            from_path = os.path.abspath(f)
            os.system("ln -s {} {}".format(from_path, path))

if __name__ == "__main__":
    main(sys.argv)

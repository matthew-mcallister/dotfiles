#!/usr/bin/env python3
import sys
import os
import glob
import shutil

def main(args):
    print("Updating submodules...")
    os.system("git submodule sync")
    os.system("git submodule update --init")

    prereqs = {
        "xmonad": "xmonad --version",
        "xmobarrc": "xmobar --version"
    }

    home = os.path.expanduser("~")

    print("\nCreating file links...")
    for f in glob.glob("*"):
        if not f.startswith(".") and not f.endswith(".py"):
            if f in prereqs and os.system(prereqs[f] + " > /dev/null 2>&1"):
                break

            path = home + "/." + f
            print(path)

            if os.path.lexists(path):
                if os.path.islink(path) or not os.path.isdir(path):
                    os.remove(path)
                else:
                    shutil.rmtree(path)

            from_path = os.path.abspath(f)
            os.system("ln -s {} {}".format(from_path, path))

    histfiles = [
        "bash_history",
        "viminfo",
        "lesshst"
    ]

    print("\nRemoving history files...")
    for f in histfiles:
        path = home + "/." + f
        print(path)

        if os.path.lexists(path) and not os.path.isdir(path):
            os.remove(path)

        os.system("ln -s /dev/null {}".format(path))

if __name__ == "__main__":
    main(sys.argv)

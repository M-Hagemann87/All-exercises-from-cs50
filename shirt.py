import os
import re
import sys
import shutil

def main():
    if len(sys.argv) != 3:
        sys.exit("Usage: python pshirt.py before/ after/")

    before, after = sys.argv[1], sys.argv[2]

    if not os.path.isdir(before):
        sys.exit(f"Before directory '{before}' does not exist")
    if not os.path.isdir(after):
        os.makedirs(after)

    for filename in os.listdir(before):
        match = re.match(r"^([^-]+)-([A-Z])\.png$", filename)
        if not match:
            continue

        name, house = match.groups()
        file_src = os.path.join(before, filename)
        file_dst = os.path.join(after, f"{house}-{name}.png")

        shutil.copy(file_src, file_dst)

if __name__ == "__main__":
    main()

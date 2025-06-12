import re

def main():
    print(parse(input("HTML: ")))


def parse(s):

    matches = re.search(r"^(<iframe)?([a-zA-Z0-9_ =\"]*)\"?https?://(www\.)?youtube\.com/embed/([a-zA-Z0-9_]+).+?$", s)
    if matches:
        print("https://youtu.be/" + matches.group(4))
        exit(0)

if __name__ == "__main__":
    main()

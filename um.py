import re
import sys

def main():
    print(count(input("Text: ")))

def count(s):
    text_um = re.findall(r"\bum\b",s,re.IGNORECASE)
    s = int(len(text_um))
    return s

if __name__ == "__main__":
    main()

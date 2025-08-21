###from cs50 import get_string

try:
    text = str(input("Text: "))
except ValueError:
    exit(1)

len_text = len(text)
words = 1
result = 0
letters = 0
phrases = 0

for i in range(len_text):
    if text[i].isalpha() or "-" in text[i]:
       letters += 1
    else:
        if " " in text[i]:
            words += 1
        else:
            for char in {"?", "!", "."}:
                if char in text[i]:
                    phrases += 1

S = (phrases / words) * 100

L = (letters / words) * 100

result = 0.0588 * L - 0.296 * S - 15.8

result = round(result)
####print(result)

if result < 1:
    print("Before Grade 1")
    exit(0)

elif result < 16:
    print("Grade ", result)

else:
    print("Grade 16+")



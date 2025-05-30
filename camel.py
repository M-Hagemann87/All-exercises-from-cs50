import re
enter_w = input("camelCase: ")
separate_w = re.findall(r'[A-Z][a-z]*|[a-z]+',enter_w)

n = len(separate_w)
n = int(n)

if n >= 1:
    word0 = separate_w[0]
    word0 = word0.lower()
if n >= 2:
    word1 = separate_w[1]
    word1 = word1.lower()
if n >= 3:
    word2 = separate_w[2]
    word2 = word2.lower()

if n == 1:
    print(word0)
elif n == 2:
    print(word0, word1, sep="_")
elif n == 3:
    print(word0, word1, word2,  sep="_")


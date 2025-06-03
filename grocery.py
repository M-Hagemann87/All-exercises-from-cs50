history = []

while True:
    try:
        item = input("").upper()
        history.append(item)
        continue
    except EOFError:
        count={}
        for word in history:
            if word in count:
                count[word] =+ 1
            else:
                count[word] = 1

        for items in sorted(count):
            print(f"{count[items]}",f"{items}")
        break

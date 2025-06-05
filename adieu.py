import inflect
p = inflect.engine()

history = []

try:
    while True:
        name = input("Name: ")
        history.append(name)
        x = p.join((history))


except EOFError:
    print("")
    print("Adieu, adieu, to", x)
    exit(1)

import inflect
p = inflect.engine()

history = []

try:
    while True:
        name = input("Name: ")
        history.append(name)
        x = p.join((history))
        print("Adieu, adieu, to ", x)
        
except EOFError:
    exit(1)

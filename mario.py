height = int(input("Height: "))
try:
    while height > 8 or height < 1:
        height = int(input("Height: "))
        continue
except ValueError:
    test = 0

for i in range (height):
    spaces = 7 - i
    print(" "*spaces, end="")
    print("#"*(i+1), end="")
    print("  ", end="")
    print("#"*(i+1))



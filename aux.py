height = int(input("Height: "))


for i in range (height):
    spaces = 7 - i
    print(" "*spaces, end="")
    print("#"*(i+1), end="")
    print("  ", end="")
    print("#"*(i+1))



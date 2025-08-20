height = 0
while height > 8 or height < 1:
    try:
        height = int(input("Height: "))
    except ValueError:
        height = 0

start_space =  8 - height

for i in range (height):
    spaces = 7 - start_space - i
    print(" "*spaces, end="")
    print("#"*(i+1), end="")
    print("  ", end="")
    print("#"*(i+1))








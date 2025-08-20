height = 0
try:
    while height > 8 or height < 1:
        height = int(input("Height: "))
        continue
except ValueError:
    height = 0

start_space =  8 - height

for i in range (height):
    spaces = 7 - start_space - i



    print(" "*spaces, end="")
    print("#"*(i+1), end="")
    print("  ", end="")
    print("#"*(i+1))



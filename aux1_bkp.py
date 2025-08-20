###OK 1:


height = int(input("Height: "))


for i in range (height):
    spaces = 7 - i
    print(" "*spaces, end="")
    print("#"*(i+1), end="")
    print("  ", end="")
    print("#"*(i+1))


#########################
##OK2
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

######################
###
# Checks whether integer using conditional

# Prompt user for an integer
n = input("Input: ")
if n.isnumeric():
    print("Integer.")
else:
    print("Not integer.")


################

try:
    n = int(input("Input: "))
except ValueError:
    print("Not integer.")
else:
    print("Integer.")
#########
if re.match(r"[A-Za-z]", c) or (c == "'" and index > 0):



# Prompt user for an integer
try:
    n = int(input("Input: "))
except ValueError:
    print("Not integer.")
else:
    print("Integer.")

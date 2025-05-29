math = input("Mathematical Expression")
x, y, z = math.split()
num1 = float(x)
op = y
num2 = float(z)

if op == "+":
    result  = num1 + num2
elif op == "-":
    result  = num1 - num2
elif op == "*":
    result  = num1 * num2
elif op == "/":
    result  = num1 / num2

if result == 0.0:
    print(0)
else:
    print(result)

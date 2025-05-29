def main ():
    greeting = input("Hello bank worker!")
    greeting = greeting.strip()
    greeting = greeting.lower()

    if greeting == "hello" or greeting == "hello, newman":
        print("$0")
    elif greeting[0] == "h":
         print("$20")
    else:
         print("$100")


main()

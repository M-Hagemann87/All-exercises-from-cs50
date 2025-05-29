def main():
    answer = input("What is the Answer to the Great Question of Life, the Universe, and Everything?")
    answer = answer.strip()
    match answer:
        case "42"|"Forty Two"|"forty-two"|"forty Two"|"Forty two"|"Forty-two"|"forty-Two"|"forty two"|"forty-Two":
            print("Yes")
        case _:
            print ("No")


main()

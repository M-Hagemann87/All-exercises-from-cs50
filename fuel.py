try:
    while True:
        fraction = input("Fraction: ").strip()
        x,y = map(int, fraction.split("/"))
        solution = (x / y)*100
        solution = int(solution)

        if solution > 100:
            continue
        elif solution > 98:
            print("F")
        elif solution < 2:
            print("E")
        elif 1 < solution < 99:
            print(solution,"%", sep="")
        break

except ValueError:
    print("ValueError")
except ZeroDivisionError:
    print("ZeroDivisionError")

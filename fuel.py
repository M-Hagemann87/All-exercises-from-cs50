def main():

    call_1 = input("Fraction: ")
    call_2 = convert(call_1)
    p_result = gauge(call_2)
    try:
        if p_result.isdigit():
            print(p_result,"%", sep="")
        else:
            print(p_result)

    except ValueError:
        print("ValueError")
    except ZeroDivisionError:
        print("ZeroDivisionError")


def convert(fraction):
    while True:
        fraction = fraction.strip()
        x, y = map(int, fraction.split("/"))
        solution = (x / y) * 100
        solution = round(solution)
        fraction = int(solution)
        try:
            if fraction > 100:
                False
            else:
                return fraction
        except ValueError:
            print("ValueError")
        except ZeroDivisionError:
            print("ZeroDivisionError")

def gauge(percentage):

        if percentage > 98:
            percentage = str(percentage)
            percentage = "F"
            return percentage
        elif percentage < 2:
            percentage = str(percentage)
            percentage = "E"
            return percentage
        elif 1 < percentage < 99:
            percentage = str(percentage)
            return percentage

if __name__ =="__main__":
    main()

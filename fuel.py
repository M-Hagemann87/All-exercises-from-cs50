def main():
    while True:
        try:
            call_1 = str(input("Fraction: "))
            call_2 = convert(call_1)
            p_result = gauge(call_2)
            if p_result.isdigit():
                print(p_result,"%", sep="")
                exit(0)
            else:
                print(p_result)
                exit(0)
            break
        except ValueError:
            continue
        except ZeroDivisionError:
            continue
        except AttributeError:
            continue


def convert(fraction):
    while True:
        fraction = fraction.strip()
        x, y = map(str, fraction.split("/"))
        x = int(x)
        y = int(y)
        solution = (x / y) * 100
        solution = round(solution)
        fraction = int(solution)
        try:
            if fraction > 100:
                False
            else:
                return fraction
        except ValueError:
            continue
        except ZeroDivisionError:
            continue

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


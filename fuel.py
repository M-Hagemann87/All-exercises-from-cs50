def main():
    while True:
        try:
            call_1 = str(input("Fraction: "))
            call_2 = convert(call_1)
            p_result = gauge(call_2)
            print(p_result)
            exit(0)
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
            percentage = (percentage+"%")
            return percentage

if __name__ =="__main__":
    main()

import random


def main():
    score = int()
    questions = int()
    level = get_level()

    while True:
        level1 = generate_integer(level)
        x = level1[0]
        y = level1[1]
        result = x + y
        tries = 0
        while True:
            if questions == 10:
                print("Score: ",score)
                exit(0)
            else:
                try:
                    if tries == 3:
                        questions += 1
                        print(f"{x} + {y} = {result}")
                        break

                    in_calc = int(input(f"{x} + {y} = "))
                    if result == in_calc:
                        score += 1
                        questions += 1
                        tries = 0
                        break
                    else:
                        print("EEE")
                        tries += 1
                except ValueError:
                    print("EEE")
                    tries += 1
                    continue


def get_level():
    while True:
        try:
            n = int(input("Level: "))
            if n in [1, 2, 3]:
                return n
            else:
                raise ValueError
        except ValueError:
            continue


def generate_integer(level):
        if level == 1:
            n1 = 0
            n2 = 9
        elif level == 2:
            n1 = 10
            n2 = 99
        elif level == 3:
            n1 = 100
            n2 = 999
        x = random.randint(n1, n2)
        y = random.randint(n1, n2)
        level =  [x,y]
        return level

if __name__ == "__main__":
    main()

import random

def main():
    level = get_level(int(input("Level: ")))
    print("Score: ", generate_integer(level))

def get_level(n):
    while True:
        try:
            if n in [1,2,3]:
                return n
            else:
                raise ValueError
        except ValueError:
            continue

def generate_integer(level):
    score = int()
    questions = int()
    while True:
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
        result = x + y
        tries = 0
        while True:
            if questions == 10:
                level = score
                return level
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

if __name__ == "__main__":
    main()

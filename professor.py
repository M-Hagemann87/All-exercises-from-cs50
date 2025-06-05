import random

tries = int()
score = int()
questions = int()
while True:
        if questions == 10:
            print("Score: ", score)
            exit(0)
        if questions < 10:
            tries = 0
            while True:
                    try:
                        level = int(input("Level: "))
                        if level == 1:
                            n1 = 0
                            n2 = 9
                            break
                        elif level == 2:
                            n1 = 10
                            n2 = 99
                            break
                        elif level == 3:
                            n1 = 100
                            n2 = 999
                            break
                    except ValueError:
                        continue
            number1 = random.randint(n1, n2)
            number2 = random.randint(n1, n2)
            result = number1 + number2
            while True:
                try:
                    in_calc = int(input(f"{number1} + {number2} = "))
                    if tries <= 1:
                        if result == in_calc:
                            score += 1
                            questions += 1
                            tries += 1
                            break
                        else:
                            print("EEE")
                            tries += 1
                    else:
                        questions += 1
                        print(f"{number1} + {number2} = {result}")
                        break
                except ValueError:
                    continue

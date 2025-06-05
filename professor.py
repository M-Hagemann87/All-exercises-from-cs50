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
                            n = 10
                            break
                        elif level == 2:
                            n = 100
                            break
                        elif level == 3:
                            n = 1000
                            break
                    except ValueError:
                        continue
            number1 = random.randint(0, n)
            number2 = random.randint(0, n)
            result = number1 + number2
            while True:
                try:
                    in_calc = int(input(f"{number1} + {number2} ="))
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

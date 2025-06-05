import random

def main():
    level = get_level()
    score = 0
    questions = 0

    while questions < 10:
        number1, number2 = generate_integer(level)
        result = number1 + number2
        correct = ask_question(number1, number2, result)
        if correct:
            score += 1
        questions += 1

    print("Score:", score)

def get_level():
    while True:
        try:
            level = int(input("Level (1-Easy, 2-Medium, 3-Hard): "))
            if level in [1, 2, 3]:
                return level
        except ValueError:
            pass  # Ignore and reprompt

def generate_integer(level):
    if level == 1:
        return random.randint(0, 9), random.randint(0, 9)
    elif level == 2:
        return random.randint(10, 99), random.randint(10, 99)
    else:
        return random.randint(100, 999), random.randint(100, 999)

def ask_question(number1, number2, result):
    tries = 0
    while tries < 3:
        try:
            answer = int(input(f"{number1} + {number2} = "))
            if answer == result:
                return True
            else:
                print("EEE")
        except ValueError:
            print("EEE")
        tries += 1
    print(f"{number1} + {number2} = {result}")
    return False

if __name__ == "__main__":
    main()

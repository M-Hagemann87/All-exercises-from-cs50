import random

while True:
    try:
        level = input("Level: ")
        if level.isdigit():
            level =  int(level)
            number = random.randint(1, level)
            break
        else:
            continue
    except ValueError:
        continue

while True:
    try:
        guess = int(input("Guess: "))
        if guess == number:
            print("Just right!")
            break
        elif guess > number:
            print("Too large!")
            continue
        elif guess < number:
            print("Too small!")
            continue
    except ValueError:
        continue


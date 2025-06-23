#OK (20/06/2025)
## Importing the necessary libraries.
import random
import time
from blessed import Terminal

## Line 7: Main program, calling the other defined functions
def main():

    initial_func()
    x = str()
    score = run_func(x)
    final_score_func(score)

## Line 16: Initial function: Show the initial instructions for 2 seconds
def initial_func():
    print("Initial Instructions:")
    print("- Help save these planets!! Push the meteor away to avoid collision!!!")
    print("- Use; < (keyboard Left) to move left.")
    print("- Use; > (keyboard right) to move right.")
    print("- Press esc to exit.")
    time.sleep(2)
    return "Initial Instructions:"

###The main running program
def run_func(score):

    term = Terminal()
    n = 10
    run = True
    score = 0
    lines = [" " * 20 for _ in range(10)]

    with term.cbreak(), term.hidden_cursor():
        meteor_control = ''
        while run:

            meteor_control = term.inkey(timeout=0.1)
            if meteor_control.code == term.KEY_LEFT and n > 0:
                n -= 1
            elif meteor_control.code == term.KEY_RIGHT and n < 18:
                n += 1
            elif meteor_control.code == term.KEY_ESCAPE:
                break

            pos = random.randint(0, 18)
            new_line = " " * pos + "🌍" + " " * (18 - pos)
            lines.pop()
            lines.insert(0, new_line)
            #Collision:
            if lines[-1][n] == "🌍":
                run = False
                break

            lines[-1] = " " * n + "🌕" + " " * (18 - n)

            print(term.home + term.clear)
            print(term.bold("Use: ← → and help save the planets!! Press ESC to exit."))
            for line in lines:
                print("||", line, "||")

            score = score + 5
            print(term.bold(f"Score: {score}"))
            time.sleep(0.45)
        return score

###Printing the final score
def final_score_func(score):

    print(f"!!!YOUR SCORE IS {score}!!! Game over!")
    return f"!!!YOUR SCORE IS {score}!!! Game over!"

if __name__  == "__main__":
    main()

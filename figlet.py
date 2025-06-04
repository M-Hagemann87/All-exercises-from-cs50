import sys
import random
from pyfiglet import Figlet

figlet = Figlet()
#Random
if len(sys.argv) < 2:
        figlet = Figlet()
        y = figlet.getFonts()
        x = random.choice(y)
        set_font = Figlet(font=x)
        text_input =  input("Input: ")
        print(set_font.renderText(text_input))
        exit()

elif len(sys.argv) == 3 and sys.argv[1] in ["-f", "--font"]:
    choice_font = sys.argv[2]
    print(choice_font)
    figlet.setFont(font=choice_font)


    text_input = input("Input: ")
    print(figlet.renderText(text_input))
    exit()

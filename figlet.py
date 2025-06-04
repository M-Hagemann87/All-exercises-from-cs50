import sys
import random
from pyfiglet import Figlet

figlet = Figlet()
#Random
try:
    if len(sys.argv) < 2:
            figlet = Figlet()
            y = figlet.getFonts()
            x = random.choice(y)
            set_font = Figlet(font=x)
            text_input =  input("Input: ")
            print("Output:")
            print(set_font.renderText(text_input))

    elif len(sys.argv) == 3 and sys.argv[1] in ["-f", "--font"]:
        choice_font = sys.argv[2]
        if choice_font not in figlet.getFonts():
               print("Invalid usage")
               sys.exit(1)

        figlet.setFont(font=choice_font)
        text_input = input("Input: ")
        print("Output:")
        print(figlet.renderText(text_input))

    else:
        print("Invalid usage")
        sys.exit(1)
except:
        sys.exit(1)


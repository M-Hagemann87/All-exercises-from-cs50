# GAME - SPACE COLLISION!
#### Video Demo:  https://youtu.be/9-BVGxBrGyc
#### Description: The Goal of this project is to develop a game called “Space Collision” in which it interacts in real time with the user, enabling the Right Keyboard “>” and the Left Keyboard “<” to control a meteor that is going towards a few random planets.
## How to run this program:
-To ensure this program runs smoothly, since it interacts with the operator. It is strongly suggested to run it through the command prompt of your computer, following the steps;
	1 – Open the Command Prompt, write “cmd” in the main search bar of your computer to find it, and press Enter.
	2 – Make sure to install all libraries (as shown below).
	3 - Write: “python” and then copy and paste the path of the program;
Example: python path/example/Harvard/cs50p/finalproject/project.py
## Library Installation:
- Make sure to install the pip’s module  libraries:
“random” --> pip install random2
“blessed” --> pip install blessed

Note: Before using the alternative “blessed” library, the program was written first in “pynput”, but it didn’t run “pip didn’t install” on Visual Studio Code, so the alternative pip that was successfully installed was “blessed”.
Note1: The “time” library is standard/already installed in python.
Visual Studio might also run with some delay; it can vary, e.g. depending on the internet connection, etc... If you use a Python embedded terminal emulator like Pycharm (that is not a real terminal), you might face some troubles with the smoothness of this program. Best is still cmd.

### Program Details:
##Program Line (PL) 3 to 5: Importing the necessary libraries.
random == to be able to sort randomly the falling planets.
time == to be able to have a delay from each updated new lines (of planets).
blessed (Terminal) == to be able to control de “meteor” to right (>) and left (<)

## Line 8: Main program, calling the other defined functions
Here is where all the other defined functions are going to be called to run.

## Line 16: Initial function: Show the initial instructions for 2 seconds
Initial Instructions:
- Help save these planets!! Push the meteor away to avoid collision!!!
- Use; < (keyboard Left) to move left.
- Use; > (keyboard right) to move right.
- Press esc to exit.


## Between lines 26 to 32: The main running program
This function is where the most important part of the logic of the program runs.
It defines the initial status of the variables and the “lines”.

## Between lines 35 and 44 is the control of the keys Left and Right, which are going to increase or decrease the variable “n” that further will control the position of the meteor. (see more in line 55).

## Between lines 46 and 49 is where it is generated randomly the position of the planet in the first line.  (called “new_line”).

## Between lines 51 and 53 is detected a collision between the planets and the meteor.

## The line 55 is where the meteor is located (depending on the value of “n”).

## Between lines 57 and 65 are some auxiliary texts, the counting score, and the time delay between each loop. And the most important the For loop for that move the lines.

## Between lines 68 and 71 is the printing of the final score; this function is called only after the Game Over!

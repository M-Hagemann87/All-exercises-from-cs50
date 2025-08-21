from cs50 import get_int
/////////////////////////

#OK
import sys
import csv

def main():

    len_sys = len(sys.argv)
    before_file = sys.argv[-2]
    after_file = sys.argv[-1]

    if len_sys == 3:
        while True:
            try:
                students = []
                with open(before_file) as file:
                    reader = csv.DictReader(file)
                    for row in reader:
                        surname, first_name = row["name"].split(",")
                        new_name_order = f'{first_name} {surname}'
                        students.append({"name": new_name_order, "house": row["house"]})

                with open(after_file, "w", newline="") as file:
                    writer = csv.DictWriter(file, fieldnames=["name", "house"])
                    writer.writeheader()

                    for student in students:
                        writer.writerow(student)
                break

            except ValueError:
                print("Not a CSV file")
                exit(1)

            except FileNotFoundError:
                print("Could not read", before_file)
                exit(1)

    elif len_sys < 3:
        sys.exit("Too few command-line arguments")

    elif len_sys > 3:
        sys.exit("Too many command-line arguments")


if __name__ =="__main__":
    main()


//////////////

##Camel Case

import re
enter_w = input("camelCase: ")
separate_w = re.findall(r'[A-Z][a-z]*|[a-z]+',enter_w)

n = len(separate_w)
n = int(n)

if n >= 1:
    word0 = separate_w[0]
    word0 = word0.lower()
if n >= 2:
    word1 = separate_w[1]
    word1 = word1.lower()
if n >= 3:
    word2 = separate_w[2]
    word2 = word2.lower()

if n == 1:
    print(word0)
elif n == 2:
    print(word0, word1, sep="_")
elif n == 3:
    print(word0, word1, word2,  sep="_")

//////////////////

def main():

    x = input("Input: ")
    print("Output:", shorten(x))

def shorten(word):
    word = ''.join(c for c in word if c not in 'AEIOUaeiou')
    return word


if __name__ == "__main__":
    main()
////////

# Logical operators, using lists

from cs50 import get_string

# Prompt user to agree
s = get_string("Do you agree? ")

# Check whether agreed
if s in ["y", "yes"]:
    print("Agreed.")
elif s in ["n", "no"]:
    print("Not agreed.")

/////////////////////////
c
float L = (letters / words) * 100;
    float S = (sentences / words) * 100;

        // Compute the Coleman-Liau index
            float score = (0.0588 * L - 0.296 * S - 15.8);

import re
import sys

def main():
    print(convert(input("Hours: ")))

def convert(s):

    try:
        matches = re.search(r"^([0-9][0-2]?)(\:)?([0-5][0-9])? (AM|PM) ?to ([0-9][0-2]?)(\:)?([0-5][0-9])? ?(AM|PM)$", s)
        if matches:
            x,y,z,w = (matches.group(1), matches.group(3),matches.group(5), matches.group(7))
            ampm_check1 = matches.group(4)
            ampm_check2 = matches.group(8)
            if ampm_check1 == "PM":
                x = int(x)
                x = int(x + 12)
                x = str(x)
                if x == "24":
                    x = "12"

            if ampm_check2 == "PM":
                z = int(z)
                z = int(z + 12)
                z = str(z)
                if z == "24":
                    z = "12"

            if ampm_check1 == "AM":
                x = int(x)
                if x < 10:
                    x = str(x)
                    x = "0"+x
                elif x == 12:
                    x = "00"

            if ampm_check2 == "AM":
                z = int(z)
                if z < 10:
                    z = str(z)
                    z = "0"+z
                elif x == 12:
                    x == "00"


            if y == None:
                y = "00"

            if w == None:
                w = "00"

            x = str(x)
            y = str(y)
            z = str(z)
            w = str(w)


            s = (x+":"+y+" to "+z+":"+w)

            return s

        else:
            raise ValueError("ValueError")


    except ValueError:
        raise ValueError("ValueError")


if __name__ == "__main__":
    main()

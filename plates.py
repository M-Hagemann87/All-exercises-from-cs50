def main():

    plate = input("Plate: ")
    if is_valid(plate):
        print("Valid")
    else:
        print("Invalid")

def is_valid(s):
    s = s.strip()
    count_s = len(s)

    if not 2 <= count_s <= 6:
        return False
    elif not s.isupper():
        return False
    elif any(c in ".,?!:;-_—[])(...&*~" for c in s):
        return False
    elif s[0].isdigit() or s[1].isdigit():
        return False

    elif count_s == 3 and s[2] == "0":
        return False
    elif count_s == 4 and s[2] == "0":
        return False
    elif count_s == 4 and s[3] == "0" and s[2].isalpha():
        return False
    elif count_s == 5 and s[2] == "0":
        return False
    elif count_s == 5 and s[3] == "0" and s[2].isalpha():
        return False
    elif count_s == 5 and s[4] == "0" and s[3].isalpha():
        return False
    elif count_s == 6 and s[2] == "0":
        return False
    elif count_s == 6 and s[3] == "0" and s[2].isalpha():
        return False
    elif count_s == 6 and s[4] == "0" and s[3].isalpha():
        return False
    elif count_s == 6 and s[5] == "0" and s[4].isalpha():
        return False

    elif count_s > 2:
        n = int(0)
        while True:
            try:
                n += 1
                if s[n].isdigit() and s[n+1].isalpha():
                    return False
            except:
                return True
    else:
        return True

if __name__ == "__main__":
    main()

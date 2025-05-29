def main():
    dollars = dollars_to_float(input("How much was the meal? "))
    percent = percent_to_float(input("What percentage would you like to tip? "))
    tip = dollars * percent
    print(f"Leave ${tip:.2f}")


def dollars_to_float(d):
    d = ''.join(c for c in d if c.isdigit() or c==".")
    d = float(d)
    return d

def percent_to_float(p):
    p = ''.join(c for c in p if c.isdigit() or c==".")
    p = float(p)
    return p/100


main()

from datetime import date
import operator
import inflect
p = inflect.engine()

def main():

    print(calc(input("Date of Birth: ")),"minutes")

def calc(t):
    try:
        yy,mm,dd = map(int, t.split("-"))
        date_birth = date(yy,mm,dd)
        today_1 = date.today()
        total = operator.__sub__(today_1 , date_birth)
        total_days =  total.days
        total_minutes = total_days*24*60
        text_min = p.number_to_words(total_minutes)
        t = (text_min.capitalize())
        return t
    except ValueError:
        return "Invalid date"


if __name__ == "__main__":
    main()

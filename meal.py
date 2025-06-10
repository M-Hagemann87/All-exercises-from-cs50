def main():
    time = input("What time is it?:  ")
    hours1 = convert(time)
    if 7 <= hours1 <= 8:
        print("breakfast time")
    elif 12 <= hours1 <= 13:
        print("lunch time")
    elif 18 <= hours1 <= 19:
        print("dinner time")

def convert(hours):
    hours = hours.split(":")
    hour = hours[0]
    minute = hours[1]
    hour = float(hour)
    minute = float(minute)
    minute1 = ((minute/0.6)/100)
    hours = float(hour+minute1)
    return hours


if __name__ == "__main__":
    main()

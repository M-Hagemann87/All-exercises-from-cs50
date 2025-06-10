def main():
    time = input("What time is it?:  ")
    hours1 = convert(time)
    if 7 <= hours1 <= 8:
        print("breakfast time")
    elif 12 <= hours1 <= 13:
        print("lunch time")
    elif 18 <= hours1 <= 19:
        print("dinner time")

def convert(time):
    time = time.split(":")
    hour = time[0]
    minute = time[1]
    hour = float(hour)
    minute = float(minute)
    minute1 = ((minute/0.6)/100)
    time = float(hour+minute1)
    return time


if __name__ == "__main__":
    main()

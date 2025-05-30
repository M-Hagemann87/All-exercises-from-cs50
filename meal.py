def main():
    time = input("What time is it?:  ")
    convert(time)

def convert(time):
    time = time.split(":")
    hour = time[0]
    minute = time[1]
    hour = float(hour)
    minute = float(minute)
    minute1 = ((minute/0.6)/100)
    hours1 = float(hour+minute1)
    if 7 <= hours1 <= 8:
        print("breakfast time")
    elif 12 <= hours1 <= 13:
        print("lunch time")
    elif 18 <= hours1 <= 19:
        print("dinner time")
    return()


main()

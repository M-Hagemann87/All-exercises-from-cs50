time = input("What time is it?")

hours = time[0]+time[1]
hours1 = ''.join(c for c in hours if c.isdigit())
minutes = time[-2:]

if hours1 == "7":
    print("breakfast time")
if hours1 == "8" and minutes == "00":
    print("breakfast time")

if hours1 == "12":
    print("lunch time")
if hours1 == "13" and minutes == "00":
    print("lunch time")

if hours1 == "18":
    print("dinner time")
if hours1 == "19" and minutes == "00":
    print("dinner time")

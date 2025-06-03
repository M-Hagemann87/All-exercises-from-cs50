months = [
    {"January": "01"},
    {"February": "02"},
    {"March": "03"},
    {"April": "04"},
    {"May": "05"},
    {"June": "06"},
    {"July": "07"},
    {"August": "08"},
    {"September": "09"},
    {"October": "10"},
    {"November": "11"},
    {"December": "12"},
]

while True:
    try:
        date_in = input("Date: ").strip()

        if "/" in date_in:
            mm1, dd1, yyyy1 = map(int, date_in.split("/"))
            mm1_formated = f"{mm1:02d}"
            dd1_formated = f"{dd1:02d}"
            print(yyyy1, mm1_formated, dd1_formated, sep="-")
            break

        elif "," in date_in:
            mm2, dd2, yyyy2 = date_in.split(" ")
            dd2 = dd2.replace(",","")
            dd2 = int(dd2)
            dd2_formated = f"{dd2:02d}"

            for month in months:
                if mm2 in month:
                    month_numb = month[mm2]
                    print(yyyy2, month_numb, dd2_formated, sep="-")
            break
    except ValueError:
        continue

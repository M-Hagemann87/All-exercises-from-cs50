### Credit program - WEEK 6 - Python

try:
    n_card = int(input("Number: "))
except ValueError:
    print("INVALID")

n_card = str(n_card)
n_len = len(n_card)

sum = 0

for i in range(n_len):
    if i % 2 == 0:
        even = str()
        even = n_card[i]
        even = int(even)
        even = even * 2
        even = str(even)
        even_len = len(even)
        even_len = str(even_len)
       ## print(even_len)

        if even_len == "1":
            even = int(even)
            sum = even  + sum
        if even_len == "2":
            even_n1 = str()
            even_n2 = str()
            even_n1 = even[0]
            even_n2 = even[1]
            even_n1 = int(even_n1)
            even_n2 = int(even_n2)
            sum = even_n1 + even_n2 + sum

    elif i % 2 == 1:
        odd = str()
        odd = n_card[i]
        odd = int(odd)
        sum = odd + sum

##print(sum)

sum = str(sum)

if sum[1] != "0":
    print("INVALID")
    exit(0)


## 16 digits // starts 4
if (n_len == 13 or n_len == 16):
    ## and n_card[0] == "4":
    print("VISA")
    exit(0)

## 13 and 15 digits // starts 51, 52, 53, 54, or 55
elif n_len == 16:
    ##if n_card[0] == "5" and (n_card[1] == "1" or n_card[1] == "2" or n_card[1] == "3" or n_card[1] == "4" or n_card[1] == "5"):
        print("MASTERCARD")
        exit(0)

## 15 digits // starts 34 or 37
elif n_len == 15:
    ##if n_card[0] == "3" and n_card[1] == "4" or n_card[1] == "7":
        print("AMEX")
        exit(0)

else:
    print("INVALID")

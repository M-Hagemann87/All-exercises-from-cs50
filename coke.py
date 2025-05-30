def main():
    n  = 50
    n = int(n)
    print("Amount Due: ", n)
    logic(n)

def logic(n):
    while n >= 0:
        coin  = input("Insert Coin: ")
        coin = int(coin)
        if coin == 30:
            coin = 0
        coin = int(coin)
        n = n  - coin
        if  n > 0:
            print("Amount Due: ", n)
        elif n  <= 0:
            change = abs(n)
            print("Change Owed:", change)
            break


main()

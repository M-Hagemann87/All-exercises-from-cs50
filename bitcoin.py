import sys
import requests


url = 'https://rest.coincap.io/v3/assets/bitcoin?apiKey=f07045e415280d6c87a088537ceb5ba2f85ed7f84f54f3f76f57972af83d5925'
r = requests.get(url)
coin = r.json()
price_bitcoin = float(coin["data"]["priceUsd"])


try:
    if len(sys.argv) == 2 and not sys.argv[1].isalpha():
        bitcoin = float(sys.argv[1])
        amount = bitcoin * price_bitcoin
        print(f"${amount:,.4f}")

    elif len(sys.argv) == 2 and sys.argv[1].isalpha():
            print("Command-line argument is not a number")
            sys.exit(1)

    elif len(sys.argv) == 1:
        print("Missing command-line argument")
        sys.exit(1)

    else:
        print("Invalid")
        sys.exit(1)

except:
    sys.exit(1)

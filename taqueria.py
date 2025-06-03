food_list = [
    {"Baja Taco": 4.25},
    {"Burrito": 7.50},
    {"Bowl": 8.50},
    {"Nachos": 11.00},
    {"Quesadilla": 8.50},
    {"Super Burrito": 8.50},
    {"Super Quesadilla": 9.50},
    {"Taco": 3.00},
    {"Tortilla Salad": 8.00}
]
prices = 0.0


while True:
    try:
        item = input("Item: ").title()
        found = False

        for foods in food_list:
            if item in foods:
                price = foods[item]
                price = float(price)
                prices = prices + price
                print(f"Total: ${prices:.2f}")
                found = True
                break
            if not found:
                continue
    except EOFError:
        break

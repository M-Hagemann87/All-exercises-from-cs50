from tabulate import tabulate
import sys
import csv

def main():

    while True:
        try:

            len_sys = len(sys.argv)
            ext_file = sys.argv[-1]

            if len_sys < 2:
                print("Too few command-line arguments")
                exit(1)
            elif len_sys > 2:
                print("Too many command-line arguments")
                exit(1)

            x,y = ext_file.split(".")

            if y != "csv" and len_sys==2:
                print("Not a CSV file")
                exit(1)
            else:

                table_pizza = []
                call_1 = sys.argv[1]
                name_file = f"{call_1}"


                with open(name_file) as file:
                    reader = csv.DictReader(file)
                    headers = reader.fieldnames
                    pizza_type = headers[0]

                    for row in reader:
                        table_pizza.append({pizza_type: row[pizza_type], "Small": row["Small"], "Large":  row["Large"]})

            print(tabulate(table_pizza, headers="keys", tablefmt="grid"))
            exit(0)

        except ValueError:
            print("Not a CSV file")
            exit(1)

        except FileNotFoundError:
            print("File does not exit")
            exit(1)

if __name__ =="__main__":
    main()

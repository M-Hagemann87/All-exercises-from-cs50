#OK
import sys
import csv

def main():

    len_sys = len(sys.argv)
    before_file = sys.argv[-2]
    after_file = sys.argv[-1]

    if len_sys == 3:
        while True:
            try:
                students = []
                with open(before_file) as file:
                    reader = csv.DictReader(file)
                    for row in reader:
                        surname, first_name = row["name"].strip().split(",")
                        new_name_order = f"{first_name.strip()} {surname.strip()}"
                        students.append({"name": new_name_order, "house": row["house"]})

                with open(after_file, "w", newline="") as file:
                    writer = csv.DictWriter(file, fieldnames=["name", "house"])
                    writer.writeheader()

                    for student in students:
                        writer.writerow(student)
                break

            except ValueError:
                print("Not a CSV file")
                exit(1)

            except FileNotFoundError:
                print("Could not read", before_file)
                exit(1)

    elif len_sys < 3:
        sys.exit("Too few command-line arguments")

    elif len_sys > 3:
        sys.exit("Too many command-line arguments")


if __name__ =="__main__":
    main()

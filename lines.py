import sys

def main():

    while True:
        try:

            len_sys = len(sys.argv)
            ext_file = sys.argv[-1]
            x, y = ext_file.split(".")

            if y != "py":
                print("Not a Python file")
                exit(1)

            elif len_sys < 2:
                print("Too few command-line arguments")
                exit(1)
            elif len_sys > 2:
                print("Too many command-line arguments")
                exit(1)
            else:
                call_1 = sys.argv[1]
                name_file = f"{call_1}"

                with open(name_file) as file:
                    result = 0
                    for line in file:
                        lines_txt = line.strip()
                        if not lines_txt:
                            continue
                        if lines_txt.startswith("#"):
                            continue
                        result += 1

                    print(result)
                    break
        except FileNotFoundError:
            print("File does not exit")
            exit(1)

if __name__ =="__main__":
    main()


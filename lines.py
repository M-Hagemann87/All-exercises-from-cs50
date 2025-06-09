import sys

def main():

    while True:
        try:

            len_sys = len(sys.argv)
            if len_sys < 2:
                print("Too few command-line arguments")
                break
            elif len_sys > 2:
                print("Too many command-line arguments")
                break
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
        except ValueError:
            exit(1)
       # except FileNotFoundError:
       #     print("File does not exit")
        #    exit(0)

if __name__ =="__main__":
    main()


from PIL import Image, ImageOps
import sys

def main():

   len_sys = len(sys.argv)

   if len_sys < 3:
        sys.exit("Too few command-line arguments")

   elif len_sys > 3:
        sys.exit("Too many command-line arguments")

   elif len_sys ==3:

        try:
            after = sys.argv[-1]
            x1, y1 = after.lower().split(".")
            before = sys.argv[-2]
            x2, y2 = before.lower().split(".")

            if y1 not in ["jpg","jpeg","png"]:
                print("invalid input")
                exit(1)

            elif y1 != y2:
                print("Input and output have different extensions")
                exit(1)

            else:
                with Image.open(before) as base:
                    with Image.open("shirt.png") as shirt:
                        shirt_s = shirt.resize((1150, 1100))
                        base.paste(shirt_s, (35, 270), shirt_s)

                        base.save(after)


        except ValueError:
            sys.exit("Invalid input")



if __name__ =="__main__":
    main()

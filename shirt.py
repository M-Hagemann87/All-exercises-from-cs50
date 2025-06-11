from PIL import Image
import sys

def main():

   len_sys = len(sys.argv)

   if len_sys < 3:
        print("Too few command-line arguments")
        exit(1)

   elif len_sys > 3:
        print("Too many command-line arguments")
        exit(1)

   elif len_sys ==3:

        try:
            after = sys.argv[-1]
            x1, y1 = after.split(".")
            before = sys.argv[-2]
            x2, y2 = before.split(".")

            if y1 not in ["jpg","jpeg","png"]:
                print("invalid input")
                exit(1)

            elif y1 != y2:
                print("Input and output have different extensions")
                exit(1)

            else:
                with Image.open(before) as base:
                    with Image.open("shirt.png") as shirt:
                        box = (0, 0, 1200, 1370)
                        base = base.crop(box)
                        shirt_s = shirt.resize((1150, 1100))
                        base.paste(shirt_s, (35, 270), shirt_s)

                        base.save(after)


        except ValueError:
            print("Invalid input")
            exit(1)



if __name__ =="__main__":
    main()

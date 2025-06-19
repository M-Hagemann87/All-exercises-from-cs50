import sys
from PIL import Image, ImageOps
import os

def main():
    # Validate CLI arguments
    if len(sys.argv) < 3:
        sys.exit("Too few command-line arguments")
    elif len(sys.argv) > 3:
        sys.exit("Too many command-line arguments")

    input_file = sys.argv[1]
    output_file = sys.argv[2]

    # Validate extensions
    valid_ext = [".jpg", ".jpeg", ".png"]
    input_ext = os.path.splitext(input_file)[1].lower()
    output_ext = os.path.splitext(output_file)[1].lower()

    if input_ext not in valid_ext:
        sys.exit("Invalid input")
    if output_ext not in valid_ext:
        sys.exit("Invalid output")
    if input_ext != output_ext:
        sys.exit("Input and output have different extensions")

    # Try to open and process the image
    try:
        shirt = Image.open("shirt.png")
        before = Image.open(input_file)
        resized = ImageOps.fit(before, shirt.size)
        resized.paste(shirt, shirt)  # Use shirt as mask
        resized.save(output_file)
    except FileNotFoundError:
        sys.exit("Input does not exist")

if __name__ == "__main__":
    main()

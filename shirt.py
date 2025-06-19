import sys
from PIL import Image, ImageOps
import os

def main():
    # Validate command-line usage
    if len(sys.argv) != 3:
        sys.exit("Usage: python shirt.py input.jpg output.png")

    input_file = sys.argv[1]
    output_file = sys.argv[2]

    # Validate file extensions
    valid_extensions = [".jpg", ".jpeg", ".png"]
    input_ext = os.path.splitext(input_file.lower())[1]
    output_ext = os.path.splitext(output_file.lower())[1]

    if input_ext not in valid_extensions or output_ext not in valid_extensions:
        sys.exit("Input and output must be .jpg, .jpeg, or .png")

    if input_ext != output_ext:
        sys.exit("Input and output have different extensions")

    try:
        # Open input photo and shirt image
        photo = Image.open(input_file)
        shirt = Image.open("shirt.png")

        # Resize photo to match shirt size
        photo = ImageOps.fit(photo, shirt.size)

        # Paste shirt onto resized photo using shirt's alpha channel as mask
        photo.paste(shirt, shirt, shirt)

        # Save result
        photo.save(output_file)

    except FileNotFoundError:
        sys.exit(f"File not found: {input_file}")


if __name__ == "__main__":
    main()

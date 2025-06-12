import re

def main():
    print(validate(input("IPv4 Address: ").strip()))

def validate(ip):
    try:
        if re.search(r"\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}", ip):
            x,y,z,w = ip.split(".")
            x = int(x)
            y = int(y)
            z = int(z)
            w = int(w)
            if 0 <= x <= 255 and 0 <= y <= 255 and 0 <= z <= 255 and 0 <= w <= 255:
                return True

            else:
                return False
        else:
            return False

    except ValueError:
        return False

if __name__ == "__main__":
    main()

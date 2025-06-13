import validators

def main():

    print(email(input("What's your email address? ")))


def email(s):

    validators.email(s)
    if email:
        return "Valid"
    if not email:
        return "Invalid"


__name__ == "__main__"
main()

import validators

def main():

    print(email(input("What's your email address? ")))


def email(s):

    if validators.email(s):
        return "Valid"
    else:
        return "Invalid"


__name__ == "__main__"
main()

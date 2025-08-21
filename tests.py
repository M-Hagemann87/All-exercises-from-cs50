def main():

    x = input("Input: ")
    print("Output:", shorten(x))

def shorten(word):
    word = ''.join(c for c in word if c not in 'AEIOUaeiou')
    return word

if __name__ == "__main__":
    main()

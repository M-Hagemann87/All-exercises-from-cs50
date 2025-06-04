import emoji

text_input = input("Input: ")
print("Output: ", end="")
print(emoji.emojize(text_input, language='alias'))

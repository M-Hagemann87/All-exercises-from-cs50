text_in  = input("Input: ")
text_cons = ''.join(c for c in text_in if c not in 'AEIOUaeiou')

print("Output: ", end="")
print(text_cons)

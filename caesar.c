// Program to encrypt some prompt text;

#include <ctype.h> // is digit --> yes need to use it
#include <cs50.h> //  get_string, etc..
#include <math.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h> // For exit(0).

int rotate(string text);

int main(int argc, string argv[])
////////////ok===>
{
    string number = argv[1];

    if (argv[2] != NULL)
    {
        printf("Usage: %s key\n", argv[0]);
        exit(1);
    }
    for (int i = 0; number[i] != '\0'; i++)
    {
        char c = number[i];
        if (isdigit(number[i]))
        {
            continue;
        }
        else
        {
            printf("Usage: %s key\n", argv[0]);
            exit(1);
        }
    }
////////////ok===>
    int new_number = atoi(number);

    string text = get_string("plaintext: ");

    printf("ciphertext: ");

    for (int i = 0; text[i] != '\0'; i++)
    {
        char new_text = text[i];
        {
            char ABab = isupper(new_text) ? 'A' : 'a';
            char cal = new_text - ABab;
            char rotated = (cal + new_number) % 26;
            char rotated1 = rotated + ABab;
            printf("%c", rotated1);
        }

    }

    printf("\n");
}

// Program to find the grade of a specific text;

#include <ctype.h>// how many letter, count
#include <cs50.h>
#include <math.h>
#include <stdio.h>
#include <string.h>

int count_letters(string text);
int count_words(string text);
int count_sentences(string text);

int main(void)
{
    // Prompt the user for some text
    string text = get_string("Text: ");

    // Count the number of letters, words, and sentences in the text
    float letters = count_letters(text);
    float words = count_words(text);
    float sentences = count_sentences(text);

    float L = (letters / words)*100;
    float S = (sentences / words)*100;

    // Compute the Coleman-Liau index
    float score = (0.0588 * L - 0.296 * S - 15.8);

    // Print the grade level
    if (score < 1.0)
    {
        printf("Before Grade 1\n");
    }
    else if (1.0 <= score && score < 16.0)
    {
        //round
        printf("Grade %d\n", (int) round(score));
    }
    else
    {
        printf("Grade 16+\n");
    }
}

int count_letters(string text)
{
    // Return the number of letters in text
    int length = strlen(text);
    int count = 0;

    for (int i = 0; text[i] != '\0'; i++)
        if (text[i] == ' ')
            count++;
        else if (text[i] == '.')
            count++;
        else if (text[i] == ',')
            count++;
        else if (text[i] == ':')
            count++;
        else if (text[i] == ';')
            count++;
        else if (text[i] == '?')
            count++;
        else if (text[i] == '!')
            count++;
        else if (text[i] == '\'')
            count++;
        else if (text[i] == '\"')
            count++;
    return length - count;
}



int count_words(string text)
{
    // Return the number of words in text

    int count = 0;

    for (int i = 0; text[i] != '\0'; i++)
        if (text[i] == ' ')
            count++;
    return count + 1;

}

int count_sentences(string text)
{
    // Return the number of sentences in text
    int count = 0;

    for (int i = 0; text[i] != '\0'; i++)
        if (text[i] == '!')
            count++;
        else if (text[i] == '?')
            count++;
        else if (text[i] == '.')
            count++;
    return count;

}


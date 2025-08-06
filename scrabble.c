// Calculate points on Scrabble game //

#include <cs50.h>
#include <ctype.h>
#include <stdio.h>
#include <string.h>

// Points alphabet
int POINTS[] = {1, 3, 3, 2, 1, 4, 2, 4, 1, 8, 5, 1, 3, 1, 1, 3, 10, 1, 1, 1, 1, 4, 4, 8, 4, 10};

int compute_score(string text);

int main(void)
{
    // Prompt user 2x
    string text1 = get_string("Player 1: ");
    string text2 = get_string("Player 2: ");

    // Compute score
    int score1 = compute_score(text1);
    int score2 = compute_score(text2);

    // Winner
    if (score1 > score2)
    {
        printf("Player 1 wins!\n");
    }
    else if (score1 < score2)
    {
        printf("Player 2 wins!\n");
    }
    else if (score1 == score2)
    {
        printf("Tie!\n");
    }
}

int compute_score(string text)
{
    int score = 0;
    for (int i = 0, len = strlen(text); i < len; i++)
    {
        if (isupper(text[i]))
        {
            score += POINTS[text[i] - 'A'];
        }
        else if (islower(text[i]))
        {
            score += POINTS[text[i] - 'a'];
        }
    }
    return score;
}

#include <cs50.h>
#include <stdio.h>

int main(void)
{
    // Prompt the user for the pyramid's height
    int n;
    do
    {
        n = get_int("Height: ");
    }
    while (n > 9 || n < 1);

    // Print a pyramid of that height
    for (int i = 0; i < n; i++)
    {
        // Print row of bricks

        for (int j = i + 1; j < n; j++)
        {
            printf(" ");
        }
        for (int k = 0; k < i + 1; k++)
        {
            printf("#");
        }

        // Print empty 2x lines
        printf("  ");

        for (int k = 0; k < i + 1; k++)
        {
            printf("#");
        }
        printf("\n");
    }
}

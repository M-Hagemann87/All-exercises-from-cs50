// Cash exercise, subtract the highest value coin

#include <stdio.h>
#include <cs50.h>

int main(void)
{
    int coin;
    int count;
    do
    {
    coin = get_int("Chage owed: ");
    count = 0;
    }
    while (0 > coin);


    // Subtract 25
    while (coin >= 25)
    {
    coin = coin - 25;
    count++;
    }
    // Subtract 10
    while (coin >= 10)
    {
    coin = coin - 10;
    count++;
    }
    // Subtract 5
    while (coin >= 5)
    {
    coin = coin - 5;
    count++;
    }
    // Subtract 1
    while (coin >= 1)
    {
    coin = coin - 1;
    count++;
    }
    printf("%i", count);
    printf("\n");
}

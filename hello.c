// Program to say hello to a prompted name/user

#include <cs50.h>
#include <stdio.h>

int main(void)

{
    string user = get_string("What is your name?: \n");
    printf("hello, %s\n", user);
}

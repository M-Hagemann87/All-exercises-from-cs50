#include <cs50.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

int main(int argc, char *argv[])
{
    // * accept one command line
    // Check command-line arguments
    if (argc != 2)
    {
        printf("Usage: ./recover card.raw\n");
        return 1;
    }

    // Open files and determine scaling factor

    FILE *card = fopen(argv[1], "r");
    if (card == NULL)
    {
        printf("Could not open file.\n");
        return 1;
    }

    uint8_t buffer[512];
    // Create a buffer for a block of data
      FILE *img = NULL;
    char image_rec[8];
    int count = 0;
    int found = 0;

    // While there's still data left to read from the memory card
    while (fread(buffer, 1, 512, card) == 512)
    {
        // Create JPEGs from the data

        if (buffer[0] == 0xff && buffer[1] == 0xd8 && buffer[2] == 0xff)
            {
                if ((buffer[3] & 0xf0) == 0xe0)
                {

                    if (found)
                    {
                        fclose(img);
                    }
                    else
                    {
                        found = 1;
                    }

                    sprintf(image_rec, "%03i.jpg", count++);
                    img = fopen((image_rec), "w");

                    if (found)
                    {
                        fwrite(buffer, 1, 512, img);
                    }

                }

            }

    }
     // Close files
    if (img != NULL)
    {
        fclose(img);
    }
    fclose(card);
    return 0;

}

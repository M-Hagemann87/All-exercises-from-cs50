#include "helpers.h"
#include <math.h>
#include <cs50.h>

// Convert image to grayscale
void grayscale(int height, int width, RGBTRIPLE image[height][width])
{
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            // Average;
            int average;
            average =  ((int) round((image[i][j].rgbtRed + image[i][j].rgbtGreen + image[i][j].rgbtBlue)/ 3.0)) ;
            image[i][j].rgbtRed = average;
            image[i][j].rgbtGreen = average;
            image[i][j].rgbtBlue = average;

        }
    }
}

// Convert image to sepia
void sepia(int height, int width, RGBTRIPLE image[height][width])
{
    int sepiaRed;
    int sepiaGreen;
    int sepiaBlue;

    // Loop over all pixels
    for (int i = 0; i < height; i++)
    {


        for (int j = 0; j < width; j++)
        {
        int originalRed = image[i][j].rgbtRed;
        int originalGreen = image[i][j].rgbtGreen;
        int originalBlue = image[i][j].rgbtBlue;

        // Compute sepia values
        sepiaRed = ((int) round(.393 * originalRed + .769 * originalGreen + .189 * originalBlue));
        sepiaGreen = ((int) round(.349 * originalRed + .686 * originalGreen + .168 * originalBlue));
        sepiaBlue = ((int) round(.272 * originalRed + .534 * originalGreen + .131 * originalBlue));


        if (sepiaRed > 255)
            {
                sepiaRed = 255;
            }
        if (sepiaGreen > 255)
            {
                sepiaGreen = 255;
            }
        if (sepiaBlue > 255)
            {
                sepiaBlue = 255;
            }

        image[i][j].rgbtRed = sepiaRed;
        image[i][j].rgbtGreen = sepiaGreen;
        image[i][j].rgbtBlue = sepiaBlue;


        }
    }
}



// Reflect image horizontally
void reflect(int height, int width, RGBTRIPLE image[height][width])
{
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            int position_R = width - j;

            RGBTRIPLE tempL = image[i][j];
            RGBTRIPLE tempR = image[i][position_R];
            image[i][j] = tempR;
            image[i][position_R] = tempL;

            if (j != position_R || j != position_R + 1)
            {
                break;
            }

        }
    }
}

// Blur image
void blur(int height, int width, RGBTRIPLE image[height][width])
{
    // Create a copy of image
    RGBTRIPLE copy[height][width];
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            copy[i][j] = image[i][j];

            RGBTRIPLE c1 = image[i-1][j-1];
            RGBTRIPLE c2 = image[i][j];
            RGBTRIPLE c3 = image[i-1][j+1];

            RGBTRIPLE c4 = image[i][j-1];
            RGBTRIPLE c5 = image[i][j];
            RGBTRIPLE c6 = image[i][j+1];

            RGBTRIPLE c7 = image[i+1][j-1];
            RGBTRIPLE c8 = image[i][j];
            RGBTRIPLE c9 = image[i+1][j+1];

            int average_Red;
            average_Red = ((c1.rgbtRed + c2.rgbtRed + c3.rgbtRed +
                           c4.rgbtRed + c5.rgbtRed + c6.rgbtRed +
                           c7.rgbtRed + c8.rgbtRed + c9.rgbtRed)/9);

            int average_Green;
            average_Green = ((c1.rgbtGreen + c2.rgbtGreen + c3.rgbtGreen +
                             c4.rgbtGreen + c5.rgbtGreen + c6.rgbtGreen +
                             c7.rgbtGreen + c8.rgbtGreen + c9.rgbtGreen)/9);

            int average_Blue;
            average_Blue = ((c1.rgbtBlue + c2.rgbtBlue + c3.rgbtBlue +
                             c4.rgbtBlue + c5.rgbtBlue + c6.rgbtBlue +
                             c7.rgbtBlue + c8.rgbtBlue + c9.rgbtBlue)/9);



        //  int average_color;
        //  average_color =  ((int) round(average_Blue + average_Green + average_Red)/ 3.0);


            image[i][j].rgbtRed = average_Red;
            image[i][j].rgbtGreen = average_Green;
            image[i][j].rgbtBlue = average_Blue;

        }
    }
}




//int main(void)
//{

////    return 0;
//}



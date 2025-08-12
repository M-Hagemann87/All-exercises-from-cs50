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
            int position_R = width - j - 1;

            if (j > position_R)
            {
                break;
            }

            RGBTRIPLE tempL = image[i][j];
            RGBTRIPLE tempR = image[i][position_R];
            image[i][j] = tempR;
            image[i][position_R] = tempL;
        }

    }
}

// Blur image
void blur(int height, int width, RGBTRIPLE image[height][width])
{
    RGBTRIPLE copy[height][width];

    // Copy original image
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            copy[i][j] = image[i][j];
        }
    }

    // Apply blur
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            int totalRed = 0, totalGreen = 0, totalBlue = 0;
            int count = 0;

            // Loop over 3x3 box
            for (int di = -1; di <= 1; di++)
            {
                for (int dj = -1; dj <= 1; dj++)
                {
                    int ni = i + di;
                    int nj = j + dj;

                    // Check bounds
                    if (ni >= 0 && ni < height && nj >= 0 && nj < width)
                    {
                        totalRed += copy[ni][nj].rgbtRed;
                        totalGreen += copy[ni][nj].rgbtGreen;
                        totalBlue += copy[ni][nj].rgbtBlue;
                        count++;
                    }
                }
            }

            image[i][j].rgbtRed = round((float)totalRed / count);
            image[i][j].rgbtGreen = round((float)totalGreen / count);
            image[i][j].rgbtBlue = round((float)totalBlue / count);
        }
    }
}



//int main(void)
//{

////    return 0;
//}



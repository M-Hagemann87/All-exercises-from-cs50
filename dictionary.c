// Implements a dictionary's functionality

#include <ctype.h>
#include <stdbool.h>
#include <string.h>
#include <strings.h>
#include <stdlib.h>
#include <stdio.h>

#include "dictionary.h"

// Represents a node in a hash table
typedef struct node
{
    char word[LENGTH + 1];
    struct node *next;
} node;

// TODO: Choose number of buckets in hash table
const unsigned int N = 26;

// Hash table
node *table[N] = {0};

// Returns true if word is in dictionary, else false
bool check(const char *word)
{
    // TODO
    int hash_word = hash(word);

    for (node *cursor = table[hash_word]; cursor !=NULL; cursor = cursor->next )
        {
        if (strcasecmp(cursor->word, word) ==0)
            {
            return true;
             }

    }
    return false;
}

// Hashes word to a number
unsigned int hash(const char *word)
{
    // TODO: Improve this hash function
    // a = 0, b = 1, c = 3, z = 25
        unsigned char c = (unsigned char) word[0];
        if (isalpha(c))
        {
            return (unsigned int)(toupper(word[0]) - 'A');
        }
        return 0;
}

// Loads dictionary into memory, returning true if successful, else false
bool load(const char *dictionary)
{
    // TODO
    // Open the dictionary file

    char word[LENGTH + 1];
    FILE *source = fopen(dictionary, "r");

    if (source == NULL)
    {
        return false;
    }

    // Read each word in the file

    while (fscanf(source, "%s", word) != EOF)
        {
        node *n = malloc(sizeof(node));
        // close if null or in the end of the file
         if (n == NULL)
            {
                fclose(source);
                return false;
            }
// Add each word to the hash table
        strcpy(n->word, word);

        int hash_word = hash(word);

        n->next = table[hash_word];
        table[hash_word] = n;

    }
    // Close the dictionary file
    fclose(source);
    return true;
}

// Returns number of words in dictionary if loaded, else 0 if not yet loaded
unsigned int size(void)
{
    // TODO
    int count = 0;
    for (int i =0; i < N; i++)
        {
            node *cursor = table[i];
            while (cursor != NULL)
            {
                count++;
                cursor = cursor->next;
            }
        }
        return count;

}

// Unloads dictionary from memory, returning true if successful, else false
bool unload(void)
{
    // TODO
    for (int i = 0; i < N; i++)
    {
        node *cursor = table[i];
        while (cursor != NULL)
        {
            node *tmp = cursor;
            cursor = cursor->next;
            free(tmp);
        }
    }
    return true;
}

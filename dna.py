import csv
import sys


## ARGV == 1 => Name of the CSV file
### ARGV == 2 => the STR counts

def main():

    name_csv_file = str()
    str_count = str()

        # TODO: Check for command-line usage
    try:
        if len(sys.argv) == 1:
            name_csv_file = sys.argv[1]

        if len(sys.argv) == 2:
            str_count = sys.argv[2]
    except ValueError:
        exit("Invalid Input")


        # TODO: Read database file into a variable
        with open(f"{name_csv_file}") as file:
            reader = csv.DictReader(file)
            print(reader.fieldnames)

    # TODO: Read DNA sequence file into a variable ##file.read().splitlines()
            reader = file.read()

    # TODO: Find longest match of each STR in DNA sequence ### DNA = Sequence  ### STR = Subsequence
            reader = csv.reader(file)
            strs = (next(reader))
            for str in strs:
                longest_matches[str] = longest_match(sequence, str)


    # TODO: Check database for matching profiles
            match = True
            for row in reader:
                for str in longest_matches:
                    if row[str] != longest_matches[str]
                        return row[str]


                if longest_matches[row] == str:


def longest_match(sequence, subsequence):
    """Returns length of longest run of subsequence in sequence."""

    # Initialize variables
    longest_run = 0
    subsequence_length = len(subsequence)
    sequence_length = len(sequence)

    # Check each character in sequence for most consecutive runs of subsequence
    for i in range(sequence_length):

        # Initialize count of consecutive runs
        count = 0

        # Check for a subsequence match in a "substring" (a subset of characters) within sequence
        # If a match, move substring to next potential match in sequence
        # Continue moving substring and checking for matches until out of consecutive matches
        while True:

            # Adjust substring start and end
            start = i + count * subsequence_length
            end = start + subsequence_length

            # If there is a match in the substring
            if sequence[start:end] == subsequence:
                count += 1

            # If there is no match in the substring
            else:
                print("No match")
                break

        # Update most consecutive matches found
        longest_run = max(longest_run, count)

    # After checking for runs at each character in seqeuence, return longest run found
    return longest_run


main()

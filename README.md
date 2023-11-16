# Caesar Cipher Decoder

> This program works best for inputted strings that have more than 750 letters (not including spaces or other characters).

## Part 1 (Python Notebook): Guessing the Shift Value
This part of the program is where the user inputs an encrypted string, and a prediction for the shift value is calculated. Following along with the steps listed in the notebook, `caesar_cipher.ipynb`, up to 26 total guesses can be generated, and they will be generated in order of confidence in accuracy. The notebook will store a CSV file that contains the frequency of each letter in the inputted string in the current working directory. A sample of this file is 'lettercounts.csv' is included in this repository. It is important that this file stay in the same directory as the R and Python notebooks, so the file can effectively be used by both programs.

## Part 2 (R - recommend using RStudio): Frequency Analysis
This part of the program calculates the chi-squared value, yielded by testing for goodness of fit between the observed and expected frequencies of letters. The expected frequencies are determined by multiplying the number of letters in the user-inputted string with the average relative frequency of letters in the alphabet as a percentage (source of frequency data mentioned below). The size of the chi-squared value is representative of the difference between the actual and observed frequencies of letters in the given string.

## Interpreting Results
The chi-squared value that is outputted can be interpreted by establishing a confidence level. For example, if a user wants to be 90% confident about the accuracy of this value as the shift, their critical value would be 1 - 0.90 = 0.10. The user can then interpret the results as correct, if the chi-squared value is less than the critical value and incorrect, if the chi-squared value is greater than the critical value. In the event that there are no chi-squared values that are smaller than the critical value (out of all 26 possible guesses), the correct shift is still most likely the smallest chi-squared value produced.

The user can also use the graphs generated in the Python (expected frequencies) and R (frequencies in guess) notebooks to assess whether they appear close enough to each other. Because the frequency of letters cannot be represented by a definitive function, sometimes simply looking at the graphs will provide enough insight into the pattern of letter frequency in the phrase.

## Sources
- Relative Frequency of Letters in English Alphabet: Mička, Pavel. "Letter frequency (English)". Algoritmy.net. Archived from the original on 4 March 2021. Retrieved 14 June 2022. Source is Leland, Robert. Cryptological mathematics. [s.l.] : The Mathematical Association of America, 2000. 199 p. ISBN 0-88385-719-7

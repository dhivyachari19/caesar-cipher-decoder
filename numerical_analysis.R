# Numerical Analysis on Caesar Cipher Guesses

setwd("/Users/dhivyachari/caesar_cipher")
library(ggplot2)
letters = c('a', 'b', 'c', 'd', 'e', 'f',
           'g', 'h', 'i', 'j', 'k', 'l', 
           'm', 'n', 'o', 'p', 'q', 'r',
           's', 't', 'u', 'v', 'w', 'x',
           'y', 'z')

## Importing observed frequency data on guess (letters count csv file)
observed_df = data.frame(letter = letters, frequency = 0)
counts_df = read.csv("lettercounts.csv")
observed_df["frequency"] = counts_df$Counts
num_letters = sum(observed_df$frequency)
ggplot(observed_df, aes(x=letters, y=frequency)) + 
  geom_bar(stat = "identity")

## Creating dataset for expected percent frequencies
expected_pct_df <- data.frame (
  Letters = c('a', 'b', 'c', 'd', 'e', 'f', 
              'g', 'h', 'i', 'j', 'k', 'l', 
              'm', 'n', 'o', 'p', 'q', 'r',
              's', 't', 'u', 'v', 'w', 'x',
              'y', 'z'),
  Frequency = c(8.2, 1.5, 2.8, 4.3, 12.7, 
                2.2, 2.0, 6.1, 7.0, 0.15,
                0.77, 4, 2.4, 6.7, 7.5,
                1.9, .095, 6, 6.3, 9.1, 
                2.8, 0.98, 2.4, 0.15, 2.0, .074)
)

### finding frequencies as percentages
expected_pct_df$Frequency = expected_pct_df$Frequency/100
expected_pct = expected_pct_df$Frequency
observed_pct = observed_df$frequency/num_letters

## chi sq test
diff_percent_df = data.frame(diff = (observed_pct-expected_pct)^2)
diff_percent_df$diff = diff_percent_df$diff/expected_pct
chi_sq_val = sum(diff_percent_df$diff)
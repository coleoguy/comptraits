# Jorja Burch - jorjaelliott@tamu.edu

# this script calculates the mean percent errors for different combinations throughout 
# the percent error results file, which only contains results for when both 
# elemental traits are additive

library(dplyr)

# read in results file with calculated beta coeff for +, -, and *, and percent errors
data <- read.csv("../results/res_a_percerr.csv")

# ADDITION
# Filter the data for "Aa + Aa" in the "trait" column and calculate the mean of "PercentError"
mean_pe_add <- data %>%
  filter(trait == "Aa + Aa") %>%
  summarise(mean_percent_error = mean(PercentError, na.rm = TRUE))


# SUBTRACTION (both 1 - 2 and 2 - 1)
# Filter the data for "Aa - Aa" in the "trait" column and calculate the mean of "PercentError"
mean_pe_sub <- data %>%
  filter(trait == "Aa - Aa") %>%
  summarise(mean_percent_error = mean(PercentError, na.rm = TRUE))


# MULTIPLICATION
# Filter the data for "Aa * Aa" in the "trait" column and calculate the mean of "PercentError"
mean_pe_mult <- data %>%
  filter(trait == "Aa * Aa") %>%
  summarise(mean_percent_error = mean(PercentError, na.rm = TRUE))



# Jorja Burch - jorjaelliott@tamu.edu

# this script calculates the percent error for how well LCA infers the correct magnitudes
# of the architectures based on an expected beta coeff for each trait

library(dplyr)

# read the data from the results csv file with the beta coeffs
data <- read.csv("../results/res_betas.csv")

# change all NAs to be zeros
data[is.na(data)] <- 0

# subset the results to be only the first 8000 rows, where the two elemental 
# traits are additive and additive
data_a <- data[1:8000,]

# define a function to calculate percent error
percent_error <- function(observed, expected) {
  abs((observed - expected) / expected) * 100
}

# calculate the sum of the observed values
data_a <- data_a %>%
  rowwise() %>%
  mutate(
    Observed_Sum = sum(c_across(Aa:AdAd)),
    PercentError = percent_error(Observed_Sum, beta)
  ) %>%
  ungroup()

# save file as csv with percent errors
#write.csv(data_a, "../results/res_a_percerr.csv", row.names = F)


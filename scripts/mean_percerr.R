# Jorja Burch - jorjaelliott@tamu.edu

# this script calculates the mean percent errors for different combinations throughout 
# the percent error results file, which only contains results for when both 
# elemental traits are additive


# read in results file with calculated beta coeff for +, -, and *, and percent errors
data <- read.csv("../results/res_a_percerr.csv")



# ELEMENTAL
# Filter the data for "Aa + Aa" in the "trait" column
ell_pe <- data[data$trait == "Aa", ]

# Calculate the mean of the "PercentError" column, ignoring any NA values
ell_pe <- mean(ell_pe$PercentError, na.rm = TRUE)



# ADDITION
# Filter the data for "Aa + Aa" in the "trait" column
add_pe <- data[data$trait == "Aa + Aa", ]

# Calculate the mean of the "PercentError" column, ignoring any NA values
add_pe <- mean(add_pe$PercentError, na.rm = TRUE)



# SUBTRACTION
# Filter the data for "Aa + Aa" in the "trait" columns
sub_pe <- data[data$trait == "Aa - Aa", ]

# Calculate the mean of the "PercentError" column, ignoring any NA values
sub_pe <- mean(sub_pe$PercentError, na.rm = TRUE)




# MULTIPLICATION
# Filter the data for "Aa * Aa" in the "trait" column
mult_pe <- data[data$trait == "Aa * Aa", ]

# Calculate the mean of the "PercentError" column, ignoring any NA values
mult_pe <- mean(mult_pe$PercentError, na.rm = TRUE)





# Jorja Burch - jorjaelliott@tamu.edu

# this script calculates the percent error for each elemental and compound trait
# and treats the beta coeff in each row as a vector of that number and  four zeros 
# (e.g., c(4.5, 0, 0, 0, 0) for additive, c(0, 10.6, 0, 0, 0) for dominance, etc.) 
# and the observed is a vector of the 5 values in columns 4 through 8 (genetic effects)

# the top portion of the script generates the percent errors for each row, while 
# the bottom portion of the script calculates the mean percent error for the elemental
# trait and for each defining function
# this is repeated for each combination of elemental traits

library(data.table)

# Read the CSV file
data <- read.csv("../results/res_betas.csv")

############## a & a ############## 
# subset the results to be only the first 8000 rows, where the two elemental 
# traits are additive and additive
data_a <- data[1:8000,]

# change all NAs to be zeros
data_a[is.na(data_a)] <- 0

# create a vector to store percent errors
percent_errors <- numeric(nrow(data_a))

# loop through each row of the matrix
for (i in 1:nrow(data_a)) {
  # extract the expected value from the "beta" column
  expected_value <- data_a$beta[i]
  
  # check if the expected value is NA
  if (is.na(expected_value)) {
    percent_errors[i] <- NA
  } else {
    # if a single value is provided for expected, create a vector with that value and four zeros
    expected <- c(expected_value, rep(0, 4))
    
    # extract the observed values from columns 4-8
    observed_values <- as.numeric(data_a[i, 4:8])
    
    # calculate the percent error for each pair of observed and expected values
    percent_errors_row <- ifelse(expected == 0, Inf, (abs(sum(observed_values - expected)) / abs(sum(expected))) * 100)
    
    # handle cases where expected is zero to avoid infinite percent error
    percent_errors_row[is.infinite(percent_errors_row)] <- NA
    
    # calculate the average percent error, ignoring NA values, this is likely only a single value,
    # so it is not actually taking the mean
    mean_percent_error <- mean(percent_errors_row, na.rm = TRUE)
    
    # store the result in the percent_errors vector
    percent_errors[i] <- mean_percent_error
  }
}

# add the percent errors as a new column to the original matrix
data_a$percent_error <- percent_errors


## ELEMENTAL TRAIT Aa ##
# Filter rows where the "trait" column is "Aa"
filt_data_a <- data_a[data_a$trait == "Aa", ]
#filt_data_a <- data_a[-1354,]
#filt_data_a <- filt_data_a[-2482,]
#filt_data_a <- filt_data_a[filt_data_a$percent_error <= 100, ] #pe=12.9%
#filt_data_a <- filt_data_a[filt_data_a$percent_error <= 200, ] #pe=15.8%
filt_data_a <- filt_data_a[filt_data_a$percent_error <= 80000, ] #pe=20.65%

# Calculate the mean of the "percent_error" column for the filtered rows
mean_pe_a <- mean(filt_data_a$percent_error, na.rm = TRUE)



## DEFINING FUNCTION: ADDITIVE ##
# Filter rows where the "trait" column is "Aa + Aa"
filt_data_add <- data_a[data_a$trait == "Aa + Aa", ]

# Calculate the mean of the "percent_error" column for the filtered rows
mean_pe_add <- mean(filt_data_add$percent_error, na.rm = TRUE)
# 13.42%


## DEFINING FUNCTION: SUBTRACTION ##
# Filter rows where the "trait" column is "Aa - Aa"
filt_data_sub <- data_a[data_a$trait == "Aa - Aa", ]

# Calculate the mean of the "percent_error" column for the filtered rows
mean_pe_sub <- mean(filt_data_sub$percent_error, na.rm = TRUE)
# 60.48%


## DEFINING FUNCTION: MULTIPLICATION ##
# Filter rows where the "trait" column is "Aa * Aa"
filt_data_mult <- data_a[data_a$trait == "Aa * Aa", ]

# Calculate the mean of the "percent_error" column for the filtered rows
mean_pe_mult <- mean(filt_data_mult$percent_error, na.rm = TRUE)
# 15.72%
############## a & a ############## 


############## d & d ############## 
# subset the results to be only rows 24001 through 32000, where the two elemental 
# traits are dominance and dominance
data_d <- data[24001:32000,]

# change all NAs to be zeros
data_d[is.na(data_d)] <- 0

# create a vector to store percent errors
percent_errors <- numeric(nrow(data_d))

# loop through each row of the matrix
for (i in 1:nrow(data_d)) {
  # extract the expected value from the "beta" column
  expected_value <- data_d$beta[i]
  
  # check if the expected value is NA
  if (is.na(expected_value)) {
    percent_errors[i] <- NA
  } else {
    # if a single value is provided for expected, create a vector with that value and four zeros
    expected <- c(0, expected_value, rep(0, 3))
    
    # extract the observed values from columns 4-8
    observed_values <- as.numeric(data_d[i, 4:8])
    
    # calculate the percent error for each pair of observed and expected values
    percent_errors_row <- ifelse(expected == 0, Inf, (abs(sum(observed_values - expected)) / abs(sum(expected))) * 100)
    
    # handle cases where expected is zero to avoid infinite percent error
    percent_errors_row[is.infinite(percent_errors_row)] <- NA
    
    # calculate the average percent error, ignoring NA values, this is likely only a single value,
    # so it is not actually taking the mean
    mean_percent_error <- mean(percent_errors_row, na.rm = TRUE)
    
    # store the result in the percent_errors vector
    percent_errors[i] <- mean_percent_error
  }
}

# add the percent errors as a new column to the original matrix
data_d$percent_error <- percent_errors


## ELEMENTAL TRAIT Ad ##
# Filter rows where the "trait" column is "Ad"
filt_data_d <- data_d[data_d$trait == "Ad", ]

# Calculate the mean of the "percent_error" column for the filtered rows
mean_pe_d <- mean(filt_data_d$percent_error, na.rm = TRUE)
# 32.2%


## DEFINING FUNCTION: ADDITIVE ##
# Filter rows where the "trait" column is "Ad + Ad"
filt_data_d_add <- data_d[data_d$trait == "Ad + Ad", ]

# Calculate the mean of the "percent_error" column for the filtered rows
mean_pe_d_add <- mean(filt_data_d_add$percent_error, na.rm = TRUE)
# 21.7%


## DEFINING FUNCTION: SUBTRACTION ##
# Filter rows where the "trait" column is "Ad - Ad"
filt_data_d_sub <- data_d[data_d$trait == "Ad - Ad", ]

# Calculate the mean of the "percent_error" column for the filtered rows
mean_pe_d_sub <- mean(filt_data_d_sub$percent_error, na.rm = TRUE)
# 54%


## DEFINING FUNCTION: MULTIPLICATION ##
# Filter rows where the "trait" column is "Ad * Ad"
filt_data_d_mult <- data_d[data_d$trait == "Ad * Ad", ]

# Calculate the mean of the "percent_error" column for the filtered rows
mean_pe_d_mult <- mean(filt_data_d_mult$percent_error, na.rm = TRUE)
# 85.1%
############## d & d ############## 








#this one doesnt work yet#
############## a & d ##############
# subset the results to be only rows 8001 through 16000, where the two elemental 
# traits are additive and dominance
data_ad <- data[8001:16000,]

# change all NAs to be zeros
data_ad[is.na(data_ad)] <- 0

# create a vector to store percent errors
percent_errors <- numeric(nrow(data_ad))

# loop through each row of the matrix
for (i in 1:nrow(data_ad)) {
  # extract the expected value from the "beta" column
  expected_value <- data_ad$beta[i]
  
  # check if the expected value is NA
  if (is.na(expected_value)) {
    percent_errors[i] <- NA
  } else {
    # if a single value is provided for expected, create a vector with that value and four zeros
    expected <- c(0, expected_value, rep(0, 3))
    
    # extract the observed values from columns 4-8
    observed_values <- as.numeric(data_ad[i, 4:8])
    
    # calculate the percent error for each pair of observed and expected values
    percent_errors_row <- ifelse(expected == 0, Inf, (abs(sum(observed_values - expected)) / abs(sum(expected))) * 100)
    
    # handle cases where expected is zero to avoid infinite percent error
    percent_errors_row[is.infinite(percent_errors_row)] <- NA
    
    # calculate the average percent error, ignoring NA values, this is likely only a single value,
    # so it is not actually taking the mean
    mean_percent_error <- mean(percent_errors_row, na.rm = TRUE)
    
    # store the result in the percent_errors vector
    percent_errors[i] <- mean_percent_error
  }
}

# add the percent errors as a new column to the original matrix
data_ad$percent_error <- percent_errors


## DEFINING FUNCTION: ADDITIVE ##
# Filter rows where the "trait" column is "Aa + Ad"
filt_data_ad_add <- data_ad[data_ad$trait == "Aa + Ad", ]

# Calculate the mean of the "percent_error" column for the filtered rows
mean_pe_ad_add <- mean(filt_data_ad_add$percent_error, na.rm = TRUE)
# 


## DEFINING FUNCTION: SUBTRACTION ##
# Filter rows where the "trait" column is "Aa - Ad"
filt_data_ad_sub <- data_ad[data_ad$trait == "Aa - Ad", ]

# Calculate the mean of the "percent_error" column for the filtered rows
mean_pe_ad_sub <- mean(filt_data_ad_sub$percent_error, na.rm = TRUE)
# 


## DEFINING FUNCTION: MULTIPLICATION ##
# Filter rows where the "trait" column is "Aa * Ad"
filt_data_ad_mult <- data_ad[data_ad$trait == "Aa * Ad", ]

# Calculate the mean of the "percent_error" column for the filtered rows
mean_pe_ad_mult <- mean(filt_data_ad_mult$percent_error, na.rm = TRUE)
#
############## a & d ##############























# additive
plot(x=filt_data_a$beta, y=filt_data_a$percent_error, xlim=c(0,0.5))


# dominance
plot(x=filt_data_d$beta, y=filt_data_d$percent_error, pch=16, cex=.05)






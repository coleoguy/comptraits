# Jorja Burch - jorjaelliott@tamu.edu
# this script calculates if there is a statistically significant difference between the "success" 
# for a 5 cohort set and a 15 cohort set (i.e., determining effect of cohort size)


# Load necessary library
library(tidyr)


# read in partial matrix (condensed version) for 5 cohort set
small <- read.csv("../../../results/partial.matrix_mean.csv")

# read in partial matrix (condensed version) for 15 cohort set
large <- read.csv("../../../results/additional.cohorts.results/15cohorts/jd_partial_matrix_means.csv")

small_numeric <- as.matrix(small[,3:6])

large_numeric <- as.matrix(large[,3:6])

# Check if the matrices have the same dimensions
if(!all(dim(small_numeric) == dim(large_numeric))) {
  stop("The matrices do not have the same dimensions.")
}

# Flatten the matrices into vectors
small_vector <- as.vector(small_numeric)
large_vector <- as.vector(large_numeric)

# correlation test
cor.test(small_vector, large_vector)
# results in significant pos cor (cor = 0.83, p-val = 5.3e-07)

# paired sample t test
t.test(small_vector, large_vector, paired = TRUE)
# significant p-val. significant effect of cohort size on compound traits


### differences between 5 and 15 cohort size for functions and elem archs

# SMALL COHORT SET - 5 cohorts - DEFINING FUNCTIONS
addition_small <- mean(small$addition) #0.55
subtraction_small <- mean(small$subtraction) #0.5
multiplication_small <- mean(small$multiplication) #0.67
division_small <- mean(small$division) #0.41

# LARGE COHORT SET - 15 cohorts - DEFINING FUNCTIONS
addition_large <- mean(large$addition) #0.65
subtraction_large <- mean(large$subtraction) #0.61
multiplication_large <- mean(large$multiplication) #0.84
division_large <- mean(large$division) #0.77


# SMALL COHORT SET - 5 cohorts - ELEM ARCHS
aa <- as.matrix(small[1,3:6])
aa_meansmall <- mean(aa) #0.94

ad <- as.matrix(small[2,3:6])
ad_meansmall <- mean(ad) #0.39

dd <- as.matrix(small[3,3:6])
dd_meansmall <- mean(dd) #0.74

ae <- as.matrix(small[4,3:6])
ae_meansmall <- mean(ae) #0.43

de <- as.matrix(small[5,3:6])
de_meansmall <- mean(de) #0.18

ee <- as.matrix(small[6,3:6])
ee_meansmall <- mean(ee) #0.51

# LARGE COHORT SET - 15 cohorts - ELEM ARCHS
aa <- as.matrix(large[1,3:6])
aa_meanlarge <- mean(aa) #0.95

ad <- as.matrix(large[2,3:6])
ad_meanlarge <- mean(ad) #0.596

dd <- as.matrix(large[3,3:6])
dd_meanlarge <- mean(dd) #0.85

ae <- as.matrix(large[4,3:6])
ae_meanlarge <- mean(ae) #0.67

de <- as.matrix(large[5,3:6])
de_meanlarge <- mean(de) #0.51

ee <- as.matrix(large[6,3:6])
ee_meanlarge <- mean(ee) #0.72





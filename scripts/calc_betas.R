# Jorja Burch - jorjaelliott@tamu.edu

# this script reads in the results from the original (5-cohort) simulation 
# and calculates the expected beta coefficients for each of the compound traits, 
# based on their defining function.

library(data.table)

# read in the results from the original simulation
res <- read.csv("../results/sim.results.csv")

# create a duplicate of res to input the compound trait "expected" beta coefficients
res_betas <- copy(res)

# calculate expected beta coefficients for each compound trait in each set of 8 rows 
# (each dataset)
for (i in seq(1, nrow(res_betas), by = 8)) {
  
  start_row <- i
  
    beta1 <- as.numeric(res_betas[start_row, 2])
    beta2 <- as.numeric(res_betas[start_row + 1, 2])
    
    res_betas[start_row + 2, 2] <- beta1 / beta2
    res_betas[start_row + 3, 2] <- beta2 / beta1
    res_betas[start_row + 4, 2] <- beta1 * beta2
    res_betas[start_row + 5, 2] <- beta1 + beta2
    res_betas[start_row + 6, 2] <- beta1 - beta2
    res_betas[start_row + 7, 2] <- beta2 - beta1
}

write.csv(res_betas, "../results/res_betas.csv")

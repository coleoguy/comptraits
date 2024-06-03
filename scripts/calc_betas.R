# Jorja Burch - jorjaelliott@tamu.edu

# this script reads in the results from the original (5-cohort) simulation 
# and calculates the expected beta coefficients for each of the compound traits, 
# based on their defining function. beta coefficients are not calculated for the division
# traits

library(data.table)

# read in the results from the original simulation
res <- read.csv("../results/sim.results.csv")

# read in the file with the values = to the difference in the p1 and p2 for each of the 
# multiplication compound traits
multrgs <- read.csv("../results/mult_comprange.csv")

# Divide vals in multrgs by 2, as this corresponds to the deviation from the mid-parent phenotype
multrgs <- as.data.frame((multrgs[,1])/2)

# Create a duplicate of res to input the compound trait "expected" beta coefficients
res_betas <- copy(res)

# Initialize a counter for multrgs
multrgs_counter <- 1

# Calculate expected beta coefficients for each compound trait in each set of 8 rows 
# (each dataset)
for (i in seq(1, nrow(res_betas), by = 8)) {
  
  start_row <- i
  
  beta1 <- as.numeric(res_betas[start_row, 2])
  beta2 <- as.numeric(res_betas[start_row + 1, 2])
  
  # Update the res_betas data frame
  # res_betas[start_row + 2, 2] <- beta1 / beta2 -- do not calculate for division
  # res_betas[start_row + 3, 2] <- beta2 / beta1 -- do not calculate for division
  res_betas[start_row + 4, 2] <- multrgs[multrgs_counter, 1]
  res_betas[start_row + 5, 2] <- beta1 + beta2
  res_betas[start_row + 6, 2] <- beta1 - beta2
  res_betas[start_row + 7, 2] <- beta2 - beta1
  
  # Increment the multrgs counter
  multrgs_counter <- multrgs_counter + 1
}

#write.csv(res_betas, "../results/res_betas.csv")

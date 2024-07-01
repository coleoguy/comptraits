# jorja burch - jorjaelliott@tamu.edu
# this script removes rows where the elemental trait has a beta coeff 
# less than 0.002, and it removes the compound traits that were calculated
# using that elemental trait

library(readr)

df <- read_csv("../results/sim.results-simplified-archs.csv")

# filter rows where "beta" is non-NA and less than 0.002
filtered_rows <- which(!is.na(df$beta) & df$beta < 0.002)

# remove sections of 8 rows when elemental trait is less than 0.002
df <- df[-c(c(1353:1360, 2481:2488, 3921:3928, 4457:4464, 4577:4584, 8673:8680, 
              10225:10232, 30121:30128, 32265:32272, 34257:34264)), ]

write.csv(df, "../results/rm_sm_betas_results.csv", row.names = F)

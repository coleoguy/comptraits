# jorja burch - jorjaelliott@tamu.edu
# this script removes rows where the elemental trait has a beta coeff 
# less than 0.002, and it removes the compound traits that were calculated
# using that elemental trait

# this script is used to remove small betas from the original sim.results-simplified-archs.csv 
# AND the res_betas.csv files. 

library(readr)

# remove from original sim results file - 5 cohorts
#df <- read_csv("../results/sim.results-simplified-archs.csv")

# remove from original sim results file - 15 cohorts
df <- read_csv("../results/additional.cohorts.results/15cohorts/jd.sim.results-simplified-archs.csv")

# filter rows where "beta" is non-NA and less than 0.002
filtered_rows <- which(!is.na(df$beta) & df$beta < 0.002)

# remove sections of 8 rows when elemental trait is less than 0.002
df <- df[-c(c(1353:1360, 2481:2488, 3921:3928, 4457:4464, 4577:4584, 8673:8680, 
              10225:10232, 30121:30128, 32265:32272, 34257:34264)), ]


#results csv with <0.002 betas removed - 5 cohort results
#write.csv(df, "../results/rm_sm_betas_results.csv", row.names = F)

#results csv with <0.002 betas removed - 15 cohort results
write.csv(df, "../results/additional.cohorts.results/15cohorts/jd_15coh_rm_sm_betas_res.csv", row.names = F)

### this next section just removed the small betas from the 
# original results file with the calculated beta coeff included

# remove from res_betas file
df.resbetas <- read_csv("../results/res_betas.csv")

# filter rows where "beta" is non-NA and less than 0.002 -- this step isnt needed
# because we already know which sections need to be removed
# filtered_rows <- which(!is.na(df$beta) & df$beta < 0.002)

# remove sections of 8 rows when elemental trait is less than 0.002
df.resbetas <- df.resbetas[-c(c(1353:1360, 2481:2488, 3921:3928, 4457:4464, 4577:4584, 8673:8680, 
              10225:10232, 30121:30128, 32265:32272, 34257:34264)), ]

write.csv(df.resbetas, "../results/res_betas_rmsmbetas.csv", row.names = F)




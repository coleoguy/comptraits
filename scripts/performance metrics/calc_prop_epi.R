# jorja burch - jorjaelliott@tamu.edu
# this script calculates the proportion of the datasets that infer epistasis for 
# each type of compound trait

dat <- read.csv("../results/rm_sm_betas_results.csv")

##### elemental traits: a & a #####
# ADDITION #
dat_aaplus <- dat[dat$trait == "a + a", ] 

counter <- 0

for (i in 1:nrow(dat_aaplus)) {
  # Check if there is a value in at least one of the epistasis columns
  if (!is.na(dat_aaplus[i, 5]) | !is.na(dat_aaplus[i, 6]) | !is.na(dat_aaplus[i, 7])) {
    counter <- counter + 1
  }
}
# 214/995


# SUBTRACTION #
dat_aasub <- dat[dat$trait == "a - a", ] 

counter <- 0

for (i in 1:nrow(dat_aasub)) {
  # Check if there is a value in at least one of the epistasis columns
  if (!is.na(dat_aasub[i, 5]) | !is.na(dat_aasub[i, 6]) | !is.na(dat_aasub[i, 7])) {
    counter <- counter + 1
  }
}
# 462/1990


# MULTIPLICATION #
dat_aamult <- dat[dat$trait == "a * a", ] 

counter <- 0

for (i in 1:nrow(dat_aamult)) {
  # Check if there is a value in at least one of the epistasis columns
  if (!is.na(dat_aamult[i, 5]) | !is.na(dat_aamult[i, 6]) | !is.na(dat_aamult[i, 7])) {
    counter <- counter + 1
  }
}
# 411/995


# DIVISION #
dat_aadiv <- dat[dat$trait == "a / a", ] 

counter <- 0

for (i in 1:nrow(dat_aadiv)) {
  # Check if there is a value in at least one of the epistasis columns
  if (!is.na(dat_aadiv[i, 5]) | !is.na(dat_aadiv[i, 6]) | !is.na(dat_aadiv[i, 7])) {
    counter <- counter + 1
  }
}
# 566/1990
##### elemental traits: a & a #####

##### elemental traits: a & d #####
# ADDITION #
dat_adplus <- dat[dat$trait == "a + d", ] 

counter <- 0

for (i in 1:nrow(dat_adplus)) {
  # Check if there is a value in at least one of the epistasis columns
  if (!is.na(dat_adplus[i, 5]) | !is.na(dat_adplus[i, 6]) | !is.na(dat_adplus[i, 7])) {
    counter <- counter + 1
  }
}
# 230/998


# SUBTRACTION #
dat_adsub <- dat[dat$trait %in% c("a - d", "d - a"), ] 

counter <- 0

for (i in 1:nrow(dat_adsub)) {
  # Check if there is a value in at least one of the epistasis columns
  if (!is.na(dat_adsub[i, 5]) | !is.na(dat_adsub[i, 6]) | !is.na(dat_adsub[i, 7])) {
    counter <- counter + 1
  }
}
# 428/1996


# MULTIPLICATION #
dat_admult <- dat[dat$trait == "a * d", ] 

counter <- 0

for (i in 1:nrow(dat_admult)) {
  # Check if there is a value in at least one of the epistasis columns
  if (!is.na(dat_admult[i, 5]) | !is.na(dat_admult[i, 6]) | !is.na(dat_admult[i, 7])) {
    counter <- counter + 1
  }
}
# 229/998


# DIVISION #
dat_addiv <- dat[dat$trait %in% c("a / d", "d / a"), ] 

counter <- 0

for (i in 1:nrow(dat_addiv)) {
  # Check if there is a value in at least one of the epistasis columns
  if (!is.na(dat_addiv[i, 5]) | !is.na(dat_addiv[i, 6]) | !is.na(dat_addiv[i, 7])) {
    counter <- counter + 1
  }
}
# 680/1996 
##### elemental traits: a & d #####

##### elemental traits: d & d #####
# ADDITION #
dat_ddplus <- dat[dat$trait == "d + d", ] 

counter <- 0

for (i in 1:nrow(dat_ddplus)) {
  # Check if there is a value in at least one of the epistasis columns
  if (!is.na(dat_ddplus[i, 5]) | !is.na(dat_ddplus[i, 6]) | !is.na(dat_ddplus[i, 7])) {
    counter <- counter + 1
  }
}
# 217/999

# SUBTRACTION #
dat_ddsub <- dat[dat$trait == "d - d", ] 

counter <- 0

for (i in 1:nrow(dat_ddsub)) {
  # Check if there is a value in at least one of the epistasis columns
  if (!is.na(dat_ddsub[i, 5]) | !is.na(dat_ddsub[i, 6]) | !is.na(dat_ddsub[i, 7])) {
    counter <- counter + 1
  }
}
# 586/1998


# MULTIPLICATION #
dat_ddmult <- dat[dat$trait == "d * d", ] 

counter <- 0

for (i in 1:nrow(dat_ddmult)) {
  # Check if there is a value in at least one of the epistasis columns
  if (!is.na(dat_ddmult[i, 5]) | !is.na(dat_ddmult[i, 6]) | !is.na(dat_ddmult[i, 7])) {
    counter <- counter + 1
  }
}
# 367/999


# DIVISION #
dat_dddiv <- dat[dat$trait == "d / d", ] 

counter <- 0

for (i in 1:nrow(dat_dddiv)) {
  # Check if there is a value in at least one of the epistasis columns
  if (!is.na(dat_dddiv[i, 5]) | !is.na(dat_dddiv[i, 6]) | !is.na(dat_dddiv[i, 7])) {
    counter <- counter + 1
  }
}
# 1182/1998
##### elemental traits: d & d #####




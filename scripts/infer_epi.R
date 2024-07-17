# jorja burch - jorjaelliott@tamu.edu
# this script looks at pairs of elemental traits where both elementals are the 
# same type of epistasis (e.g., aa & aa), and it calculates the proportion of
# the time that LCA infers the original epistasis for that pair (e.g., proportion
# of the time where LCA infers aa when the compound trait is aa & aa), then it 
# repeats this for each function

dat <- read.csv("../results/rm_sm_betas_results.csv")


###### subset the data for aa & aa ###### 
  ## addition ##
aaplus <- dat[dat$trait == "aa + aa", ] 

counter <- 0

for (i in 1:nrow(aaplus)) {
  # Check if there is a value in the aa epistasis col
  if (!is.na(aaplus[i, 5]))
    {
    counter <- counter + 1
  }
}
# 96/100

  ## subtraction ##
aasub <- dat[dat$trait == "aa - aa", ] 

counter <- 0

for (i in 1:nrow(aasub)) {
  # Check if there is a value in the aa epistasis col
  if (!is.na(aasub[i, 5]))
  {
    counter <- counter + 1
  }
}
# 164/200


  ## multiplication ##
aamult <- dat[dat$trait == "aa * aa", ] 

counter <- 0

for (i in 1:nrow(aamult)) {
  # Check if there is a value in the aa epistasis col
  if (!is.na(aamult[i, 5]))
  {
    counter <- counter + 1
  }
}
# 99/100


  ## division ##
aadiv <- dat[dat$trait == "aa / aa", ] 

counter <- 0

for (i in 1:nrow(aadiv)) {
  # Check if there is a value in the aa epistasis col
  if (!is.na(aadiv[i, 5]))
  {
    counter <- counter + 1
  }
}
# 99/200
###### subset the data for aa & aa ###### 


###### subset the data for ad & ad ###### 
## addition ##
adplus <- dat[dat$trait == "ad + ad", ] 

counter <- 0

for (i in 1:nrow(adplus)) {
  # Check if there is a value in the ad epistasis col
  if (!is.na(adplus[i, 6]))
  {
    counter <- counter + 1
  }
}
# 114/117

## subtraction ##
adsub <- dat[dat$trait == "ad - ad", ] 

counter <- 0

for (i in 1:nrow(adsub)) {
  # Check if there is a value in the ad epistasis col
  if (!is.na(adsub[i, 6]))
  {
    counter <- counter + 1
  }
}
# 204/234


## multiplication ##
admult <- dat[dat$trait == "ad * ad", ] 

counter <- 0

for (i in 1:nrow(admult)) {
  # Check if there is a value in the ad epistasis col
  if (!is.na(admult[i, 6]))
  {
    counter <- counter + 1
  }
}
# 115/117


## division ##
addiv <- dat[dat$trait == "ad / ad", ] 

counter <- 0

for (i in 1:nrow(addiv)) {
  # Check if there is a value in the ad epistasis col
  if (!is.na(addiv[i, 6]))
  {
    counter <- counter + 1
  }
}
# 175/234
###### subset the data for ad & ad ######


###### subset the data for dd & dd ###### 
## addition ##
ddplus <- dat[dat$trait == "dd + dd", ] 

counter <- 0

for (i in 1:nrow(ddplus)) {
  # Check if there is a value in the dd epistasis col
  if (!is.na(ddplus[i, 7]))
  {
    counter <- counter + 1
  }
}
# 101/108

## subtraction ##
ddsub <- dat[dat$trait == "dd - dd", ] 

counter <- 0

for (i in 1:nrow(ddsub)) {
  # Check if there is a value in the dd epistasis col
  if (!is.na(ddsub[i, 7]))
  {
    counter <- counter + 1
  }
}
# 172/216


## multiplication ##
ddmult <- dat[dat$trait == "dd * dd", ] 

counter <- 0

for (i in 1:nrow(ddmult)) {
  # Check if there is a value in the dd epistasis col
  if (!is.na(ddmult[i, 7]))
  {
    counter <- counter + 1
  }
}
# 107/108


## division ##
dddiv <- dat[dat$trait == "dd / dd", ] 

counter <- 0

for (i in 1:nrow(dddiv)) {
  # Check if there is a value in the dd epistasis col
  if (!is.na(dddiv[i, 7]))
  {
    counter <- counter + 1
  }
}
# 106/216
###### subset the data for dd & dd ######
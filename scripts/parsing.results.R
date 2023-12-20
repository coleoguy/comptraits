res <- read.csv("../results/sim.results.csv")

# Parsing out Aa and Aa
sum.res <- as.data.frame(matrix(0,6,6))
colnames(sum.res) <- c("Aa","Ad","AaAa","AaAd","AdAd", "NA")
row.names(sum.res) <- c("Aa1 / Aa2", "Aa2 / Aa1", "Aa1 * Aa2", "Aa + Aa", 
                        "Aa1 - Aa2", "Aa2 - Aa1")

for(i in seq(from=1, by=8, length.out=1000)){
  for(j in 1:5){
    sum.res[, j] <- sum.res[, j] + as.numeric(!is.na(res[(i + 2):(i + 7), (j + 2)]))
  }
  counter <- 1
  for(k in (i + 2):(i + 7)){
    if(sum(is.na(res[k, 3:7])) == 5){
      sum.res[counter, 6] <- sum.res[counter, 6] + 1
    }
    counter <- counter + 1
  }
}
AaAa <- sum.res

# Parsing out Aa and Ad
sum.res <- as.data.frame(matrix(0,6,6))
colnames(sum.res) <- c("Aa","Ad","AaAa","AaAd","AdAd", "NA")
row.names(sum.res) <- c("Aa1 / Aa2", "Aa2 / Aa1", "Aa1 * Aa2", "Aa + Aa", 
                        "Aa1 - Aa2", "Aa2 - Aa1")

for(i in seq(from=1, by=8, length.out=1000)){ # this line changes
  for(j in 1:5){
    sum.res[, j] <- sum.res[, j] + as.numeric(!is.na(res[(i + 2):(i + 7), (j + 2)]))
  }
  counter <- 1
  for(k in (i + 2):(i + 7)){
    if(sum(is.na(res[k, 3:7])) == 5){
      sum.res[counter, 6] <- sum.res[counter, 6] + 1
    }
    counter <- counter + 1
  }
}





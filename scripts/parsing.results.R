res <- read.csv("../results/sim.results.csv")

# Parsing out Aa and Aa
sum.resAa.Aa <- as.data.frame(matrix(0,6,6))
colnames(sum.resAa.Aa) <- c("Aa","Ad","AaAa","AaAd","AdAd", "NA")
row.names(sum.resAa.Aa) <- c("Aa1 / Aa2", "Aa2 / Aa1", "Aa1 * Aa2", "Aa1 + Aa2", 
                        "Aa1 - Aa2", "Aa2 - Aa1")

for(i in seq(from=1, by=8, length.out=1000)){
  for(j in 1:5){
    sum.resAa.Aa[, j] <- sum.resAa.Aa[, j] + as.numeric(!is.na(res[(i + 2):(i + 7), (j + 2)]))
  }
  counter <- 1
  for(k in (i + 2):(i + 7)){
    if(sum(is.na(res[k, 3:7])) == 5){
      sum.resAa.Aa[counter, 6] <- sum.resAa.Aa[counter, 6] + 1
    }
    counter <- counter + 1
  }
}
write.csv(sum.resAa.Aa, file = "../results/resAa.Aa.csv", row.names=T)


# Parsing out Aa and Ad
sum.resAa.Ad <- as.data.frame(matrix(0,6,6))
colnames(sum.resAa.Ad) <- c("Aa","Ad","AaAa","AaAd","AdAd", "NA")
row.names(sum.resAa.Ad) <- c("Aa / Ad", "Ad / Aa", "Aa * Ad", "Aa + Ad", 
                        "Aa - Ad", "Ad - Aa") # these now names change

for(i in seq(from=8001, by=8, length.out=1000)){ # this line changes
  for(j in 1:5){
    sum.resAa.Ad[, j] <- sum.resAa.Ad[, j] + as.numeric(!is.na(res[(i + 2):(i + 7), (j + 2)]))
  }
  counter <- 1
  for(k in (i + 2):(i + 7)){
    if(sum(is.na(res[k, 3:7])) == 5){
      sum.resAa.Ad[counter, 6] <- sum.resAa.Ad[counter, 6] + 1
    }
    counter <- counter + 1
  }
}
write.csv(sum.resAa.Ad, file = "../results/resAa.Ad.csv", row.names=T)


# Parsing out Ad and Ad
sum.resAd.Ad <- as.data.frame(matrix(0,6,6))
colnames(sum.resAd.Ad) <- c("Aa","Ad","AaAa","AaAd","AdAd", "NA")
row.names(sum.resAd.Ad) <- c("Ad1 / Ad2", "Ad2 / Ad1", "Ad1 * Ad2", "Ad1 + Ad2", 
                             "Ad1 - Ad2", "Ad2 - Ad1")

for(i in seq(from=24001, by=8, length.out=1000)){ # this line changes
  for(j in 1:5){
    sum.resAd.Ad[, j] <- sum.resAd.Ad[, j] + as.numeric(!is.na(res[(i + 2):(i + 7), (j + 2)]))
  }
  counter <- 1
  for(k in (i + 2):(i + 7)){
    if(sum(is.na(res[k, 3:7])) == 5){
      sum.resAd.Ad[counter, 6] <- sum.resAd.Ad[counter, 6] + 1
    }
    counter <- counter + 1
  }
}
write.csv(sum.resAd.Ad, file = "../results/resAd.Ad.csv", row.names=T)




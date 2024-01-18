res <- read.csv("../results/sim.results.csv")
#elar1 <- "Aa"
#elar2 <- "Aa"

GetTable <- function(res, elar1, elar2){
  elar1hits <- which(res$trait == elar1)
  elar2hits <- which(res$trait == elar2) - 1
  starts <- intersect(elar1hits, elar2hits)
  sum.res <- as.data.frame(matrix(0,6,6))
  colnames(sum.res) <- c("Aa","Ad","AaAa","AaAd","AdAd", "NA")
  row.names(sum.res) <- c("1. / 2.", "2. / 1.", "1. * 2.", "1. + 2.", 
                          "1. - 2.", "2. - 1.")
  for(i in starts){ 
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
  sum.res <- sum.res/length(starts)
  print(paste(length(starts), "datsets match your request"))
  return(sum.res)
}

#component traits: Aa & Aa
a.a.res <- GetTable(res, elar1="Aa", elar2="Aa")
write.csv(a.a.res, file="../results/a.a.tab.csv")

#component traits: Ad & Ad
d.d.res <- GetTable(res, elar1="Ad", elar2="Ad")
write.csv(d.d.res, file="../results/d.d.tab.csv")

#component traits: Aa & Ad
a.d.res <- GetTable(res, elar1="Aa", elar2="Ad")
write.csv(a.d.res, file="../results/a.d.tab.csv")

#component traits: Aa & AaAa
a.AaAa.res <- GetTable(res, elar1="Aa", elar2="AaAa")
write.csv(a.AaAa.res, file="../results/a.AaAa.tab.csv")
#component traits: Aa & AaAd
a.AaAd.res <- GetTable(res, elar1="Aa", elar2="AaAd")
write.csv(a.AaAd.res, file="../results/a.AaAd.tab.csv")
#component traits: Aa & AdAd
a.AdAd.res <- GetTable(res, elar1="Aa", elar2="AdAd")
write.csv(a.AdAd.res, file="../results/a.AdAd.tab.csv")

#component traits: Ad & AaAa
d.AaAa.res <- GetTable(res, elar1="Ad", elar2="AaAa")
write.csv(d.AaAa.res, file="../results/d.AaAa.tab.csv")
#component traits: Ad & AaAd
d.AaAd.res <- GetTable(res, elar1="Ad", elar2="AaAd")
write.csv(d.AaAd.res, file="../results/d.AaAd.tab.csv")
#component traits: Ad & AdAd
d.AdAd.res <- GetTable(res, elar1="Ad", elar2="AdAd")
write.csv(d.AdAd.res, file="../results/d.AdAd.tab.csv")

#component traits: AaAa & AaAa
AaAa.AaAa.res <- GetTable(res, elar1="AaAa", elar2="AaAa")
write.csv(AaAa.AaAa.res, file="../results/AaAa.AaAa.tab.csv")
#component traits: AaAa & AaAd
AaAa.AaAd.res <- GetTable(res, elar1="AaAa", elar2="AaAd")
write.csv(AaAa.AaAd.res, file="../results/AaAa.AaAd.tab.csv")
#component traits: AaAa & AdAd
AaAa.AdAd.res <- GetTable(res, elar1="AaAa", elar2="AdAd")
write.csv(AaAa.AdAd.res, file="../results/AaAa.AdAd.tab.csv")

#component traits: AaAd & AaAa
AaAd.AaAa.res <- GetTable(res, elar1="AaAd", elar2="AaAa")
write.csv(AaAd.AaAa.res, file="../results/AaAd.AaAa.tab.csv")
#component traits: AaAd & AaAd
AaAd.AaAd.res <- GetTable(res, elar1="AaAd", elar2="AaAd")
write.csv(AaAd.AaAd.res, file="../results/AaAd.AaAd.tab.csv")
#component traits: AaAd & AdAd
AaAd.AdAd.res <- GetTable(res, elar1="AaAd", elar2="AdAd")
write.csv(AaAd.AdAd.res, file="../results/AaAd.AdAd.tab.csv")

#component traits: AdAd & AaAa
AdAd.AaAa.res <- GetTable(res, elar1="AdAd", elar2="AaAa")
write.csv(AdAd.AaAa.res, file="../results/AdAd.AaAa.tab.csv")
#component traits: AdAd & AaAd
AdAd.AaAd.res <- GetTable(res, elar1="AdAd", elar2="AaAd")
write.csv(AdAd.AaAd.res, file="../results/AdAd.AaAd.tab.csv")
#component traits: AdAd & AdAd
AdAd.AdAd.res <- GetTable(res, elar1="AdAd", elar2="AdAd")
write.csv(AdAd.AdAd.res, file="../results/AdAd.AdAd.tab.csv")











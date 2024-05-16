# Jorja Burch - jorjaelliott@tamu.edu

# this script takes the results from the simcoding.R (original simulation), and it
# parses those results into tables showing the results of each elemental trait pair

# read in the original simulation results (from simcoding.R)
res <- read.csv("../results/sim.results.csv")
#elar1 <- "Aa"
#elar2 <- "Aa"

GetTable <- function(res, elar1, elar2){
  elar1hits <- which(res$trait == elar1)
  elar2hits <- which(res$trait == elar2) - 1
  starts <- intersect(elar1hits, elar2hits)
  sum.res <- as.data.frame(matrix(0,6,6))
  colnames(sum.res) <- c("a","d","aa","ad","dd", "NA")
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

#elemental traits: a & a
a.a.res <- GetTable(res, elar1="Aa", elar2="Aa")
write.csv(a.a.res, file="../results/a.a.tab.csv")

#elemental traits: d & d
d.d.res <- GetTable(res, elar1="Ad", elar2="Ad")
write.csv(d.d.res, file="../results/d.d.tab.csv")

#elemental traits: a & d
a.d.res <- GetTable(res, elar1="Aa", elar2="Ad")
write.csv(a.d.res, file="../results/a.d.tab.csv")

#elemental traits: a & aa
a.aa.res <- GetTable(res, elar1="Aa", elar2="AaAa")
write.csv(a.aa.res, file="../results/a.aa.tab.csv")

#elemental traits: a & ad
a.ad.res <- GetTable(res, elar1="Aa", elar2="AaAd")
write.csv(a.ad.res, file="../results/a.ad.tab.csv")

#elemental traits: a & dd
a.dd.res <- GetTable(res, elar1="Aa", elar2="AdAd")
write.csv(a.dd.res, file="../results/a.dd.tab.csv")

#elemental traits: d & aa
d.aa.res <- GetTable(res, elar1="Ad", elar2="AaAa")
write.csv(d.aa.res, file="../results/d.aa.tab.csv")

#elemental traits: d & ad
d.ad.res <- GetTable(res, elar1="Ad", elar2="AaAd")
write.csv(d.ad.res, file="../results/d.ad.tab.csv")

#elemental traits: d & dd
d.dd.res <- GetTable(res, elar1="Ad", elar2="AdAd")
write.csv(d.dd.res, file="../results/d.dd.tab.csv")

#elemental traits: aa & aa
aa.aa.res <- GetTable(res, elar1="AaAa", elar2="AaAa")
write.csv(aa.aa.res, file="../results/aa.aa.tab.csv")

#elemental traits: aa & ad
aa.ad.res <- GetTable(res, elar1="AaAa", elar2="AaAd")
write.csv(aa.ad.res, file="../results/aa.ad.tab.csv")

#elemental traits: aa & dd
aa.dd.res <- GetTable(res, elar1="AaAa", elar2="AdAd")
write.csv(aa.dd.res, file="../results/aa.dd.tab.csv")

#elemental traits: ad & aa
ad.aa.res <- GetTable(res, elar1="AaAd", elar2="AaAa")
write.csv(ad.aa.res, file="../results/ad.aa.tab.csv")

#elemental traits: ad & ad
ad.ad.res <- GetTable(res, elar1="AaAd", elar2="AaAd")
write.csv(ad.ad.res, file="../results/ad.ad.tab.csv")

#elemental traits: ad & dd
ad.dd.res <- GetTable(res, elar1="AaAd", elar2="AdAd")
write.csv(ad.dd.res, file="../results/ad.dd.tab.csv")

#elemental traits: dd & aa
dd.aa.res <- GetTable(res, elar1="AdAd", elar2="AaAa")
write.csv(dd.aa.res, file="../results/dd.aa.tab.csv")

#elemental traits: dd & ad
dd.ad.res <- GetTable(res, elar1="AdAd", elar2="AaAd")
write.csv(dd.ad.res, file="../results/dd.ad.tab.csv")

#elemental traits: dd & dd
dd.dd.res <- GetTable(res, elar1="AdAd", elar2="AdAd")
write.csv(dd.dd.res, file="../results/dd.dd.tab.csv")











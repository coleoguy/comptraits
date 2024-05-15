res <- read.csv("../results/more.cohorts/more.cohort.sim.results.csv")
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

#component traits: a & a
more.cohort.a.a.res <- GetTable(res, elar1="Aa", elar2="Aa")
write.csv(more.cohort.a.a.res, file="../results/more.cohorts/tabs.from.parsing.results/more.cohort.a.a.tab.csv")

#component traits: d & d
more.cohort.d.d.res <- GetTable(res, elar1="Ad", elar2="Ad")
write.csv(more.cohort.d.d.res, file="../results/more.cohorts/tabs.from.parsing.results/more.cohort.d.d.tab.csv")

#component traits: a & d
more.cohort.a.d.res <- GetTable(res, elar1="Aa", elar2="Ad")
write.csv(more.cohort.a.d.res, file="../results/more.cohorts/tabs.from.parsing.results/more.cohort.a.d.tab.csv")

#component traits: a & aa
more.cohort.a.aa.res <- GetTable(res, elar1="Aa", elar2="AaAa")
write.csv(more.cohort.a.aa.res, file="../results/more.cohorts/tabs.from.parsing.results/more.cohort.a.aa.tab.csv")

#component traits: a & ad
more.cohort.a.ad.res <- GetTable(res, elar1="Aa", elar2="AaAd")
write.csv(more.cohort.a.ad.res, file="../results/more.cohorts/tabs.from.parsing.results/more.cohort.a.ad.tab.csv")

#component traits: a & dd
more.cohort.a.dd.res <- GetTable(res, elar1="Aa", elar2="AdAd")
write.csv(more.cohort.a.dd.res, file="../results/more.cohorts/tabs.from.parsing.results/more.cohort.a.dd.tab.csv")

#component traits: d & aa
more.cohort.d.aa.res <- GetTable(res, elar1="Ad", elar2="AaAa")
write.csv(more.cohort.d.aa.res, file="../results/more.cohorts/tabs.from.parsing.results/more.cohort.d.aa.tab.csv")

#component traits: d & ad
more.cohort.d.ad.res <- GetTable(res, elar1="Ad", elar2="AaAd")
write.csv(more.cohort.d.ad.res, file="../results/more.cohorts/tabs.from.parsing.results/more.cohort.d.ad.tab.csv")

#component traits: d & dd
more.cohort.d.dd.res <- GetTable(res, elar1="Ad", elar2="AdAd")
write.csv(more.cohort.d.dd.res, file="../results/more.cohorts/tabs.from.parsing.results/more.cohort.d.dd.tab.csv")

#component traits: aa & aa
more.cohort.aa.aa.res <- GetTable(res, elar1="AaAa", elar2="AaAa")
write.csv(more.cohort.aa.aa.res, file="../results/more.cohorts/tabs.from.parsing.results/more.cohort.aa.aa.tab.csv")

#component traits: aa & ad
more.cohort.aa.ad.res <- GetTable(res, elar1="AaAa", elar2="AaAd")
write.csv(more.cohort.aa.ad.res, file="../results/more.cohorts/tabs.from.parsing.results/more.cohort.aa.ad.tab.csv")

#component traits: aa & dd
more.cohort.aa.dd.res <- GetTable(res, elar1="AaAa", elar2="AdAd")
write.csv(more.cohort.aa.dd.res, file="../results/more.cohorts/tabs.from.parsing.results/more.cohort.aa.dd.tab.csv")

#component traits: ad & aa
more.cohort.ad.aa.res <- GetTable(res, elar1="AaAd", elar2="AaAa")
write.csv(more.cohort.ad.aa.res, file="../results/more.cohorts/tabs.from.parsing.results/more.cohort.ad.aa.tab.csv")

#component traits: ad & ad
more.cohort.ad.ad.res <- GetTable(res, elar1="AaAd", elar2="AaAd")
write.csv(more.cohort.ad.ad.res, file="../results/more.cohorts/tabs.from.parsing.results/more.cohort.ad.ad.tab.csv")

#component traits: ad & dd
more.cohort.ad.dd.res <- GetTable(res, elar1="AaAd", elar2="AdAd")
write.csv(more.cohort.ad.dd.res, file="../results/more.cohorts/tabs.from.parsing.results/more.cohort.ad.dd.tab.csv")

#component traits: dd & aa
more.cohort.dd.aa.res <- GetTable(res, elar1="AdAd", elar2="AaAa")
write.csv(more.cohort.dd.aa.res, file="../results/more.cohorts/tabs.from.parsing.results/more.cohort.dd.aa.tab.csv")

#component traits: dd & ad
more.cohort.dd.ad.res <- GetTable(res, elar1="AdAd", elar2="AaAd")
write.csv(more.cohort.dd.ad.res, file="../results/more.cohorts/tabs.from.parsing.results/more.cohort.dd.ad.tab.csv")

#component traits: dd & dd
more.cohort.dd.dd.res <- GetTable(res, elar1="AdAd", elar2="AdAd")
write.csv(more.cohort.dd.dd.res, file="../results/more.cohorts/tabs.from.parsing.results/more.cohort.dd.dd.tab.csv")
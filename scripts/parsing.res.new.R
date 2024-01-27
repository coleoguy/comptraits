res <- read.csv("../results/sim.results.csv")

GetTable <- function(res, elar){
  
  #  if the row hits + 1 has a NA in column res$beta, 
  # move up a row and try it again. if it meets the 
  # criteria, then store that hit as a start. if it 
  # doesn't meet the criteria, discard that hit. 
  
  for (i in 1:(nrow(res) - 1)) {
    if (res$trait[i] == elar && !is.na(res$beta[i + 1])) {
      starts <- c(starts, i)
    } else {
      if (i > 1) {
        if (res$trait[i - 1] == elar && !is.na(res$beta[i])) {
          starts <- c(starts, i - 1)
        }
      }
    }
  }
  ##########
  
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

a.res <- GetTable(res, elar="Aa")















###### OLD #####
#component traits: a & a
a.a.res <- GetTable(res, elar1="Aa", elar2="Aa")
#write.csv(a.a.res, file="../results/a.a.tab.csv")

#component traits: d & d
d.d.res <- GetTable(res, elar1="Ad", elar2="Ad")
#write.csv(d.d.res, file="../results/d.d.tab.csv")

#component traits: a & d
a.d.res <- GetTable(res, elar1="Aa", elar2="Ad")
#write.csv(a.d.res, file="../results/a.d.tab.csv")

#component traits: a & aa
a.aa.res <- GetTable(res, elar1="Aa", elar2="AaAa")
#write.csv(a.aa.res, file="../results/a.aa.tab.csv")

#component traits: a & ad
a.ad.res <- GetTable(res, elar1="Aa", elar2="AaAd")
#write.csv(a.ad.res, file="../results/a.ad.tab.csv")

#component traits: a & dd
a.dd.res <- GetTable(res, elar1="Aa", elar2="AdAd")
#write.csv(a.dd.res, file="../results/a.dd.tab.csv")

#component traits: d & aa
d.aa.res <- GetTable(res, elar1="Ad", elar2="AaAa")
#write.csv(d.aa.res, file="../results/d.aa.tab.csv")

#component traits: d & ad
d.ad.res <- GetTable(res, elar1="Ad", elar2="AaAd")
#write.csv(d.ad.res, file="../results/d.ad.tab.csv")

#component traits: d & dd
d.dd.res <- GetTable(res, elar1="Ad", elar2="AdAd")
#write.csv(d.dd.res, file="../results/d.dd.tab.csv")

#component traits: aa & aa
aa.aa.res <- GetTable(res, elar1="AaAa", elar2="AaAa")
#write.csv(aa.aa.res, file="../results/aa.aa.tab.csv")

#component traits: aa & ad
aa.ad.res <- GetTable(res, elar1="AaAa", elar2="AaAd")
#write.csv(aa.ad.res, file="../results/aa.ad.tab.csv")

#component traits: aa & dd
aa.dd.res <- GetTable(res, elar1="AaAa", elar2="AdAd")
#write.csv(aa.dd.res, file="../results/aa.dd.tab.csv")

#component traits: ad & aa
ad.aa.res <- GetTable(res, elar1="AaAd", elar2="AaAa")
#write.csv(ad.aa.res, file="../results/ad.aa.tab.csv")

#component traits: ad & ad
ad.ad.res <- GetTable(res, elar1="AaAd", elar2="AaAd")
#write.csv(ad.ad.res, file="../results/ad.ad.tab.csv")

#component traits: ad & dd
ad.dd.res <- GetTable(res, elar1="AaAd", elar2="AdAd")
write.csv(ad.dd.res, file="../results/ad.dd.tab.csv")

#component traits: dd & aa
dd.aa.res <- GetTable(res, elar1="AdAd", elar2="AaAa")
#write.csv(dd.aa.res, file="../results/dd.aa.tab.csv")

#component traits: dd & ad
dd.ad.res <- GetTable(res, elar1="AdAd", elar2="AaAd")
#write.csv(dd.ad.res, file="../results/dd.ad.tab.csv")

#component traits: dd & dd
dd.dd.res <- GetTable(res, elar1="AdAd", elar2="AdAd")
#write.csv(dd.dd.res, file="../results/dd.dd.tab.csv")











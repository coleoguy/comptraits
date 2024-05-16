# Jorja Burch - jorjaelliott@tamu.edu

# this script parses the results differently than the jd.parsing.results.R script.
# this script (jd.parsingMargTab.R) parses the results into "marginalized" tables, 
# producing 5 tables that show the "true" and "false" positives when a specific
# architecture is ONE of the elemental architectures.
# this script does not account for both architectures in the compound trait, 
# only one of the architectures. 
# (if interested in the results between a specific pair of elemental architectures, 
# use the "jd.parsing.results.R" script.)

#read in the results from the 15 cohorts simulation 
res <- read.csv("../../../results/additional.cohorts.results/jd.cohorts15/jd.sim.results.csv")

GetMargTab <- function(res, elar){
  
  #  if the row hits + 1 has a NA in column res$beta, 
  # move up a row and try it again. if it meets the 
  # criteria, then store that hit as a start. if it 
  # doesn't meet the criteria, discard that hit. 
  starts <- c()
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

res.a <- GetMargTab(res, elar="Aa")
write.csv(res.a, "../../../results/additional.cohorts.results/jd.cohorts15/tabs.from.parsingMargTab/jd.a.tab.csv")

res.d <- GetMargTab(res, elar="Ad")
write.csv(res.d, "../../../results/additional.cohorts.results/jd.cohorts15/tabs.from.parsingMargTab/jd.d.tab.csv")

res.aa <- GetMargTab(res, elar="AaAa")
write.csv(res.aa, "../../../results/additional.cohorts.results/jd.cohorts15/tabs.from.parsingMargTab/jd.aa.tab.csv")

res.ad <- GetMargTab(res, elar="AaAd")
write.csv(res.ad, "../../../results/additional.cohorts.results/jd.cohorts15/tabs.from.parsingMargTab/jd.ad.tab.csv")

res.dd <- GetMargTab(res, elar="AdAd")
write.csv(res.dd, "../../../results/additional.cohorts.results/jd.cohorts15/tabs.from.parsingMargTab/jd.dd.tab.csv")











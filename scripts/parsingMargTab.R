res <- read.csv("../results/sim.results.csv")

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
res.d <- GetMargTab(res, elar="Ad")













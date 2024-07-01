#Jorja Burch - jorjaelliott@tamu.edu

# This script creates a matrix where each row represents the possible combinations of 
# two elemental architectures, and each column represents the "success rate" for
# inferring the correct (original) architectures under the six possible functions.

# read in the data (results where small betas have been removed)
dat <- read.csv("../results/rm_sm_betas_results.csv")

# grab the rows that each dataset starts on
starts <- seq(from=1, by=8, length.out=5991)

# container for adding up successes
succ.matrix <- as.data.frame(matrix(0, nrow = 18, ncol = 9))
succ.matrix[, 1] <- c("a", "a", "d", "a", "a", "a", "d", "d", "d", "aa", "aa", "aa", "ad", "ad", "ad", "dd", "dd", "dd")
succ.matrix[, 2] <- c("a", "d", "d", "aa", "ad", "dd", "aa", "ad", "dd", "aa", "ad", "dd", "aa", "ad", "dd", "aa", "ad", "dd")
colnames(succ.matrix) <- c("first element", "second element", "1/2", "2/1", "1*2", "1+2", "1-2", "2-1", "total")

for(i in 1:(length(starts)-1)){
  # get the current dataset to evaluate
  foo <- dat[starts[i]:(starts[i+1]-1),]
  # find columns that correspond to elemental architecture
  # the hard coding on pulling it out of foo is correct as this never changes
  arch1 <- which(colnames(foo) == foo[1,1])
  arch2 <- which(colnames(foo) == foo[2,1])
  # check each row of the current dataset where each row corresponds to 
  # a generating function. We want to count any row as a success only if
  # it has the underlying elemental architecture and nothing eles
  for(j in 3:8){
    a <- !is.na(foo[j,arch1])
    b <- !is.na(foo[j,arch2])
    falarchs <- (3:7)[!3:7 %in% c(arch1,arch2)]
    c <- is.na(foo[j, falarchs])
    x <- succ.matrix$`first element` == foo[1,1]
    y <- succ.matrix$`second element` == foo[2,1]
    targ.row <- which(x+y == 2)
    if(all(c(a,b,c))){
      print("success")
      # get the row to enter into
      succ.matrix[targ.row, j] <- succ.matrix[targ.row, j] + 1
      succ.matrix[targ.row, 9] <- succ.matrix[targ.row, 9] +1
    }else{
      print("failed")
      succ.matrix[targ.row, 9] <- succ.matrix[targ.row, 9] +1
    }
  }
}
succ.matrix[,3:8] <- round(succ.matrix[,3:8] / (succ.matrix$total/6), digits=2)
#write.csv(succ.matrix, "../results/succ.matrix.csv", row.names = F)

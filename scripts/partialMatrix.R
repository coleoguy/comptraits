#Jorja Burch - jorjaelliott@tamu.edu

# This script creates a matrix where each row represents the possible combinations of 
# two elemental architectures, and each column represents the "partial success rate" for
# inferring the correct (original) architectures under the six possible functions. 
# "partial" means that the original architectures (from the elemental traits) were inferred, 
# but other architectures were also inferred

# read in the data (results with the small betas removed)
dat <- read.csv("../results/rm_sm_betas_results.csv")

# grab the rows that each dataset starts on
starts <- seq(from=1, by=8, length.out=5991)

# container for adding up successes
part.matrix <- as.data.frame(matrix(0, nrow = 18, ncol = 9))
part.matrix[, 1] <- c("a", "a", "d", "a", "a", "a", "d", "d", "d", "aa", "aa", "aa", "ad", "ad", "ad", "dd", "dd", "dd")
part.matrix[, 2] <- c("a", "d", "d", "aa", "ad", "dd", "aa", "ad", "dd", "aa", "ad", "dd", "aa", "ad", "dd", "aa", "ad", "dd")
colnames(part.matrix) <- c("first element", "second element", "1/2", "2/1", "1*2", "1+2", "1-2", "2-1", "total")

for(i in 1:(length(starts)-1)){
  # get the current dataset to evaluate
  foo <- dat[starts[i]:(starts[i+1]-1),]
  # find columns that correspond to elemental architecture
  # the hard coding on pulling it out of foo is correct as this never changes
  arch1 <- which(colnames(foo) == foo[1,1])
  arch2 <- which(colnames(foo) == foo[2,1])
  # check each row of the current dataset where each row corresponds to 
  # a generating function. We want to count any row as a partial if
  # it has the underlying elemental architecture AND other architures as well
  for(j in 3:8){
    a <- !is.na(foo[j,arch1])
    b <- !is.na(foo[j,arch2])
    #falarchs <- (3:7)[!3:7 %in% c(arch1,arch2)]
    #c <- is.na(foo[j, falarchs])
    x <- part.matrix$`first element` == foo[1,1]
    y <- part.matrix$`second element` == foo[2,1]
    targ.row <- which(x+y == 2)
    if(all(c(a,b))){
      print("success")
      # get the row to enter into
      part.matrix[targ.row, j] <- part.matrix[targ.row, j] + 1
      part.matrix[targ.row, 9] <- part.matrix[targ.row, 9] +1
    }else{
      print("failed")
      part.matrix[targ.row, 9] <- part.matrix[targ.row, 9] +1
    }
  }
}
part.matrix[,3:8] <- round(part.matrix[,3:8] / (part.matrix$total/6), digits=2)

#you can save the partial matrix at this step. it is the full version containing all
#pairs of elemental traits AND all 6 defining function. proceed to the next lines of 
#code if you want to condense the partial matrix
#write.csv(part.matrix, "../results/partial.matrix.csv", row.names = F)



###### the next steps condense the 3 types of epistasis into a single row 
# "E" by taking the mean of the other epistasis rows

part.matrix_mean <- part.matrix[1:3, 1:8]

####combining a&aa, a&ad, a&dd
means <- colMeans(part.matrix[4:6, 3:8], na.rm = TRUE)

# Create a new row with "a" in column 1, "e" in column 2, and the calculated means in columns 3-8
new_row <- c("a", "e", as.numeric(means), NA)

# Convert the new row to a dataframe
new_row_df <- as.data.frame(t(new_row), stringsAsFactors = FALSE)
names(new_row_df) <- names(part.matrix)

# Bind the new row to the dataframe
part.matrix_mean <- rbind(part.matrix[1:3, ], new_row_df)


####combining d&aa, d&ad, d&dd
means <- colMeans(part.matrix[7:9, 3:8], na.rm = TRUE)

# Create a new row with "d" in column 1, "e" in column 2, and the calculated means in columns 3-8
new_row <- c("d", "e", as.numeric(means), NA)

# Convert the new row to a dataframe
new_row_df <- as.data.frame(t(new_row), stringsAsFactors = FALSE)
names(new_row_df) <- names(part.matrix)

# Bind the new row to the dataframe
part.matrix_mean <- rbind(part.matrix_mean[1:4, ], new_row_df)



####combining aa&aa, aa&ad, aa&dd, ad&aa, ad&ad, ad&dd, dd&aa, dd&ad, dd&dd
means <- colMeans(part.matrix[10:18, 3:8], na.rm = TRUE)

# Create a new row with "e" in column 1, "e" in column 2, and the calculated means in columns 3-8
new_row <- c("e", "e", as.numeric(means), NA)

# Convert the new row to a dataframe
new_row_df <- as.data.frame(t(new_row), stringsAsFactors = FALSE)
names(new_row_df) <- names(part.matrix)

# Bind the new row to the dataframe
part.matrix_mean <- rbind(part.matrix_mean[1:5, ], new_row_df)


#make sure that division columns are numeric before proceeding
part.matrix_mean[, 3] <- as.numeric(part.matrix_mean[, 3])
part.matrix_mean[, 4] <- as.numeric(part.matrix_mean[, 4])

#condensed 1/2 and 2/1 into a single column using mean
part.matrix_mean$division <- rowMeans(part.matrix_mean[, 3:4], na.rm = TRUE)

#reordered cols and removed extra subtraction (which was identical to other subtraction) and totals col
part.matrix_mean <- part.matrix_mean[,c(1:2, 6:7, 5, 10)]

#condensed col names
colnames(part.matrix_mean) <- c("first element", "second element", "addition", "subtraction", "multiplication", "division")

#here you can save the condensed partial matrix
#write.csv(part.matrix_mean, "../results/partial.matrix_mean.csv", row.names = F)







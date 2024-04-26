#Jorja Burch - jorjaelliott@tamu.edu

# This script creates a matrix where each row represents the possible combinations of 
# two elemental architectures, and each column represents the "success rate" for
# inferring the correct (original) architectures under the six possible functions.

true.matrix <- matrix("", nrow = 18, ncol = 8)

true.matrix[, 1] <- c("a", "a", "d", "a", "a", "a", "d", "d", "d", "aa", "aa", "aa", "ad", "ad", "ad", "dd", "dd", "dd")
true.matrix[, 2] <- c("a", "d", "d", "aa", "ad", "dd", "aa", "ad", "dd", "aa", "ad", "dd", "aa", "ad", "dd", "aa", "ad", "dd")

colnames(true.matrix) <- c("first element", "second element", "1. / 2.", "2. / 1.", "1. * 2.", "1. + 2.", "1. - 2.", "2. - 1.")

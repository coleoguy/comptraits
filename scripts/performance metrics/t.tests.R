# t.tests for fewer cohorts (5) versus many cohorts (15)

# Load the data
# sm cohort set
matrix1 <- read.csv("../../results/partial.matrix.csv")

# lg cohort set
matrix2 <- read.csv("../../results/additional.cohorts.results/15cohorts/jd.part.matrix.csv")

matrix1 <- matrix1[,c(3:8)]
matrix2 <- matrix2[,c(3:8)]

# Exclude the first two rows and then vectorize both matrices
vector1 <- unlist(matrix1)
vector2 <- unlist(matrix2)

# Perform the paired t-test on the two vectors
test_result <- t.test(vector1, vector2, paired = TRUE)

# Display the full results of the t-test
cat("Paired Sample T-Test Results \n")
cat("t-statistic:", test_result$statistic, "\n")
cat("p-value:", test_result$p.value, "\n")
cat("Degrees of freedom:", test_result$parameter, "\n")
cat("95% Confidence Interval:", test_result$conf.int, "\n")
cat("Mean of the differences:", test_result$estimate, "\n")









##### t tests comparing functions & arch pairs ##### not included in paper results

## means for each function ##

# success matrix
old.succ5.f <- c(0.28, 0.29, 0.52, 0.4, 0.35, 0.35)
new.succ8.f <- c(0.3, 0.3, 0.55, 0.47, 0.41, 0.41)
t.test(old.succ5.f, new.succ8.f)

# partial matrix
old.part5.f <- c(0.35, 0.36, 0.63, 0.47, 0.42, 0.42)
new.part8.f <- c(0.49, 0.51, 0.75, 0.55, 0.49, 0.49)
t.test(old.part5.f, new.part8.f)

# failure matrix
old.fail5.f <- c(0.64, 0.63, 0.37, 0.53, 0.58, 0.58)
new.fail8.f <- c(0.51, 0.49, 0.25, 0.45, 0.51, 0.51)
t.test(old.fail5.f, new.fail8.f)


## means for each pair of archs ##

# success matrix
old.succ5.a <- c(0.62, 0.34, 0.48, 0.38, 0.37, 0.38, 0.05, 0.34, 0.05, 0.63,
                0.41, 0.08, 0.39, 0.64, 0.38, 0.08, 0.38, 0.62)
new.succ8.a <- c(0.63, 0.36, 0.49, 0.38, 0.46, 0.43, 0.098, 0.38, 0.07, 0.65,
                0.48, 0.13, 0.47, 0.63, 0.45, 0.11, 0.51, 0.66)
t.test(old.succ5.a, new.succ8.a)

# partial matrix
old.part5.a <- c(0.93, 0.38, 0.68, 0.42, 0.42, 0.42, 0.06, 0.37, 0.06, 0.76, 
                0.44, 0.097, 0.45, 0.87, 0.41, 0.09, 0.42, 0.75)
new.part8.a <- c(0.93, 0.49, 0.72, 0.59, 0.66, 0.57, 0.1, 0.46, 0.09, 0.81, 
                0.61, 0.14, 0.62, 0.89, 0.57, 0.12, 0.63, 0.8)
t.test(old.part5.a, new.part8.a)

# failure matrix
old.fail5.a <- c(0.07, 0.62, 0.32, 0.57, 0.59, 0.59, 0.94, 0.63, 0.94, 0.24,
                0.56, 0.90, 0.55, 0.14, 0.59, 0.91, 0.58, 0.25)
new.fail8.a <- c(0.07, 0.51, 0.28, 0.42, 0.34, 0.43, 0.90, 0.54, 0.91, 0.19, 
                0.4, 0.86, 0.38, 0.11, 0.44, 0.88, 0.37, 0.2)
t.test(old.fail5.a, new.fail8.a)


##### ##### ##### ##### #####


# t.tests for fewer cohorts (5) versus many "jd" cohorts (15)

## means for each function ##

# success matrix
old.succ5.f <- c(0.28, 0.29, 0.52, 0.4, 0.35, 0.35)
new.succ15.f <- c(0.33, 0.33, 0.5, 0.49, 0.47, 0.47)
t.test(old.succ5.f, new.succ15.f)

# partial matrix
old.part5.f <- c(0.35, 0.36, 0.63, 0.47, 0.42, 0.42)
new.part15.f <- c(0.76, 0.77, 0.83, 0.60, 0.57, 0.57)
t.test(old.part5.f, new.part15.f)

# failure matrix
old.fail5.f <- c(0.64, 0.63, 0.37, 0.53, 0.58, 0.58)
new.fail15.f <- c(0.24, 0.24, 0.18, 0.40, 0.43, 0.43)
t.test(old.fail5.f, new.fail15.f)


## means for each pair of archs ##

# success matrix
old.succ5.a <- c(0.62, 0.34, 0.48, 0.38, 0.37, 0.38, 0.05, 0.34, 0.05, 0.63,
                0.41, 0.08, 0.39, 0.64, 0.38, 0.08, 0.38, 0.62)
new.succ15.a <- c(0.58, 0.32, 0.47, 0.38, 0.46, 0.38, 0.21, 0.41, 0.31, 0.61, 
                  0.47, 0.30, 0.51, 0.6, 0.45, 0.27, 0.49, 0.53)
t.test(old.succ5.a, new.succ15.a)

# partial matrix
old.part5.a <- c(0.93, 0.38, 0.68, 0.42, 0.42, 0.42, 0.06, 0.37, 0.06, 0.76, 
                0.44, 0.097, 0.45, 0.87, 0.41, 0.09, 0.42, 0.75)
new.part15.a <- c(0.94, 0.59, 0.82, 0.7, 0.71, 0.60, 0.49, 0.66, 0.4, 0.62, 
                  0.69, 0.52, 0.76, 0.93, 0.63, 0.47, 0.68, 0.79)
t.test(old.part5.a, new.part15.a)

# failure matrix
old.fail5.a <- c(0.07, 0.62, 0.32, 0.57, 0.59, 0.59, 0.94, 0.63, 0.94, 0.24,
                0.56, 0.90, 0.55, 0.14, 0.59, 0.91, 0.58, 0.25)
new.fail15.a <- c(0.07, 0.41, 0.18, 0.30, 0.30, 0.40, 0.51, 0.34, 0.6, 0.08,
                  0.31, 0.48, 0.24, 0.07, 0.37, 0.54, 0.33, 0.22)
t.test(old.fail5.a, new.fail15.a)



part5 <- read.csv("../../results/partial.matrix.csv")
part15 <- read.csv("../../results/additional.cohorts.results/15cohorts/jd.part.matrix.csv")
t.test(x=part5, y=part15, paired=T)










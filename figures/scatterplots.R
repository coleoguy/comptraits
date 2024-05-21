# Jorja Burch - jorjaelliott@tamu.edu

# this script generates scatter plots comparing the success, partial success, 
# and failure matricies between the 5-cohort (original) sim results and the 
# 15-cohort (jd) sim results. 


### JD (15-chort) success vs Original (5-chort) success ###

# read in the success matrix for jd sim and the original sim
jd.succ <- read.csv("../results/additional.cohorts.results/jd.cohorts15/jd.succ.matrix.csv")
orig.succ <- read.csv("../results/succ.matrix.csv")

# subset the matricies to exclude the first two columns (labeling the archs) 
# and the last column (totals for each row)
jd.succ_subset <- jd.succ[, 3:8]
orig.succ_subset <- orig.succ[, 3:8]

# flatten the matrices into vectors
x <- as.vector(as.matrix(jd.succ_subset))
y <- as.vector(as.matrix(orig.succ_subset))

# plot the 15-cohort (jd) success on the x and the 5-cohort (original) success 
# on the y 
plot(x, y, xlab = "jd (15) success", ylab = "original (5) success", main = "", 
     xlim=c(0,1), ylim=c(0,1), pch=16)
abline(a = 0, b = 1, col = "red", lty = 1)

# Fit a linear model
#model <- lm(y ~ x)

# Calculate R-squared
#r_squared <- summary(model)$r.squared

# Add R-squared value to the plot
#text(x = min(x), y = max(y), labels = paste("R-squared =", round(r_squared, 2)), pos = 4, col = "blue")



### JD (15-chort) partial vs Original (5-chort) partial ###

# read in the partial matrix for jd sim and the original sim
jd.part <- read.csv("../results/additional.cohorts.results/jd.cohorts15/jd.part.matrix.csv")
orig.part <- read.csv("../results/part.matrix.csv")

# subset the matricies to exclude the first two columns (labeling the archs) 
# and the last column (totals for each row)
jd.part_subset <- jd.part[, 3:8]
orig.part_subset <- orig.part[, 3:8]

# flatten the matrices into vectors
x <- as.vector(as.matrix(jd.part_subset))
y <- as.vector(as.matrix(orig.part_subset))

# plot the 15-cohort (jd) partial on the x and the 5-cohort (original) partial 
# on the y 
plot(x, y, xlab = "jd (15) partial", ylab = "original (5) partial", main = "", 
     xlim=c(0,1), ylim=c(0,1), pch=16)
abline(a = 0, b = 1, col = "red", lty = 1)

# Fit a linear model
#model <- lm(y ~ x)

# Calculate R-squared
#r_squared <- summary(model)$r.squared

# Add R-squared value to the plot
#text(x = min(x), y = max(y), labels = paste("R-squared =", round(r_squared, 2)), pos = 4, col = "blue")


### JD (15-chort) failure vs Original (5-chort) failure ###

# read in the failure matrix for jd sim and the original sim
jd.fail <- read.csv("../results/additional.cohorts.results/jd.cohorts15/jd.fail.matrix.csv")
orig.fail <- read.csv("../results/fail.matrix.csv")

# subset the matricies to exclude the first two columns (labeling the archs) 
# and the last column (totals for each row)
jd.fail_subset <- jd.fail[, 3:8]
orig.fail_subset <- orig.fail[, 3:8]

# flatten the matrices into vectors
x <- as.vector(as.matrix(jd.fail_subset))
y <- as.vector(as.matrix(orig.fail_subset))

# plot the 15-cohort (jd) failure on the x and the 5-cohort (original) failure 
# on the y 
plot(x, y, xlab = "jd (15) failure", ylab = "original (5) failure", main = "", 
     xlim=c(0,1), ylim=c(0,1), pch=16)
abline(a = 0, b = 1, col = "red", lty = 1)

# Fit a linear model
#model <- lm(y ~ x)

# Calculate R-squared
#r_squared <- summary(model)$r.squared

# Add R-squared value to the plot
#text(x = min(x), y = max(y), labels = paste("R-squared =", round(r_squared, 2)), pos = 4, col = "blue")









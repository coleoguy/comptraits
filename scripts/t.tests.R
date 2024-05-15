# t.tests for fewer cohorts versus more cohorts means 

## means for each function ##

# success matrix
old.succ.f <- c(0.28, 0.29, 0.52, 0.4, 0.35, 0.35)
new.succ.f <- c(0.3, 0.3, 0.55, 0.47, 0.41, 0.41)
t.test(old.succ.f, new.succ.f)

# partial matrix
old.part.f <- c(0.35, 0.36, 0.63, 0.47, 0.42, 0.42)
new.part.f <- c(0.49, 0.51, 0.75, 0.55, 0.49, 0.49)
t.test(old.part.f, new.part.f)

# failure matrix
old.fail.f <- c(0.64, 0.63, 0.37, 0.53, 0.58, 0.58)
new.fail.f <- c(0.51, 0.49, 0.25, 0.45, 0.51, 0.51)
t.test(old.fail.f, new.fail.f)


## means for each pair of archs ##

# success matrix
old.succ.a <- c(0.62, 0.34, 0.48, 0.38, 0.37, 0.38, 0.05, 0.34, 0.05, 0.63,
                0.41, 0.08, 0.39, 0.64, 0.38, 0.08, 0.38, 0.62)
new.succ.a <- c(0.63, 0.36, 0.49, 0.38, 0.46, 0.43, 0.098, 0.38, 0.07, 0.65,
                0.48, 0.13, 0.47, 0.63, 0.45, 0.11, 0.51, 0.66)
t.test(old.succ.a, new.succ.a)

# partial matrix
old.part.a <- c(0.93, 0.38, 0.68, 0.42, 0.42, 0.42, 0.06, 0.37, 0.06, 0.76, 
                0.44, 0.097, 0.45, 0.87, 0.41, 0.09, 0.42, 0.75)
new.part.a <- c(0.93, 0.49, 0.72, 0.59, 0.66, 0.57, 0.1, 0.46, 0.09, 0.81, 
                0.61, 0.14, 0.62, 0.89, 0.57, 0.12, 0.63, 0.8)
t.test(old.part.a, new.part.a)

# failure matrix
old.fail.a <- c(0.07, 0.62, 0.32, 0.57, 0.59, 0.59, 0.94, 0.63, 0.94, 0.24,
                0.56, 0.90, 0.55, 0.14, 0.59, 0.91, 0.58, 0.25)
new.fail.a <- c(0.07, 0.51, 0.28, 0.42, 0.34, 0.43, 0.90, 0.54, 0.91, 0.19, 
                0.4, 0.86, 0.38, 0.11, 0.44, 0.88, 0.37, 0.2)
t.test(old.fail.a, new.fail.a)












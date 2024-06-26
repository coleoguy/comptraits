#Turn table into colored matrix

library(ggplot2)
library(viridis)

#Read in succ.matrix.csv
dat <- read.csv("more.cohort.fail.matrix.csv")

#change column names to display correct functions
colnames(dat) <- c("first element","second element","1/2","2/1","1*2","1+2","1-2","2-1","total")

#combine columns 1 & 2 
combined_column <- paste(dat$"first element", dat$"second element", sep = " & ")

# Name the combined column
dat$'Elemental.Architectures' <- combined_column

#remove the 1st & 2nd column
dat <- dat[, -1]
dat <- dat[, -1]

#rearrange to make elemental architectures column 1
dat <- dat[, c(8, 1:7)]

#remove "total" column
more.cohort.fail.matrix <- dat[,1:7]

# Get row and column names
row_names <- rownames(more.cohort.fail.matrix)
col_names <- colnames(more.cohort.fail.matrix)

# Melt the table to long format
library(reshape2)

more.cohort.fail.matrix.long <- melt(more.cohort.fail.matrix)


# Create the plot
ggplot(more.cohort.fail.matrix.long, aes(variable, Elemental.Architectures, fill = value)) +
  geom_tile() +
  geom_text(aes(label = value), color = "white") + #added numbers to cells#
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Functions", y = "Elemental Architectures") +
  ggtitle("More Cohort Failure")+
  theme_minimal() 

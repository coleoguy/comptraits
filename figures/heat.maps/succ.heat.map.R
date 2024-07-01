# Jorja Burch - jorjaelliott@tamu.edu

# this script turns success matrix into colored heatmap for original (5) cohort set

library(ggplot2)
library(viridis)

#Read in succ.matrix.csv
dat <- read.csv("../results/succ.matrix.csv")

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
succ.matrix <- dat[,1:7]

# Get row and column names
row_names <- rownames(succ.matrix)
col_names <- colnames(succ.matrix)

# Melt the table to long format
library(reshape2)

succ.matrix.long <- melt(succ.matrix)


# Create the plot
ggplot(succ.matrix.long, aes(variable, Elemental.Architectures, fill = value)) +
  geom_tile() +
  geom_text(aes(label = value), color = "white") + #added numbers to cells#
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Functions", y = "Elemental Architectures") +
  ggtitle("Success")+
  theme_minimal() 



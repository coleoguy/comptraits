# jorja burch - jorjaelliott@tamu.edu
# this script takes the condensed partial matrix and colors it as a heatmap figure.
# calculations for function and architecture means are included at the bottom of this 
# script. these values are added to the figure using powerpoint.

library(ggplot2)
library(viridis)
library(reshape2)

#Read in succ.matrix.csv
dat <- read.csv("../results/partial.matrix_mean.csv")

#make function cols numeric and round to 2 decimal places
for (i in 3:6) {
  dat[, i] <- round(as.numeric(dat[, i]), 2)
}

#combine columns 1 & 2 
combined_column <- paste(dat$"first.element", dat$"second.element", sep = " & ")

# Name the combined column
dat$'Elemental.Architectures' <- combined_column

#remove the 1st & 2nd column (first element & second element cols)
dat <- dat[, -c(1,2)]

#rearrange to make elemental architectures column 1
dat <- dat[, c(5, 1:4)]

# Get row and column names
#row_names <- rownames(dat)
#col_names <- colnames(dat)

# Melt the table to long format
dat.long <- melt(dat, id.vars = "Elemental.Architectures")

# Reorder the levels of Elemental.Architectures based on the original order
dat.long$Elemental.Architectures <- factor(dat.long$Elemental.Architectures, levels = unique(dat$Elemental.Architectures))

# Create the plot
ggplot(dat.long, aes(variable, Elemental.Architectures, fill = value)) +
  geom_tile() +
  geom_text(aes(label = value), color = "white", size = 5.5) + #added numbers to cells#
  scale_fill_viridis(name = "Success", limits = c(0, 1), begin = 0, end = 0.85) +
  labs(x = "Defining Functions", y = "Elemental Architectures") +
  ggtitle("Partial Success")+
  theme_minimal() +
  scale_y_discrete(limits = rev(levels(dat.long$Elemental.Architectures))) +
  theme(
    axis.title.x = element_text(vjust = -1), # Move x axis label
    axis.title.y = element_text(vjust = 1),  # Adjust y axis label position if needed
    axis.text.x = element_text(vjust = 0.5, hjust = 0.5), # Rotate x axis labels
    axis.text.x.top = element_text(vjust = 0.5, hjust = 0.5), # Rotate top x axis labels
    axis.title.x.top = element_text(vjust = 2), # Adjust top x axis title position
    axis.title.y.right = element_text(vjust = 1) # Adjust right y axis title position if needed
  ) +
  scale_x_discrete(position = "top") # Move x axis to the top


### calculations for function and elem arch means ###
addition_mean <- mean(dat$addition) #0.55
subtraction_mean <- mean(dat$subtraction) #0.5
multiplication_mean <- mean(dat$multiplication) #0.67
division_mean <- mean(dat$division) #0.41

aa <- as.matrix(dat[1,2:5])
aa_mean <- mean(aa) #0.94

ad <- as.matrix(dat[2,2:5])
ad_mean <- mean(ad) #0.395

dd <- as.matrix(dat[3,2:5])
dd_mean <- mean(dd) #0.74

ae <- as.matrix(dat[4,2:5])
ae_mean <- mean(ae) #0.43

de <- as.matrix(dat[5,2:5])
de_mean <- mean(de) #0.18

ee <- as.matrix(dat[6,2:5])
ee_mean <- mean(ee) #0.51

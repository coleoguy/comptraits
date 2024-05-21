# Jorja Burch - jorjaelliott@tamu.edu

# this script generates the one element figures, which come from tables generated 
# from the ParsingMargTab.R script.

library(ggplot2)
library(viridis)

##### colored matrix for 1 known element- a #####
data <- read.csv("../results/tabs.from.parsingMargTab/res.a.csv", header = TRUE, row.names = 1)

# Convert the data frame to a matrix
data_matrix <- as.matrix(data)

precision <- 3

# Round the values to the desired precision
rounded_matrix <- round(data_matrix, digits = precision)

# Creating a data frame suitable for ggplot
data_long <- expand.grid(Row = rownames(rounded_matrix), 
                         Column = colnames(rounded_matrix))
data_long$Value <- as.vector(rounded_matrix)


# Open PDF device
pdf("../figures/1.element/a.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  geom_text(aes(label = Value), color = "white") + #added numbers to cells#
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "One Elemental Trait: a") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix for 1 known element- a #####



##### colored matrix for 1 known element- d #####
data <- read.csv("../results/tabs.from.parsingMargTab/res.d.csv", header = TRUE, row.names = 1)

# Convert the data frame to a matrix
data_matrix <- as.matrix(data)

precision <- 3

# Round the values to the desired precision
rounded_matrix <- round(data_matrix, digits = precision)

# Creating a data frame suitable for ggplot
data_long <- expand.grid(Row = rownames(rounded_matrix), 
                         Column = colnames(rounded_matrix))
data_long$Value <- as.vector(rounded_matrix)


# Open PDF device
pdf("../figures/1.element/d.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  geom_text(aes(label = Value), color = "white") + #added numbers to cells#
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "One Elemental Trait: d") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix for 1 known element- d #####



##### colored matrix for 1 known element- aa #####
data <- read.csv("../results/tabs.from.parsingMargTab/res.aa.csv", header = TRUE, row.names = 1)

# Convert the data frame to a matrix
data_matrix <- as.matrix(data)

precision <- 3

# Round the values to the desired precision
rounded_matrix <- round(data_matrix, digits = precision)

# Creating a data frame suitable for ggplot
data_long <- expand.grid(Row = rownames(rounded_matrix), 
                         Column = colnames(rounded_matrix))
data_long$Value <- as.vector(rounded_matrix)


# Open PDF device
pdf("../figures/1.element/aa.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  geom_text(aes(label = Value), color = "white") + #added numbers to cells#
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "One Elemental Trait: aa") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix for 1 known element- aa #####



##### colored matrix for 1 known element- ad #####
data <- read.csv("../results/tabs.from.parsingMargTab/res.ad.csv", header = TRUE, row.names = 1)

# Convert the data frame to a matrix
data_matrix <- as.matrix(data)

precision <- 3

# Round the values to the desired precision
rounded_matrix <- round(data_matrix, digits = precision)

# Creating a data frame suitable for ggplot
data_long <- expand.grid(Row = rownames(rounded_matrix), 
                         Column = colnames(rounded_matrix))
data_long$Value <- as.vector(rounded_matrix)


# Open PDF device
pdf("../figures/1.element/ad.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  geom_text(aes(label = Value), color = "white") + #added numbers to cells#
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "One Elemental Trait: ad") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix for 1 known element- ad #####



##### colored matrix for 1 known element- dd #####
data <- read.csv("../results/tabs.from.parsingMargTab/res.dd.csv", header = TRUE, row.names = 1)

# Convert the data frame to a matrix
data_matrix <- as.matrix(data)

precision <- 3

# Round the values to the desired precision
rounded_matrix <- round(data_matrix, digits = precision)

# Creating a data frame suitable for ggplot
data_long <- expand.grid(Row = rownames(rounded_matrix), 
                         Column = colnames(rounded_matrix))
data_long$Value <- as.vector(rounded_matrix)


# Open PDF device
pdf("../figures/1.element/dd.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  geom_text(aes(label = Value), color = "white") + #added numbers to cells#
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "One Elemental Trait: dd") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix for 1 known element- dd #####

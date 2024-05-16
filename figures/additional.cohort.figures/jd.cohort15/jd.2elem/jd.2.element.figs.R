# this script generates the figures for each pair of elemental traits, 
# based on the tables from the parsing.results.R script

library(ggplot2)
library(viridis)

##### colored matrix for 2 known elements- a & a #####
data <- read.csv("../../../../results/additional.cohorts.results/jd.cohorts15/tabs.from.parsing.results/jd.a.a.tab.csv", header = TRUE, row.names = 1)

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
pdf("jd.a.a.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  geom_text(aes(label = Value), color = "white") + #added numbers to cells#
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Elemental Traits: a & a") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix for 2 known elements- a & a #####

##### colored matrix for 2 known elements- a & d #####
data <- read.csv("../../../../results/additional.cohorts.results/jd.cohorts15/tabs.from.parsing.results/jd.a.d.tab.csv", header = TRUE, row.names = 1)

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
pdf("jd.a.d.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  geom_text(aes(label = Value), color = "white") + #added numbers to cells#
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Elemental Traits: a & d") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix for 2 known elements- a & d #####

##### colored matrix for 2 known elements- d & d #####
data <- read.csv("../../../../results/additional.cohorts.results/jd.cohorts15/tabs.from.parsing.results/jd.d.d.tab.csv", header = TRUE, row.names = 1)

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
pdf("jd.d.d.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  geom_text(aes(label = Value), color = "white") + #added numbers to cells#
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Elemental Traits: d & d") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix for 2 known elements- d & d #####

### ### ### ### ### ### ### ### ### ###

##### colored matrix for 2 known elements- a & aa #####
data <- read.csv("../../../../results/additional.cohorts.results/jd.cohorts15/tabs.from.parsing.results/jd.a.aa.tab.csv", header = TRUE, row.names = 1)

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
pdf("jd.a.aa.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  geom_text(aes(label = Value), color = "white") + #added numbers to cells#
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Elemental Traits: a & aa") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix for 2 known elements- a & aa #####

##### colored matrix - a & ad #####
data <- read.csv("../../../../results/additional.cohorts.results/jd.cohorts15/tabs.from.parsing.results/jd.a.ad.tab.csv", header = TRUE, row.names = 1)

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
pdf("jd.a.ad.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  geom_text(aes(label = Value), color = "white") + #added numbers to cells#
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Elemental Traits: a & ad") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix for 2 known elements- a & ad #####

##### colored matrix for 2 known elements- a & dd #####
data <- read.csv("../../../../results/additional.cohorts.results/jd.cohorts15/tabs.from.parsing.results/jd.a.dd.tab.csv", header = TRUE, row.names = 1)

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
pdf("jd.a.dd.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  geom_text(aes(label = Value), color = "white") + #added numbers to cells#
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Elemental Traits: a & dd") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix for 2 known elements- a & dd #####

### ### ### ### ### ### ### ### ### ###

##### colored matrix for 2 known elements- d & aa #####
data <- read.csv("../../../../results/additional.cohorts.results/jd.cohorts15/tabs.from.parsing.results/jd.d.aa.tab.csv", header = TRUE, row.names = 1)

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
pdf("jd.d.aa.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  geom_text(aes(label = Value), color = "white") + #added numbers to cells#
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Elemental Traits: d & aa") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix for 2 known elements- d & aa #####

##### colored matrix for 2 known elements- d & ad #####
data <- read.csv("../../../../results/additional.cohorts.results/jd.cohorts15/tabs.from.parsing.results/jd.d.ad.tab.csv", header = TRUE, row.names = 1)

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
pdf("jd.d.ad.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  geom_text(aes(label = Value), color = "white") + #added numbers to cells#
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Elemental Traits: d & ad") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix for 2 known elements- a & ad #####

##### colored matrix for 2 known elements- d & dd #####
data <- read.csv("../../../../results/additional.cohorts.results/jd.cohorts15/tabs.from.parsing.results/jd.d.dd.tab.csv", header = TRUE, row.names = 1)

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
pdf("jd.d.dd.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  geom_text(aes(label = Value), color = "white") + #added numbers to cells#
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Elemental Traits: d & dd") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix for 2 known elements- d & dd #####

### ### ### ### ### ### ### ### ### ###

##### colored matrix for 2 known elements- aa & aa #####
data <- read.csv("../../../../results/additional.cohorts.results/jd.cohorts15/tabs.from.parsing.results/jd.aa.aa.tab.csv", header = TRUE, row.names = 1)

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
pdf("jd.aa.aa.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  geom_text(aes(label = Value), color = "white") + #added numbers to cells#
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Elemental Traits: aa & aa") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix for 2 known elements- aa & aa #####

##### colored matrix for 2 known elements- aa & ad #####
data <- read.csv("../../../../results/additional.cohorts.results/jd.cohorts15/tabs.from.parsing.results/jd.aa.ad.tab.csv", header = TRUE, row.names = 1)

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
pdf("jd.aa.ad.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  geom_text(aes(label = Value), color = "white") + #added numbers to cells#
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Elemental Traits: aa & ad") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix for 2 known elements- aa & ad #####

##### colored matrix for 2 known elements- aa & dd #####
data <- read.csv("../../../../results/additional.cohorts.results/jd.cohorts15/tabs.from.parsing.results/jd.aa.dd.tab.csv", header = TRUE, row.names = 1)

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
pdf("jd.aa.dd.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  geom_text(aes(label = Value), color = "white") + #added numbers to cells#
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Elemental Traits: aa & dd") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix for 2 known elements- aa & dd #####

### ### ### ### ### ### ### ### ### ###

##### colored matrix for 2 known elements- ad & aa #####
data <- read.csv("../../../../results/additional.cohorts.results/jd.cohorts15/tabs.from.parsing.results/jd.ad.aa.tab.csv", header = TRUE, row.names = 1)

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
pdf("jd.ad.aa.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  geom_text(aes(label = Value), color = "white") + #added numbers to cells#
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Elemental Traits: ad & aa") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix for 2 known elements- ad & aa #####

##### colored matrix for 2 known elements- ad & ad #####
data <- read.csv("../../../../results/additional.cohorts.results/jd.cohorts15/tabs.from.parsing.results/jd.ad.ad.tab.csv", header = TRUE, row.names = 1)

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
pdf("jd.ad.ad.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  geom_text(aes(label = Value), color = "white") + #added numbers to cells#
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Elemental Traits: ad & ad") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix for 2 known elements- ad & ad #####

##### colored matrix for 2 known elements- ad & dd #####
data <- read.csv("../../../../results/additional.cohorts.results/jd.cohorts15/tabs.from.parsing.results/jd.ad.dd.tab.csv", header = TRUE, row.names = 1)

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
pdf("jd.ad.dd.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  geom_text(aes(label = Value), color = "white") + #added numbers to cells#
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Elemental Traits: ad & dd") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix for 2 known elements- ad & dd #####

### ### ### ### ### ### ### ### ### ###

##### colored matrix for 2 known elements- dd & aa #####
data <- read.csv("../../../../results/additional.cohorts.results/jd.cohorts15/tabs.from.parsing.results/jd.dd.aa.tab.csv", header = TRUE, row.names = 1)

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
pdf("jd.dd.aa.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  geom_text(aes(label = Value), color = "white") + #added numbers to cells#
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Elemental Traits: dd & aa") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix for 2 known elements- dd & aa #####

##### colored matrix for 2 known elements- dd & ad #####
data <- read.csv("../../../../results/additional.cohorts.results/jd.cohorts15/tabs.from.parsing.results/jd.dd.ad.tab.csv", header = TRUE, row.names = 1)

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
pdf("jd.dd.ad.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  geom_text(aes(label = Value), color = "white") + #added numbers to cells#
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Elemental Traits: dd & ad") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix for 2 known elements- dd & ad #####

##### colored matrix for 2 known elements- dd & dd #####
data <- read.csv("../../../../results/additional.cohorts.results/jd.cohorts15/tabs.from.parsing.results/jd.dd.dd.tab.csv", header = TRUE, row.names = 1)

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
pdf("jd.dd.dd.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  geom_text(aes(label = Value), color = "white") + #added numbers to cells#
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Elemental Traits: dd & dd") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix for 2 known elements- dd & dd #####
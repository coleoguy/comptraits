library(ggplot2)
library(viridis)

##### colored matrix - a & a #####
data <- read.csv("../results/a.a.tab.csv", header = TRUE, row.names = 1)

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
pdf("../figures/color.num/a.a.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  geom_text(aes(label = Value), color = "white") + #added numbers to cells#
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Component Traits: a & a") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix - a & a #####

##### colored matrix - a & d #####
data <- read.csv("../results/a.d.tab.csv", header = TRUE, row.names = 1)

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
pdf("../figures/color.num/a.d.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  geom_text(aes(label = Value), color = "white") + #added numbers to cells#
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Component Traits: a & d") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix - a & d #####

##### colored matrix - d & d #####
data <- read.csv("../results/d.d.tab.csv", header = TRUE, row.names = 1)

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
pdf("../figures/color.num/d.d.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  geom_text(aes(label = Value), color = "white") + #added numbers to cells#
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Component Traits: d & d") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix - d & d #####

### ### ### ### ### ### ### ### ### ###

##### colored matrix - a & aa #####
data <- read.csv("../results/a.aa.tab.csv", header = TRUE, row.names = 1)

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
pdf("../figures/color.num/a.aa.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  geom_text(aes(label = Value), color = "white") + #added numbers to cells#
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Component Traits: a & aa") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix - a & aa #####

##### colored matrix - a & ad #####
data <- read.csv("../results/a.ad.tab.csv", header = TRUE, row.names = 1)

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
pdf("../figures/color.num/a.ad.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  geom_text(aes(label = Value), color = "white") + #added numbers to cells#
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Component Traits: a & ad") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix - a & ad #####

##### colored matrix - a & dd #####
data <- read.csv("../results/a.dd.tab.csv", header = TRUE, row.names = 1)

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
pdf("../figures/color.num/a.dd.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  geom_text(aes(label = Value), color = "white") + #added numbers to cells#
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Component Traits: a & dd") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix - a & dd #####

### ### ### ### ### ### ### ### ### ###

##### colored matrix - d & aa #####
data <- read.csv("../results/d.aa.tab.csv", header = TRUE, row.names = 1)

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
pdf("../figures/color.num/d.aa.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  geom_text(aes(label = Value), color = "white") + #added numbers to cells#
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Component Traits: d & aa") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix - d & aa #####

##### colored matrix - d & ad #####
data <- read.csv("../results/d.ad.tab.csv", header = TRUE, row.names = 1)

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
pdf("../figures/color.num/d.ad.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  geom_text(aes(label = Value), color = "white") + #added numbers to cells#
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Component Traits: d & ad") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix - a & ad #####

##### colored matrix - d & dd #####
data <- read.csv("../results/d.dd.tab.csv", header = TRUE, row.names = 1)

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
pdf("../figures/color.num/d.dd.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  geom_text(aes(label = Value), color = "white") + #added numbers to cells#
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Component Traits: d & dd") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix - d & dd #####

### ### ### ### ### ### ### ### ### ###

##### colored matrix - aa & aa #####
data <- read.csv("../results/aa.aa.tab.csv", header = TRUE, row.names = 1)

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
pdf("../figures/color.num/aa.aa.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  geom_text(aes(label = Value), color = "white") + #added numbers to cells#
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Component Traits: aa & aa") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix - aa & aa #####

##### colored matrix - aa & ad #####
data <- read.csv("../results/aa.ad.tab.csv", header = TRUE, row.names = 1)

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
pdf("../figures/color.num/aa.ad.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  geom_text(aes(label = Value), color = "white") + #added numbers to cells#
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Component Traits: aa & ad") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix - aa & ad #####

##### colored matrix - aa & dd #####
data <- read.csv("../results/aa.dd.tab.csv", header = TRUE, row.names = 1)

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
pdf("../figures/color.num/aa.dd.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  geom_text(aes(label = Value), color = "white") + #added numbers to cells#
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Component Traits: aa & dd") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix - aa & dd #####

### ### ### ### ### ### ### ### ### ###

##### colored matrix - ad & aa #####
data <- read.csv("../results/ad.aa.tab.csv", header = TRUE, row.names = 1)

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
pdf("../figures/color.num/ad.aa.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  geom_text(aes(label = Value), color = "white") + #added numbers to cells#
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Component Traits: ad & aa") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix - ad & aa #####

##### colored matrix - ad & ad #####
data <- read.csv("../results/ad.ad.tab.csv", header = TRUE, row.names = 1)

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
pdf("../figures/color.num/ad.ad.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  geom_text(aes(label = Value), color = "white") + #added numbers to cells#
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Component Traits: ad & ad") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix - ad & ad #####

##### colored matrix - ad & dd #####
data <- read.csv("../results/ad.dd.tab.csv", header = TRUE, row.names = 1)

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
pdf("../figures/color.num/ad.dd.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  geom_text(aes(label = Value), color = "white") + #added numbers to cells#
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Component Traits: ad & dd") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix - ad & dd #####

### ### ### ### ### ### ### ### ### ###

##### colored matrix - dd & aa #####
data <- read.csv("../results/dd.aa.tab.csv", header = TRUE, row.names = 1)

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
pdf("../figures/color.num/dd.aa.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  geom_text(aes(label = Value), color = "white") + #added numbers to cells#
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Component Traits: dd & aa") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix - dd & aa #####

##### colored matrix - dd & ad #####
data <- read.csv("../results/dd.ad.tab.csv", header = TRUE, row.names = 1)

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
pdf("../figures/color.num/dd.ad.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  geom_text(aes(label = Value), color = "white") + #added numbers to cells#
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Component Traits: dd & ad") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix - dd & ad #####

##### colored matrix - dd & dd #####
data <- read.csv("../results/dd.dd.tab.csv", header = TRUE, row.names = 1)

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
pdf("../figures/color.num/dd.dd.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  geom_text(aes(label = Value), color = "white") + #added numbers to cells#
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Component Traits: dd & dd") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix - dd & dd #####









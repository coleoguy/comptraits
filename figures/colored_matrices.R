library(ggplot2)
library(viridis)

##### colored matrix - Aa & Aa #####
data <- read.csv("../results/a.a.tab.csv", header = TRUE, row.names = 1)

# Convert the data frame to a matrix
data_matrix <- as.matrix(data)

# Creating a data frame suitable for ggplot
data_long <- expand.grid(Row = rownames(data_matrix), 
                         Column = colnames(data_matrix))
data_long$Value <- as.vector(data_matrix)

# Open PDF device
pdf("../figures/a.a.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Component Traits: Aa & Aa") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix - Aa & Aa #####

##### colored matrix - Aa & Ad #####
data <- read.csv("../results/a.d.tab.csv", header = TRUE, row.names = 1)

# Convert the data frame to a matrix
data_matrix <- as.matrix(data)

# Creating a data frame suitable for ggplot
data_long <- expand.grid(Row = rownames(data_matrix), 
                         Column = colnames(data_matrix))
data_long$Value <- as.vector(data_matrix)

# Open PDF device
pdf("../figures/a.d.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Component Traits: Aa & Ad") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix - Aa & Ad #####

##### colored matrix - Ad & Ad #####
data <- read.csv("../results/d.d.tab.csv", header = TRUE, row.names = 1)

# Convert the data frame to a matrix
data_matrix <- as.matrix(data)

# Creating a data frame suitable for ggplot
data_long <- expand.grid(Row = rownames(data_matrix), 
                         Column = colnames(data_matrix))
data_long$Value <- as.vector(data_matrix)

# Open PDF device
pdf("../figures/d.d.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Component Traits: Ad & Ad") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix - Ad & Ad #####

### ### ### ### ### ### ### ### ### ###

##### colored matrix - Aa & AaAa #####
data <- read.csv("../results/a.AaAa.tab.csv", header = TRUE, row.names = 1)

# Convert the data frame to a matrix
data_matrix <- as.matrix(data)

# Creating a data frame suitable for ggplot
data_long <- expand.grid(Row = rownames(data_matrix), 
                         Column = colnames(data_matrix))
data_long$Value <- as.vector(data_matrix)

# Open PDF device
pdf("../figures/a.AaAa.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Component Traits: Aa & AaAa") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix - Aa & AaAa #####

##### colored matrix - Aa & AaAd #####
data <- read.csv("../results/a.AaAd.tab.csv", header = TRUE, row.names = 1)

# Convert the data frame to a matrix
data_matrix <- as.matrix(data)

# Creating a data frame suitable for ggplot
data_long <- expand.grid(Row = rownames(data_matrix), 
                         Column = colnames(data_matrix))
data_long$Value <- as.vector(data_matrix)

# Open PDF device
pdf("../figures/a.AaAd.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Component Traits: Aa & AaAd") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix - Aa & AaAd #####

##### colored matrix - Aa & AdAd #####
data <- read.csv("../results/a.AdAd.tab.csv", header = TRUE, row.names = 1)

# Convert the data frame to a matrix
data_matrix <- as.matrix(data)

# Creating a data frame suitable for ggplot
data_long <- expand.grid(Row = rownames(data_matrix), 
                         Column = colnames(data_matrix))
data_long$Value <- as.vector(data_matrix)

# Open PDF device
pdf("../figures/a.AdAd.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Component Traits: Aa & AdAd") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix - Aa & AdAd #####

### ### ### ### ### ### ### ### ### ###

##### colored matrix - Ad & AaAa #####
data <- read.csv("../results/d.AaAa.tab.csv", header = TRUE, row.names = 1)

# Convert the data frame to a matrix
data_matrix <- as.matrix(data)

# Creating a data frame suitable for ggplot
data_long <- expand.grid(Row = rownames(data_matrix), 
                         Column = colnames(data_matrix))
data_long$Value <- as.vector(data_matrix)

# Open PDF device
pdf("../figures/d.AaAa.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Component Traits: Ad & AaAa") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix - Ad & AaAa #####

##### colored matrix - Ad & AaAd #####
data <- read.csv("../results/d.AaAd.tab.csv", header = TRUE, row.names = 1)

# Convert the data frame to a matrix
data_matrix <- as.matrix(data)

# Creating a data frame suitable for ggplot
data_long <- expand.grid(Row = rownames(data_matrix), 
                         Column = colnames(data_matrix))
data_long$Value <- as.vector(data_matrix)

# Open PDF device
pdf("../figures/d.AaAd.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Component Traits: Ad & AaAd") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix - Ad & AaAd #####

##### colored matrix - Ad & AdAd #####
data <- read.csv("../results/d.AdAd.tab.csv", header = TRUE, row.names = 1)

# Convert the data frame to a matrix
data_matrix <- as.matrix(data)

# Creating a data frame suitable for ggplot
data_long <- expand.grid(Row = rownames(data_matrix), 
                         Column = colnames(data_matrix))
data_long$Value <- as.vector(data_matrix)

# Open PDF device
pdf("../figures/d.AdAd.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Component Traits: Ad & AdAd") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix - Ad & AdAd #####

### ### ### ### ### ### ### ### ### ###

##### colored matrix - AaAa & AaAa #####
data <- read.csv("../results/AaAa.AaAa.tab.csv", header = TRUE, row.names = 1)

# Convert the data frame to a matrix
data_matrix <- as.matrix(data)

# Creating a data frame suitable for ggplot
data_long <- expand.grid(Row = rownames(data_matrix), 
                         Column = colnames(data_matrix))
data_long$Value <- as.vector(data_matrix)

# Open PDF device
pdf("../figures/AaAa.AaAa.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Component Traits: AaAa & AaAa") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix - AaAa & AaAa #####

##### colored matrix - AaAa & AaAd #####
data <- read.csv("../results/AaAa.AaAd.tab.csv", header = TRUE, row.names = 1)

# Convert the data frame to a matrix
data_matrix <- as.matrix(data)

# Creating a data frame suitable for ggplot
data_long <- expand.grid(Row = rownames(data_matrix), 
                         Column = colnames(data_matrix))
data_long$Value <- as.vector(data_matrix)

# Open PDF device
pdf("../figures/AaAa.AaAd.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Component Traits: AaAa & AaAd") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix - AaAa & AaAd #####

##### colored matrix - AaAa & AdAd #####
data <- read.csv("../results/AaAa.AdAd.tab.csv", header = TRUE, row.names = 1)

# Convert the data frame to a matrix
data_matrix <- as.matrix(data)

# Creating a data frame suitable for ggplot
data_long <- expand.grid(Row = rownames(data_matrix), 
                         Column = colnames(data_matrix))
data_long$Value <- as.vector(data_matrix)

# Open PDF device
pdf("../figures/AaAa.AdAd.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Component Traits: AaAa & AdAd") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix - AaAa & AdAd #####

### ### ### ### ### ### ### ### ### ###

##### colored matrix - AaAd & AaAa #####
data <- read.csv("../results/AaAd.AaAa.tab.csv", header = TRUE, row.names = 1)

# Convert the data frame to a matrix
data_matrix <- as.matrix(data)

# Creating a data frame suitable for ggplot
data_long <- expand.grid(Row = rownames(data_matrix), 
                         Column = colnames(data_matrix))
data_long$Value <- as.vector(data_matrix)

# Open PDF device
pdf("../figures/AaAd.AaAa.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Component Traits: AaAd & AaAa") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix - AaAd & AaAa #####

##### colored matrix - AaAd & AaAd #####
data <- read.csv("../results/AaAd.AaAd.tab.csv", header = TRUE, row.names = 1)

# Convert the data frame to a matrix
data_matrix <- as.matrix(data)

# Creating a data frame suitable for ggplot
data_long <- expand.grid(Row = rownames(data_matrix), 
                         Column = colnames(data_matrix))
data_long$Value <- as.vector(data_matrix)

# Open PDF device
pdf("../figures/AaAd.AaAd.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Component Traits: AaAd & AaAd") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix - AaAd & AaAd #####

##### colored matrix - AaAd & AdAd #####
data <- read.csv("../results/AaAd.AdAd.tab.csv", header = TRUE, row.names = 1)

# Convert the data frame to a matrix
data_matrix <- as.matrix(data)

# Creating a data frame suitable for ggplot
data_long <- expand.grid(Row = rownames(data_matrix), 
                         Column = colnames(data_matrix))
data_long$Value <- as.vector(data_matrix)

# Open PDF device
pdf("../figures/AaAd.AdAd.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Component Traits: AaAd & AdAd") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix - AaAd & AdAd #####

### ### ### ### ### ### ### ### ### ###

##### colored matrix - AdAd & AaAa #####
data <- read.csv("../results/AdAd.AaAa.tab.csv", header = TRUE, row.names = 1)

# Convert the data frame to a matrix
data_matrix <- as.matrix(data)

# Creating a data frame suitable for ggplot
data_long <- expand.grid(Row = rownames(data_matrix), 
                         Column = colnames(data_matrix))
data_long$Value <- as.vector(data_matrix)

# Open PDF device
pdf("../figures/AdAd.AaAa.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Component Traits: AdAd & AaAa") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix - AdAd & AaAa #####

##### colored matrix - AdAd & AaAd #####
data <- read.csv("../results/AdAd.AaAd.tab.csv", header = TRUE, row.names = 1)

# Convert the data frame to a matrix
data_matrix <- as.matrix(data)

# Creating a data frame suitable for ggplot
data_long <- expand.grid(Row = rownames(data_matrix), 
                         Column = colnames(data_matrix))
data_long$Value <- as.vector(data_matrix)

# Open PDF device
pdf("../figures/AdAd.AaAd.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Component Traits: AdAd & AaAd") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix - AdAd & AaAd #####

##### colored matrix - AdAd & AdAd #####
data <- read.csv("../results/AdAd.AdAd.tab.csv", header = TRUE, row.names = 1)

# Convert the data frame to a matrix
data_matrix <- as.matrix(data)

# Creating a data frame suitable for ggplot
data_long <- expand.grid(Row = rownames(data_matrix), 
                         Column = colnames(data_matrix))
data_long$Value <- as.vector(data_matrix)

# Open PDF device
pdf("../figures/AdAd.AdAd.pdf")

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  scale_fill_viridis(name = "Value", limits = c(0, 1)) +
  labs(x = "Architectures", y = "Functions", title = "Component Traits: AdAd & AdAd") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#close the device
dev.off()
##### colored matrix - AdAd & AdAd #####









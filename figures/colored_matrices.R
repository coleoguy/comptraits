library(ggplot2)
library(viridis)

##### colored matrix - Aa & Aa #####
data <- read.csv("../results/resAa.Aa.csv", header = TRUE, row.names = 1)

# Convert the data frame to a matrix
data_matrix <- as.matrix(data)

# Creating a data frame suitable for ggplot
data_long <- expand.grid(Row = rownames(data_matrix), 
                         Column = colnames(data_matrix))
data_long$Value <- as.vector(data_matrix)

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  scale_fill_viridis(name = "Value", limits = c(0, 1000)) +
  labs(x = "Architectures", y = "Functions", title = "Component Traits: Aa & Aa") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
##### colored matrix - Aa & Aa #####




##### colored matrix - Aa & Ad #####
data <- read.csv("../results/resAa.Ad.csv", header = TRUE, row.names = 1)

# Convert the data frame to a matrix
data_matrix <- as.matrix(data)

# Creating a data frame suitable for ggplot
data_long <- expand.grid(Row = rownames(data_matrix), 
                         Column = colnames(data_matrix))
data_long$Value <- as.vector(data_matrix)

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  scale_fill_viridis(name = "Value", limits = c(0, 1000)) +
  labs(x = "Architectures", y = "Functions", title = "Component Traits: Aa & Ad") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
##### colored matrix - Aa & Ad #####




##### colored matrix - Ad & Ad #####
data <- read.csv("../results/resAd.Ad.csv", header = TRUE, row.names = 1)

# Convert the data frame to a matrix
data_matrix <- as.matrix(data)

# Creating a data frame suitable for ggplot
data_long <- expand.grid(Row = rownames(data_matrix), 
                         Column = colnames(data_matrix))
data_long$Value <- as.vector(data_matrix)

# Creating the plot
ggplot(data_long, aes(x = Column, y = Row, fill = Value)) +
  geom_tile() +
  scale_fill_viridis(name = "Value", limits = c(0, 1000)) +
  labs(x = "Architectures", y = "Functions", title = "Component Traits: Ad & Ad") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
##### colored matrix - Ad & Ad #####




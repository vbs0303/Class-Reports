# Install ggplot2 if not already installed
if (!require(ggplot2)) install.packages("ggplot2")

# Load ggplot2
library(ggplot2)

# Create sample data
data <- data.frame(
  x = 1:10,
  y = c(2, 3, 5, 7, 11, 13, 17, 19, 23, 29)
)

# Create a scatter plot
ggplot(data, aes(x = x, y = y)) +
  geom_point(color = "blue", size = 3) + 
  geom_line(color = "red") +
  labs(title = "Simple Graph in R",
       x = "X-Axis",
       y = "Y-Axis") +
  theme_minimal()

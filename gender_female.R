# Load necessary libraries
library(ggplot2)
library(dplyr)

# Read the dataset
data <- read.csv("~/Desktop/Crash_Data.csv")

# Filter the dataset for females only
female_data <- data %>%
  filter(Gender_Drv1 == "Female") %>%
  select(Totalinjuries)

# Plot: Bar graph for female injury distribution
ggplot(female_data, aes(x = Totalinjuries)) +
  geom_bar(fill = "skyblue", color = "black", alpha = 0.7) +
  theme_minimal(base_size = 14) +
  labs(
    title = "Distribution of Injuries (Female Drivers)",
    x = "Number of Injuries",
    y = "Count"
  ) +
  theme(plot.title = element_text(hjust = 0.5))

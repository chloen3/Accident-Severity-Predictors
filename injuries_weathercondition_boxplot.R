# Load required libraries
library(dplyr)
library(ggplot2)

# Step 1: Load the dataset
file_path <- "~/Desktop/Crash_Data.csv"  # Path to the dataset
crash_data <- read.csv(file_path)

# Step 2: Boxplot for fatalities by weather condition
ggplot(crash_data, aes(x = Weather, y = Totalinjuries, fill = Weather)) +
  geom_boxplot() +
  theme_minimal() +
  labs(
    title = "Injuries by Weather Condition",
    x = "Weather Condition",
    y = "Number of Injuries",
    fill = "Weather"
  ) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1),
    plot.title = element_text(hjust = 0.5, face = "bold"),
    axis.title = element_text(face = "bold")
  )

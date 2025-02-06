# Step 1: Load Required Libraries
library(dplyr)
library(ggplot2)

# Step 2: Load the Dataset
file_path <- "~/Desktop/Crash_Data.csv"  # Specify the dataset path
crash_data <- read.csv(file_path)

# Step 3: Combine, Clean, and Aggregate Data
# Merging Age_Drv1 and Age_Drv2 into a unified dataset and calculating average fatalities per age
avg_fatalities_by_age <- crash_data %>%
  select(Age_Drv1, Age_Drv2, Totalfatalities) %>%  # Select relevant columns
  gather(key = "Driver", value = "Age", Age_Drv1, Age_Drv2) %>%  # Combine Age columns
  filter(!is.na(Age) & Age > 0 & Age < 120) %>%  # Filter valid ages
  group_by(Age) %>%  # Group by age
  summarise(Average_Fatalities = mean(Totalfatalities, na.rm = TRUE))  # Calculate average fatalities

# Step 4: Visualize as a Scatterplot
ggplot(avg_fatalities_by_age, aes(x = Age, y = Average_Fatalities)) +
  geom_point(color = "salmon", size = 2, alpha = 0.7) +  # Scatter points
  geom_smooth(method = "loess", se = FALSE, color = "blue", linetype = "dashed") +  # Smoothed trend line
  theme_minimal(base_size = 14) +  # Minimal theme
  labs(
    title = "Average Number of Fatalities by Driver Age",
    x = "Driver Age",
    y = "Average Fatalities"
  ) +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),  # Center and bold the title
    axis.text = element_text(face = "bold"),  # Bold axis labels
    axis.title = element_text(face = "bold")  # Bold axis titles
  )

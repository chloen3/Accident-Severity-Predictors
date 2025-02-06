# Step 1: Load Required Libraries
library(dplyr)
library(ggplot2)
library(tidyr)  # For the `gather` function

# Step 2: Load the Dataset
file_path <- "~/Desktop/Crash_Data.csv"  # Specify the dataset path
crash_data <- read.csv(file_path)

# Step 3: Combine Gender Columns into a Unified Dataset
# Merging Gender_Drv1 and Gender_Drv2 into a single column for comprehensive analysis
gender_data <- crash_data %>%
  select(Gender_Drv1, Gender_Drv2) %>%  # Select relevant columns
  gather(key = "Driver", value = "Gender", Gender_Drv1, Gender_Drv2) %>%  # Combine columns into a long format
  filter(Gender %in% c("Male", "Female", "Unknown"))  # Filter for valid gender categories

# Step 4: Visualize Gender Distribution
ggplot(gender_data, aes(x = Gender, fill = Gender)) +
  geom_bar(alpha = 0.85, color = "black", width = 0.6) +  # Use a professional bar style
  theme_minimal(base_size = 14) +  # Minimal theme with larger base font size
  labs(
    title = "Gender Distribution Among Drivers",
    x = "Gender",
    y = "Number of Drivers",
    fill = "Gender"
  ) +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),  # Center and bold the title
    legend.title = element_text(face = "bold"),  # Bold the legend title
    axis.text.x = element_text(angle = 0, hjust = 0.5, face = "bold"),  # Bold and center x-axis labels
    axis.text.y = element_text(face = "bold")  # Bold y-axis labels
  ) +
  scale_fill_brewer(palette = "Set2")  # Apply a professional color palette

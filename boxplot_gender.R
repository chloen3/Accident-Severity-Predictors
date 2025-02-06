# Load necessary libraries
library(ggplot2)
library(dplyr)

# Read the dataset
data <- read.csv("~/Desktop/Crash_Data.csv")

# Filter data for relevant columns and clean invalid values
gender_data <- data %>%
  select(Gender_Drv1, Totalinjuries, Totalfatalities) %>%
  filter(Gender_Drv1 %in% c("Male", "Female"))  # Keep only valid genders



# Plot 3: Boxplot of Injuries by Gender
ggplot(gender_data, aes(x = Gender_Drv1, y = Totalinjuries, fill = Gender_Drv1)) +
  geom_boxplot(alpha = 0.7) +
  scale_fill_manual(values = c("skyblue", "salmon")) +
  theme_minimal(base_size = 14) +
  labs(
    title = "Boxplot of Injuries by Gender",
    x = "Gender",
    y = "Number of Injuries",
    fill = "Gender"
  ) +
  theme(plot.title = element_text(hjust = 0.5))

# Load required libraries
library(dplyr)
library(ggplot2)

# Step 1: Load the dataset
file_path <- "~/Desktop/Crash_Data.csv"  # Path to the dataset
crash_data <- read.csv(file_path)

# Step 2: Create a unified influence category
# Categorize accidents based on whether drugs, alcohol, or neither influenced the incident
crash_data <- crash_data %>%
  mutate(Influence_Category = case_when(
    DrugUse_Drv2 != "No Apparent Influence" ~ "Drug Use",
    AlcoholUse_Drv2 != "No Apparent Influence" ~ "Alcohol Use",
    TRUE ~ "No Apparent Influence"
  ))

# Convert the new influence category into a factor
crash_data$Influence_Category <- as.factor(crash_data$Influence_Category)

# Step 3: Summarize data by influence category
summary_data <- crash_data %>%
  group_by(Influence_Category) %>%
  summarise(
    Total_Accidents = n(),
    Total_Injuries = sum(Totalinjuries, na.rm = TRUE),
    Total_Fatalities = sum(Totalfatalities, na.rm = TRUE)
  )

# 1. Bar graph for number of accidents by influence category
ggplot(summary_data, aes(x = Influence_Category, y = Total_Accidents, fill = Influence_Category)) +
  geom_bar(stat = "identity", alpha = 0.85, color = "black") +
  theme_minimal(base_size = 14) +
  labs(
    title = "Number of Accidents by Influence Category",
    x = "Influence Category",
    y = "Number of Accidents",
    fill = "Influence Type"
  ) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1, color = "black"),
    plot.title = element_text(hjust = 0.5, face = "bold", color = "black"),
    legend.title = element_text(face = "bold", color = "black"),
    axis.title = element_text(color = "black")
  ) +
  scale_fill_brewer(palette = "Set2")

# 2. Bar graph for number of injuries by influence category
ggplot(summary_data, aes(x = Influence_Category, y = Total_Injuries, fill = Influence_Category)) +
  geom_bar(stat = "identity", alpha = 0.85, color = "black") +
  theme_minimal(base_size = 14) +
  labs(
    title = "Number of Injuries by Influence Category",
    x = "Influence Category",
    y = "Number of Injuries",
    fill = "Influence Type"
  ) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1, color = "black"),
    plot.title = element_text(hjust = 0.5, face = "bold", color = "black"),
    legend.title = element_text(face = "bold", color = "black"),
    axis.title = element_text(color = "black")
  ) +
  scale_fill_brewer(palette = "Set2")

# 3. Bar graph for number of fatalities by influence category
ggplot(summary_data, aes(x = Influence_Category, y = Total_Fatalities, fill = Influence_Category)) +
  geom_bar(stat = "identity", alpha = 0.85, color = "black") +
  theme_minimal(base_size = 14) +
  labs(
    title = "Number of Fatalities by Influence Category",
    x = "Influence Category",
    y = "Number of Fatalities",
    fill = "Influence Type"
  ) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1, color = "black"),
    plot.title = element_text(hjust = 0.5, face = "bold", color = "black"),
    legend.title = element_text(face = "bold", color = "black"),
    axis.title = element_text(color = "black")
  ) +
  scale_fill_brewer(palette = "Set2")

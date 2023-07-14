# Load required libraries
library(dplyr)
library(ggplot2)
library(shiny)
library(caret)

# Step 1: Read the CSV file and view the dataset



# Step 2: Preprocessing with dplyr
# Select relevant columns and handle missing values





# Step 3: Exploratory data analysis with ggplot2
# Visualize survival rate by passenger class using a loop








# Step 4: Create a basic R Shiny dashboard with selected features
# Define UI











# Define server































# Step 5: Machine learning with logistic regression


# Step 6: Evaluate the model




# Ensure both predictions and actual values are factors with the same levels



# Calculate accuracy


# Calculate precision, recall, and F1-score








# Print the evaluation metrics
print("Evaluation Metrics:")
print(paste("Accuracy:", accuracy))
print(paste("Precision:", precision))
print(paste("Recall:", recall))
print(paste("F1-Score:", f1_score))


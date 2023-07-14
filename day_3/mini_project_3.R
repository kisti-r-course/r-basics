# Load required libraries
library(dplyr)
library(ggplot2)
library(shiny)
library(caret)

# Step 1: Read the CSV file and view the dataset
titanic <- read.csv("C:/Users/ADMIN/OneDrive/tmp/r-basics/data/train.csv", stringsAsFactors = TRUE)
head(titanic)

# Step 2: Preprocessing with dplyr
# Select relevant columns and handle missing values
titanic_processed <- titanic %>%
  select(Survived, Pclass, Sex, Age, Fare) %>%
  mutate(Age = ifelse(is.na(Age), mean(Age, na.rm = TRUE), Age)) %>%
  mutate(Survived = factor(Survived, levels = c(0, 1)))

# Step 3: Exploratory data analysis with ggplot2
# Visualize survival rate by passenger class using a loop
for (feature in c("Pclass", "Sex", "Age", "Fare")) {
  ggplot(titanic_processed, aes(x = .data[[feature]], fill = factor(Survived))) +
    geom_bar(position = "fill") +
    labs(title = paste("Survival Rate by", feature)) +
    xlab(feature) +
    ylab("Proportion") +
    scale_fill_manual(values = c("#FF4A4A", "#4ACFFF"))
}

# Step 4: Create a basic R Shiny dashboard with selected features
# Define UI
ui <- fluidPage(
  titlePanel("Titanic Passenger Analysis"),
  sidebarLayout(
    sidebarPanel(
      checkboxGroupInput(
        inputId = "features",
        label = "Select Features",
        choices = c("Pclass", "Sex", "Age", "Fare"),
        selected = c("Pclass", "Sex", "Age")
      )
    ),
    mainPanel(
      plotOutput("plot")
    )
  )
)

# Define server
server <- function(input, output) {
  output$plot <- renderPlot({
    # Generate dynamic plot based on selected features using if and for loops
    if ("Pclass" %in% input$features) {
      p <- ggplot(titanic_processed, aes(x = Pclass, fill = factor(Survived))) +
        geom_bar(position = "fill") +
        labs(title = "Survival Rate by Pclass") +
        xlab("Pclass") +
        ylab("Proportion") +
        scale_fill_manual(values = c("#FF4A4A", "#4ACFFF"))
      print(p)
    }
    
    if ("Sex" %in% input$features) {
      p <- ggplot(titanic_processed, aes(x = Sex, fill = factor(Survived))) +
        geom_bar(position = "fill") +
        labs(title = "Survival Rate by Sex") +
        xlab("Sex") +
        ylab("Proportion") +
        scale_fill_manual(values = c("#FF4A4A", "#4ACFFF"))
      print(p)
    }
    
    if ("Age" %in% input$features) {
      p <- ggplot(titanic_processed, aes(x = Age, fill = factor(Survived))) +
        geom_bar(position = "fill") +
        labs(title = "Survival Rate by Age") +
        xlab("Age") +
        ylab("Proportion") +
        scale_fill_manual(values = c("#FF4A4A", "#4ACFFF"))
      print(p)
    }
    
    if ("Fare" %in% input$features) {
      p <- ggplot(titanic_processed, aes(x = Fare, fill = factor(Survived))) +
        geom_bar(position = "fill") +
        labs(title = "Survival Rate by Fare") +
        xlab("Fare") +
        ylab("Proportion") +
        scale_fill_manual(values = c("#FF4A4A", "#4ACFFF"))
      print(p)
    }
  })
}

# Step 5: Machine learning with logistic regression
model <- glm(Survived ~ ., data = titanic_processed, family = binomial(link = "logit"))

# Step 6: Evaluate the model
predictions <- predict(model, newdata = titanic_processed, type = "response")
predictions <- ifelse(predictions > 0.5, "1", "0")

# Ensure both predictions and actual values are factors with the same levels
predictions <- factor(predictions, levels = c("0", "1"))
titanic_processed$Survived <- factor(titanic_processed$Survived, levels = c("0", "1"))

# Calculate accuracy
accuracy <- mean(predictions == titanic_processed$Survived)

# Calculate precision, recall, and F1-score
confusion <- confusionMatrix(predictions, titanic_processed$Survived)
precision <- confusion$byClass["Pos Pred Value"]
recall <- confusion$byClass["Sensitivity"]
f1_score <- confusion$byClass["F1"]

# Print the evaluation metrics
print("Evaluation Metrics:")
print(paste("Accuracy:", accuracy))
print(paste("Precision:", precision))
print(paste("Recall:", recall))
print(paste("F1-Score:", f1_score))



library(dplyr)

setwd("/path/to/directory")

df <- read.csv("./data/Salaries.csv", stringsAsFactors = TRUE)
df %>% as_tibble()

# Exploratory Data Analysis ----

## Summary Statistics ----

summary(df)

## Other useful statistics ----

# var(), sd(), IQR()

# group_by()로 rank별로 묶어 variance, standard deviation, interquartile range

df %>%
    group_by(rank) %>%
    summarise(var = var(salary),
                sd = sd(salary),
                iqr = IQR(salary))


table(df$rank) # counts of each rank

table(df$rank) / nrow(df) # percentage of each rank




## Visualisation for EDA ----

### Histograms ----

hist(df$salary)

# 더 예쁜 histogram을 꾸며보기

hist(df$salary,
    xlab = "Salary (USD)",
    main = "Histogram of Academic Salaries",
    breaks = 20,
    col = "pink",
    border = "purple")

### Barplots ----

barplot(table(df$rank))


##### Exercise ----
# barplot의 x label을 "Ranks", 제목을 "Distribution of Professor Ranks", barplot 색은 빨간색으로 체우고 border를 파란색으로 수정

barplot(table(df$rank),
        xlab = "Ranks",
        main = "Distribution of Professor Ranks",
        col = "red",
        border = "blue")


### Scatterplots ----

plot(salary ~ yrs.since.phd, 
    data = df,
    xlab = "Years Since PhD (Years)",
    ylab = "Salary (USD)",
    main = "Salary vs Years Since PhD",
    pch = 20, # shape of data points
    cex = 3, # data point size
    col = "dodgerblue")


### ggplot2 ----


library(ggplot2)



ggplot(df, aes(x = yrs.since.phd, y = salary))


# ggplot에게 주어진 정보는 x와 y가 무엇인지이기 때문에 x와 y axes만 가진 plot이 출력됩니다.


ggplot(df, aes(x = yrs.since.phd, y = salary)) +
    geom_point()

# Plot의 색과 모양도 수정할 수 있습니다.

ggplot(df, aes(x = yrs.since.phd, y = salary)) +
    geom_point(alpha = 0.7,
                color = "orange",
                size = 5)

# Label도 추가해볼 수 있습니다.

ggplot(df, aes(x = yrs.since.phd, y = salary)) +
    geom_point(alpha = 0.5,
                color = "orange",
                size = 10) + 
    xlab("Years Since PhD") +
    ylab("Salary (USD)")


##### Exercise: ggplot의 geom_histogram()으로 salary에 대한 bins가 15개인 histogram 생성하고, x label은 "Salary (USD)"로 수정

ggplot(df, aes(x = salary)) +
    geom_histogram(bins = 15) +
    xlab("Salary (USD)")

#### Why ggplot2?

# Base R와 달리 ggplot은 많은 응용 방법이 있습니다. 거의 모든 요소들이 customisable합니다!

ggplot(df, aes(x = salary, fill = discipline)) +
    geom_histogram(bins = 20, alpha = 0.7, position = "identity") +
    scale_fill_manual(values = c("#68b3a2", "#404080")) +
    xlab("Salary (USD)") +
    ggtitle("Histogram of Salaries by Discipline") +
    theme(plot.title = element_text(size = 20,
                                    color = "darkorange",
                                    hjust = 0.5),
            axis.title.x = element_text(size = 10,
                                    color = "darkblue",
                                    hjust = 0.5),
            axis.title.y = element_text(size = 10,
                                    color = "darkred",
                                    hjust = 0.5),
            legend.key.size = unit(1, "cm"),
            legend.title = element_text(size = 10),
            legend.text = element_text(size = 5,  color = "darkgrey"))

# 이 plot을 한번 저장해보세요.
ggsave("test_plot.png")

dev.off()

##### Exercise ----
# PPT plot 재현

ggplot(df, aes(x = yrs.service, y = salary, color = sex)) +
    geom_point(alpha = 0.7, size = 5) +
    xlab("Service Years (Years)") +
    ylab("Salary (USD)") +
    ggtitle("Years of Service vs Salary") +
    theme(plot.title = element_text(size = 20,
                                    color = "red",
                                    hjust = 0.5),
            axis.title.x = element_text(size = 10,
                                    color = "blue",
                                    hjust = 0.5),
            axis.title.y = element_text(size = 10,
                                    color = "purple",
                                    hjust = 0.5),
            legend.key.size = unit(1, "cm"),
            legend.title = element_text(size = 10),
            legend.text = element_text(size = 5,  color = "orange"))


## Correlation ----
# Correlation은 두 변수 사이의 관계를 측정하는 방법입니다. Correlation은 -1과 1 사이의 값을 가지며, 0에 가까울수록 두 변수 사이의 관계가 없다는 것을 의미합니다.


cor_df <- cor(df %>% select(yrs.since.phd, salary, yrs.service))
head(cor_df)



library(ggcorrplot)

ggcorrplot(cor_df,
            lab = TRUE,
            lab_size = 3,
            colors = c("#6d86d6", "white", "#d66d6d"),
            title = "Correlation Plot of Years Since PhD, Salary, and Years of Service")


# 변수가 더 많은 데이터를 가지고 correlation heatmap을 그려보겠습니다

data(mtcars)

mtcars %>% as_tibble()
str(mtcars)
summary(mtcars)

corr_mt <- cor(mtcars)
head(corr_mt)

ggcorrplot(corr_mt,
            lab = TRUE,
            lab_size = 3,
            colors = c("#6d86d6", "white", "#d66d6d"),
            outline.col = "white",
            title = "Correlation Plot of mtcars")


##### Exercise: 새로운 데이터로 histogram과 correlation heatmap 출력 ----

data(iris)
head(iris)
str(iris)

summary(iris)

hist(iris$Sepal.Length,
    xlab = "Sepal Length (cm)",
    main = "Histogram of Sepal Length",
    breaks = 20)

ggplot(iris, aes(x = Sepal.Length)) +
    geom_histogram(bins = 20, fill = "#6d86d6") +
    xlab("Sepal Length (cm)") +
    ggtitle("Histogram of Sepal Length")



### ggplot 응용 ----

# 여러 변수의 plot을 한번에 그려보기 위해, 데이터를 long format으로 변형시킬 수 있습니다.


library(tidyr)

# transform to long format (2 columns)
iris_long <- gather(iris[, 1:4], key = "name", value = "value")

head(iris_long)

# plot histigrams per name
ggplot(iris_long, aes(value)) +
  geom_histogram(bins = 20, fill = "#6d86d6") +
  facet_wrap(~name, scale = "free_x")

# Correlation plot도 한번 그려보겠습니다.

cor_iris <- cor(iris[, 1:4])
head(cor_iris)

ggcorrplot(cor_iris,
            method = "square",
            lab = TRUE,
            title = "Correlation Plot of Iris Data")



##### Exercise: for loop을 사용해 iris 데이터의 column마다 histogram을 그린 후 저장 ----

library(ggplot2)

# colnames를 사용하여 ggsave로 "Sepal.Width_histogram.png" 형태로 저장해보세요.
for (i in 1:4) {
  ggplot(iris, aes(x = get(colnames(iris)[i]))) +
    geom_histogram(bins = 10)
  
  ggsave(paste0("./results/", colnames(iris)[i], "_histogram.png"))
}

## Principal Component Analysis (PCA) ----

# PCA는 데이터의 차원을 줄이는 방법입니다. 예를 들어, 3차원 데이터를 2차원으로 줄이는 것입니다.


library(plotly)
library(ggfortify)



iris_pca <- prcomp(iris[, 1:4], center = TRUE, scale. = TRUE)
summary(iris_pca)

# prcomp함수로 PCA를 수행했을 때, 각 PC의 중요도를 확인할 수 있습니다.
# PC1은 데이터의 분산을 가장 많이 설명하는 축입니다. PC2는 PC1과 직교하는 축이며, 데이터의 분산을 두번째로 많이 설명하는 축입니다.

iris_pca$rotation
iris_pca$sdev

# rotation은 PCA의 loadings를 나타냅니다.
# Loadings란 PC1, PC2, PC3, PC4가 각각 어떤 변수들의 선형결합으로 이루어져 있는지를 나타냅니다.
# sdev는 각 PC의 eigenvalue, 즉 각 PC가 데이터의 분산을 얼마나 설명하는지를 나타냅니다.
# 예를 들어, Sepal.Length는 PC1의 loadings에 큰 영향을 미치고, PC1은 데이터의 분산을 가장 많이 설명하므로, Sepal.Length는 데이터의 분산을 가장 많이 설명하는 변수라고 할 수 있습니다. 

p <- autoplot(iris_pca)
ggplotly(p)

# PCA의 결과에서 PC1의 괄호 안의 숫자는 PC1이 데이터의 분산의 몇 %를 설명하는지를 나타냅니다.
# 이 PCA plot은 어떤 의미가 담겨있을까요?

p <- autoplot(iris_pca, data = iris, colour = 'Species')

ggplotly(p)
    
# Colour을 "Species"로 지정하면, 각각의 종별로 데이터가 어떻게 분포하는지 확인할 수 있습니다.
# PC1상에서 setosa는 다른 종들과 구분이 되는 반면, versicolor와 virginica는 구분이 잘 되지 않습니다.

p <- autoplot(iris_pca, data = iris, colour = 'Species',
              loadings = TRUE, loadings.colour = 'blue',
              loadings.label = TRUE, loadings.label.size = 3)

ggplotly(p)

# loadings를 확인하면, PC1은 Sepal.Length와 Sepal.Width의 선형결합으로 이루어져 있음을 알 수 있습니다.


##### Exercise: salary 데이터로 PCA를 그려보기 ----
# Hint: PCA는 categorical또는 binary 변수에 대해서는 수행할 수 없기 때문에, continuous 변수만을 사용합니다.

pca_res <- prcomp(df %>% select(yrs.since.phd, yrs.service, salary), center = TRUE, scale. = TRUE)

autoplot(pca_res, data = df, colour = "rank")


# salary 데이터에 PCA를 적용하면 PC1상에서 rank별로 나뉘는 것을 확인할 수 있습니다.

pca_res$rotation
pca_res$sdev

autoplot(pca_res, data = df, colour = "rank",
         loadings = TRUE, loadings.colour = 'blue',
         loadings.label = TRUE, loadings.label.size = 3)

# loadings를 확인하면, PC1은 yrs.since.phd와 yrs.service의 선형결합으로 이루어져 있음을 알 수 있습니다.
# PC1은 데이터 분산의 70%를 설명하므로, yrs.since.phd와 yrs.service는 데이터의 분산을 많이 설명하는 변수라고 할 수 있습니다.



# Introduction to R Shiny ----

## Overview and Setup ----

# Hello World 앱

# Shiny는 두가지 요소가 필요합니다. Server, 그리고 UI입니다.
# Server은 뒤에서 실행되는 logic이라고 보시면 되고, UI는 앱에서 표시되는 내용이라고 생각하시면 됩니다.

# Define server logic
# input과 output을 받을 수 있는, server라는 function을 만들어줍니다.

server <- function(input, output) {
  output$text <- renderText("Hello, Shiny!")
}

# Define UI
# 실제로 실행하면 보일 부분을 ui라는 변수에 넣어줍니다.
# 여기서 fluidPage()라는 기본적인 "Page"를 만들 수 있는 함수를 사용해봅니다.
?fluidPage

# fluidPage에 일반적으로 쓰이는 요소는 titlePanel과 mainPanel, sidebarLayout 등이 있는데, 앞으로 조금씩 사용해보며 어떻게 표현되는지 살펴보겠습니다.

ui <- fluidPage(
  titlePanel("Hello Shiny!"),
  mainPanel(
    textOutput("text")
  )
)

# 이제 shinyApp()라는 함수에 ui와 server를 지정하여 실행만 해주면 됩니다.
shinyApp(ui = ui, server = server)

# 실행된 앱을 보면서 다시 server, ui 코드를 살펴보세요!



## Reactive Programming ----


# Reactive programming이란, user가 무언가 input을 하면, 그것에 "react"하는 것입니다.
# 예시로, 버튼을 누르면 화면에 표시된 숫자가 +1이 되도록 앱을 만들겠습니다.


# Creating a reactive counter app

# server부분에 어떤 logic이 포함되어있어야할지 먼저 생각해봅니다.
# 1. Counter (+1이 저장되는 값 (0으로 시작))
# 2. Increment (버튼을 누르면 +1이 되도록 하는 부분)
# 3. Output Value (버튼을 눌렀을 때 표시될 값)

# Define server logic
server <- function(input, output) {
  # Create a reactive value to store the counter
  counter <- reactiveVal(0)
  
  # Increment the counter on button click
  observeEvent(input$increment, {
    counter(counter() + 1)
  })
  
  # Display the counter value
  output$counterValue <- renderText({
    counter()
  })
}

# 이제 UI 부분에 어떤 부분이 포함되어야 할까요?
# 1. (optional) titlePanel (페이지의 제목)
# 2. Button (유저가 클릭할 버튼)
# 3. Output (화면에 표시될 값)

# 여기서 각 UI 요소가 server의 어떤 요소와 연결될지 생각해보고 빈칸을 체우세요.

# Define UI
ui <- fluidPage(
  titlePanel("Reactive Counter"),
  mainPanel(
    actionButton("increment", "Increment"),
    textOutput("counterValue")
  )
)

# Run the application
shinyApp(ui = ui, server = server)

## Input and Output Widgets ----

# 이제 input과 output이 표시되는 창을 가진 앱을 만들어보겠습니다.

# Creating an app with input and output widgets

# 여기서 사용할 수 있는 것은 reactive()라는 함수로, userInput이 들어갈 자리를 만들어줍니다.
# renderText()를 이용해 output을 화면에 표시해 줄수 있습니다.

# Define server logic
server <- function(input, output) {
  # Get user input from a text input widget
  userText <- reactive({
    input$userInput
  })
  
  # Output the user input in a text output widget
  output$userOutput <- renderText({
    userText()
  })
}

##### Exercise: 위의 요소들을 활용해 앱 생성 ----

# Define UI
ui <- fluidPage(
  titlePanel("Input and Output Widgets"),
  mainPanel(
    textInput("userInput", "Enter Text:"),
    textOutput("userOutput")
  )
)

# Run the application
shinyApp(ui = ui, server = server)

## Layout and Styling ----

##### Exercise: numeric input을 받아서 그 값을 제곱한 output을 만들 server logic을 정의 후 UI 생성 ----

# Define server logic for the styled layout app
server <- function(input, output) {
  # Get user input from a numeric input widget
  userNumber <- reactive({
    input$userNumber
  })
  
  # Output the square of the user input in a text output widget
  output$squaredNumber <- renderText({
    userNumber()^2
  })
}



# Define UI for the styled layout app
ui <- fluidPage(
  titlePanel("Styled Layout"),
  sidebarLayout(
    sidebarPanel(
      numericInput("userNumber", "Enter a Number:", value = 0)
    ),
    mainPanel(
      h3("Squared Number:"),
      textOutput("squaredNumber")
    )
  )
)

# Run the application
shinyApp(ui = ui, server = server)






# Mini Project: Salaries Dashboard

## Step 1: Data Preparation

# Load the salaries dataset
salaries <- read.csv("C:/Users/ADMIN/OneDrive/tmp/r-basics/data/Salaries.csv", header = TRUE)

salaries <- salaries %>%
  mutate_if(is.character, as.factor)

## Step 2: Dashboard Setup

# Load required libraries
library(shiny)
library(dplyr)
library(ggplot2)

# Define UI for the salaries dashboard
ui <- fluidPage(
  titlePanel("Salaries Dashboard"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("rank", "Select Rank:", choices = c("All", levels(salaries$rank))),
      selectInput("sex", "Select Sex:", choices = c("All", levels(salaries$sex))),
      numericInput("years", "Select Years of Service:", value = 0)
    ),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Summary", 
                 verbatimTextOutput("summaryOutput")),
        
        tabPanel("Histogram", 
                 plotOutput("histogramPlot"))
      )
    )
  )
)

## Step 3: Server Logic

# Define server logic for the salaries dashboard
server <- function(input, output) {
  
  # Create a reactive subset of data based on user input
  filteredData <- reactive({
    data <- salaries
    if (input$rank != "All") {
      data <- data[data$rank == input$rank, ]
    }
    if (input$sex != "All") {
      data <- data[data$sex == input$sex, ]
    }
    if (!is.null(input$years)) {
      data <- data[data$yrs.service >= input$years, ]
    }
    data
  })
  
  # Generate summary statistics based on filtered data
  output$summaryOutput <- renderPrint({
    summary(filteredData())
  })
  
  # Generate histogram plot based on filtered data
  output$histogramPlot <- renderPlot({
    ggplot(filteredData(), aes(x = salary)) +
      geom_histogram(fill = "steelblue", bins = 20) +
      labs(title = "Salary Distribution", x = "Salary", y = "Frequency")
  })
}

## Step 4: Run the Dashboard

# Run the Shiny application
shinyApp(ui = ui, server = server)

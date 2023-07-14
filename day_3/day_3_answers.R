# R Course Day 3 ----

## Load data  ----


library(dplyr)

df <- read.csv("Salaries.csv", stringsAsFactors = TRUE)
df %>% as_tibble()


## Linear regression ----

### Prepare data ----


colnames(df)

df <- lapply(df, function(x) if(is.factor(x)) as.numeric(x) - 1 else x) %>% data.frame()

### Regression ----


l1 <- lm(salary ~ ., data = df)
summary(l1)



### Publish results ----


library(stargazer)

stargazer(l1, type = "html", out = "l1.html")


## Making predictions ----

### Split train and test data ----


set.seed(42)
which_train <- sample(1:219, size = 131, replace = FALSE)

training <- df %>%
  slice(which_train)
testing <- df %>%
  slice(-which_train)


### Fit model ----



l2 <- lm(salary ~ ., data = training)
summary(l2)


### Evaluate model ----


testing1 <- testing %>%
  mutate(yhats = predict(l2, newdata = testing)) %>%
  mutate(residuals = salary - yhats)



# "Cross-validation correlation": the correlation between the predictions and the actual values.


testing1 %>%
  summarize(cor = cor(rank, yhats))

testing1 %>%
  summarize(cor = cor(rank, yhats)) %>%
  mutate(R2 = cor^2, shrinkage = summary(l2)$r.squared - R2)



library(ggplot2)
ggplot(testing1, aes(x = yhats, y = residuals)) +
  geom_point() +
  geom_smooth(se = FALSE)


# Plot을 봤을 때, residuals가 0을 중심으로 랜덤하게 분포되어 있으면 좋은 모델이라고 할 수 있습니다.
# 하지만 위 plot은 그렇지 않기 때문에 모델이 적절하지 않다고 해석할 수 있습니다.


testing1 %>%
  summarize(mean(residuals), sd(residuals))

sd(residuals(l2))


# Residuals의 standard deviation이 test data와 비슷한 것을 확인할 수 있습니다.
# 이는 모델이 어느정도는 적합하다는 것을 의미합니다.

### Model assumptions

# 모델이 적절한지 다시 생각해보기 위해, 각 변수를 살펴보겠습니다.


df %>% as_tibble()


# 저번 시간에 확인한대로, yrs.since.phd와 yrs.service는 서로 상관관계가 높기 때문에, 하나의 변수만 포함해보겠습니다.



l3 <- lm(salary ~ rank + discipline + yrs.service + sex, data = training)

testing2 <- testing %>%
  mutate(yhats = predict(l3, newdata = testing)) %>%
  mutate(residuals = salary - yhats)

testing2 %>%
  summarize(cor = cor(rank, yhats)) %>%
  mutate(R2 = cor^2, shrinkage = summary(l3)$r.squared - R2)

ggplot(testing2, aes(x = yhats, y = residuals)) +
  geom_point() +
  geom_smooth(se = FALSE)

testing2 %>%
  summarize(mean(residuals), sd(residuals))

sd(residuals(l3))


# 위 결과를 보면, 모델이 더 적절해졌다는 것을 알 수 있습니다.
# 더 확실히 비교하기 위해 likelihood ratio test를 해보겠습니다.
# Likelihood ratio test (LRT)는 두 모델의 likelihood를 비교하여, 두 모델이 유의미하게 다른지를 확인하는 방법입니다.


library(lmtest)
lrtest(l2, l3)


# LRT를 진행해봤을 때, p-value가 0.05보다 작기 때문에, 두 모델이 유의미하게 다르다고 할 수 있습니다.
# 즉, l3 모델이 l2 모델보다 더 적절하다고 할 수 있습니다.



## Cross-Validation ----

library(caret)

# Perform k-fold cross-validation
cv <- trainControl(method = "cv", number = 10)  # 10-fold cross-validation
model <- train(salary ~ ., data = training, method = "lm", trControl = cv)

# Evaluate the model's performance
print(model)


## Model Selection and Regularization ----


library(leaps)

# Perform stepwise model selection using AIC
step_model <- regsubsets(salary ~ ., data = training, method = "exhaustive", nvmax = ncol(training) - 1)
summary(step_model)

library(glmnet)
# Perform LASSO regression
lasso_model <- glmnet(x = model.matrix(salary ~ ., data = training), y = training$salary, alpha = 1)
plot(lasso_model)



##### Exercises ----


# Load the "mtcars" dataset
data(mtcars)

# Perform exploratory data analysis
head(mtcars)
summary(mtcars)

# Split the dataset into a training set and a test set
set.seed(123)
train_index <- sample(1:nrow(mtcars), 0.7 * nrow(mtcars))
train_data <- mtcars[train_index, ]
test_data <- mtcars[-train_index, ]

# Fit a linear regression model
lm_model <- lm(mpg ~ ., data = train_data)

# Evaluate the model's performance
predictions <- predict(lm_model, newdata = test_data)
r_squared <- summary(lm_model)$r.squared
rmse <- sqrt(mean((test_data$mpg - predictions)^2))

# Interpret the coefficients
coefficients <- coef(lm_model)

# Print the results
print("Linear Regression Model")
print(paste("R-squared:", r_squared))
print(paste("RMSE:", rmse))
print("Coefficients:")
print(coefficients)




# Load the "Boston" dataset
library(MASS)
data(Boston)

# Perform exploratory data analysis
head(Boston)
summary(Boston)

# Split the dataset into a training set and a test set
set.seed(123)
train_index <- sample(1:nrow(Boston), 0.7 * nrow(Boston))
train_data <- Boston[train_index, ]
test_data <- Boston[-train_index, ]

# Fit a LASSO regression model
library(glmnet)
lasso_model <- glmnet(as.matrix(train_data[, -14]), train_data$medv, family = "gaussian", alpha = 1)

# Evaluate the LASSO model's performance
predictions_lasso <- predict(lasso_model, newx = as.matrix(test_data[, -14]))
r_squared_lasso <- cor(predictions_lasso, test_data$medv)^2
rmse_lasso <- sqrt(mean((test_data$medv - predictions_lasso)^2))

# Fit a Ridge regression model
ridge_model <- glmnet(as.matrix(train_data[, -14]), train_data$medv, family = "gaussian", alpha = 0)

# Evaluate the Ridge model's performance
predictions_ridge <- predict(ridge_model, newx = as.matrix(test_data[, -14]))
r_squared_ridge <- cor(predictions_ridge, test_data$medv)^2
rmse_ridge <- sqrt(mean((test_data$medv - predictions_ridge)^2))

# Print the results
print("LASSO Regression Model")
print(paste("R-squared:", r_squared_lasso))
print(paste("RMSE:", rmse_lasso))

print("Ridge Regression Model")
print(paste("R-squared:", r_squared_ridge))
print(paste("RMSE:", rmse_ridge))

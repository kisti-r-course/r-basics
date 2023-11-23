# R Course Day 3 ----

## Load data  ----


library(dplyr)




## Linear regression ----

### Prepare data ----


colnames(df)






### Regression ----



### Publish results ----


library(stargazer)




## Making predictions ----

### Split train and test data ----


set.seed(42)







### Fit model ----








### Evaluate model ----









# "Cross-validation correlation": the correlation between the predictions and the actual values.











library(ggplot2)






# Plot을 봤을 때, residuals가 0을 중심으로 랜덤하게 분포되어 있으면 좋은 모델이라고 할 수 있습니다.
# 하지만 위 plot은 그렇지 않기 때문에 모델이 적절하지 않다고 해석할 수 있습니다.









# Residuals의 standard deviation이 test data와 비슷한 것을 확인할 수 있습니다.
# 이는 모델이 어느정도는 적합하다는 것을 의미합니다.

### Model assumptions

# 모델이 적절한지 다시 생각해보기 위해, 각 변수를 살펴보겠습니다.


df %>% as_tibble()


# 저번 시간에 확인한대로, yrs.since.phd와 yrs.service는 서로 상관관계가 높기 때문에, 하나의 변수만 포함해보겠습니다.























# 위 결과를 보면, 모델이 더 적절해졌다는 것을 알 수 있습니다.
# 더 확실히 비교하기 위해 likelihood ratio test를 해보겠습니다.
# Likelihood ratio test (LRT)는 두 모델의 likelihood를 비교하여, 두 모델이 유의미하게 다른지를 확인하는 방법입니다.






# LRT를 진행해봤을 때, p-value가 0.05보다 작기 때문에, 두 모델이 유의미하게 다르다고 할 수 있습니다.
# 즉, l3 모델이 l2 모델보다 더 적절하다고 할 수 있습니다.



## Cross-Validation ----

library(caret)

# Perform k-fold cross-validation



# Evaluate the model's performance



## Model Selection and Regularization ----



# Perform stepwise model selection using AIC
library(leaps)




# Perform LASSO regression






##### Exercises ----

# Load the "mtcars" dataset
data(mtcars)

# Perform exploratory data analysis



# Split the dataset into a training set and a test set
set.seed(123)






# Fit a linear regression model


# Evaluate the model's performance





# Interpret the coefficients


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



# Split the dataset into a training set and a test set
set.seed(123)






# Fit a LASSO regression model
library(glmnet)


# Evaluate the LASSO model's performance






# Fit a Ridge regression model


# Evaluate the Ridge model's performance






# Print the results
print("LASSO Regression Model")
print(paste("R-squared:", r_squared_lasso))
print(paste("RMSE:", rmse_lasso))

print("Ridge Regression Model")
print(paste("R-squared:", r_squared_ridge))
print(paste("RMSE:", rmse_ridge))

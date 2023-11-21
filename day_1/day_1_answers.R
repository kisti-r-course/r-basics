# R Basics ----

# R은 코드 한줄을 실행하면 그것이 print됩니다.


# 이것은 주석입니다
2 + 3 # 5

print("Hello world!")

print(2 + 3)

print(paste("2 더하기 3은", 2 + 3))


# 주석을 다는것을 생활화합시다!
# 코드가 길어질 수록 메모를 해두는 것이 좋고, 만약 타인이 코드를 읽어야할 경우 이해에 도움이 됩니다.

# 사용 예시:

num = as.integer(readline(prompt="Enter a number: ")) # num이라는 variable을 user input으로 설정

if ((num %% 2) == 0) { # num을 2로 나누었을 때 나머지가 0인 경우
        print(paste(num,"is Even")) # num이 짝수라고 출력
    } else { # 그외의 경우에는
        print(paste(num,"is Odd")) # num이 홀수라고 출력
    }



# 위와 같이 한줄마다 주석을 다는 것은 추천하지 않습니다.
# 주석은 필요할 때, 이해를 도울 수 있는 정보를 포함시킬 목적으로 사용하는 것이 좋습니다.

# 사용 예시 #2

num = as.integer(readline(prompt="Enter a number: ")) # num이라는 variable을 user input으로 설정

if ((num %% 2) == 0) {
        print(paste(num,"is Even"))
    } else {
        print(paste(num,"is Odd"))
        # print(paste("나머지 값:", num %% 2))
    }



# 위와 같이 사용하지 않지만 보존하고 싶은 코드도 주석으로 처리할 수 있습니다. rstudio에서 주석처리 단축키 (윈도우): ctrl + shift + c

## Working directory ----

# Working directory란, 코드가 실행될 컴퓨터 내의 위치라고 생각하면 됩니다.
# getwd()로 현태 working directory를 알 수 있고, setwd()로 working directory를 변경할 수 있습니다.
# 원하시는 폴더의 path를 setwd()에 아래와 비슷한 형식으로 수정해주세요.

getwd()
setwd("/path/to/my/directory")

## Data types, operators, variables, functions ----

# Numeric


class(24)
class(0.4)


# Characters

class('Hello')
class('24')

# Logical (Boolean)

class(TRUE)
class(F)
class('FALSE')


### Numeric operators ----
# 
# 아래의 코드를 실행해보며 값이 어떻게 나오는지 확인해봅시다.

1 + 2
3 - 5
2 * 3
2 / 4
2 ^ 5

(1 + 3) / 8
(2 + 4) ^ 3

(((2 + 4) ^ 5) / log(4)) * sin(10)

1:3
4:10


# ":"는 앞의 숫자부터 뒤의 숫자까지의 range를 출력할 수 있습니다.
# 사칙연산을 할 경우 괄호의 위치를 확인하는 것이 중요합니다!

# 그렇다면 숫자가 아닌 character를 사용해보면 어떻게 나오는지 확인해봅시다.

"2" + "3"

# 따옴표는 numeric을 character로 변형해버리기 때문에 에러가 발생합니다.

### Variables ----

# R에서는 "<-"와 같은 화살표를 통해서 변수에 값이나 함수를 넣어서 보관할 수 있습니다.
# 변수들은 따옴표가 없는 string을 사용합니다.
# Variable의 이름은 명확하고 간단하게끔 하는 것이 좋습니다.

# 많이 사용되는 방식은 두가지로, 어떤 방식이든 여러 방식을 왔다갔다 하지 않고 한가지를 꾸준히 사용하는 것이 중요합니다.
# **Naming Conventions:**
# - Camel case (e.g. exampleDataFrame)
# - Snake case (e.g. example_data_frame)

number_one <- 1
number_two <- 2

number_one + number_two

sum_of_nums <- 1 + 2
sum_of_nums



### Functions ----

# 함수는 어렵고 길게 써야하는 코드를 간단하게 만들어줄 수 있습니다.
# 예를 들어, 1 + 2 + ... + 99 + 100 를 구하고 싶을 때, sum() 함수와 ":"를 (또는 seq()) 통해 간단하게 합을 구할 수 있습니다.

1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9
sum(1, 2, 3, 4, 5, 6, 7, 8, 9)

seq(1, 100, by = 2)
seq(0, 70, length.out = 8)
seq(100, 5000, by = 100)

# 1에서 100까지의 숫자들의 sum을 구하고 싶으면?
sum(1:100)


##### Exercise ----

# 0에서 1000까지의 숫자 중 5로 끝나는 숫자들의 sum을 구하기


sum(seq(5, 1000, by = 10))



## Data structures and manipulation ----

### Vectors ----

vector_nums <- c(1, 2, 3, 4, 5)
vector_nums
class(vector_nums)

vector_chars <- c("a", "b", "c", "d", "e", "f")
class(vector_chars)

vector_bool <- c(TRUE, FALSE, FALSE, TRUE)
class(vector_bool)

vector_mix <- c(rep("A", 3), seq(1, 10, by =2), TRUE, FALSE)
vector_mix
class(vector_mix)


vector_mix[1]
vector_mix[5]

# "==" : equal

vector_mix == "A"
vector_mix == "TRUE"

# vector_mix에서 "5"만 출력
vector_mix[vector_mix == "5"]

# Tip: which 함수를 사용하면 원하는 값의 위치 출력

which(vector_mix == "5")

### Matrices ----

matrix_chars <- matrix(vector_chars, nrow = 2, ncol = 3)
matrix_chars

matrix_chars[1, 1]

matrix_chars[, 1]

matrix_chars[1, ]

# Tip: which 함수에서 "arr.ind = TRUE"로 설정하면 원하는 값의 위치 출력

which(matrix_chars == "d", arr.ind=TRUE)

### Lists ----

list_mix <- list(vector_nums, vector_chars, vector_bool)
list_mix

list_mix[[1]]

class(list_mix)

class(list_mix[[1]])
class(list_mix[[2]])
class(list_mix[[3]])


# 리스트에서 "d"를 불러오려면?

list_mix[[2]]
list_mix[[2]][4]


##### Exercise ----
# list_mix에서 "TRUE"만 찾아서 출력**





### Dataframe ----


random_mat <- matrix(sample(1:100, 1000, replace = TRUE), nrow = 200)
head(random_mat)

random_df <- data.frame(random_mat)
head(random_df)

colnames(random_df)
rownames(random_df)


##### Exercise ----
# random_df의 column names를 "A", "B", "C", "D", "E"로 지정**

colnames(random_df) <- c("A", "B", "C", "D", "E")

#### "$" Colnames ----

random_df$C == random_df[3]

# Import and manipulate data ----

# 예시 데이터 다운로드

# Download example csv file
download.file("https://rkabacoff.github.io/datavis/Salaries.csv", destfile = "./data/Salaries.csv")

# The 2008-09 nine-month academic salary for Assistant Professors, Associate Professors and Professors in a college in the U.S.

## Read data ----

salaries <- read.csv("./data/Salaries.csv", header = TRUE)

head(salaries)
class(salaries)

nrow(salaries)
ncol(salaries)

str(salaries)


## Summary statistics ----

summary(salaries)



## Missing values ----

any(is.na(salaries))
which(is.na(salaries), arr.ind = TRUE)

# 결측치가 있을 경우: 제거 또는 imputation 실행

# na.omit() function
any(is.na(na.omit(salaries)))

# complete.cases() function
any(is.na(salaries[complete.cases(salaries),]))

# rowSums() function
any(is.na(salaries[rowSums(is.na(salaries)) == 0, ]))

# Tip: rowSums()를 통해 값이 모두 NA인 row만 제거 가능

na_df <- data.frame(col1 = c(sample(1:10, 5, replace = TRUE)), col2 = c(sample(100:500, 5, replace = TRUE)), col2 = c(sample(1:5, 5, replace = TRUE)))
na_df[1, 2] <- NA
na_df[5, 3] <- NA
na_df[3,] <- NA

na_df

# rowSums() function
na_df[rowSums(is.na(na_df)) != ncol(na_df), ]


## dplyr ----

### Install and load packages ----

install.packages("dplyr")
install.packages("missForest")

library(missForest)
library(dplyr)

#### Random NAs ----

salaries <- prodNA(salaries, 0.05)


### The pipe "%>%" ----

head(salaries %>% na.omit())
any(is.na(salaries))

complete_data <- salaries %>% na.omit()
any(is.na(complete_data))

# Tip: tibble을 사용하면 추가적인 정보와 함께 표시

tib_salaries <- salaries %>% as_tibble()
# 또는
# tib_salaries <- as_tibble(salaries)

tib_salaries

### Applying dplyr ----

sal <- salaries %>% select(rank, salary)
head(sal)

##### Exercise ----
# salaries에서 rank, sex, salary만 추출, 결측치가 있는 row 제거, rank가 "Prof"인 row만 남긴 tibble을 "prof_data" variable에 생성**

prof_data <- salaries %>% 
  as_tibble() %>%
  na.omit() %>% 
  select(rank, sex, salary) %>%
  filter(rank == "Prof")

prof_data


### Factors ----

class(prof_data$sex)

prof_data$sex <- factor(prof_data$sex)
prof_data

levels(prof_data$sex) # [1] "Female" "Male" 의 순서는 "Female"이 0, "Male"이 1으로 취급

##### Exercise: salaries의 chr data type을 factor로 수정해서 "df"에 저장**

df <- salaries %>%
            as_tibble() %>%
            na.omit() %>%
            mutate(rank = factor(rank), discipline = factor(discipline), sex = factor(sex))

# 더 간단한 방법: mutate_if로 조건을 사용

df <- salaries %>%
            as_tibble() %>%
            na.omit() %>%
            mutate_if(is.character, as.factor)


# 다른 방법: lapply 사용

df <- lapply(salaries, function(x) {if (is.character(x)) as.factor(x) else x}) %>% data.frame()

summary(df)
str(df)



### group_by() and summarise() ----

df %>% 
    group_by(rank) %>% 
    summarise(mean_salary = mean(salary),
                max_salary = max(salary),
                min_salary = min(salary))


df %>% 
    group_by(sex) %>%
    tally()

df %>% 
    group_by(sex) %>%
    count()


##### Exercise ----
# 분야별로 각 성별의 count를 출력

df %>% 
  group_by(discipline) %>%
  count(sex)


### arrange() ----

df <- df %>% arrange(desc(salary))

write.csv(df, "salaries_preproc.csv", row.names = FALSE)


# apply(), lapply(), sapply() ----

# apply() 함수는 행 또는 열에 함수를 적용할 때 사용할 수 있습니다.


matrix_data <- matrix(1:9, nrow = 3)
apply(matrix_data, 1, sum)  # Apply sum() function to rows
apply(matrix_data, 2, mean)  # Apply mean() function to columns


# lapply() 함수는 리스트에 함수를 적용할 때 사용할 수 있습니다.

list_data <- list(a = 1:3, b = 4:6, c = 7:9)
lapply(list_data, sum)  # Apply sum() function to each element

# sapply() 함수는 리스트에 함수를 적용하고 결과를 벡터로 반환할 때 사용할 수 있습니다.

vector_data <- c(1, 2, 3, 4, 5)
sapply(vector_data, sqrt)  # Apply sqrt() function to each element



### Exercise ----

# Step 1: random matrix 생성
set.seed(123)
my_matrix <- matrix(runif(20), nrow = 5, ncol = 4)
my_matrix

# Step 2: apply()를 사용하여 mean() 적용
col_means <- apply(my_matrix, 2, mean)
col_means

# Step 3: lapply()를 사용하여 sqrt() 적용
sqrt_vals <- lapply(my_matrix, sqrt)
sqrt_vals

# Step 4: sapply()를 사용하여 sum() 적용
row_sums <- sapply(my_matrix, sum)
row_sums

# Step 5: random factor 벡터 생성
categories <- sample(c("A", "B", "C"), size = 20, replace = TRUE)
categories

# Step 6: 결과 확인
print(paste0(1:length(col_means), "번째 열의 평균: ", col_means))
print(paste0(1:length(sqrt_vals), "번째 값의 제곱근: ", sqrt_vals))
print(paste0(1:length(row_sums), "번째 행의 합계: ", row_sums))



# if and for loops ----

x <- 10

# if 문

if (x > 5) {                                   # if 조건이 참이면 실행
  message("x는 5보다 큽니다.")
} else {                                       # if 조건이 거짓이면 실행
  message("x는 5보다 작거나 같습니다.")
}

# for 루프
for (i in 1:5) {
  message("Repeat:", i)                           # 1부터 5까지 반복
}

# for loop를 사용하여 벡터의 제곱 계산

numbers <- c(1, 2, 3, 4, 5)
squared_numbers <- numeric(length(numbers))

for (i in 1:length(numbers)) {
  squared_numbers[i] <- numbers[i] ^ 2
}

squared_numbers


# Creating functions ----

# calculate_average() 함수: 벡터의 평균을 계산하는 함수

calculate_average <- function(x) {
  avg <- sum(x) / length(x)
  return(avg)
}

data <- c(10, 15, 20, 25, 30)
calculate_average(data)  # Call the custom function


#### Exercise: BMI 계산과 데이터 필터링을 위한 함수 생성 ----

# Exercise: Creating a Function to Calculate BMI and Filter Data

patient_data <- read.csv("./data/patient_data.csv", header = TRUE)
head(patient_data)

# Load the dplyr package
library(dplyr)

# Step 1: Create the custom function
calculate_bmi <- function(height, weight) {
  bmi <- weight / (height / 100)^2  # Convert height to meters
  return(bmi)
}

# Step 2: Apply the function to calculate BMI and add it as a new column
patient_data <- patient_data %>%
  mutate(BMI = apply(patient_data[, c("Height", "Weight")], 1, function(x) calculate_bmi(x[1], x[2])))

# Step 3: Filter the dataframe based on BMI greater than 25
filtered_data <- patient_data %>%
  filter(BMI > 25)

# Step 4: Print the filtered dataframe
filtered_data



#### Exercise: BMI 범주를 계산하는 함수 생성 ----

# 하나의 argument를 (BMI 값) 사용하는 calculate_bmi_category라는 함수를 정의해보기

# 함수 내에서 if 문을 사용하여 BMI 값을 기준으로 적절한 BMI 범주 ('Underweight', 'Normal', 'Overweight', 'Obese') 로 assign
# BMI < 18.5: 'Underweight'
# 18.5 <= BMI < 25: 'Normal'
# 25 <= BMI < 30: 'Overweight'
# BMI >= 30: 'Obese'

# for 루프를 사용하여 calculate_bmi_category 함수를 patient_data 데이터 프레임에 적용하고 BMI_Category라는 새 열을 만들어 각 환자에 대해 계산된 BMI 범주를 저장


# Step 1: Load the dplyr library
library(dplyr)

# Step 2: Define the custom function
calculate_bmi_category <- function(bmi) {
  if (bmi < 18.5) {
    category <- 'Underweight'
  } else if (bmi < 25) {
    category <- 'Normal'
  } else if (bmi < 30) {
    category <- 'Overweight'
  } else {
    category <- 'Obese'
  }
  return(category)
}

# Step 3: Apply the function using a for loop
for (i in 1:nrow(patient_data)) {
  bmi <- patient_data$BMI[i]
  patient_data$BMI_Category[i] <- calculate_bmi_category(bmi)
}

# Step 4: View the updated patient_data dataframe
patient_data


#### Exercise: Patient Data를 필터링하고 요약하는 함수 생성 ----


# Exercise: Filtering and Summarizing Patient Data

# Step 1: Filter the dataframe to select patients above 40 years old
filtered_data <- patient_data %>%
  filter(Age > 40)

# Step 2: Calculate the average height and weight for the selected patients
avg_height <- mean(filtered_data$Height)
avg_weight <- mean(filtered_data$Weight)

# Step 3: Print the summary statistics of the filtered data
summary_stats <- filtered_data %>%
  summarise(
    Count = n(),
    Mean_Height = mean(Height),
    Mean_Weight = mean(Weight),
    Min_Height = min(Height),
    Max_Height = max(Height),
    Min_Weight = min(Weight),
    Max_Weight = max(Weight)
  )

summary_stats



# Project ----

# 데이터 imputation, 필터링, summary statistics

# Load required libraries
library(dplyr)

# Step 1: Read the CSV file and view the dataset
train_df <- read.csv("./data/train.csv", header = TRUE)
head(train_df)

# Step 2: Check missing values
sapply(train_df, function(x) sum(is.na(x)))

# Step 3: Exercise - Create a Basic Imputation Function
impute_mean <- function(x) {
  if (any(is.na(x))) {                            # 결측값이 있는 경우에만 실행
    mean_val <- mean(x, na.rm = TRUE)             # 결측값을 제외한 평균값 계산
    x[is.na(x)] <- mean_val                       # 결측값을 평균값으로 대체
  }
  return(x)                                       # x 반환
}

# Step 4: Apply the Imputation Function to Age column
train_df$Age <- impute_mean(train_df$Age)

# Step 5: Check missing values after imputation
sapply(train_df, function(x) sum(is.na(x)))

# Step 6: Outlier detection and normalization function
outlier_norm <- function(x) {
  q1 <- quantile(x, probs = 0.25)                   # x의 1사분위수(Q1) 계산
  q3 <- quantile(x, probs = 0.75)                   # x의 3사분위수(Q3) 계산
  iqr <- q3 - q1                                    # x의 사분위범위(IQR) 계산
  lower_bound <- q1 - 1.5 * iqr                     # 이상치 탐지를 위한 하한값 계산
  upper_bound <- q3 + 1.5 * iqr                     # 이상치 탐지를 위한 상한값 계산
  # 이상치를 하한값 또는 상한값으로 대체
  x[x < lower_bound] <- lower_bound
  x[x > upper_bound] <- upper_bound
  return(x)                                         # 수정된 x 반환
}

# Step 7: Apply outlier detection and normalization to Age column
train_df$Age <- outlier_norm(train_df$Age)

# Step 8: View updated dataset
head(train_df)

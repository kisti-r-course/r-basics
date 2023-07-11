# R Basics ----

# R은 코드 한줄을 실행하면 그것이 print됩니다.


# 이것은 주석입니다









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






# Characters





# Logical (Boolean)







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












### Functions ----

# 함수는 어렵고 길게 써야하는 코드를 간단하게 만들어줄 수 있습니다.
# 예를 들어, 1 + 2 + ... + 99 + 100 를 구하고 싶을 때, sum() 함수와 ":"를 (또는 seq()) 통해 간단하게 합을 구할 수 있습니다.

1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9
sum(1, 2, 3, 4, 5, 6, 7, 8, 9)







# 1에서 100까지의 숫자들의 sum을 구하고 싶으면?




##### Exercise: 0에서 1000까지의 숫자 중 5로 끝나는 숫자들의 sum ----






## Data structures and manipulation ----

### Vectors ----

























# "==" : equal






# vector_mix에서 "5"만 출력


# Tip: which 함수를 사용하면 원하는 값의 위치 출력

which(vector_mix == "5")

### Matrices ----











# Tip: which 함수에서 "arr.ind = TRUE"로 설정하면 원하는 값의 위치 출력




### Lists ----















# 리스트에서 "d"를 불러오려면?






##### Exercise: list_mix에서 "TRUE"만 찾아서 출력 ----





### Dataframe ----














##### Exercise: random_df의 column names를 "A", "B", "C", "D", "E"로 지정 ----

#### "$" Colnames ----




# Import and manipulate data ----

# 예시 데이터 다운로드

# Download example csv file
download.file("https://rkabacoff.github.io/datavis/Salaries.csv", destfile = "Salaries.csv")

# The 2008-09 nine-month academic salary for Assistant Professors, Associate Professors and Professors in a college in the U.S.

## Read data ----












## Summary statistics ----






## Missing values ----





# 결측치가 있을 경우: 제거 또는 imputation 실행

# na.omit() function


# complete.cases() function


# rowSums() function



# Tip: rowSums()를 통해 값이 모두 NA인 row만 제거 가능

na_df <- data.frame(col1 = c(sample(1:10, 5, replace = TRUE)), col2 = c(sample(100:500, 5, replace = TRUE)), col2 = c(sample(1:5, 5, replace = TRUE)))
na_df[1, 2] <- NA
na_df[5, 3] <- NA
na_df[3,] <- NA

na_df

# rowSums() function



## dplyr ----

### Install and load packages ----







### The pipe "%>%" ----










# Tip: tibble을 사용하면 추가적인 정보와 함께 표시

tib_salaries <- salaries %>% as_tibble()
# 또는
# tib_salaries <- as_tibble(salaries)

tib_salaries

### Applying dplyr ----





##### Exercise: salaries에서 rank, sex, salary만 추출, 결측치가 있는 row 제거, rank가 "Prof"인 row만 남긴 tibble을 "prof_data" variable에 생성 ----









### Factors ----






# [1] "Female" "Male" 의 순서는 "Female"이 0, "Male"이 1으로 취급

##### Exercise: salaries의 chr data type을 factor로 수정해서 "df"에 저장 ----








# 더 간단한 방법: mutate_if로 조건을 사용










# 다른 방법: lapply 사용










### group_by() and summarise() ----



















##### Exercise: 분야별로 각 성별의 count를 출력 ----









### arrange() ----







##### Exercise: Patient data summary statistics 출력 ----

# Step 1: Filter the dataframe to select patients above 40 years old



# Step 2: Calculate the average height and weight for the selected patients




# Step 3: Print the summary statistics of the filtered data
summary_stats <- filtered_data %>%
  summarise(
    Count = ,
    Mean_Height = ,
    Mean_Weight = ,
    Min_Height = ,
    Max_Height = ,
    Min_Weight = ,
    Max_Weight = 
  )

summary_stats



## apply(), lapply(), sapply(), tapply() ----

# apply() 함수는 행 또는 열에 함수를 적용할 때 사용할 수 있습니다.



# lapply() 함수는 리스트에 함수를 적용할 때 사용할 수 있습니다.



# sapply() 함수는 리스트에 함수를 적용하고 결과를 벡터로 반환할 때 사용할 수 있습니다.



# tapply() 함수는 벡터에 함수를 적용하고 결과를 벡터로 반환할 때 사용할 수 있습니다.







##### Exercise: apply 함수 활용 ----



# Step 1: random matrix 생성
set.seed(123)
my_matrix <- matrix(runif(20), nrow = 5, ncol = 4)
my_matrix

# Step 2: apply()를 사용하여 mean() 적용




# Step 3: lapply()를 사용하여 length() 적용




# Step 4: sapply()를 사용하여 sum() 적용




# Step 5: random factor 벡터 생성
categories <- sample(c("A", "B", "C"), size = 20, replace = TRUE)
categories

# Step 6: tapply()를 사용하여 table() 적용




# Step 7: 결과 확인
print(paste0("각 열의 평균: ", col_means))
print(paste0("각 열의 길이: ", col_lengths))
print(paste0("각 행의 합계: ", row_sums))
print(paste0("카테고리 별 개수: ", category_counts))



## if and for loops ----

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






## Creating functions ----


# calculate_average() 함수: 벡터의 평균을 계산하는 함수








##### Exercise: BMI 계산과 데이터 필터링 함수 ----

patient_data <- read.csv("./data/patient_data.csv", header = TRUE)

# Step 1: Create the custom function
calculate_bmi <- function(height, weight) {
#
#
}

# Step 2: Apply the function to calculate BMI and add it as a new column





# Step 3: Filter the dataframe based on BMI greater than 25





# Step 4: 결과 출력







##### Exercise: 하나의 argument를 (BMI 값) 사용하는 calculate_bmi_category라는 함수를 정의 ----

# 함수 내에서 if 문을 사용하여 BMI 값을 기준으로 적절한 BMI 범주 ('Underweight', 'Normal', 'Overweight', 'Obese') 로 assign
# BMI < 18.5: 'Underweight'
# 18.5 <= BMI < 25: 'Normal'
# 25 <= BMI < 30: 'Overweight'
# BMI >= 30: 'Obese'

# for 루프를 사용하여 calculate_bmi_category 함수를 patient_data 데이터 프레임에 적용하고 BMI_Category라는 새 열을 만들어 각 환자에 대해 계산된 BMI 범주를 저장


# Step 1: Define the custom function




# Step 2: Apply the function using a for loop





# Step 3: View the updated patient_data dataframe







# Project ----


# 주어진 데이터셋을 사용하여 결측값 대체 및 이상치 탐지

# 1. 필요한 라이브러리 load

# 2. CSV 파일을 읽고 데이터셋을 확인

# 3. 기본적인 결측값 대체 함수 생성
#     결측값을 제외한 평균값을 계산
#     결측값을 평균값으로 대체

# 4. Age 열에 대해 결측값 대체 함수를 적용
#     대체 후 결측값이 있는지 확인

# 5. 이상치 탐지 및 정규화 함수
#     x의 1사분위수(Q1)를 계산
#     x의 3사분위수(Q3)를 계산
#     x의 사분위범위(IQR)를 계산
#     이상치 탐지를 위한 하한값 (lower bound)을 계산
#     이상치 탐지를 위한 상한값 (upper bound)을 계산
#     이상치를 하한값 또는 상한값으로 대체

# 6. Age 열에 이상치 탐지 및 정규화 함수를 적용
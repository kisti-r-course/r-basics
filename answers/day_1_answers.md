R Course DAY 1
================
Seo Yoon Park
July 12, 2023

- [1 R Course Day 1](#1-r-course-day-1)
  - [1.1 R Basics](#11-r-basics)
    - [1.1.1 Working directory](#111-working-directory)
    - [1.1.2 Data types, operators, variables,
      functions](#112-data-types-operators-variables-functions)
      - [1.1.2.1 Numeric operators](#1121-numeric-operators)
      - [1.1.2.2 Variables](#1122-variables)
      - [1.1.2.3 Functions](#1123-functions)
    - [1.1.3 Data structures and
      manipulation](#113-data-structures-and-manipulation)
      - [1.1.3.1 Vectors](#1131-vectors)
      - [1.1.3.2 Matrices](#1132-matrices)
      - [1.1.3.3 Lists](#1133-lists)
      - [1.1.3.4 Dataframe](#1134-dataframe)
  - [1.2 Import and manipulate data](#12-import-and-manipulate-data)
    - [1.2.1 Read data](#121-read-data)
    - [1.2.2 Summary statistics](#122-summary-statistics)
    - [1.2.3 Missing values](#123-missing-values)
    - [1.2.4 dplyr](#124-dplyr)
      - [1.2.4.1 Install and load
        packages](#1241-install-and-load-packages)
      - [1.2.4.2 The pipe “%\>%”](#1242-the-pipe-)
      - [1.2.4.3 Applying dplyr](#1243-applying-dplyr)
      - [1.2.4.4 Factors](#1244-factors)
      - [1.2.4.5 filter(), group_by() and
        summarise()](#1245-filter-group_by-and-summarise)
  - [1.3 apply(), lapply(), sapply(),
    tapply()](#13-apply-lapply-sapply-tapply)
  - [1.4 if and for loops](#14-if-and-for-loops)
  - [1.5 Creating functions](#15-creating-functions)
- [2 Project](#2-project)

# 1 R Course Day 1

------------------------------------------------------------------------

## 1.1 R Basics

R은 코드 한줄을 실행하면 그것이 print됩니다. <br>

``` r
# 이것은 주석입니다
2 + 3 # 5
```

    ## [1] 5

``` r
print("Hello world!")
```

    ## [1] "Hello world!"

``` r
print(2 + 3)
```

    ## [1] 5

``` r
print(paste("2 더하기 3은", 2 + 3))
```

    ## [1] "2 더하기 3은 5"

<br>

주석을 다는것을 생활화합시다! <br> 코드가 길어질 수록 메모를 해두는 것이
좋고, 만약 타인이 코드를 읽어야할 경우 이해에 도움이 됩니다. <br>

사용 예시:

``` r
num = as.integer(readline(prompt="Enter a number: ")) # num이라는 variable을 user input으로 설정

if ((num %% 2) == 0) { # num을 2로 나누었을 때 나머지가 0인 경우
        print(paste(num,"is Even")) # num이 짝수라고 출력
    } else { # 그외의 경우에는
        print(paste(num,"is Odd")) # num이 홀수라고 출력
    }
```

위와 같이 한줄마다 주석을 다는 것은 추천하지 않습니다. <br>

주석은 필요할 때, 이해를 도울 수 있는 정보를 포함시킬 목적으로 사용하는
것이 좋습니다.

<br>

사용 예시 \#2

``` r
num = as.integer(readline(prompt="Enter a number: ")) # num이라는 variable을 user input으로 설정

if ((num %% 2) == 0) {
        print(paste(num,"is Even")) 
    } else {
        print(paste(num,"is Odd"))
        # print(paste("나머지 값:", num %% 2))
    }
```

위와 같이 사용하지 않지만 보존하고 싶은 코드도 주석으로 처리할 수
있습니다. rstudio에서 주석처리 단축키 (윈도우): ctrl + shift + c <br>

### 1.1.1 Working directory

Working directory란, 코드가 실행될 컴퓨터 내의 위치라고 생각하면 됩니다.
<br> getwd()로 현태 working directory를 알 수 있고, setwd()로 working
directory를 변경할 수 있습니다. <br> 원하시는 폴더의 path를 setwd()에
아래와 비슷한 형식으로 수정해주세요.

``` r
getwd()
setwd("/path/to/my/directory")
```

### 1.1.2 Data types, operators, variables, functions

<br>

- Numeric

``` r
class(24)
```

    ## [1] "numeric"

``` r
class(0.4)
```

    ## [1] "numeric"

<br>

- Characters

``` r
class('Hello')
```

    ## [1] "character"

``` r
class('24')
```

    ## [1] "character"

<br>

- Logical (Boolean)

``` r
class(TRUE)
```

    ## [1] "logical"

``` r
class(F)
```

    ## [1] "logical"

``` r
class('FALSE')
```

    ## [1] "character"

#### 1.1.2.1 Numeric operators

아래의 코드를 실행해보며 값이 어떻게 나오는지 확인해봅시다. <br>

``` r
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
```

    ## [1] 3
    ## [1] -2
    ## [1] 6
    ## [1] 0.5
    ## [1] 32
    ## [1] 0.5
    ## [1] 216
    ## [1] -3051.522
    ## [1] 1 2 3
    ## [1]  4  5  6  7  8  9 10
    ....

“:”는 앞의 숫자부터 뒤의 숫자까지의 range를 출력할 수 있습니다. <br>
사칙연산을 할 경우 괄호의 위치를 확인하는 것이 중요합니다! <br> <br>

그렇다면 숫자가 아닌 character를 사용해보면 어떻게 나오는지
확인해봅시다.

``` r
# "2" + "3"
```

따옴표는 numeric을 charater로 변형해버리기 때문에 에러가 발생합니다.

------------------------------------------------------------------------

##### Addition, Subtraction, Multiplication, and Division

| Math       | `R`     | Result |
|:-----------|:--------|:-------|
| $3 + 2$    | `3 + 2` | 5      |
| $3 - 2$    | `3 - 2` | 1      |
| $3 \cdot2$ | `3 * 2` | 6      |
| $3 / 2$    | `3 / 2` | 1.5    |

##### Exponents

| Math         | `R`             | Result |
|:-------------|:----------------|:-------|
| $3^2$        | `3 ^ 2`         | 9      |
| $2^{(-3)}$   | `2 ^ (-3)`      | 0.125  |
| $100^{1/2}$  | `100 ^ (1 / 2)` | 10     |
| $\sqrt{100}$ | `sqrt(100)`     | 10     |

##### Mathematical Constants

| Math  | `R`      | Result    |
|:------|:---------|:----------|
| $\pi$ | `pi`     | 3.1415927 |
| $e$   | `exp(1)` | 2.7182818 |

##### Logarithms

주의: log()는 natural logarithm을 뜻함

| Math              | `R`                 | Result |
|:------------------|:--------------------|:-------|
| $\log(e)$         | `log(exp(1))`       | 1      |
| $\log_{10}(1000)$ | `log10(1000)`       | 3      |
| $\log_{2}(8)$     | `log2(8)`           | 3      |
| $\log_{4}(16)$    | `log(16, base = 4)` | 2      |

##### Trigonometry

| Math            | `R`           | Result |
|:----------------|:--------------|:-------|
| $\sin(\pi / 2)$ | `sin(pi / 2)` | 1      |
| $\cos(0)$       | `cos(0)`      | 1      |

------------------------------------------------------------------------

#### 1.1.2.2 Variables

R에서는 “\<-”와 같은 화살표를 통해서 변수에 값이나 함수를 넣어서 보관할
수 있습니다. <br> 변수들은 따옴표가 없는 string을 사용합니다. <br>
Variable의 이름은 명확하고 간단하게끔 하는 것이 좋습니다. <br>

많이 사용되는 방식은 두가지로, 어떤 방식이든 여러 방식을 왔다갔다 하지
않고 한가지를 꾸준히 사용하는 것이 중요합니다. <br> **Naming
Conventions:** - Camel case (e.g. exampleDataFrame) - Snake case
(e.g. example_data_frame)

``` r
number_one <- 1
number_two <- 2

number_one + number_two
```

    ## [1] 3

``` r
sum_of_nums <- 1 + 2
sum_of_nums
```

    ## [1] 3

#### 1.1.2.3 Functions

함수는 어렵고 길게 써야하는 코드를 간단하게 만들어줄 수 있습니다. <br>
예를 들어, 1 + 2 + … + 99 + 100 를 구하고 싶을 때, sum() 함수와 “:”를
(또는 seq()) 통해 간단하게 합을 구할 수 있습니다.

``` r
1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9
```

    ## [1] 45

``` r
sum(1, 2, 3, 4, 5, 6, 7, 8, 9)
```

    ## [1] 45

``` r
seq(1, 100, by = 2)
```

    ##  [1]  1  3  5  7  9 11 13 15 17 19 21 23 25 27 29 31 33 35 37 39 41 43 45 47 49
    ## [26] 51 53 55 57 59 61 63 65 67 69 71 73 75 77 79 81 83 85 87 89 91 93 95 97 99

``` r
seq(0, 70, length.out = 8)
```

    ## [1]  0 10 20 30 40 50 60 70

``` r
seq(100, 5000, by = 100)
```

    ##  [1]  100  200  300  400  500  600  700  800  900 1000 1100 1200 1300 1400 1500
    ## [16] 1600 1700 1800 1900 2000 2100 2200 2300 2400 2500 2600 2700 2800 2900 3000
    ## [31] 3100 3200 3300 3400 3500 3600 3700 3800 3900 4000 4100 4200 4300 4400 4500
    ## [46] 4600 4700 4800 4900 5000

``` r
# 1에서 100까지의 숫자들의 sum을 구하고 싶으면?
sum(1:100)
```

    ## [1] 5050

<br>

**Exercise: 0에서 1000까지의 숫자 중 5로 끝나는 숫자들의 sum을 구하기**

``` r
sum(seq(5, 1000, by = 10))
```

    ## [1] 50000

### 1.1.3 Data structures and manipulation

------------------------------------------------------------------------

#### 1.1.3.1 Vectors

``` r
vector_nums <- c(1, 2, 3, 4, 5)
vector_nums
```

    ## [1] 1 2 3 4 5

``` r
class(vector_nums)
```

    ## [1] "numeric"

``` r
vector_chars <- c("a", "b", "c", "d", "e", "f")
class(vector_chars)
```

    ## [1] "character"

``` r
vector_bool <- c(TRUE, FALSE, FALSE, TRUE)
class(vector_bool)
```

    ## [1] "logical"

``` r
vector_mix <- c(rep("A", 3), seq(1, 10, by =2), TRUE, FALSE)
vector_mix
```

    ##  [1] "A"     "A"     "A"     "1"     "3"     "5"     "7"     "9"     "TRUE" 
    ## [10] "FALSE"

``` r
class(vector_mix)
```

    ## [1] "character"

``` r
vector_mix[1]
```

    ## [1] "A"

``` r
vector_mix[5]
```

    ## [1] "3"

“==” : equal <br>

``` r
vector_mix == "A"
```

    ##  [1]  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE

``` r
vector_mix == "TRUE"
```

    ##  [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE

``` r
# vector_mix에서 "5"만 출력
vector_mix[vector_mix == "5"]
```

    ## [1] "5"

<br>

{#Tip_1 .message style=“color: blue;”} **Tip: which 함수를 사용하면
원하는 값의 위치 출력**

``` r
which(vector_mix == "5")
```

    ## [1] 6

------------------------------------------------------------------------

#### 1.1.3.2 Matrices

``` r
matrix_chars <- matrix(vector_chars, nrow = 2, ncol = 3)
matrix_chars
```

    ##      [,1] [,2] [,3]
    ## [1,] "a"  "c"  "e" 
    ## [2,] "b"  "d"  "f"

``` r
matrix_chars[1, 1]
```

    ## [1] "a"

|       |     |     |
|:------|:----|:----|
| **a** | c   | e   |
| b     | d   | f   |

``` r
matrix_chars[, 1]
```

    ## [1] "a" "b"

|       |     |     |
|:------|:----|:----|
| **a** | c   | e   |
| **b** | d   | f   |

``` r
matrix_chars[1, ]
```

    ## [1] "a" "c" "e"

|       |       |       |
|:------|:------|:------|
| **a** | **c** | **e** |
| b     | d     | f     |

<br>

{#Tip_2 .message style=“color: blue;”} **Tip: which 함수에서 “arr.ind =
TRUE”로 설정하면 원하는 값의 위치 출력**

``` r
which(matrix_chars == "d", arr.ind=TRUE)
```

    ##      row col
    ## [1,]   2   2

------------------------------------------------------------------------

#### 1.1.3.3 Lists

``` r
list_mix <- list(vector_nums, vector_chars, vector_bool)
list_mix
```

    ## [[1]]
    ## [1] 1 2 3 4 5
    ## 
    ## [[2]]
    ## [1] "a" "b" "c" "d" "e" "f"
    ## 
    ## [[3]]
    ## [1]  TRUE FALSE FALSE  TRUE

``` r
list_mix[[1]]
```

    ## [1] 1 2 3 4 5

``` r
class(list_mix)
```

    ## [1] "list"

``` r
class(list_mix[[1]])
```

    ## [1] "numeric"

``` r
class(list_mix[[2]])
```

    ## [1] "character"

``` r
class(list_mix[[3]])
```

    ## [1] "logical"

``` r
# 리스트에서 "d"를 불러오려면?

list_mix[[2]]
list_mix[[2]][4]
```

    ## [1] "a" "b" "c" "d" "e" "f"
    ## [1] "d"

<br>

**Exercise: list_mix에서 “TRUE”만 찾아서 출력**

``` r
list_mix[[1]][list_mix[[1]] == 3]
```

    ## [1] 3

------------------------------------------------------------------------

#### 1.1.3.4 Dataframe

``` r
random_mat <- matrix(sample(1:100, 1000, replace = TRUE), nrow = 200)
head(random_mat)
```

    ##      [,1] [,2] [,3] [,4] [,5]
    ## [1,]   23   17   48   46   52
    ## [2,]   20   81   33   49   22
    ## [3,]   43    3   73   89    9
    ## [4,]   23   22   47   40   37
    ## [5,]   80   82   69   90   29
    ## [6,]   82   52   79   29   51

``` r
random_df <- data.frame(random_mat)
head(random_df)
```

    ##   X1 X2 X3 X4 X5
    ## 1 23 17 48 46 52
    ## 2 20 81 33 49 22
    ## 3 43  3 73 89  9
    ## 4 23 22 47 40 37
    ## 5 80 82 69 90 29
    ## 6 82 52 79 29 51

``` r
colnames(random_df)
```

    ## [1] "X1" "X2" "X3" "X4" "X5"

``` r
rownames(random_df)
```

    ##   [1] "1"   "2"   "3"   "4"   "5"   "6"   "7"   "8"   "9"   "10"  "11"  "12" 
    ##  [13] "13"  "14"  "15"  "16"  "17"  "18"  "19"  "20"  "21"  "22"  "23"  "24" 
    ##  [25] "25"  "26"  "27"  "28"  "29"  "30"  "31"  "32"  "33"  "34"  "35"  "36" 
    ##  [37] "37"  "38"  "39"  "40"  "41"  "42"  "43"  "44"  "45"  "46"  "47"  "48" 
    ##  [49] "49"  "50"  "51"  "52"  "53"  "54"  "55"  "56"  "57"  "58"  "59"  "60" 
    ##  [61] "61"  "62"  "63"  "64"  "65"  "66"  "67"  "68"  "69"  "70"  "71"  "72" 
    ##  [73] "73"  "74"  "75"  "76"  "77"  "78"  "79"  "80"  "81"  "82"  "83"  "84" 
    ##  [85] "85"  "86"  "87"  "88"  "89"  "90"  "91"  "92"  "93"  "94"  "95"  "96" 
    ##  [97] "97"  "98"  "99"  "100" "101" "102" "103" "104" "105" "106" "107" "108"
    ## [109] "109" "110" "111" "112" "113" "114" "115" "116" "117" "118" "119" "120"
    ....

<br>

**Exercise: random_df의 column names를 “A”, “B”, “C”, “D”, “E”로 지정**

``` r
colnames(random_df) <- c("A", "B", "C", "D", "E")
head(random_df)
```

    ##    A  B  C  D  E
    ## 1 23 17 48 46 52
    ## 2 20 81 33 49 22
    ## 3 43  3 73 89  9
    ## 4 23 22 47 40 37
    ## 5 80 82 69 90 29
    ## 6 82 52 79 29 51

##### 1.1.3.4.1 “\$” Colnames

``` r
random_df$C
```

    ##   [1]  48  33  73  47  69  79   5  47  92  44  97  90  73  16  24  30  70  39
    ##  [19]  63  28  19  44  77  43  30  91  65  26  81  30  34  60  69   6  29  97
    ##  [37]   1  34  93  23  62  76   9  70  76  82  23  81  22  16  96  70 100  78
    ##  [55]  29  29  72   1 100  13  26  18  19  97  79  53  14  77  96  91  31   5
    ##  [73]  92  85  17  35  73  61   4  56  80  57  93  45  62  74  24  35   2  13
    ##  [91]  83  37  28  60  59  13  81  46  76  13  30  90  26  50  18  99  35  29
    ## [109]   9  53  37  26  60   7  96  64  75  15  28  12  55  72 100   2  87  65
    ## [127]  79  84  80  43   4  71   8  51  81  49  31  34  70  37  60  69  99  84
    ## [145]  30  18  95  49   9  37   8  29   5  58  91  19  85  73  33  98  64  35
    ## [163]  18  21  33   4  84  96  62  67  15  89  53  40  66  52  17  23  76  22
    ....

``` r
random_df[3]
```

    ##       C
    ## 1    48
    ## 2    33
    ## 3    73
    ## 4    47
    ## 5    69
    ## 6    79
    ## 7     5
    ## 8    47
    ## 9    92
    ....

``` r
random_df[, 3]
```

    ##   [1]  48  33  73  47  69  79   5  47  92  44  97  90  73  16  24  30  70  39
    ##  [19]  63  28  19  44  77  43  30  91  65  26  81  30  34  60  69   6  29  97
    ##  [37]   1  34  93  23  62  76   9  70  76  82  23  81  22  16  96  70 100  78
    ##  [55]  29  29  72   1 100  13  26  18  19  97  79  53  14  77  96  91  31   5
    ##  [73]  92  85  17  35  73  61   4  56  80  57  93  45  62  74  24  35   2  13
    ##  [91]  83  37  28  60  59  13  81  46  76  13  30  90  26  50  18  99  35  29
    ## [109]   9  53  37  26  60   7  96  64  75  15  28  12  55  72 100   2  87  65
    ## [127]  79  84  80  43   4  71   8  51  81  49  31  34  70  37  60  69  99  84
    ## [145]  30  18  95  49   9  37   8  29   5  58  91  19  85  73  33  98  64  35
    ## [163]  18  21  33   4  84  96  62  67  15  89  53  40  66  52  17  23  76  22
    ....

``` r
any(random_df$C != random_df[, 3])
```

    ## [1] FALSE

## 1.2 Import and manipulate data

예시 데이터 다운로드

``` r
# Download example csv file
download.file("https://rkabacoff.github.io/datavis/Salaries.csv", destfile = "./data/Salaries.csv")
```

The 2008-09 nine-month academic salary for Assistant Professors,
Associate Professors and Professors in a college in the U.S.

------------------------------------------------------------------------

### 1.2.1 Read data

``` r
salaries <- read.csv("./data/Salaries.csv", header = TRUE)

head(salaries)
```

    ##        rank discipline yrs.since.phd yrs.service  sex salary
    ## 1      Prof          B            19          18 Male 139750
    ## 2      Prof          B            20          16 Male 173200
    ## 3  AsstProf          B             4           3 Male  79750
    ## 4      Prof          B            45          39 Male 115000
    ## 5      Prof          B            40          41 Male 141500
    ## 6 AssocProf          B             6           6 Male  97000

``` r
class(salaries)
```

    ## [1] "data.frame"

``` r
nrow(salaries)
```

    ## [1] 397

``` r
ncol(salaries)
```

    ## [1] 6

``` r
str(salaries)
```

    ## 'data.frame':    397 obs. of  6 variables:
    ##  $ rank         : chr  "Prof" "Prof" "AsstProf" "Prof" ...
    ##  $ discipline   : chr  "B" "B" "B" "B" ...
    ##  $ yrs.since.phd: int  19 20 4 45 40 6 30 45 21 18 ...
    ##  $ yrs.service  : int  18 16 3 39 41 6 23 45 20 18 ...
    ##  $ sex          : chr  "Male" "Male" "Male" "Male" ...
    ##  $ salary       : int  139750 173200 79750 115000 141500 97000 175000 147765 119250 129000 ...

### 1.2.2 Summary statistics

``` r
summary(salaries)
```

    ##      rank            discipline        yrs.since.phd    yrs.service   
    ##  Length:397         Length:397         Min.   : 1.00   Min.   : 0.00  
    ##  Class :character   Class :character   1st Qu.:12.00   1st Qu.: 7.00  
    ##  Mode  :character   Mode  :character   Median :21.00   Median :16.00  
    ##                                        Mean   :22.31   Mean   :17.61  
    ##                                        3rd Qu.:32.00   3rd Qu.:27.00  
    ##                                        Max.   :56.00   Max.   :60.00  
    ##      sex                salary      
    ##  Length:397         Min.   : 57800  
    ##  Class :character   1st Qu.: 91000  
    ....

### 1.2.3 Missing values

``` r
any(is.na(salaries))
```

    ## [1] FALSE

``` r
which(is.na(salaries), arr.ind = TRUE)
```

    ##      row col

결측치가 있을 경우: 제거 또는 imputation 실행 <br>

``` r
# na.omit() function
any(is.na(na.omit(salaries)))
```

    ## [1] FALSE

``` r
# complete.cases() function
any(is.na(salaries[complete.cases(salaries),]))
```

    ## [1] FALSE

``` r
# rowSums() function
any(is.na(salaries[rowSums(is.na(salaries)) == 0, ]))
```

    ## [1] FALSE

<br>

**rowSums()를 통해 값이 모두 NA인 row만 제거 가능**

``` r
na_df <- data.frame(col1 = c(sample(1:10, 5, replace = TRUE)), col2 = c(sample(100:500, 5, replace = TRUE)), col2 = c(sample(1:5, 5, replace = TRUE)))
na_df[1, 2] <- NA
na_df[5, 3] <- NA
na_df[3,] <- NA

# rowSums() function
na_df[rowSums(is.na(na_df)) != ncol(na_df), ]
```

    ##   col1 col2 col2.1
    ## 1    8   NA      2
    ## 2   10  188      5
    ## 4    9  127      3
    ## 5    8  419     NA

------------------------------------------------------------------------

### 1.2.4 dplyr

#### 1.2.4.1 Install and load packages

``` r
install.packages("dplyr")
```

``` r
library(dplyr)
```

#### 1.2.4.2 The pipe “%\>%”

``` r
head(salaries %>% na.omit())
```

    ##        rank discipline yrs.since.phd yrs.service  sex salary
    ## 1      Prof          B            19          18 Male 139750
    ## 2      Prof          B            20          16 Male 173200
    ## 3  AsstProf          B             4           3 Male  79750
    ## 4      Prof          B            45          39 Male 115000
    ## 5      Prof          B            40          41 Male 141500
    ## 6 AssocProf          B             6           6 Male  97000

``` r
any(is.na(salaries))
```

    ## [1] FALSE

``` r
complete_data <- salaries %>% na.omit()
any(is.na(complete_data))
```

    ## [1] FALSE

**tibble을 사용하면 추가적인 정보와 함께 표시**

``` r
tib_salaries <- salaries %>% as_tibble()
# 또는
# tib_salaries <- as_tibble(salaries)

tib_salaries
```

    ## # A tibble: 397 × 6
    ##    rank      discipline yrs.since.phd yrs.service sex    salary
    ##    <chr>     <chr>              <int>       <int> <chr>   <int>
    ##  1 Prof      B                     19          18 Male   139750
    ##  2 Prof      B                     20          16 Male   173200
    ##  3 AsstProf  B                      4           3 Male    79750
    ##  4 Prof      B                     45          39 Male   115000
    ##  5 Prof      B                     40          41 Male   141500
    ##  6 AssocProf B                      6           6 Male    97000
    ##  7 Prof      B                     30          23 Male   175000
    ....

#### 1.2.4.3 Applying dplyr

``` r
sal <- salaries %>% select(rank, salary)
head(sal)
```

    ##        rank salary
    ## 1      Prof 139750
    ## 2      Prof 173200
    ## 3  AsstProf  79750
    ## 4      Prof 115000
    ## 5      Prof 141500
    ## 6 AssocProf  97000

**Exercise: salaries에서 rank, sex, salary만 추출, 결측치가 있는 row
제거, rank가 “Prof”인 row만 남긴 tibble을 “prof_data” variable에 생성**

``` r
prof_data <- salaries %>% 
                    as_tibble() %>%
                    na.omit() %>% 
                    select(rank, sex, salary) %>%
                    filter(rank == "Prof")

prof_data
```

    ## # A tibble: 266 × 3
    ##    rank  sex    salary
    ##    <chr> <chr>   <int>
    ##  1 Prof  Male   139750
    ##  2 Prof  Male   173200
    ##  3 Prof  Male   115000
    ##  4 Prof  Male   141500
    ##  5 Prof  Male   175000
    ##  6 Prof  Male   147765
    ##  7 Prof  Male   119250
    ....

#### 1.2.4.4 Factors

``` r
class(prof_data$sex)
```

    ## [1] "character"

``` r
prof_data$sex <- factor(prof_data$sex)
prof_data
```

    ## # A tibble: 266 × 3
    ##    rank  sex    salary
    ##    <chr> <fct>   <int>
    ##  1 Prof  Male   139750
    ##  2 Prof  Male   173200
    ##  3 Prof  Male   115000
    ##  4 Prof  Male   141500
    ##  5 Prof  Male   175000
    ##  6 Prof  Male   147765
    ##  7 Prof  Male   119250
    ....

``` r
levels(prof_data$sex) # [1] "Female" "Male" 의 순서는 "Female"이 0, "Male"이 1으로 취급
```

    ## [1] "Female" "Male"

**Exercise: salaries의 chr data type을 factor로 수정해서 “df”에 저장**

``` r
df <- salaries %>%
            as_tibble() %>%
            na.omit() %>%
            mutate(rank = factor(rank), discipline = factor(discipline), sex = factor(sex))

# 더 간단한 방법: mutate_if로 조건을 사용

df <- salaries %>%
            as_tibble() %>%
            na.omit() %>%
            mutate_if(is.character, as.factor)

df
```

    ## # A tibble: 397 × 6
    ##    rank      discipline yrs.since.phd yrs.service sex    salary
    ##    <fct>     <fct>              <int>       <int> <fct>   <int>
    ##  1 Prof      B                     19          18 Male   139750
    ##  2 Prof      B                     20          16 Male   173200
    ##  3 AsstProf  B                      4           3 Male    79750
    ##  4 Prof      B                     45          39 Male   115000
    ##  5 Prof      B                     40          41 Male   141500
    ##  6 AssocProf B                      6           6 Male    97000
    ##  7 Prof      B                     30          23 Male   175000
    ....

``` r
summary(df)
```

    ##         rank     discipline yrs.since.phd    yrs.service        sex     
    ##  AssocProf: 64   A:181      Min.   : 1.00   Min.   : 0.00   Female: 39  
    ##  AsstProf : 67   B:216      1st Qu.:12.00   1st Qu.: 7.00   Male  :358  
    ##  Prof     :266              Median :21.00   Median :16.00               
    ##                             Mean   :22.31   Mean   :17.61               
    ##                             3rd Qu.:32.00   3rd Qu.:27.00               
    ##                             Max.   :56.00   Max.   :60.00               
    ##      salary      
    ##  Min.   : 57800  
    ##  1st Qu.: 91000  
    ....

``` r
str(df)
```

    ## tibble [397 × 6] (S3: tbl_df/tbl/data.frame)
    ##  $ rank         : Factor w/ 3 levels "AssocProf","AsstProf",..: 3 3 2 3 3 1 3 3 3 3 ...
    ##  $ discipline   : Factor w/ 2 levels "A","B": 2 2 2 2 2 2 2 2 2 2 ...
    ##  $ yrs.since.phd: int [1:397] 19 20 4 45 40 6 30 45 21 18 ...
    ##  $ yrs.service  : int [1:397] 18 16 3 39 41 6 23 45 20 18 ...
    ##  $ sex          : Factor w/ 2 levels "Female","Male": 2 2 2 2 2 2 2 2 2 1 ...
    ##  $ salary       : int [1:397] 139750 173200 79750 115000 141500 97000 175000 147765 119250 129000 ...

#### 1.2.4.5 filter(), group_by() and summarise()

``` r
df %>% filter(sex == "Female")
```

    ## # A tibble: 39 × 6
    ##    rank      discipline yrs.since.phd yrs.service sex    salary
    ##    <fct>     <fct>              <int>       <int> <fct>   <int>
    ##  1 Prof      B                     18          18 Female 129000
    ##  2 Prof      A                     39          36 Female 137000
    ##  3 AssocProf A                     13           8 Female  74830
    ##  4 AsstProf  B                      4           2 Female  80225
    ##  5 AsstProf  B                      5           0 Female  77000
    ##  6 Prof      B                     23          19 Female 151768
    ##  7 Prof      B                     25          25 Female 140096
    ....

``` r
df %>% filter(discipline == "B", sex == "Female")
```

    ## # A tibble: 21 × 6
    ##    rank      discipline yrs.since.phd yrs.service sex    salary
    ##    <fct>     <fct>              <int>       <int> <fct>   <int>
    ##  1 Prof      B                     18          18 Female 129000
    ##  2 AsstProf  B                      4           2 Female  80225
    ##  3 AsstProf  B                      5           0 Female  77000
    ##  4 Prof      B                     23          19 Female 151768
    ##  5 Prof      B                     25          25 Female 140096
    ##  6 AsstProf  B                     11           3 Female  74692
    ##  7 AssocProf B                     11          11 Female 103613
    ....

``` r
df %>% 
    group_by(rank) %>% 
    summarise(mean_salary = mean(salary),
                max_salary = max(salary),
                min_salary = min(salary))
```

    ## # A tibble: 3 × 4
    ##   rank      mean_salary max_salary min_salary
    ##   <fct>           <dbl>      <int>      <int>
    ## 1 AssocProf      93876.     126431      62884
    ## 2 AsstProf       80776.      97032      63100
    ## 3 Prof          126772.     231545      57800

``` r
df %>% 
    group_by(sex) %>%
    tally()
```

    ## # A tibble: 2 × 2
    ##   sex        n
    ##   <fct>  <int>
    ## 1 Female    39
    ## 2 Male     358

``` r
df %>% 
    group_by(sex) %>%
    count()
```

    ## # A tibble: 2 × 2
    ## # Groups:   sex [2]
    ##   sex        n
    ##   <fct>  <int>
    ## 1 Female    39
    ## 2 Male     358

**Exercise: 분야별로 각 성별의 count를 출력**

``` r
df %>% 
    group_by(discipline) %>%
    count(sex)
```

    ## # A tibble: 4 × 3
    ## # Groups:   discipline [2]
    ##   discipline sex        n
    ##   <fct>      <fct>  <int>
    ## 1 A          Female    18
    ## 2 A          Male     163
    ## 3 B          Female    21
    ## 4 B          Male     195

``` r
df <- df %>%
        arrange(desc(salary))

write.csv(df, "./results/salaries_preproc.csv", row.names = FALSE)
```

## 1.3 apply(), lapply(), sapply(), tapply()

apply() 함수는 행 또는 열에 함수를 적용할 때 사용할 수 있습니다.

``` r
matrix_data <- matrix(1:9, nrow = 3)
apply(matrix_data, 1, sum)  # Apply sum() function to rows
```

    ## [1] 12 15 18

``` r
apply(matrix_data, 2, mean)  # Apply mean() function to columns
```

    ## [1] 2 5 8

lapply() 함수는 리스트에 함수를 적용할 때 사용할 수 있습니다.

``` r
list_data <- list(a = 1:3, b = 4:6, c = 7:9)
lapply(list_data, sum)  # Apply sum() function to each element
```

    ## $a
    ## [1] 6
    ## 
    ## $b
    ## [1] 15
    ## 
    ## $c
    ## [1] 24

sapply() 함수는 리스트에 함수를 적용하고 결과를 벡터로 반환할 때 사용할
수 있습니다.

``` r
vector_data <- c(1, 2, 3, 4, 5)
sapply(vector_data, sqrt)  # Apply sqrt() function to each element
```

    ## [1] 1.000000 1.414214 1.732051 2.000000 2.236068

tapply() 함수는 벡터에 함수를 적용하고 결과를 벡터로 반환할 때 사용할 수
있습니다.

``` r
vector_data <- c(1, 2, 3, 4, 5)
factor_data <- factor(c("a", "a", "b", "b", "c"))
tapply(vector_data, factor_data, sum)  # Apply sum() function to each element
```

    ## a b c 
    ## 3 7 5

Exercise

``` r
# Step 1: random matrix 생성
set.seed(123)
my_matrix <- matrix(runif(20), nrow = 5, ncol = 4)
my_matrix
```

    ##           [,1]      [,2]      [,3]       [,4]
    ## [1,] 0.2875775 0.0455565 0.9568333 0.89982497
    ## [2,] 0.7883051 0.5281055 0.4533342 0.24608773
    ## [3,] 0.4089769 0.8924190 0.6775706 0.04205953
    ## [4,] 0.8830174 0.5514350 0.5726334 0.32792072
    ## [5,] 0.9404673 0.4566147 0.1029247 0.95450365

``` r
# Step 2: apply()를 사용하여 mean() 적용
col_means <- apply(my_matrix, 2, mean)
col_means
```

    ## [1] 0.6616689 0.4948262 0.5526592 0.4940793

``` r
# Step 3: lapply()를 사용하여 sqrt() 적용
sqrt_vals <- lapply(my_matrix, sqrt)
sqrt_vals
```

    ## [[1]]
    ## [1] 0.5362625
    ## 
    ## [[2]]
    ## [1] 0.8878655
    ## 
    ## [[3]]
    ## [1] 0.639513
    ## 
    ## [[4]]
    ....

``` r
# Step 4: sapply()를 사용하여 sum() 적용
row_sums <- sapply(my_matrix, sum)
row_sums
```

    ##  [1] 0.28757752 0.78830514 0.40897692 0.88301740 0.94046728 0.04555650
    ##  [7] 0.52810549 0.89241904 0.55143501 0.45661474 0.95683335 0.45333416
    ## [13] 0.67757064 0.57263340 0.10292468 0.89982497 0.24608773 0.04205953
    ## [19] 0.32792072 0.95450365

``` r
# Step 5: random factor 벡터 생성
categories <- sample(c("A", "B", "C"), size = 20, replace = TRUE)
categories
```

    ##  [1] "A" "A" "A" "A" "C" "B" "C" "B" "A" "B" "C" "B" "A" "C" "C" "A" "C" "B" "A"
    ## [20] "C"

``` r
# Step 6: tapply()를 사용하여 table() 적용
category_counts <- tapply(categories, categories, table)
category_counts
```

    ## A B C 
    ## 8 5 7

``` r
# Step 7: 결과 확인
print(paste0(1:length(col_means), "번째 열의 평균: ", col_means))
```

    ## [1] "1번째 열의 평균: 0.66166885313578"  "2번째 열의 평균: 0.49482615632005" 
    ## [3] "3번째 열의 평균: 0.552659244323149" "4번째 열의 평균: 0.494079321343452"

``` r
print(paste0(1:length(sqrt_vals), "번째 값의 제곱근: ", sqrt_vals))
```

    ##  [1] "1번째 값의 제곱근: 0.536262547754935" 
    ##  [2] "2번째 값의 제곱근: 0.887865494004473" 
    ##  [3] "3번째 값의 제곱근: 0.639513034903668" 
    ##  [4] "4번째 값의 제곱근: 0.939690057415173" 
    ##  [5] "5번째 값의 제곱근: 0.969776925016184" 
    ##  [6] "6번째 값의 제곱근: 0.213439685602119" 
    ##  [7] "7번째 값의 제곱근: 0.726708667931657" 
    ##  [8] "8번째 값의 제곱근: 0.944679334162681" 
    ##  [9] "9번째 값의 제곱근: 0.742586705015531" 
    ## [10] "10번째 값의 제곱근: 0.675732739552737"
    ....

``` r
print(paste0(1:length(row_sums), "번째 행의 합계: ", row_sums))
```

    ##  [1] "1번째 행의 합계: 0.287577520124614"  
    ##  [2] "2번째 행의 합계: 0.788305135443807"  
    ##  [3] "3번째 행의 합계: 0.4089769218117"    
    ##  [4] "4번째 행의 합계: 0.883017404004931"  
    ##  [5] "5번째 행의 합계: 0.940467284293845"  
    ##  [6] "6번째 행의 합계: 0.0455564993899316" 
    ##  [7] "7번째 행의 합계: 0.528105488047004"  
    ##  [8] "8번째 행의 합계: 0.892419044394046"  
    ##  [9] "9번째 행의 합계: 0.551435014465824"  
    ## [10] "10번째 행의 합계: 0.456614735303447" 
    ....

``` r
print(paste0(1:length(category_counts), "번째 카테고리의 개수: ", category_counts))
```

    ## [1] "1번째 카테고리의 개수: 8" "2번째 카테고리의 개수: 5"
    ## [3] "3번째 카테고리의 개수: 7"

## 1.4 if and for loops

``` r
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
```

    ## [1]  1  4  9 16 25

## 1.5 Creating functions

``` r
# calculate_average() 함수: 벡터의 평균을 계산하는 함수

calculate_average <- function(x) {
  avg <- sum(x) / length(x)
  return(avg)
}

data <- c(10, 15, 20, 25, 30)
calculate_average(data)  # Call the custom function
```

    ## [1] 20

**Exercise: BMI 계산과 데이터 필터링을 위한 함수 생성**

``` r
# Exercise: Creating a Function to Calculate BMI and Filter Data

patient_data <- read.csv("./data/patient_data.csv", header = TRUE)
head(patient_data)
```

    ##       Name Height Weight Age
    ## 1 Patient1  164.4   52.3  44
    ## 2 Patient2  189.4   72.1  33
    ## 3 Patient3  170.4   89.9  40
    ## 4 Patient4  194.2   56.1  58
    ## 5 Patient5  197.0   78.0  39
    ## 6 Patient6  152.3   60.3  56

``` r
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
```

    ##         Name Height Weight Age      BMI
    ## 1   Patient3  170.4   89.9  40 30.96139
    ## 2   Patient6  152.3   60.3  56 25.99666
    ## 3   Patient9  177.6   94.8  36 30.05539
    ## 4  Patient15  155.1   90.7  49 37.70368
    ## 5  Patient17  162.3   90.5  42 34.35671
    ## 6  Patient18  152.1   90.6  58 39.16244
    ## 7  Patient19  166.4   89.7  43 32.39558
    ## 8  Patient23  182.0   85.5  32 25.81210
    ## 9  Patient37  187.9   99.2  53 28.09688
    ....

**Exercise: BMI 범주를 계산하는 함수 생성**

``` r
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
```

    ##         Name Height Weight Age      BMI BMI_Category
    ## 1   Patient1  164.4   52.3  44 19.35076       Normal
    ## 2   Patient2  189.4   72.1  33 20.09904       Normal
    ## 3   Patient3  170.4   89.9  40 30.96139        Obese
    ## 4   Patient4  194.2   56.1  58 14.87525  Underweight
    ## 5   Patient5  197.0   78.0  39 20.09843       Normal
    ## 6   Patient6  152.3   60.3  56 25.99666   Overweight
    ## 7   Patient7  176.4   56.4  57 18.12516  Underweight
    ## 8   Patient8  194.6   87.7  44 23.15869       Normal
    ## 9   Patient9  177.6   94.8  36 30.05539        Obese
    ....

**Exercise: Patient Data를 필터링하고 요약하는 함수 생성**

``` r
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
```

    ##   Count Mean_Height Mean_Weight Min_Height Max_Height Min_Weight Max_Weight
    ## 1    25     175.572      75.524      151.2      198.2       52.3       99.2

# 2 Project

**데이터 imputation, 필터링, summary statistics**

``` r
# Load required libraries
library(dplyr)

# Step 1: Read the CSV file and view the dataset
train_df <- read.csv("./data/train.csv", header = TRUE)
head(train_df)
```

    ##   PassengerId Survived Pclass
    ## 1           1        0      3
    ## 2           2        1      1
    ## 3           3        1      3
    ## 4           4        1      1
    ## 5           5        0      3
    ## 6           6        0      3
    ##                                                  Name    Sex Age SibSp Parch
    ## 1                             Braund, Mr. Owen Harris   male  22     1     0
    ## 2 Cumings, Mrs. John Bradley (Florence Briggs Thayer) female  38     1     0
    ....

``` r
# Step 2: Check missing values
sapply(train_df, function(x) sum(is.na(x)))
```

    ## PassengerId    Survived      Pclass        Name         Sex         Age 
    ##           0           0           0           0           0         177 
    ##       SibSp       Parch      Ticket        Fare       Cabin    Embarked 
    ##           0           0           0           0           0           0

``` r
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
```

    ## PassengerId    Survived      Pclass        Name         Sex         Age 
    ##           0           0           0           0           0           0 
    ##       SibSp       Parch      Ticket        Fare       Cabin    Embarked 
    ##           0           0           0           0           0           0

``` r
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
```

    ##   PassengerId Survived Pclass
    ## 1           1        0      3
    ## 2           2        1      1
    ## 3           3        1      3
    ## 4           4        1      1
    ## 5           5        0      3
    ## 6           6        0      3
    ##                                                  Name    Sex      Age SibSp
    ## 1                             Braund, Mr. Owen Harris   male 22.00000     1
    ## 2 Cumings, Mrs. John Bradley (Florence Briggs Thayer) female 38.00000     1
    ....

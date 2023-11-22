# function(x)는 사용자가 만든 함수를 나타내며, x는 각 요소를 가리키는 변수입니다.

# 예를 들어, lapply를 사용하여 리스트의 각 요소에 제곱을 계산하려면 다음과 같이 함수를 정의합니다.

my_list <- list(a = 1:3, b = 4:6, c = 7:9)
result <- lapply(my_list, function(x) x^2)
# 여기서 function(x) 부분은 각 요소를 x로 받아들여 제곱을 계산하는 함수를 정의한 것입니다. 
# 이 함수는 lapply에 의해 리스트의 각 요소에 적용되어 각 요소를 제곱한 값으로 이루어진 리스트를 반환합니다.

# apply
# apply 함수는 배열(행렬)이나 데이터 프레임의 여러 차원에 걸쳐 함수를 적용하는 데 사용됩니다.
# 
# 예시 - 사용자 정의 함수:


# 행렬의 행별 평균과 표준편차 계산
mat <- matrix(1:12, nrow = 3)
apply(mat, 1, function(x) c(mean = mean(x), sd = sd(x)))

# lapply
# lapply 함수는 리스트의 각 요소에 대해 사용자 정의 함수를 적용하고 리스트로 반환합니다.
# 
# 예시 - 데이터 프레임 작업:

df <- data.frame(
  name = c("Alice", "Bob", "Charlie"),
  score_math = c(85, 76, 92),
  score_english = c(78, 80, 88)
)

# 특정 접두사로 시작하는 열에 사용자 정의 함수 적용
result <- lapply(df[grep("^score_", names(df))], function(col) summary(col))


# sapply
# Sapply 함수는 반복 결과가 일정한 경우 벡터나 행렬로 결과를 간결하게 반환합니다.
# 
# 예시 - 조건부 출력:

# 숫자 리스트
numbers_list <- list(a = 1:5, b = 6:10, c = 11:15)

# 각 요소의 홀짝 여부 확인
result <- sapply(numbers_list, function(x) ifelse(x %% 2 == 0, "짝수", "홀수"))

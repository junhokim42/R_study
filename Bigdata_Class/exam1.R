# 현재 워킹 디렉토리
getwd()   # setwd()

# 스칼라 값 - 하나의 값 ---> 원소 한개로 구성된 백터
100
"abc"
TRUE
T
mode(100)
mode("abc")
mode(T)
class(100)
class("abc")
class(T)
typeof(100)
typeof("abc")
typeof(T)
str(100)
str("abc")
str(T)

# 백터를 생성하는 다양한 방법
1:10
10:1
100:200
c(10, 3, 4, 7, 15)
rep(1, 100)
rep(1:3, 5)
rep(1:3, times=5) # 키워드 파라미터
rep(1:3, each=5)
?rep  #help()
seq(10)
seq(5, 15)
seq(5, 15, 3)
seq(15, 5, -1)

# 내장 백터
LETTERS
letters
month.name
month.abb
pi

type(pi)

LETTERS;letters;month.name;month.abb;pi

LETTERS[1]; LETTERS[c(3,4,5)]
LETTERS[3:5]; LETTERS[5:3]
LETTERS[-1]; LETTERS[c(-2,-4)]

length(LETTERS)
length(month.name)
length(pi)

# 인덱싱과 슬라이싱
x <- c(10,2,7,4,15)
x
print(x)
class(x)
x[1]
x[2]
x[2:4]
x[c(3,2,4)]
x[2:5]
x[-1]
x[-5]

# 주요 함수
rev(x)
range(x)
sort(x)
sort(x, decreasing = TRUE)
sort(x, decreasing = T)
#x <- sort(x)
order(x)


# 백터의 원소값 변경하기
x[3] <- 20
x

# 백터화 연산
x + 1
x <- x + 1
100:200 * 2

# 기초통계량 관련 함수
max(x);min(x);mean(x);sum(x)
quantile(x)
summary(x)

# bool값을 활용한 인덱싱
x[c(2,4)] # x[2], x[4]
x[c(F,T,F,T,F)] # x[c(T,F)] 
x > 5
x[x > 5] 
x[x > 5 & x < 15] # x[x > 5 && x < 15]
x[x > 5 | x < 15]

# 백터의 원소들에 이름 설정
x
names(x)
names(x) <- LETTERS[1:5]
x
x[2];x["B"] 
names(x) <- NULL
x
x[2];x["B"] 


# &, && 연산자의 차이 - 백터화 연산을 원한다면 & 를 사용
c(T, T, F, F) & c(T, F, T, F)
c(T, T, F, F) | c(T, F, T, F)
c(T, T, F, F) && c(T, F, T, F)
c(T, T, F, F) || c(T, F, T, F)


# 만들어진 객체들 확인과 삭제
ls()
rm(x)
x
class(x)


# which(), which.max(), which.min() 함수 익히기 
rainfall <- c(21.6, 23.6, 45.8, 77.0, 
              102.2, 133.3,327.9, 348.0, 
              137.6, 49.3, 53.0, 24.9)
rainfall > 100
rainfall[rainfall > 100]
which(rainfall > 100)
month.name[which(rainfall > 100)]
month.abb[which(rainfall > 100)]
month.korname <- c("1월","2월","3월",
                   "4월","5월","6월",
                   "7월","8월","9월",
                   "10월","11월","12월")
month.korname[which(rainfall > 100)]
which.max(rainfall)
which.min(rainfall)
month.korname[which.max(rainfall)]
month.korname[which.min(rainfall)]

# 난수 추출
sample(1:20, 3)
sample(1:45, 6)
sample(1:10, 7)
sample(1:10, 7, replace=T)


# 백터는 문자열 결합을 함수로 --> paste()
paste("I'm","Duli","!!")
paste("I'm","Duli","!!", sep="")
paste0("I'm","Duli","!!")


# paste() 함수에 어려 백터들을 아규먼트로 주면 백터들의 원소끼리 결합하여 백터 구성 
fruit <- c("Apple", "Banana", "Strawberry")
food <- c("Pie","Juice", "Cake")
paste(fruit, food)

paste(fruit, food, sep="")
paste(fruit, food, sep=":::")
paste(fruit, food, sep="", collapse="-")
paste(fruit, food, sep="", collapse="")
paste(fruit, food, collapse=",")





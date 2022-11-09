#############################################################
# 날짜와 시간 관련 기능을 지원하는 함수들
# 날짜정보와 시간정보는 R에서 다른 클래스를 통해 구현된다. 
# 날짜(Date)는 1970-01-01을 기준으로 R 내부적으로 정수형으로 저장되고
# 시간(Time)도 R 내부적으로 1970-01-01을 기준으로 초단위로 저장된다.

# 날짜(Date): Date 클래스
# 시간(time): POSIXct, POSIXlt 클래스
# POSIXct 클래스는 매우 큰 정수로 시간정보를 데이터프레임으로 저장할 때 유용하다.
# POSIXlt 클래스는 리스트 자료형으로 요일, 년, 월, 일 등의 정보를 리스트 내부 원소로 
#                  저장되어 각각의 정보를 구분하여 다루기 좋다.

# 현재날짜: Sys.Date()
# 현재날짜 및 시간: Sys.time()
# 미국식 날짜 및 시간: date()

# 년월일 시분초 타입의 문자열을 날짜 또는 날짜+시간으로 변경 : 
# as.Date("년-월-일 시:분:초") 또는 as.Date("년/월/일 시:분:초")
# as.POSIXct("년-월-일 시:분:초") 
# as.POSIXlt("년-월-일 시:분:초") 

# 특정 포맷을 이용한 날짜 및 시간: as.Date("날짜 및 시간 문자열", format="포맷")

# 날짜 데이터끼리 연산 가능 : 
# 날짜끼리 뺄셈가능, 날짜와 정수의 덧셈뺄셈 가능 - 하루를 1로 간주, 소숫점 생략
# 날짜 데이터끼리 연산할 때 소숫점을 표현하려면 as.Date() 대신에 as.POSIXct() 함수 사용

(today <- Sys.Date())
format(today, "%Y년 %m월 %d일")
format(today, "%d일 %B %Y년")
format(today, "%y")
format(today, "%Y")
format(today, "%B")
format(today, "%b")
format(today, "%a")
format(today, "%A")
weekdays(today) 
months(today) 
quarters(today)
unclass(today)  # 1970-01-01을 기준으로 얼마나 날짜가 지났지는 지의 값을 가지고 있다.


Sys.Date()
Sys.time()
str(Sys.Date())
str(Sys.time())
Sys.timezone()

as.Date('1/15/2022') # 에러발생
as.Date('2022/1/15') # 잘 인식한다.
as.Date('2022-1-15') # 잘 인식한다.
as.Date('1/15/22',format='%m/%d/%Y') # format 은 생략 가능
as.Date('1/15/22',format='%m/%d/%y')
as.Date('1월 15, 2022',format='%B %d, %Y')
as.Date('20220115',format='%Y%m%d') 
as.Date('22115',format='%y%b%d') 

x1 <- "2022-11-10 13:30:41" # "%Y-%m-%d %H:%M:%S"
# 문자열을 날짜형으로
(d <- as.Date(x1))
# 문자열을 날짜+시간형으로
(t1 <- as.POSIXct(x1))
(t2 <- as.POSIXlt(x1))
class(d)
class(t1)
class(t2)
(t3 <- strptime(x1, "%Y-%m-%d %H:%M:%S"))
class(t3)

x2 <- "20220601"
as.Date(x2, "%Y%m%d")
as.POSIXct(x2, tryFormats="%Y%m%d")
as.POSIXlt(x2, tryFormats="%Y%m%d")
strptime(x2, "%Y%m%d")

# 날짜 데이터 연산
as.Date("2022/01/01 08:00:00") - as.Date("2022/01/01 05:00:00")
as.POSIXct("2022/01/01 08:00:00") - as.POSIXct("2022/01/01 05:00:00")
as.POSIXlt("2022/01/01 08:00:00") - as.POSIXlt("2022/01/01 05:00:00")
Sys.Date() - 1
Sys.Date() + 2

ct <- Sys.time() 
lt <- as.POSIXlt(ct)
str(ct) 
str(lt) 
unclass(ct) 
unclass(lt) 
lt$mon+1
lt$hour
lt$year+1900

as.POSIXct(1449894438,origin="1970-01-01")
as.POSIXlt(1449894438,origin="1970-01-01")

as.POSIXlt("2022/11/07")$wday
as.POSIXlt("2022/11/08")$wday
as.POSIXlt("2022/11/09")$wday
as.POSIXlt("2022/11/10")$wday
as.POSIXlt("2022/11/11")$wday
as.POSIXlt("2022/11/12")$wday

#내가 태어난 요일 출력하기
myday <- as.Date("2022-03-01")
weekdays(myday)

#내가 태어난지 며칠
Sys.Date() - myday

#올해의 크리스마스 요일 2가지방법(요일명,숫자)
christmas<-as.POSIXlt("2022-12-25")
weekdays(christmas)
christmas$wday

#2022년 1월 1일 어떤 요일
tmp<-as.Date("2022-01-01")
weekdays(tmp)

tmp<-as.POSIXct("2022-01-01")
weekdays(tmp)

tmp<-as.POSIXlt("2022-01-01")
weekdays(tmp)

#오늘은 xxxx년x월xx일x요일입니다 형식으로 출력
tmp<-Sys.Date()
year<-format(tmp,'%Y')
month<-format(tmp,'%m')
day<-format(tmp,'%d')
weekday<-format(tmp,'%A')
paste0("오늘은 ",year,"년 ",month,"월 ",day,"일 ",weekday,"입니다.")

format(tmp,'오늘은 %Y년 %B %d일 %A입니다')

# 정규표현식
word <- "JAVA javascript 가나다 123 %^&*"
gsub("A", "", word) 
gsub("a", "", word) 
gsub("[Aa]", "", word) 
gsub("[가-힣]", "", word) 
gsub("[^가-힣]", "", word) 
gsub("[&^%*]", "", word) 
gsub("[1234567890]", "", word) 
gsub("[[:punct:]]", "", word) 
gsub("[[:alnum:]]", "", word) 
gsub("[[:digit:]]", "", word) 
gsub("[^[:alnum:]]", "", word) 
gsub("[[:space:]]", "", word) 
gsub("[[:space:][:punct:]]", "", word)


# 정규표현식 사용
word <- "JAVA javascript Aa 가나다 AAaAaA123 %^&*"
gsub(" ", "@", word); sub(" ", "@", word)
gsub("A", "", word) 
gsub("a", "", word) 
gsub("Aa", "", word) 
gsub("(Aa)", "", word) 
gsub("(Aa){2}", "", word);gsub("Aa{2}", "", word) 
# "JAVA javascript Aa 가나다 AAaAaA123 %^&*"
gsub("[Aa]", "", word) 
gsub("[가-힣]", "", word) 
gsub("[^가-힣]", "", word) 
gsub("[&^%*]", "", word) 
gsub("[[:punct:]]", "", word) 
gsub("[[:alnum:]]", "", word) 
gsub("[1234567890]", "", word) 
gsub("[0-9]", "", word) 
gsub("\\d", "", word); gsub("\\D", "", word)
gsub("[[:digit:]]", "", word) 
gsub("[^[:alnum:]]", "", word) 
gsub("[[:space:]]", "", word) 
gsub("[[:punct:][:digit:]]", "", word) 
gsub("[[:punct:][:digit:][:space:]]", "", word) 




# 날짜 또는 날짜+시간 데이터 셋 만들기
dd <- seq(Sys.Date(),Sys.Date() + 10, "day")
dd
weekdays(dd)
seq(Sys.time(),Sys.time() + 60*60*10, "hour")
seq(Sys.time(),Sys.time() + 60*10, "min")


seq(Sys.Date(), as.Date("2050-12-31"), "10 year")

seq(Sys.Date(), length.out=10, by="year")
seq(Sys.Date(), length.out=10, by="10 year")
seq(Sys.Date(), length.out=10, by="day")
seq(Sys.time(), length.out=10, by="hour")
seq(Sys.time(), length.out=10, by="min")
seq(Sys.time(), length.out=10, by="sec")

data.frame(num=1:9, point=as.POSIXct(c("2022-11-04 09:30:02", "2022-11-04 09:30:04",
                                       "2022-11-04 09:30:06", "2022-11-04 09:30:08", "2022-11-04 09:30:10", 
                                       "2022-11-04 09:30:12", "2022-11-04 09:30:14", "2022-11-04 09:30:16",
                                       "2022-11-04 09:30:18")))

data.frame(num=1:9, point=seq(as.POSIXct("2022-11-04 09:30:02"), length.out=9,by="2 sec"))
data.frame(num=1:9, point=seq(as.POSIXct("2022-11-04 09:30:02"), length.out=9,by="sec"))

#############################################################
#문자열 처리 관련 주요 함수들 

x <- "We have a dream"
nchar(x)
length(x)

y <- c("We", "have", "a", "dream", "ㅋㅋㅋ")
length(y)
nchar(y)

letters
sort(letters, decreasing=TRUE)

fox.says <- "It is only with the HEART that one can See Rightly"
tolower(fox.says)
toupper(fox.says)

substr("Data Analytics", start=1, stop=4)
substr("Data Analytics", 6, 14)
substring("Data Analytics", 6)

classname <- c("Data Analytics", "Data Mining", "Data Visualization")
substr(classname, 1, 4)

countries <- c("Korea, KR", "United States, US", "China, CN")
substr(countries, nchar(countries)-1, nchar(countries))

str(islands)
head(islands)
landmesses <- names(islands)
landmesses
grep(pattern="New", x=landmesses)

index <- grep("New", landmesses)
landmesses[index]
# 동일
grep("New", landmesses, value=T)


txt <- "Data Analytics is useful. Data Analytics is also interesting."
sub(pattern="Data", replacement="Business", x=txt)
gsub(pattern="Data", replacement="Business", x=txt)

x <- c("test1.csv", "test2.csv", "test3.csv", "test4.csv")
x <- gsub(".csv", "", x)
x

gsub("[ABC]", "@", "123AunicoBC98ABC")
gsub("ABC", "@", "123AunicoBC98ABC")
gsub("(AB)|C", "@", "123AunicoBC98ABC")
gsub("A|(BC)", "@", "123AunicoBC98ABC")
gsub("A|B|C", "@", "123AunicoBC98ABC")

words <- c("ct", "at", "bat", "chick", "chae", "cat", 
           "cheanomeles", "chase", "chasse", "mychasse", 
           "cheap", "check", "cheese", "hat", "mycat")

grep("che", words, value=T)
grep("at", words, value=T)
grep("[ch]", words, value=T)
grep("[at]", words, value=T)
grep("ch|at", words, value=T)
grep("ch(e|i)ck", words, value=T)
grep("chase", words, value=T)
grep("chas?e", words, value=T)
grep("chas*e", words, value=T)
grep("chas+e", words, value=T)
grep("ch(a*|e*)se", words, value=T)
grep("^c", words, value=T)  #[^....]  -> 부정
grep("t$", words, value=T)
grep("^c.*t$", words, value=T)

words2 <- c("12 Dec", "OK", "http//", 
            "<TITLE>Time?</TITLE>", 
            "12345", "Hi there")

grep("[[:alnum:]]", words2, value=TRUE)
grep("[[:alpha:]]", words2, value=TRUE)
grep("[[:digit:]]", words2, value=TRUE)
grep("[[:punct:]]", words2, value=TRUE)
grep("[[:space:]]", words2, value=TRUE)
grep("\\w", words2, value=TRUE)
grep("\\d", words2, value=TRUE);grep("\\D", words2, value=TRUE)
grep("\\s", words2, value=TRUE)



fox.said <- "What is essential is invisible to the eye"
fox.said
strsplit(x= fox.said, split= " ")
strsplit(x= fox.said, split="")

fox.said.words <- unlist(strsplit(fox.said, " "))
fox.said.words
fox.said.words <- strsplit(fox.said, " ")[[1]]
fox.said.words
fox.said.words[3]
p1 <- "You come at four in the afternoon, than at there I shall begin to the  happy"
p2 <- "One runs the risk of weeping a little, if one lets himself be tamed"
p3 <- "What makes the desert beautiful is that somewhere it hides a well"
littleprince <- c(p1, p2, p3)
strsplit(littleprince, " ")
strsplit(littleprince, " ")[[3]] 
strsplit(littleprince, " ")[[3]][5]

#############################################################
# 데이터 전처리시 자주 사용되는 apply 계열의 함수를 알아보자
weight <- c(65.4, 55, 380, 72.2, 51, NA)
height <- c(170, 155, NA, 173, 161, 166)
gender <- c("M", "F","M","M","F","F")

df <- data.frame(w=weight, h=height)
df
?apply
?lapply
apply(df, 1, sum, na.rm=TRUE)
apply(df, 2, sum, na.rm=TRUE)
lapply(df, sum, na.rm=TRUE)
sapply(df, sum, na.rm=TRUE)
tapply(1:6, gender, sum) # rm(sum)
tapply(df$w, gender, mean, na.rm=TRUE)
mapply(paste, 1:5, LETTERS[1:5], month.abb[1:5])



v<-c("abc", "DEF", "TwT")
sapply(v, function(d) paste("-",d,"-", sep=""))

l<-list("abc", "DEF", "TwT")
sapply(l, function(d) paste("-",d,"-", sep=""))
lapply(l, function(d) paste("-",d,"-", sep=""))

flower <- c("rose", "iris", "sunflower", "anemone", "tulip")
length(flower)
nchar(flower)
sapply(flower, function(d) if(nchar(d) > 5) return(d))
sapply(flower, function(d) if(nchar(d) > 5) d)
sapply(flower, function(d) if(nchar(d) > 5) return(d) else return(NA))
sapply(flower, function(d) paste("-",d,"-", sep=""))

sapply(flower, function(d, n=5) if(nchar(d) > n) return(d))
sapply(flower, function(d, n=5) if(nchar(d) > n) return(d), 3)
sapply(flower, function(d, n=5) if(nchar(d) > n) return(d), n=4)

count <- 1
myf <- function(x, wt=T){
  print(paste(x,"(",count,")"))
  Sys.sleep(1)
  if(wt) 
    r <- paste("*", x, "*")
  else
    r <- paste("#", x, "#")
  count <<- count + 1;
  return(r)
}
result <- sapply(df$w, myf)
length(result)
result
sapply(df$w, myf, F)
sapply(df$w, myf, wt=F)
rr1 <- sapply(df$w, myf, wt=F)
str(rr1)

count <- 1
sapply(df, myf)
rr2 <- sapply(df, myf)
str(rr2)
rr2[1,1]
rr2[1,"w"]

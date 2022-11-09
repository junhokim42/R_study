# 데이터 전처리 - 데이터 시각화를 학습하자

install.packages("showtext")
library(showtext)
showtext_auto() 
font_add(family = "cat", regular = "fonts/HoonWhitecatR.ttf")
font_add(family = "dog", regular = "fonts/THEdog.ttf")
font_add(family = "maple", regular = "fonts/MaplestoryBold.ttf")

rainbow(3)
rainbow(7)

par(c("mar","mfrow"))

국어<- c(4,7,6,8,5,5,9,10,4,10)  
plot(국어)

plot(국어, type="o", col="blue", family="maple")       
title(main="성적그래프", col.main="red", font.main=4, family="maple")

국어 <- c(4,7,6,8,5,5,9,10,4,10)
수학 <- c(7,4,7,3,8,10,4,10,5,7)


plot(국어, type="o", col="blue")
lines(수학, type="o", pch=16, lty=2, col="red")     
title(main="성적그래프", col.main="red", font.main=3)

국어 <- c(4,7,6,8,5,5,9,10,4,10)
par(mar=c(1,1,1,1), mfrow=c(4,2))

plot(국어, type="p", col="blue", main="type = p", xaxt="n", yaxt="n")
plot(국어, type="l", col="blue", main="type = l", xaxt="n", yaxt="n")
plot(국어, type="b", col="blue", main="type = b", xaxt="n", yaxt="n")
plot(국어, type="c", col="blue", main="type = c", xaxt="n", yaxt="n")
plot(국어, type="o", col="blue", main="type = o", xaxt="n", yaxt="n")
plot(국어, type="h", col="blue", main="type = h", xaxt="n", yaxt="n")
plot(국어, type="s", col="blue", main="type = s", xaxt="n", yaxt="n")
plot(국어, type="S", col="blue", main="type = S", xaxt="n", yaxt="n")
par(mar=c(5,5,5,5), mfrow=c(1,1))

국어 <- c(4,7,6,8,5,5,9,10,4,10); 
수학 <- c(7,4,7,3,8,10,4,10,5,7)

plot(국어, type="o", col="blue", ylim=c(0,10), axes=FALSE, ann=FALSE)

# x, y 축 추가하기
axis(1, at=1:10, lab=c("01","02","03","04", "05","06","07","08","09","10"), family="maple") # x축 추가
axis(2, at=c(0,2,4,6,8,10), family="maple")  # y축 추가

# 그래프 추가하고, 그래프에 박스 그리기
lines(수학, type="o", pch=16, lty=2, col="red")    
box()   # 박스 그리기

# 그래프 제목, 축의 제목, 범례 나타내기
title(main="성적그래프", col.main="red", family="maple") 
title(xlab="학번", col.lab=rgb(0,1,0), family="maple")  
title(ylab="점수", col.lab=rgb(1,0,0), family="maple")  
legend(8, 3, c("국어","수학"), cex=1.2, col=c("blue","red"), pch=c(21,16), lty=c(1,2))  



(성적 <- read.table("data/성적.txt", header=TRUE))

plot(성적$학번, 성적$국어, main="성적그래프", xlab="학번", ylab="점수",  xlim=c(0, 11), ylim=c(0, 11)) 

ymax <- max(성적[3:5]) #성적 데이터 중에서 최대값을 찾는다(y 축의 크기 제한)
ymax
pcols<- c("red","blue","green")
png(filename="output/성적.png", height=400, width=700, bg="white") # 출력을 png파일로 설정
plot(성적$국어, type="o", col=pcols[1], ylim=c(0, ymax), axes=FALSE, ann=FALSE)
axis(1, at=1:10, lab=c("01","02","03","04","05","06","07","08","09","10"))
axis(2, at=c(0,2,4,6,8,10), lab=c(0,2,4,6,8,10))
box()
lines(성적$수학, type="o", pch=16, lty=2, col=pcols[2])
lines(성적$영어, type="o", pch=23, lty=3, col=pcols[3] )
title(main="성적그래프", col.main="red", font.main=4)
title(xlab="학번", col.lab=rgb(1,0,0))
title(ylab="점수", col.lab=rgb(0,0,1))
legend(1, ymax, names(성적)[c(3,4,5)], cex=0.8, col=pcols, pch=c(21,16,23), lty=c(1,2,3))
dev.off()

plot(성적$국어, 성적$수학)
plot(수학~국어) # 포뮬러식

?plot


# 막대그래프 그리기
ls()
barplot(국어)

coldens <- seq(from=10, to=100, by=10)   # 막대그래프의 색밀도 설정을 위한 벡터
xname <- 성적$학번                                         # X 축 값 설정위한  벡터
barplot(성적$국어, main="성적그래프", xlab="학번", 
        ylab="점수", border="red", col="green", density=coldens, 
        names.arg=xname, family="dog")

# 학생의 각 과목에 대한 각각의 점수에 대한 그래프
성적1<- 성적[3:5] 
str(성적1)
par(mar=c(5,5,5,5), mfrow=c(1,1))
barplot(as.matrix(성적1), main="성적그래프", beside=T, 
        ylab="점수", col=rainbow(10), family="cat")

par(mar=c(5,5,5,5), mfrow=c(1,2))
barplot(as.matrix(성적1), main="성적그래프", ylab="점수", 
        col=rainbow(10))
barplot(t(성적1), main="성적그래프", ylab="점수", col=rainbow(3))

par(mar=c(5,5,5,5), mfrow=c(1,1))
# 학생의 각 과목에 대한 합계 점수에 대한 그래프
xname <- 성적$학번;    #  x축 레이블용 벡터
par(xpd=T, mar=par()$mar+c(0,0,0,4));   # 우측에 범례가 들어갈 여백을 확보
barplot(t(성적1), main="성적그래프", ylab="점수", col=rainbow(3), space=0.1, cex.axis=0.8, names.arg=xname, cex=0.8)
legend(11,30, names(성적1), cex=0.8, fill=rainbow(3));

par(xpd=T, mar=c(5,5,5,2));   # 우측에 범례가 들어갈 여백을 확보
barplot(t(성적1), main="성적그래프", ylab="점수", col=rainbow(3), space=0.1, cex.axis=0.8, names.arg=xname, cex=0.8)
legend(11,30, names(성적1), cex=0.8, fill=rainbow(3));


# 학생의 각 과목에 대한 합계 점수에 대한 그래프(가로막대 그래프)
xname <- 성적$학번;    #  x축 레이블용 벡터
barplot(t(성적1), main="성적그래프", ylab="학번", 
        col=rainbow(3), space=0.1, cex.axis=2.0, 
        names.arg=xname,cex.lab=3.0, horiz=T);
legend(30,11, names(성적1), cex=0.8, fill=rainbow(3))

?barplot


# 파이그래프
(성적 <- read.table("data/성적.txt", header=TRUE));
pie(성적$국어, labels=paste(성적$성명, "-", 성적$국어),col=terrain.colors(10))
pie(성적$국어, clockwise=T, labels=paste(성적$성명, "-", 성적$국어), 
    col=rainbow(10))
pie(성적$국어, density=10, clockwise=T, labels=paste(성적$성명, "-", 성적$국어), col=rainbow(10))
pie(성적$국어, labels=paste(성적$성명, "-", 성적$국어), col=rainbow(10), main="국어성적", edges=10)
pie(성적$국어, labels=paste(성적$성명,"\n","(",성적$국어,")"), col=rainbow(10))
pie(rep(1, 24), col = rainbow(24), radius = 1.2, main="파이그래프", col.main="green", cex.main=3, family="dog")




ls()
# 히스토그램
hist(성적$국어, main="성적분포-국어", 
     xlab="점수", breaks=5, 
     col = "lightblue", border = "pink", family='dog')
hist(성적$수학, main="성적분포-수학", 
     xlab="점수", col = "lightblue", 
     breaks=2, border = "pink")
hist(성적$국어, main="성적분포-국어", 
     xlab="점수", ylab="도수", 
     col=rainbow(12), border = "pink")

nums <- sample(1:100, 30)
hist(nums, family='maple')
hist(nums, breaks=c(0,10,20,30,40,50,60,70,80,90,100))
hist(nums, breaks=10)
hist(nums, breaks=2)
hist(nums, breaks=c(0,50,100), probability = T)
hist(nums, breaks=c(0,50,100))
hist(nums, breaks=c(0,30,100))
hist(nums, breaks=c(0,33,66,100))
hist(nums, breaks=c(0,33,66,100), freq=T)

# 적당한 구간수 구하기
5 * log10(30)
5 * log(30, 10)
nclass.Sturges(nums)# 구간수 구하는 함수, Sturges 공식
nclass.scott(nums) # 구간수 구하는 함수, 편차값 적용
nclass.FD(nums) # 구간수 구하는 함수, 사분위 범위 이용


# 박스플롯
summary(성적$국어)
boxplot(성적$국어, col="yellow",  ylim=c(0,10), xlab="국어", ylab="성적", family='dog')


성적2 <- 성적[,3:5]
boxplot(성적2, col=rainbow(3), ylim=c(0,10), ylab="성적")

data <- read.table("data/온도.txt", header=TRUE, sep=",")
head(data, n=5) 
dim(data)
str(data)
boxplot(data)
boxplot(data, las = 2)
boxplot(data, las = 2, at = c(1,2,3,4, 6,7,8,9, 11,12,13,14))
chtcols = rep(c("red","sienna","palevioletred1","royalblue2"), times=3)
chtcols
boxplot(data, las = 2, at = c(1,2,3,4, 6,7,8,9, 11,12,13,14), col=chtcols)
grid(col="gray", lty=2, lwd=1)
#old <- par(family = "maple")
#par(old)
boxplot(data, family='maple')  # 안됨!! 다른 아이들은 다 되는데!!

boxplot(data, axes=F)
axis(1, at=1:12, lab=names(data), family="maple") # x축 추가
axis(2, at=seq(-5, 15, 5), family="cat")
title("다양하게 폰트를 지정한 박스플롯", family="dog", cex.main=2)
box()

dev.copy(png, "output/mytest.png") 
dev.off()

rainbow(10)
heat.colors(10)
terrain.colors(10)
topo.colors(10)
cm.colors(10)
gray.colors(10)
colors()

########################################################################
# 난생처음 교재 소스 : 282 페이지
# 8장 : 기본그래프 작성하기 1

favorite <- c('WINTER', 'SUMMER', 'SPRING', 'SUMMER', 'SUMMER',
              'FALL', 'FALL', 'SUMMER', 'SPRING', 'SPRING')   # 자료 입력
favorite                            # favorite의 내용 출력
table(favorite)                     # 도수분포 계산


ds <- table(favorite)                      # 도수분포표 저장
ds       

# 도수분포표 내용 확인     
barplot(ds, main='favorite season')        # 막대그래프 작성



barplot(ds, main='favorite season', 
        col='blue')                   # 막대의 색 지정


barplot(ds, main='favorite season', 
        col=c('blue','red','green','yellow'))     # 막대의 색을 각각 지정

barplot(ds, main='favorite season', 
        col=rainbow(4))       # 레인보우 팔레트에서 4개의 색을 선택


barplot(ds, main='favorite season', 
        col='green',                           # 막대의 색을 지정
        xlab='계절',                           # x축 설명
        ylab='빈도수' )                        # y축 설명


barplot(ds, main='favorite season', 
        col='yellow',                          # 막대의 색을 지정
        horiz=TRUE)                            # 세로 방향 출력    



barplot(ds, main='favorite season', 
        col='yellow',                          # 막대의 색을 지정
        names=c('FA','SP','SU','WI'))          # 그룹 이름을 바꾸어 출력    


barplot(ds, main='favorite season', 
        col='green',                          # 막대의 색을 지정
        las=2)                                # 그룹 이름을 수직 방향으로    


age.A <- c(13709, 10974, 7979, 5000, 4250)
age.B <- c(17540, 29701, 36209, 33947, 24487)
age.C <- c(991, 2195, 5366, 12980, 19007)

ds <- rbind(age.A, age.B, age.C)
colnames(ds) <- c('1970','1990','2010','2030','2050')  
ds
str(ds)
class(ds)

# 그래프의 작성
barplot(ds, main='인구 추정')    


barplot(ds, main='인구 추정', 
        col=c('green','blue','yellow'))


barplot(ds, main='인구 추정', 
        col=c('green','blue','yellow'),
        beside=TRUE)


barplot(ds, main='인구 추정', 
        col=c('green','blue','yellow'),
        beside=TRUE,
        legend.text=T)

par(mfrow=c(1, 1), mar=c(5, 5, 5, 7))
barplot(ds, main='인구 추정', 
        col=c('green','blue','yellow'),
        beside=TRUE,
        legend.text=T,
        args.legend = list(x='topright', bty='n', inset=c(-0.25,0)))

par(mfrow=c(1, 1), mar=c(5, 5, 5, 7))        # 그래프 윈도우 설정
barplot(ds, main='인구 추정', 
        col=c('green','blue','yellow'),
        beside=TRUE,
        legend.text=c('0~14세','15~64세','65세 이상'),
        args.legend = list(x='topright', bty='n', inset=c(-0.25,0)))
par(mfrow=c(1, 1), mar=c(5,4,4,2)+0.1)      # 그래프창 설정 해제


head(cars)                    
dist <- cars[,2]              # 자동차 제동거리
dist
hist(dist,                    # data
     main='Histogram for 제동거리',   # 제목
     xlab ='제동거리',        # x축 레이블              
     ylab='빈도수',           # y축 레이블                     
     border='blue',           # 막대 테두리색  
     col='green',             # 막대 색
     las=2,                   # x축 글씨 방향(0~3) 
     breaks=2)                # 막대 개수 조절


result <- hist(dist,                    # data
               main='Histogram for 제동거리',    # 제목
               breaks=5)                # 막대 개수 조절
result
freq <- result$counts                   # 구간별 빈도수 저장
names(freq) <- result$breaks[-1]        # 구간값을 이름으로 지정
freq                                    # 구간별 빈도수 출력

par(mfrow=c(2,2), mar=c(3,3,4,2))     # 화면 분할(2x2)               

hist(iris$Sepal.Length,               # 그래프 1
     main='Sepal.Length',
     col='orange')             

barplot(table(mtcars$cyl),            # 그래프 2
        main='mtcars',
        col=c('red','green','blue'))              

barplot(table(mtcars$gear),           # 그래프 3
        main='mtcars',
        col=rainbow(3),               # 레인보우 팔레트 사용
        horiz=TRUE)              

pie(table(mtcars$cyl),                # 그래프 4
    main='mtcars',
    col=topo.colors(3),           # topo 팔레트 사용
    radius=2)              

par(mfrow=c(1,1), mar=c(5,4,4,2)+.1)  # 화면 분할 취소 


par(mfrow = c(2,2), mar = c(6,6,3,3))

barplot(table(chickwts$feed), main = 'distribution by Feed Type',
        horiz = T, las = 1, col = 'green')

hist(Orange$age, main = 'the age of orange',
     breaks = 4, xlab = 'day', col = 'yellow', border = 'blue')

barplot(table(chickwts$feed), main = 'distribution by Feed Type',
        las = 2, col = 'green')

hist(Orange$age, main = 'the age of orange',
     breaks = 6, xlab = 'day', col = 'yellow', border = 'blue')

par(mfrow = c(1,1), mar = c(5,4,4,2)+.1)

# 9장 : 기본그래프 작성하기 2

favorite <- c('WINTER', 'SUMMER', 'SPRING', 'SUMMER', 'SUMMER',
              'FALL', 'FALL', 'SUMMER', 'SPRING', 'SPRING')   # 자료 입력
ds <- table(favorite)                                         # 도수분포 계산
ds                
pie(ds, main='선호 계절',                                     # 원그래프 작성
    radius=1) 

pie(ds, main='선호 계절',
    col=c('brown','green','red','black'),    # 파이의 색 지정
    radius=1 )                               # 파이의 크기 지정 

install.packages('plotrix')

library(plotrix)
pie3D(ds, main='선호 계절',
      labels=names(ds),                              # 파이별 레이블 지정
      labelcex=1.0,                                  # 레이블의 폰트 크기
      explode=0.1,                                   # 파이 간 간격
      radius=1.5,                                    # 파이의 크기 
      col=c('brown','green','red','yellow'))         # 파이의 색 지정

month = 1:12                             # 자료 입력
late  = c(5,8,7,9,4,6,12,13,8,6,6,4)     # 자료 입력      
plot(month,                              # x data
     late,                               # y data
     main='지각생 통계',                 # 제목 
     type='l',                           # 그래프의 종류 선택(알파벳) 
     lty=1,                              # 선의 종류(line type) 선택
     lwd=1,                              # 선의 굵기 선택
     xlab='Month',                       # x축 레이블
     ylab='Late cnt'                     # y축 레이블
)

month = 1:12
late1  = c(5,8,7,9,4,6,12,13,8,6,6,4)
late2  = c(4,6,5,8,7,8,10,11,6,5,7,3)
plot(month,                                # x 데이터
     late1,                                # y 데이터
     main='Late students',
     type='b',                             # 그래프의 종류 선택(알파벳)
     lty=1,                                # 선의 종류(line type) 선택
     col='red',                            # 선의 색깔 선택          
     xlab='Month',                         # x축 레이블
     ylab='Late cnt'                       # y축 레이블
)
lines(month,                               # x 데이터
      late2,                                # y 데이터
      type='b',                             # 선의 종류(line type) 선택
      col='blue')                           # 선의 색깔 선택

dist <- cars[,2]                      # 자동차 제동거리 (단위: 피트)
boxplot(dist, main='자동차 제동거리')

boxplot.stats(dist)

boxplot(Petal.Length~Species,            # 자료와 그룹 정보
        data=iris,                       # 자료가 저장된 자료구조
        main='품종별 꽃잎의 길이',       # 그래프의 제목    
        col=c('green','yellow','blue'))  # 상자들의 색

wt <-mtcars$wt                   # 중량 자료
mpg <- mtcars$mpg                # 연비 자료
plot(wt, mpg,                    # 2개 변수(x축, y축)     
     main='중량-연비 그래프',    # 제목
     xlab='중량',                # x축 레이블
     ylab='연비(MPG)',           # y축 레이블
     col='red',                  # point의 color
     pch=19)                     # point의 종류 

vars <- c('mpg','disp','drat','wt')    # 대상 변수 
target <- mtcars[,vars]                # 대상 자료 생성  
head(target)
pairs(target,                          # 대상 자료     
      main='Multi plots') 

iris.2 <- iris[,3:4]                # 데이터 준비
levels(iris$Species)                # 그룹 확인
group <- as.numeric(iris$Species)   # 점의 모양과 색
group                               # group 내용 출력
color <- c('red','green','blue')    # 점의 컬러
plot(iris.2, 
     main='Iris plot',
     pch=c(group),
     col=color[group]) 

plot(iris.2, 
     main='Iris plot',
     pch=c(group),
     col=color[group]) 

legend(x='bottomright',               # 범례의 위치  
       legend=levels(iris$Species),   # 범례의 내용
       col=c('red','green','blue'),   # 색 지정
       pch=c(1:3))                    # 점의 모양 

# 난생처음 교재 소스 : 351 페이지


# problem1
iris;
str(iris)

# problem2
(df1 <- data.frame(x = 1:5, y = x*2))

# problem3
col1 <- 1:5
col2 <- letters[1:5]
col3 <- 6:10
(df2 <- data.frame(col1, col2, col3))

# problem4
제품명 <- c('사과','딸기','수박')
가격 <- c(1800,1500,3000)
판매량 <- c(24,38,13)
(df3 <- data.frame(제품명, 가격, 판매량))

# problem5
(과일가격평균 = mean(df3$가격))
(판매량평균 = mean(df3$판매량))

# problem6
name <- c("Potter", "Elsa", "Gates", "Wendy", "Ben")
gender <- factor(c("M", "F", "M", "F", "M"))
math <- c(85, 76, 99, 88, 40)

(df4 <- data.frame(name, gender, math))
df4$stat <- c(76, 73, 95, 82, 35)
df4$score <- df4$stat + df4$math
df4$grade <- ifelse(df4$score >= 150,'A',
                    ifelse(df4$score >= 100, 'B',
                           ifelse(df4$score >= 70, 'C','D')))

#problem7~15
myemp <- read.csv("data/emp.csv")
str(myemp)

myemp[3:5,]
myemp[,-4]
myemp$ename
myemp[,c('ename','sal')]

subset(myemp[,c('ename', 'sal','job')],myemp$job=="SALESMAN") 
subset(myemp[,c('ename', 'sal','deptno')],1000 <= myemp$sal & myemp$sal <= 3000)
subset(myemp[,c('ename', 'job','sal')],myemp$job !="ANALYST")

#problem16~20
myemp[is.na(myemp$comm),][,c('ename','sal')]
subset(myemp[,c('ename','sal')], is.na(myemp$comm) == 'TRUE')

(myemp[order(myemp$sal),])
dim(myemp)

table(myemp$deptno)
table(myemp$job)
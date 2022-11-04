# Problem1
countEvenOdd <- function(x){
  num_odd <- 0
  num_even <- 0
  if(!is.vector(x)) return(NULL)
  for(i in x){
    if(!is.numeric(i)) return(NULL)
    ifelse(i%%2 == 0, num_even <- num_even + 1, num_odd <- num_odd + 1)
  }
  answer <- list(even=num_even, odd=num_odd)
  return(answer)
}
countEvenOdd(c(2,3,4,5,6,87,56))
countEvenOdd(c(2,3,4,5,6,'dd'))
countEvenOdd(list(2,3,4,5,6,'dd'))
countEvenOdd(matrix(1:9, nrow=3))

# Problem2
vmSum <- function(x){
  if(is.vector(x) && !is.list(x)) {
    if(any(!is.numeric(x))){
      print("숫자 백터만 전달하세요")
      return(0)
    }else{
      result <- sum(x)
    }
  } else {
    return("백터만 전달하세요")
  }

  return(result)
}
vmSum(c(3,5,6,3,6,7))
vmSum(c(3,5,6,3,6,7,'q'))
vmSum(data.frame(333))

# Problem3
vmSum2 <- function(x){
  if(is.vector(x) && !is.list(x)) {
    if(any(!is.numeric(x))){
      warning("숫자 백터만 전달하세요")
      return(0)
    }else{
      result <- sum(x)
    }
  } else {
    stop("백터만 전달하세요")
  }
  
  return(result)
}
vmSum2(c(3,5,6,3,6,7))
vmSum2(c(3,5,6,3,6,7,'q'))
vmSum2(data.frame(333))

# Problem4
mySum <- function(x){
  if (is.null(x))
    return()
  else if(!is.vector(x) || is.list(x))
    stop("백터만 처리가능\n")
  else{
    if (any(is.na(x))){
      warning("NA를 최저값으로 변경하여 처리함\n")
      x[is.na(x)] <- min(x, na.rm = T)
    }
    oddSum <- sum(x[seq(1, length(x), 2)])
    evenSum <- sum(x[seq(2, length(x), 2)])
    return(list(oddSum = oddSum, evenSum = evenSum))
  }
}
mySum(c(1,2,NA,NA,NA,9,10))
mySum(c(1:5))
mySum(data.frame())
mySum(NULL)

# Problem5
myExpr <- function(x){
  if(!is.function(x))
    stop("수행하지 않음")
  else{
    problem5_sample <<- sample(1:45, 6)
    return(x(problem5_sample))
  }
}
myExpr(cat)
problem5_sample

myExpr(max)
problem5_sample

myExpr(sum)
problem5_sample

myExpr(mySum)
problem5_sample

myExpr(2)

# Problem6
createVector1 <- function(...){
  v <- c(...)
  if(is.null(v))
    return(NULL)
  else if(any(is.na(v)))
    return(NA)
  else
    return(v)
}
createVector1(1,2,3,4,5)
createVector1(1,2,3,4,NA)
createVector1(1,2,3,4,T)
createVector1(1,2,F,4,5,6,"A")
createVector1()

# Problem7
createVector2 <- function(...){
  num <- c()
  cha <- c()
  logi <- c()
  datas <- list(...)
  if (length(datas) == 0)
    return()
  else{
    for (data in datas){
      if (is.numeric(data))
        num <- c(num, data)
      else if(is.character(data))
        cha <- c(cha, data)
      else if (is.logical(data))
        logi <- c(logi, data)
    }
    return(list(numeric = num, character = cha, logical = logi))
  }
}

createVector2(1,2,3,4,5)
createVector2(1,2,3,4,TRUE, NA)
createVector2(FALSE,2, NA, "fe")

# Problem8
iotest1 <- read.table("data/iotest1.txt", header = TRUE)
iotest1 <- scan("data/iotest1.txt", sep = " ")
iotest1

cat("오름차순:", sort(iotest1), "\n")
cat("내림차순:", sort(iotest1, decreasing=T), "\n")
cat("합:", sum(iotest1), "\n")
cat("평균:", mean(iotest1), "\n")

# Problem9
iotest2 <- scan("data/iotest2.txt", what = "")
(iotest2 <- table(iotest2))
(iotest2 <- names(which.max(iotest2)))
cat("가장 많이 등장한 단어는", iotest2, "입니다")

# Problem1
exam1 <- function() {
  alpha <- paste(LETTERS,letters, sep="")
  return(alpha)
}
exam1()

# Problem2
exam2 <- function(x){
  sum = 0
  for(item in 1:x) {
    sum <- sum + item
  }
  return(sum)
}
exam2(10)
exam2(5)

# Problem3
exam3 <- function(x, y){
  return(abs(x-y))
}
exam3(10,20)
exam3(20,5)
exam3(5,30)
exam3(6,3)
exam3(3,3)

# Problem4
exam4 <- function(x,y,z){
  answer <- switch(EXPR=y,
                  "+"=x+z,
                  "-"=x-z,
                  "*"=x*z,
                  "%/%"=x%/%z,
                  "%%"=x%%z,
                  "규격의 연산자만 전달하세요")
  
  if(y == '%/%' && x == 0){
    answer <- "오류1"
  }else if(y == '%%' && z == 0){
    answer <- "오류2"
  }
  
  return(answer)
}

exam4(20,'+',6)
exam4(20,'^',6)
exam4(0,'%%',6)
exam4(20,'%/%',0)
exam4(20,'%%',6)
exam4(20,'%%',0)

# Problem5
exam5 <- function(x,y="#"){
  if(x<0){
    return(NULL)
  }else{
    cat(rep(y, x), '\n',sep="")
  }
}
exam5(4)
exam5(-4)
exam5(7,"&")

# Problem6
exam6 <- function(x){
  a <- c()
  for(i in x){
    if(is.na(i) == TRUE){
      a <- c(a,'처리불가')
    }else if(i>=85){
      a <- c(a,'상등급')
    }else if(i>=70){
      a <- c(a,'중등급')
    }else{
      a <- c(a,'하등급')
    }
  }
  
  answer <- for(i in 1:length(a)){
    cat(as.character(x[i]), "점은 ",a[i],"입니다.",'\n',sep="")
  }
  return(answer)
}
exam6(c(80,50,70,66,NA,35))
exam6(c(100,85,84,NA,70,69))

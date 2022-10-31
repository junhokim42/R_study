# Problem1
L1 <- list(name = "scott", sal = 3000)
L1$sal
(result1 <- L1[["sal"]]*2)

# Problem2
L2 <- list("scott", c(100,200,300))
L2[[1]]
L2[[2]]

# Problem3
L3 <- list(c(3,5,7), c("A","B","C"))
L3[[2]][[1]] <- "Alpha"
L3

# Problem4
L4 <- list(alpha=0:4, beta=sqrt(1:5), gamma=log(1:5))
(L4[["alpha"]] +10)
L4

# Problem5
emp <- read.csv("data/emp.csv")
L5 <- list(data1=list(LETTERS),
           data2=emp[1:3,], data3=L4)
for(num in 1:3){
  if(num == 1){
    print(L5[[num]][[num]][1])
  }else{
    print(L5[[num]][[num]])
  }
}

# Problem6
L6 <- list(math=list(95,90), writing=list(90,85), reading=list(85,80))
mean(unlist(L6))

# Problem7
grade <- sample(1:6,1)
if (grade >= 4){
  cat(grade,"학년은 고학년입니다","\n")
}else {
  cat(grade,"학년은 저학년입니다","\n")
}

cat(grade, ifelse(grade<=3, "학년은 저학년", "학년은 고학년"), "\n")

# Problem8
(choice <- sample(1:5,1))
if (choice == 1){
  cat("결과값:",300+50,"\n")
}else if (choice == 2){
  cat("결과값:",300-50,"\n")
}else if (choice == 3){
  cat("결과값:",300*50,"\n")
}else if (choice == 4){
  cat("결과값:",300/50,"\n")
}else {
  cat("결과값:",300%%50,"\n")
}

result <- switch(EXPR=choice, 300+50, 300-50, 300/50, 300%%50)
cat("결과값:", result)

# Problem9
(count <- sample(3:10,1))
(deco <- sample(1:3,1))
if (deco == 1){
  cat(rep("*",count),"\n", sep="")
}else if (deco == 2){
  cat(rep("$",count),"\n", sep="")
}else {
  cat(rep("#",count),"\n", sep="")
}

deco <- switch(EXPR=deco,"*","$","#")
cat(rep(deco, count), '\n',sep="")

# Problem10
(score <- sample(0:100, 1))
level <- switch(EXPR=as.character(score%/%10),
                 "10"=,"9"="A등급",
                 "8"= "B등급",
                 "7"= "C등급",
                 "6"= "D등급",
                 "F등급")

level

# Problem11
alpha <- c()
for(n in 1:26)
  alpha= c(alpha,paste0(LETTERS[n],letters[n]))

alpha <- paste(LETTERS,letters, sep="")
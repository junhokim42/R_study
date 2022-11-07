html = 'https://www.megabox.co.kr/movie-detail/comment?rpstMovieNo=21049700'
remDr$navigate(html)

#평점
grade_all <- c()

#좋았던 부분
like_all <- c()

#감상평
comment_all <- c()

# 첫페이지 크롤링
for(i in 1:11){
  grade <- remDr$findElements(using='css selector', paste0('#contentData > div > div.movie-idv-story > ul > li:nth-child(',i,') > div.story-area > div.story-box > div > div.story-cont > div.story-point'))
  grade_all <- c(grade_all, sapply(grade,function(x){x$getElementText()}))
  
  like <- remDr$findElements(using='css selector', paste0('#contentData > div > div.movie-idv-story > ul > li:nth-child(',i,') > div.story-area > div.story-box > div > div.story-cont > div.story-recommend'))
  like_all <- c(like_all, sapply(like,function(x){x$getElementText()}))
  
  comment <- remDr$findElements(using='css selector', paste0('#contentData > div > div.movie-idv-story > ul > li:nth-child(',i,') > div.story-area > div.story-box > div > div.story-cont > div.story-txt'))
  comment_all <- c(comment_all, sapply(comment,function(x){x$getElementText()}))
}

# 2~10 페이지
for(i in 2:10){
  page <- paste0('#contentData > div > div.movie-idv-story > nav > a:nth-child(',i,')', sep="")                
  nextpage <- NULL
  try(nextpage<-remDr$findElement(using='css selector',page))
  if(length(nextpage) == 0)   break;
  nextpage$clickElement()
  Sys.sleep(1)
  
  for(i in 1:11){
    grade <- remDr$findElements(using='css selector', paste0('#contentData > div > div.movie-idv-story > ul > li:nth-child(',i,') > div.story-area > div.story-box > div > div.story-cont > div.story-point'))
    grade_all <- c(grade_all, sapply(grade,function(x){x$getElementText()}))
    
    like <- remDr$findElements(using='css selector', paste0('#contentData > div > div.movie-idv-story > ul > li:nth-child(',i,') > div.story-area > div.story-box > div > div.story-cont > div.story-recommend'))
    like_all <- c(like_all, sapply(like,function(x){x$getElementText()}))
    
    comment <- remDr$findElements(using='css selector', paste0('#contentData > div > div.movie-idv-story > ul > li:nth-child(',i,') > div.story-area > div.story-box > div > div.story-cont > div.story-txt'))
    comment_all <- c(comment_all, sapply(comment,function(x){x$getElementText()}))
  }
}

grade_all <- unlist(grade_all)
like_all <- unlist(like_all)
comment_all <- unlist(comment_all)

movie <- data.frame(grade = grade_all, like = like_all, comment = comment_all)
View(movie)
write.csv(movie, "output/movie.csv", fileEncoding='CP949')

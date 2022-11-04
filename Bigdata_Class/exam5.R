library() 
installed.packages()
search()

# install.packages("rvest") 
# install.packages("XML")
# install.packages("httr")


# [ 예제1 ]
library(rvest)

url <- "http://unico2013.dothome.co.kr/crawling/tagstyle.html"
text <- read_html(url)
text

str(text)
text$doc

nodes <- html_nodes(text, "div") # 태그 선택자
nodes

title <- html_text(nodes)
title

node1 <- html_nodes(text, "div:nth-of-type(1)")
node1
html_text(node1)
html_attr(node1, "style")

node2 <- html_nodes(text, "div:nth-of-type(2)")
node2
html_text(node2)
html_attr(node2, "style")

node3 <- html_nodes(text, "div:nth-of-type(3)")
node3
html_text(node3)

# [ 예제2 ]
# 웹문서 읽기
url <- "https://www.data.go.kr/tcs/dss/selectDataSetList.do"
html <- read_html(url)
html

# 목록 아이템 추출
title <- html_text(html_nodes(html, "#apiDataList .title"))
title

# 목록 아이템 설명 추출
desc <- html_text(html_nodes(html, "#apiDataList .ellipsis"))
desc

# 데이터 정제: 제어문자를 공백으로 대체
title <- gsub("[[:cntrl:]]", "", title)
title

desc <- gsub("[[:cntrl:]]", "", desc)
desc

# 데이터 출력
openapidf <- data.frame(title, desc)
openapidf
View(openapidf)
write.csv(openapidf, "output/openapi.csv", fileEncoding='CP949')


# [ 예제3 ]
# 영화 제목과 평점 읽기
url<- "http://movie.naver.com/movie/point/af/list.nhn?"
html <- read_html(url)
html
# 영화제목
nodes <- html_nodes(html, ".movie")
title <- html_text(nodes)
title
# 영화평점
nodes <- html_nodes(html, ".title em")
point <- html_text(nodes)
point
onepagedf1 <- data.frame(title, point)
print(onepagedf1)

# [ 예제4 ]
# 영화 제목, 평점, 리뷰글 읽기(1)
url<- "http://movie.naver.com/movie/point/af/list.nhn?page=1"
html <- read_html(url)
html
# 영화제목
nodes <- html_nodes(html, ".movie")
title <- html_text(nodes)
title
# 영화평점
nodes <- html_nodes(html, ".title em")
point <- html_text(nodes)
point
# 영화 리뷰글
nodes <- html_nodes(html, ".title")
review <- html_text(nodes, trim=TRUE)
review

# 영화 리뷰글
nodes <- html_nodes(html, xpath='//*[@id="old_content"]/table/tbody/tr/td[2]/text()')
review <- html_text(nodes, trim=TRUE)
review
review <- review[seq(4,50,5)]
review

onepagedf2 <- data.frame(title, point, review)
print(onepagedf2)
View(onepagedf2)


# [ 예제5 ]
# 영화 제목, 평점, 리뷰글 읽기(2)
vtitle<-NULL; vpoint<-NULL; vreview<-NULL; page=NULL
url<- "http://movie.naver.com/movie/point/af/list.nhn?page=1"
html <- read_html(url)
html

for (index in 1:10) {
  # 영화제목
  node <- html_node(html, paste0("#old_content > table > tbody > tr:nth-child(", index, ") > td.title > a.movie.color_b"))
  title <- html_text(node)
  vtitle[index] <- title
  # 영화평점
  node <- html_node(html, paste0("#old_content > table > tbody > tr:nth-child(", index,") > td.title > div > em"))
  point <- html_text(node)
  vpoint <- c(vpoint, point)
  # 영화리뷰 
  node <- html_nodes(html, xpath=paste0('//*[@id="old_content"]/table/tbody/tr[', index,"]/td[2]/text()"))
  node <- html_text(node, trim=TRUE)
  print(node)
  review = node[4] 
  vreview <- append(vreview, review)
}
page <- data.frame(vtitle, vpoint, vreview)
View(page)
write.csv(page, "output/movie_reviews_1page.csv")

# [ 예제6 ]
# 영화 제목, 평점, 리뷰글 읽기(3)
site<- "http://movie.naver.com/movie/point/af/list.nhn?page="
html <- NULL
movie.review <- NULL
for(i in 1: 100) {
  url <- paste0(site, i)
  html <- read_html(url)
  nodes <- html_nodes(html, ".movie")
  title <- html_text(nodes)
  nodes <- html_nodes(html, ".title em")
  point <- html_text(nodes)
  nodes <- html_nodes(html, xpath="//*[@id='old_content']/table/tbody/tr/td[2]/text()")
  imsi <- html_text(nodes, trim=TRUE)
  review <- imsi[nchar(imsi) > 0] 
  if(length(review) == 10) {
    page <- data.frame(title, point, review)
    movie.review <- rbind(movie.review, page)
  } else {
    cat(paste(i," 페이지에는 리뷰글이 생략된 데이터가 있어서 수집하지 않습니다.ㅜㅜ\n"))
  }
}
View(movie.review)

rm(list=ls())

# [ 예제7 ]
# 영화 제목, 평점, 리뷰글 읽기(4)
site<- "http://movie.naver.com/movie/point/af/list.nhn?page="
html <- NULL
vtitle <- NULL
vpoint <- NULL
vreview <- NULL
movie.allreview <- NULL
for(i in 1: 100) {
  cat(i, "페이지\n")
  url <- paste0(site, i)
  html <- read_html(url)
  for (index in 1:10) {
    # 영화제목
    node <- html_node(html, paste0("#old_content > table > tbody > tr:nth-child(", index, ") > td.title > a.movie.color_b"))
    title <- html_text(node)
    vtitle[index] <- title
    # 영화평점
    node <- html_node(html, paste0("#old_content > table > tbody > tr:nth-child(", index,") > td.title > div > em"))
    point <- html_text(node)
    vpoint <- c(vpoint, point)
    # 영화리뷰 
    node <- html_nodes(html, xpath=paste0('//*[@id="old_content"]/table/tbody/tr[', index,"]/td[2]/text()"))
    node <- html_text(node, trim=TRUE)
    review = node[4] 
    vreview <- append(vreview, review)
  }
}
movie.allreview <- data.frame(vtitle, vpoint, vreview)
View(movie.allreview)
write.csv(movie.allreview, "output/movie_reviews_100page.csv")


# [ 예제8 ]
# 한겨레 페이지(XML 패키지 사용)
library(XML)
library(rvest)
imsi <- read_html("http://www.hani.co.kr/")
t <- htmlParse(imsi)
t
content<- xpathSApply(t,'//*[@id="main-top01-scroll-in"]/div/div/h4/a', xmlValue); 
content

# [ 예제9 ]
# W3C의 HTTP 프로토콜 스팩에서 Table of Contents 읽기
title2 = html_nodes(read_html('http://www.w3.org/Protocols/rfc2616/rfc2616.html'), 'div.toc h2')
title2 = html_text(title2)
title2

# [ 예제10 ]
# 뉴스, 게시판 등 글 목록에서 글의 URL만 뽑아내기 
htxt = read_html("https://news.naver.com/main/list.nhn?mode=LSD&mid=sec&sid1=001")
link = html_nodes(htxt, 'div.list_body a'); 
length(link)
article.href = unique(html_attr(link, 'href'))
article.href

# [ 예제11 ]
# 이미지, 첨부파일 다운 받기 
# pdf
library(httr)
res = GET('http://cran.r-project.org/web/packages/httr/httr.pdf')
writeBin(content(res, 'raw'), 'c:/Temp/httr.pdf')

# [ 예제10 ]
# jpg
h = read_html('http://unico2013.dothome.co.kr/productlog.html')
imgs = html_nodes(h, 'img')
img.src = html_attr(imgs, 'src')
for(i in 1:length(img.src)){
  res = GET(paste('http://unico2013.dothome.co.kr/',img.src[i], sep=""))
  writeBin(content(res, 'raw'), paste('c:/Temp/', img.src[i], sep=""))
} 



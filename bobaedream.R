library(RSelenium)
library(stringr)
library(rvest)
library(RCurl)
library(XML)
library(dplyr)

# 이미지 저장 위치 설정 
setwd("C:/Users/82102/Desktop/Bigdata 특강/빅데이터프로젝트/융복합프로젝트/보배드림이미지")

# 보배드림 국내차거래 메뉴 160페이지까지 html코드에서 img태그만 가져오기
for (i in 1:160){
  htmlcode <- getURL(paste0("https://www.bobaedream.co.kr/cyber/CyberCar.php?gubun=K&page=",i,"&order=S11&view_size=70")) %>% htmlParse %>% capture.output
  img_tag_pattern <- "<img.*?>"
  img_tag <- htmlcode %>% regmatches(regexpr(img_tag_pattern, .))
  
  src_href_pattern <- "(?<=src=\\\").*?(?=\\\")"
  src_href <- img_tag %>% regmatches(regexpr(src_href_pattern, ., perl=T))
  
  # img태그의 URL을 큰 이미지 파일 URL로 변경
  for(j in src_href %>% length %>% seq){
    src_href[j] <- gsub("thum5_","img_",src_href[j])
    src_href[j] <- gsub(".jpg","_1.jpg",src_href[j])
    try(download.file(paste0("https:", src_href[j]), paste0((i-1)*70+j,".jpg"), mode = 'wb'))
  }
}
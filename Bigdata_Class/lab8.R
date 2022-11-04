html <- read_html('https://news.daum.net/')
html

#뉴스 카테고리
category <- html_nodes(html, 'div.cont_thumb span.txt_category') 
category <- html_text(category)

#뉴스 제목
news_title <- c()
for(i in 1:20){
  title <- html_nodes(html, xpath=paste0('/html/body/div[2]/main/section/div/div[1]/div[1]/ul/li[',i,']/div/div/strong/a/text()'))
  title <- html_text(title, trim = T)
  title <- gsub("[[:cntrl:]]", "", title)
  news_title <- c(news_title, title)
}

news_title

#데이터프레임으로 CSV 파일 저장
(daumnews <- data.frame(newscategory = category, newstitle = news_title))
View(daumnews)
write.csv(daumnews, "output/daumnews.csv", fileEncoding='CP949')

# [ 예제13 ]
# SNS의 Open API 활용
library(httr)
library(rvest)
library(XML)
searchUrl<- "https://openapi.naver.com/v1/search/blog.xml"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"

query <- URLencode("수능")
url <- paste0(searchUrl, "?query=", query, "&display=100")
doc <- GET(url, add_headers("Content_Type" = "application/xml",
                            "X-Naver-client-Id" = Client_ID, "X-naver-Client-Secret" = Client_Secret))

# 블로그 내용에 대한 리스트 만들기		
doc2 <- xmlParse(doc, encoding="UTF-8")
text<- xpathSApply(doc2, "//item/description", xmlValue)
text
text1 <- gsub("</?b>", "", text) # </?b> --> <b> 또는 </b>
text1 <- gsub("&apos;|&quot;|&amp;", "", text1) 
text1

text[100]
text1[100]

# [ 예제14 ]
# 네이버 뉴스 연동  
searchUrl<- "https://openapi.naver.com/v1/search/news.xml"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"
query <- URLencode("빅데이터")
url <- paste0(searchUrl, "?query=", query, "&display=100")
doc <- GET(url, add_headers("Content_Type" = "application/xml",
                            "X-Naver-client-Id" = Client_ID, "X-naver-Client-Secret" = Client_Secret))

# 네이버 뉴스 내용에 대한 리스트 만들기		
doc2 <- xmlParse(doc)
text<- xpathSApply(doc2, "//item/description", xmlValue); 
text
text2 <- gsub("</?b>", "", text) # </?b> --> <b> 또는 </b>
text2 <- gsub("&apos;|&quot;|&amp;", "", text2)
text2

text[95:97]
text2[95:97]



# [ 예제15 ]
library(XML)
API_key  <- "%2BjzsSyNtwmcqxUsGnflvs3rW2oceFvhHR8AFkM3ao%2Fw50hwHXgGyPVutXw04uAXvrkoWgkoScvvhlH7jgD4%2FRQ%3D%3D"
bus_No <- "360"
url <- paste("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?serviceKey=", API_key, "&strSrch=", bus_No, sep="")
doc <- xmlParse(url)
top <- xmlRoot(doc)
top
df <- xmlToDataFrame(getNodeSet(doc, "//itemList"))
df
str(df)
View(df)

busRouteId <- df[df$busRouteNm == 360, "busRouteId"]
busRouteId

url <- paste("http://ws.bus.go.kr/api/rest/busRouteInfo/getStaionByRoute?ServiceKey=", API_key, "&busRouteId=", busRouteId, sep="")
doc <- xmlParse(url)
top <- xmlRoot(doc)
top
df <- xmlToDataFrame(getNodeSet(doc, "//itemList"))
df
View(df)
str(df)

# [ 예제16 ]
# 서울시 빅데이터- XML 응답 처리
# http://openapi.seoul.go.kr:8088/796143536a756e69313134667752417a/xml/LampScpgmtb/1/100/

library(XML)
key = '796143536a756e69313134667752417a'
contentType = 'xml'
startIndex = '1'
endIndex = '200'
url = paste0('http://openapi.seoul.go.kr:8088/',key,'/',contentType,'/LampScpgmtb/',startIndex,'/',endIndex,'/')

t <- xmlParse(url)
upNm<- xpathSApply(t,"//row/UP_NM", xmlValue) 
pgmNm<- xpathSApply(t,"//row/PGM_NM", xmlValue)
targetNm<- xpathSApply(t,"//row/TARGET_NM", xmlValue)
price<- xpathSApply(t,"//row/U_PRICE", xmlValue)
close(t)

df <- data.frame(upNm, pgmNm, targetNm, price)
View(df)
write.csv(df, "output/seoul_stedu.csv")


# 정규표현식 사용
word <- "JAVA javascript Aa 가나다 AAaAaA123 %^&*"
gsub(" ", "@", word)
sub(" ", "@", word)
gsub("A", "", word) 
gsub("a", "", word) 
gsub("[Aa]", "", word) 
gsub("A|a", "", word) 
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
gsub("\\d", "", word) 
gsub("\\D", "", word)
gsub("[[:digit:]]", "", word) 
gsub("[^[:alnum:]]", "", word) 
gsub("[[:space:]]", "", word) 
gsub("[[:punct:][:digit:]]", "", word) 
gsub("[[:punct:][:digit:][:space:]]", "", word) 



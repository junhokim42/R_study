library(RSelenium)

remDr <- remoteDriver(remoteServerAddr="localhost", port=4445, browserName="chrome")
remDr$open()

html = 'http://gs25.gsretail.com/gscvs/ko/products/event-goods'
remDr$navigate(html)

goodsname <- NULL
goodsprice <- NULL

twotoone <- remDr$findElement(using="css selector", "#TWO_TO_ONE")
twotoone$clickElement()
Sys.sleep(1)

#

index <- 0

repeat{
  for (i in 1:10){
    gs25css <- paste0("#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > div > span > a:nth-child(",i,")")
    gs25page <- remDr$findElements(using='css selector',gs25css)
    if(length(gs25page) == 0) 
      break
    sapply(gs25page,function(x){x$clickElement()})
    Sys.sleep(1)
    
    eventgoodsnodes <- remDr$findElements(using='css selector', '#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li > div > p.tit')
    eventgoodsname <- sapply(eventgoodsnodes, function(x) {x$getElementText()})
    goodsname <- c(goodsname, eventgoodsname)
    
    eventpricenodes <- remDr$findElements(using='css selector', '#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li > div > p.price > span')
    eventprice <- sapply(eventpricenodes, function(x) {x$getElementText()})
    eventprice <- gsub("[,원]", "", eventprice)
    goodsprice <- c(goodsprice, eventprice)
    index <- index + 1
    cat("현재",index,'페이지 처리중\n')
  }
  
  gs25css <- "#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > div > a.next"
  gs25page <- remDr$findElements(using='css selector',gs25css)
  sapply(gs25page,function(x){x$clickElement()})
  
  pageCheck <- remDr$findElements(using='css selector', '#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > div > span > a:nth-child(1)')
  pageCheck <- sapply(pageCheck, function(x) {x$getElementText()})
  pageCheck <- as.numeric(pageCheck)
  
  if(pageCheck != index + 1) 
    break
  Sys.sleep(1)
}

gs25 <- data.frame(goodsname = unlist(goodsname), goodsprice = goodsprice)
View(gs25)
write.csv(gs25, "output/gs25_twotoone.csv", fileEncoding='CP949')

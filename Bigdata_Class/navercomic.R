name <- c()
summary <- c()
grade <- c()

for(i in 1:20){
  html <- read_html(paste0("https://comic.naver.com/genre/bestChallenge?&page=",i))
  html
  
  comicName <- html_nodes(html, 'h6.challengeTitle a') 
  (comicName <- html_text(comicName, trim = T))
  
  comicSummary <- html_nodes(html, 'div.summary')
  (comicSummary <- html_text(comicSummary, trim = T))
  
  comicGrade <- html_nodes(html, 'div.rating_type strong')
  (comicGrade <- html_text(comicGrade, trim = T))
  
  name <- c(name, comicName)
  summary <- c(summary, comicSummary)
  grade <- c(grade, comicGrade)
}

webtoon <- data.frame(comicName = name, comicSummary = summary, comicGrade = grade)
View(webtoon)
write.csv(webtoon, "output/navercomic.csv", fileEncoding='CP949')

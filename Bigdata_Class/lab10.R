# Problem1

v <- sample(1:26,10)
v_letters <- sapply(v, function(d) paste(LETTERS[d], sep=""))
v_letters


# Problem2

df2 <- read.table("data/product_click.log", stringsAsFactors = T)
colnames(df2) <- c('clicktime', 'pid')
head(df2)

df2$clickday <- strptime(as.character(df2$clicktime), "%Y%m%d%H%M")
df2$clickday <- weekdays(df2$clickday)
df2$num <- 1
head(df2)

df2_tap <- tapply(df2$num, df2$clickday, sum) #목요일

# Problem3
lines <- readLines("data/memo.txt")

line1 <- gsub("[[:punct:]]", "", lines[1])

line2 <- gsub("e", "E", lines[2])

line3 <- gsub("[1-2]", "", lines[3])

line4 <- gsub(" R |Analysis|Big|Data", "", lines[4])

line5 <- gsub("[[:punct:]]", "", lines[5])
line5 <- gsub("[0-9]", "", line5)

line6 <- gsub(" ", "", lines[6])
new_lines <- c(line1, line2, line3, line4, line5, line6)

write(new_lines, "output/memo_new.txt")

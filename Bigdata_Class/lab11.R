# Problem1

df2 <- read.table("data/product_click.log", stringsAsFactors = T)
df2$num <- 1
df2_clickproduct <- tapply(df2$num, df2$V2, sum)

png(filename="output/clicklog1.png", height=700, width=700, bg="white")
barplot(df2_clickproduct, main="세로바 그래프 실습", xlab="상품ID", 
        ylab="클릭수", border="gray",
        col=terrain.colors(10), family="dog", cex.main=2, col.main="red")
dev.off()

# Problem2

df2$clickday <- strptime(as.character(df2$V1), "%Y%m%d%H%M")
df2$clickhour <- df2$clickday$hour
df2_clicktime <- tapply(df2$num, df2$clickhour, sum)

png(filename="output/clicklog2.png", height=700, width=700, bg="white")
pie(df2_clicktime, main="파이 그래프 실습",
    labels=paste(rownames(df2_clicktime),"-",
                 as.character(as.integer(rownames(df2_clicktime))+1)),
    col=terrain.colors(10), cex.main=2, col.main="blue")
dev.off()

# Problem3

grade <- read.table("data/성적.txt", header=TRUE)

png(filename="output/clicklog3.png", height=700, width=700, bg="white")
boxplot(grade[,3:5], col=rainbow(3), ylim=c(0,10),
        main="과목별 성적 분표", family="cat", cex.main=2, col.main="orange")
dev.off()

# Problem4

png(filename="output/clicklog4.png", height=700, width=700, bg="white")
barplot(t(as.matrix(grade[,3:5])), main="학생별 점수", 
        col=terrain.colors(3), names.arg=grade$성명,
        family="dog", cex.main=2, col.main="pink")
legend(10.5,29, names(grade[,3:5]), cex=0.8, fill=terrain.colors(3))
dev.off()

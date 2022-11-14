library(tidyr)
library(dplyr)
library(ggplot2)
library(MASS)

# Problem1
exam <- read.csv("data/score.csv")
ggplot(exam, aes(x=math, y=science, fill = class)) +  geom_point(colour = 'black', shape=21, size=1)

ggsave("output/result1.png")

# Problem2
ggplot(mpg, aes(x=class)) + geom_bar(aes(fill=drv))

ggsave("output/result2.png")

# Problem3
click <- read.table("data/product_click.log")
p <- ggplot(data = click, aes(x = V2, fill = V2)) +
  geom_bar(position = "dodge") + labs(title="제품 당 클릭 수",
                                      x ="상품 ID", y = "클릭수")

ggplotly(p)
ggsave(filename = "output/result3.png")

# Problem4
library(treemap)
data(GNI2014)
?treemap

png(filename = "output/result4.png", width = 800, height = 800)
treemap(GNI2014, vSize="population", vColor="continent", index=c("continent", "iso3"),
        title="전세계 인구정보", fontfamily.title="maple", border.col = "green",
        fontfamily.labels="maple")
dev.off()



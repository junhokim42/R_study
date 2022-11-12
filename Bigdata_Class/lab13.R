library(dplyr)
library(ggplot2)

# Problem1
mpg <- as.data.frame(ggplot2::mpg)
str(mpg)
dim(mpg)

mpg %>% head(10)
mpg %>% tail(10)

data(mpg)
View(mpg)
summary(mpg)

mpg %>% group_by(manufacturer) %>% tally()
mpg %>%
  group_by(manufacturer, model) %>%
  tally()

# Problem2
mpg_new <- mpg %>%
  rename(city = cty, highway = hwy)

summary(mpg_new)

# Problem3
## Q1
max(mpg %>% filter(displ <= 4) %>%
       summarise(mean_under4 = mean(hwy)),
     mpg %>% filter(displ >= 5) %>%
       summarise(mean_upper5 = mean(hwy)))

## Q2
max(mpg %>% filter(manufacturer == 'audi') %>%
      summarise(mean_audi = mean(cty)),
    mpg %>% filter(manufacturer == 'toyota') %>%
      summarise(mean_toyota = mean(cty)))

## Q3
mpg %>%
  filter(manufacturer == 'chevrolet' | manufacturer == 'ford' | manufacturer == 'honda') %>%
  summarise(mean = mean(hwy))

# Problem4

mpg_new <- mpg %>% select(class, cty)

mean_suv <- mpg_new %>% filter(class == 'suv') %>%
  summarise(mean_suv = mean(cty))

mean_compact <- mpg_new %>% filter(class == 'compact') %>%
  summarise(mean_compact = mean(cty))

max(mean_suv, mean_compact)

# Problem5
mpg %>% filter(manufacturer == 'audi') %>%
  arrange(desc(hwy)) %>% head(5)

# Problem6
library(tidyr)
grade2 <- read.csv("data/성적2.csv")
View(grade2)

grade2$국어 <- ifelse(grade2$국어 < 0 | grade2$국어 > 10,
                    round(mean(grade2$국어, na.rm = T)), grade2$국어)
grade2$수학 <- ifelse(grade2$수학 < 0 | grade2$수학 > 10,
                    round(mean(grade2$수학, na.rm = T)), grade2$수학)

fill(grade2, everything(), .direction = "updown")

boxplot(grade2[,3:4])

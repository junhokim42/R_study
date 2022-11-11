library(dplyr)

emp <- read.csv("data/emp.csv")
head(emp)

# Problem1
filter(emp, job == 'MANAGER')

# Problem2
emp %>% select(empno, ename, sal)

# Problem3
emp %>% select(-empno)

# Problem4
emp %>% select(ename, sal)

# Problem5
emp %>%
  group_by(job) %>% summarise(n = n())

emp %>%
  group_by(job) %>% tally()

# Problem6
emp %>%
  filter(sal >= 1000 & sal <= 3000) %>%
  select(ename, sal, deptno)

# Problem7
emp %>%
  filter(job != 'ANALYST') %>%
  select(ename, job, sal)

# Problem8
emp %>%
  filter(job == 'SALESMAN' | job == 'ANALYST') %>%
  select(ename, job)

# Problem9
emp %>%
  group_by(deptno) %>%
  summarise(sum_sal = sum(sal))  

# Problem10
emp %>% arrange(sal)

# Problem11
emp %>% arrange(desc(sal)) %>% head(1)

# Problem12
empnew <- emp %>%
  rename(salary = sal, commrate = comm)

# Problem13
emp %>%
  group_by(deptno) %>%
  summarise(n = n()) %>%
  arrange(desc(n)) %>%
  head(1)

# Problem14
emp %>% 
  mutate(enamelength = nchar(ename)) %>%
  arrange(enamelength) %>%
  select(ename)

# Problem15
emp %>%
  filter(!is.na(comm)) %>% summarise(n = n())

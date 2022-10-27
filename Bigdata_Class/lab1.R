# problem1

v1 = 1:10
v2 = v1*2
max_v = max(v2)
min_v = min(v2)
avg_v = mean(v2)
sum_v = sum(v2)
v3 = v2[-5]
print(v1)
print(v2)
print(v3)
print(max_v)
print(min_v)
print(avg_v)
print(sum_v)

# problem2

v4 = seq(1,9,2)
v5 = rep(1,5)
v6 = rep(1:3, times=3)
v7 = rep(1:4, each=2)
print(v4)
print(v5)
print(v6)
print(v7)

# problem3
nums = 1:100
print(nums)
print(sort(nums, decreasing = TRUE))
print(nums[nums>50])
print(which(nums<=50))
print(which.max(nums))
print(which.min(nums))

# problem4
v8 = seq(1,10,3)
v8.name <- LETTERS[1:4]
print(v8[1])

# problem5
score = sample(1:20, 5)
myFriend <- c("둘리", "또치", "도우너", "희동", "듀크")
score.name <- myFriend
myFriend_score = paste(score, myFriend, sep="-")
print(myFriend_score)
print(score.name[which.max(score)])
print(score.name[which.min(score)])
print(score.name[which(score > 10)])

# problem6
count = sample(1:100, 7)

week.korname <- c("일요일","월요일","화요일","수요일","목요일","금요일","토요일")
count.name <- week.korname
problem6 = paste(week.korname, count, sep=":")
print(problem6)
print(count.name[which.max(count)])
print(count.name[which.min(count)])
print(count.name[which(count > 50)])

# problem7
v9 = sample(1:30, 10, replace=T)
alphabet = c('z', 'y', 'x', 'w', 'v', 'u', 't', 's', 'r', 'q')
v10 <- alphabet
names(v10) <- v9
print(v9)
print(v10)
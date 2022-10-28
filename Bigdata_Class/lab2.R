# problem1

(v <- seq(10, 38, 2))
(m1 <- matrix(v, nrow=3, ncol=5))
(m_max_v <- max(m1))
(m_min_v <- min(m1))
(row_max <- apply(m1, 1, max))
(col_max <- apply(m1, 2, max))

# problem2
n1 <- 1:3
n2 <- 4:6
n3 <- 7:9
m2 <- cbind(n1, n2, n3)
colnames(m2) <- NULL
(m2)

# problem3
m3 <- rbind(n1, n2, n3)
rownames(m3) <- NULL
(m3)

# problem4
m4 <- m3
colnames(m4) <- c('col1', 'col2', 'col3')
rownames(m4) <- c('row1', 'row2', 'row3')
(m4)

# problem5
alpha <- letters[1:6]
alpha <- matrix(alpha, nrow = 2)
(alpha2 <- rbind(alpha, letters[24:26]))
(alpha3 <- cbind(alpha, c('s', 'p')))

# problem6
(a <- array(1:24, dim=c(2,3,4)))
(a[2,3,4])
(a[2,,])
(a[,1,])
(a[,,3])
(a+100)
(a[,,4]*100)
(a[1,2:3,])
a[2,,2] <- a[2,,2]+100
a[,,1] <- a[,,1]-2
a <- a*10
(a)
rm(a)
(a)
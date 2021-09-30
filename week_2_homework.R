set.seed(15)
hw2 <- runif(50, 4, 50)
hw2 <- replace(hw2, c(4,12,22,27), NA)
hw2
prob1 <- hw2[!is.na(hw2)]
prob1
prob1 <-prob1[prob1<=38 & prob1>=14]
prob1
times3 <- prob1*3
times3
plus10 <- times3 + 10
plus10
length(plus10)
is.integer(1:10.5)
((1:((1+length(c(1:13)))/2)*2)-1)
odds <- plus10[((1:((1+length(plus10))/2)*2)-1)]
odds

#Notes on subsetting
set.seed(13435)
x <- data.frame("var1" = sample(1:5),
                "var2" = sample(6:10),
                "var3" = sample(11:15))
x <- x[sample(1:5),]; x$var2[c(1,3)] = NA

# > x
# var1 var2 var3
# 5    2   NA   11
# 4    4   10   12
# 1    3   NA   14
# 3    5    6   13
# 2    1    7   15

#select a single column
x[,1]
x[, "var1"]

#selecting specific rows and columns x[rows, cols]
#below subsets first two rows and the second column var2
x[1:2, "var2"]

#Subsetting with logical statements
#All the rows of x where var1  <=3 and var3 > 11
x[(x$var1 <= 3 & x$var3 > 11),]

#All the rows where var1 <= 3 or var3 > 15
x[(x$var1 <= 3 | x$var3 > 15), ]


#Dealing with missing values
#You can subset with the which() command that returns the indices

x[which(x$var2 >8),]


#Sorting
#sort the values on a column
sort(x$var1)

#sort in decreasing order
sort(x$var1, decreasing = TRUE)

#sort but place NAs at the last
sort(x$var2, na.last = TRUE)


#Ordering
#Arranging the whole table using a column as basis
x[order(x$var1),]

#You can also order using multiple columns, taking the first arg first 
x[order(x$var1, x$var3),]


#You can add columns by plainly adding them to the original
x$var4 <- rnorm(5)

#Or by column binding cbind
y <- cbind(x, rnorm(5))
#Putting rnorm(5) first will bind it to the left side

#You can bind rows with the rbind command






x <- 1:10
y <- 1:10

my_matrix <- outer(x, y, "*")
names(x) <- x
names(y) <- y

my_matrix

nested <- outer(mymatrix, 1:10)
nested


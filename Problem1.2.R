
# Family Tree
family_tree <- data.frame(
  name = c("Devon", "Mitchell", "Garrett", "Dion", "Serena"),
  birthday = as.Date(c("06/20/1993", "04/18/1995", "12/31/1997", "08/21/1969", "07/10/1971"), "%m/%d/%Y"),
  gender = c("M", "M", "M", "M", "F")
)

family_tree

apply(family_tree[2], 2, mean)



# Vectors
Names = c("Devon", "Mitchell", "Garrett", "Dion", "Serena")
Birthdays = c("1993-06-20", "1995-04-18", "1997-12-31", "1969-08-21", "1997-07-10")
Genders = c("M", "M", "M", "M", "F")

# Family Tree
family_tree <- data.frame(Names, Birthdays, Genders)
family_tree

# Date
family_tree$Age_Years <- floor((Sys.Date() - as.Date(family_tree$Birthdays))/365)
mean(family_tree$Age_Years)

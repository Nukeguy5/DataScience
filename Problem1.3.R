face <- c("A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King")
suit <- c("Clubs", "Spades", "Hearts", "Diamonds")

deck <- outer(face, suit, makecard <- function(face, suit)(
  return(paste(face, suit, sep = " of "))
))

s <- sample(deck, 100, replace = TRUE)



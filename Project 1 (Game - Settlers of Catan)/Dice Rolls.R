# Group
  # Aaron, Keith

# Settlers of Catan

dice <- 1:6

# probability <- outer(dice, dice, '+')

player1 <- data.frame(
  placement <- table(c(8,5,10, 4,8,10)),
  resource_cards <- 0
)

player2 <- data.frame(
  placement <- table(c(6,9,3, 5,11,4)),
  resouce_cards <- 0
)


play_game <- function(rolls, player1, player2){
  rolls <- sample(dice, rolls, replace = TRUE) + sample(dice, rolls, replace = TRUE)
  for (roll in rolls){
    if (roll %in% player1){
      i <- which(player1$Var1 == roll)
      player1$count = player1$resource_cards + player1$Freq[i]
    }
  }
}

play_game(20, player1, player2)
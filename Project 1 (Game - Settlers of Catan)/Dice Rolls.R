# Group
  # Aaron, Keith

# Settlers of Catan

dice <- 1:6

# probability <- outer(dice, dice, '+')

player1 <- data.frame(
  placement <- table(c(8,5,10, 4,8,10))
)

player2 <- data.frame(
  placement <- table(c(6,9,3, 5,11,4))
)


play_game <- function(rolls, player1, player2){
  rolls <- sample(dice, rolls, replace = TRUE) + sample(dice, rolls, replace = TRUE)
  for (roll in rolls){
    if (roll %in% player1$Var1){
      i <- which(player1$Var1 == roll)
      cards_recvd <- player1$Freq[i]
      player1$resource_cards <- player1$resource_cards + cards_recvd
    }
    if (roll %in% player2$Var1){
      i <- which(player2$Var1 == roll)
      cards_recvd <- player2$Freq[i]
      player2$resource_cards <- player2$resource_cards + cards_recvd
    }
  }
}

play_game(20, player1, player2)
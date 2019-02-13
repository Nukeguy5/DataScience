# Group
  # Aaron, Keith

# Settlers of Catan

# probability <- outer(dice, dice, '+')

player1 <- data.frame(
  placement <- c(8,5,10, 4,8,10)
)

player2 <- data.frame(
  placement <- c(6,9,3, 5,11,4)
)

play_game <- function(rolls, player1, player2){
  dice <- c(1:6)
  all_rolls <- sample(dice, rolls, replace = TRUE) + sample(dice, rolls, replace = TRUE)
  cards_recv1 <- sum(player1$placement[player1$placement %in% all_rolls])
  cards_recv2 <- sum(player2$placement[player2$placement %in% all_rolls])
  print(paste("Player 1 num of cards: ", cards_recv1))
  print(paste("Player 2 num of cards: ", cards_recv2))
  result <- c(cards_recv1, cards_recv2)
  return(result)
}

play_games <- function(n_games, n_rolls, player1, player2){
  for (i in 1:n_games){
    play_game(n_rolls, player1, player2)
  }
}

# play_game(40, player1, player2)

play_games(100, 40, player1 = player1, player2 = player2)

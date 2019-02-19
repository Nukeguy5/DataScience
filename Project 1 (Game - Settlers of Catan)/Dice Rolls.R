# Group
  # Aaron, Keith

# Settlers of Catan

# probability <- outer(dice, dice, '+')

player1 <- data.frame(
  placement <- c(c(8,5,10), c(4,8,10))
)

player2 <- data.frame(
  placement <- c(c(6,9,3), c(5,11,4))
)

play_game <- function(rolls, player1, player2){
  dice <- c(1:6)
  all_rolls <- sample(dice, rolls, replace = TRUE) + sample(dice, rolls, replace = TRUE)
  cards_recv1 <- sum(player1$placement[player1$placement %in% all_rolls])
  cards_recv2 <- sum(player2$placement[player2$placement %in% all_rolls])
  print(paste("Player 1 num of cards: ", cards_recv1))
  print(paste("Player 2 num of cards: ", cards_recv2))
  print("")
  result <- c(cards_recv1, cards_recv2)
  return(result)
}

play_games <- function(n_games, n_rolls, player1, player2){
  player1_most_cards <- 0
  player2_most_cards <- 0
  tie <- 0
  for (i in 1:n_games){
    result <- play_game(n_rolls, player1, player2)
    player1_total <- result[1]
    player2_total <- result[2]
    if (player1_total > player2_total) {
      player1_most_cards <- player1_most_cards + 1
    } else if (player1_total < player2_total) {
      player2_most_cards <- player2_most_cards + 1
    } else {
      tie <- tie + 1
    }
  }
  outcome <- c(player1_most_cards, player2_most_cards, tie)
  return(outcome)
}

# play_game(40, player1, player2)

result <- play_games(100, 40, player1 = player1, player2 = player2)
print(paste("Player 1 Games With Most Resources:", result[1]))
print(paste("Player 2 Games With Most Resources:", result[2]))
print(paste("Games With Same Amount of Cards:", result[3]))

face <- c("A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King")
suit <- c("Clubs", "Spades", "Hearts", "Diamonds")

deck <- outer(face, suit, FUN = 'paste', sep = ' of ')

draw <- sample(deck, size = 100, replace = TRUE)

hearts_drawn <- length(draw[grep("Hearts", draw)])
hearts_drawn/length(draw)

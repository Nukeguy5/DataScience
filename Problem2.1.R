load("college_scorecard_ca.Rda")
na_pub <- is.na(college_scorecard_ca_latest$npt4_pub)
na_priv <- is.na(college_scorecard_ca_latest$npt4_priv)
count_pub <- sum(na_pub)
count_priv <- sum(na_priv)
count <- count_pub + count_priv
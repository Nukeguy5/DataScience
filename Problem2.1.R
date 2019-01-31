load("college_scorecard_ca.Rda")

# Q1
na_pub <- is.na(college_scorecard_ca_latest$npt4_pub)
na_priv <- is.na(college_scorecard_ca_latest$npt4_priv)
count_pub <- sum(na_pub)
count_priv <- sum(na_priv)
count_pub
count_priv

# Q2
non_na_pub <- college_scorecard_ca_latest$npt4_pub[!is.na(college_scorecard_ca_latest$npt4_pub)]
non_na_priv <- college_scorecard_ca_latest$npt4_priv[!is.na(college_scorecard_ca_latest$npt4_priv)]
avg_pub <- mean(non_na_pub)
avg_priv <- mean(non_na_priv)
avg_pub
avg_priv

# Q3
sd_pub <- sd(non_na_pub)
sd_priv <- sd(non_na_priv)
sd_pub
sd_priv

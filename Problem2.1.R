load("college_scorecard_ca.Rda")
# na_pub <- is.na(college_scorecard_ca_latest$npt4_pub)
# na_priv <- is.na(college_scorecard_ca_latest$npt4_priv)
# count_pub <- sum(na_pub)
# count_priv <- sum(na_priv)
# count <- count_pub + count_priv

non_na_colleges <- college_scorecard_ca_latest$instnm[!is.na(college_scorecard_ca_latest$instnm)]

for(i in seq_along(non_na_colleges)){
  apply(array, margin, ...)
}
load("college_scorecard_ca.Rda")

non_na_colleges <- filter(college_scorecard_ca_latest, !is.na(college_scorecard_ca_latest$instnm))
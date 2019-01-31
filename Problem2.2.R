load("college_scorecard_ca.Rda")

df <- college_scorecard_ca_latest

df$npt <- df$npt4_pub

# Using complete.cases
df_complete <- df[, c("instnm", "md_earn_wne_p10", "npt")]
df_complete <- df_complete[complete.cases(df_complete),]
summary(df_complete$md_earn_wne_p10)

# Using filter
library("dplyr")
df_filter <- df %>%
  filter(!is.na(npt)) %>%
  filter(!is.na(md_earn_wne_p10))

# Filter WJU with Z-Score
wju <- df %>%
  filter(instnm == "William Jessup University")
wju$md_earn_wne_p10

wju_z <- (wju$md_earn_wne_p10 - mean(df$md_earn_wne_p10[!is.na(df$md_earn_wne_p10)]))/sd(df$md_earn_wne_p10[!is.na(df$md_earn_wne_p10)])
wju_z

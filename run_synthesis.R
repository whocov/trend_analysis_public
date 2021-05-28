

# compile report
setwd(here::here("report_sources"))
rmarkdown::render('soc_review.Rmd')

# zip report
zip(file = "soc_review.html", zipfile = "soc_review.zip")

# get smtp password from environment
password <- Sys.getenv("SENDINBLUE_SMTP_PASSWORD")

# email it
library(emayili)
library(magrittr)

recipients <- c("thibautjombart@gmail.com", "polaino@who.int", "batran@who.int")

txt_body <- sprintf(
  "Please find attached the latest COVID-19 dynamics synthesis report. This automated update was generated at %s. You can download the full .xlsx file from: https://github.com/whocov/trend_analysis_public/raw/main/synthesis/dynamics_synthesis_latest.xlsx",
  Sys.time()
  )

email <- envelope() %>%
  from("thibautjombart@gmail.com") %>%
  to(recipients) %>%
  subject("COVID-19 dynamics synthesis") %>%
  text(txt_body) %>%
  attachment("soc_review.zip")

smtp <- server(host = "smtp-relay.sendinblue.com",
               port = 587,
               username = "thibautjombart@gmail.com",
               password = password)

smtp(email)

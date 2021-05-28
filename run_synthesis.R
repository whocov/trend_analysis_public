

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

email <- envelope() %>%
  from("thibautjombart@gmail.com") %>%
  to("thibautjombart@gmail.com") %>%
  subject("COVID-19 dynamics synthesis") %>%
  text("Please find attached the latest version of the COVID-19 dynamics synthesis report") %>%
  attachment("soc_review.zip")

smtp <- server(host = "smtp-relay.sendinblue.com",
               port = 587,
               username = "thibautjombart@gmail.com",
               password = password)

smtp(email)
#smtp(email, verbose = TRUE)

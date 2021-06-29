

# compile report
setwd(here::here("report_sources"))
rmarkdown::render('elr_review.Rmd')

# zip report
zip_name <- sprintf( "elr_review_%s.zip", Sys.Date())
zip(files = c("elr_review.html",
              "dynamics_synthesis.xlsx",
              "excluded_countries.txt"),
    zipfile = zip_name)

# get smtp password from environment
password <- Sys.getenv("SENDINBLUE_SMTP_PASSWORD")

# email it
library(emayili)
library(magrittr)

recipients <- c("thibautjombart@gmail.com",
                "polaino@who.int",
                "batran@who.int",
                "laurensonschaferh@who.int",
                "vandemaelek@who.int")

txt_body <- sprintf(
  "Dear Colleague, <br><br>Please find attached the latest COVID-19 Epi Level of Risk (ELR) report as well as an xlsx file with pre-classification of countries sorted by WHO region. Note that not all countries may have been included in the analysis, so that some lines may be empty. You will find more information on inclusion criteria at: https://github.com/whocov/trend_analysis_public/.<br><br>This automated update was generated on the %s.<br><br>Best regards, <br>Thibaut Jombart<br>(through github actions)",
  Sys.time()
  )

email <- envelope() %>%
  from("thibautjombart@gmail.com") %>%
  to(recipients) %>%
  subject("COVID-19 ELR synthesis") %>%
  text(txt_body) %>%
  attachment(zip_name)

smtp <- server(
  host = "smtp-relay.sendinblue.com",
  port = 587,
  username = "thibautjombart@gmail.com",
  password = password)

smtp(email)

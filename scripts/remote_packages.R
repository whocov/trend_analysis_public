
## Use this script to install non-cran packages; note that the default `force =
## FALSE` means installs are only performed if the current version is not up to
## date (or not the right tag).

phifunc_token_file <- here::here("phifunc_token")
if (file.exists(phifunc_token_file)) {
  phifunc_token <- scan(phifunc_token_file, what = "character")
} else {
  phifunc_token <- NULL
}

remotes::install_github("reconhub/trending@bootstrap", upgrade = "never")
remotes::install_github("reconverse/incidence2", upgrade = "never")
remotes::install_github("reconverse/i2extras", upgrade = "never")
remotes::install_github("reconhub/trendbreaker", upgrade = "never")

if (!is.null(phifunc_token)) {
  remotes::install_github(
             "whocov/phifunc",
             auth_token = phifunc_token,
             subdir = "phifunc", upgrade = "never")
}

if (!require("rfextras")) remotes::install_github("reconhub/rfextras", upgrade = "never")
if (!require("ggthemr")) remotes::install_github('Mikata-Project/ggthemr', upgrade = "never")

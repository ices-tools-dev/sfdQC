
# packages
library(DBI)
library(odbc)
library(icesTAF)
library(jsonlite)

# settings
config <- read_json("data-raw/config.json", simplifyVector = TRUE)

# connect to DB
conn <- dbConnect(odbc::odbc(),
                 driver = config$odbc$driver,
                 server = config$odbc$server,
                 Trusted_Connection = config$odbc$Trusted_Connection,
                 database = config$odbc$database)

# fetch
benthis <-
  dplyr::tbl(conn, "tblAux_benthisGearWidthsForWGSFD17") %>%
  dplyr::filter(!is.na(av_kw)) %>%
  collect(n = Inf)

# disconnect
dbDisconnect(conn)

# add to data folder
devtools::use_data(benthis, overwrite = TRUE)

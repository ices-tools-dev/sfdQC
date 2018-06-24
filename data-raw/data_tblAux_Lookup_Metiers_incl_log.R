
# packages
library(DBI)
library(odbc)
library(icesTAF)
library(jsonlite)
library(dplyr)

# settings
config <- read_json("data-raw//config.json", simplifyVector = TRUE)

# connect to DB
conn <- dbConnect(odbc::odbc(),
                 driver = config$odbc$driver,
                 server = config$odbc$server,
                 Trusted_Connection = config$odbc$Trusted_Connection,
                 database = config$odbc$database)

metier_lookup <-
  dplyr::tbl(conn, "tblAux_Lookup_Metiers_incl_log") %>%
  dplyr::select(LE_MET_level6,
                Benthis_metiers,
                Metier_level5,
                Metier_level4,
                JNCC_grouping,
                Fishing_category,
                Description,
                Fishing_category_FO) %>%
  collect(n = Inf)

# disconnect
dbDisconnect(conn)

# add to data folder
devtools::use_data(metier_lookup, overwrite = TRUE)


# packages
library(RODBC)
library(icesTAF)
library(jsonlite)

# settings
config <- read_json("wgsfd_2018_dataset/config.json", simplifyVector = TRUE)

# connect to DB
conn <- odbcDriverConnect(connection = config$db_connection)

# set up sql command
sqlq <- "select * from tblAux_benthisGearWidthsForWGSFD17"

# fetch
benthis <- sqlQuery(conn, sqlq)

# disconnect
odbcClose(conn)

# filter
benthis <- benthis[!is.na(benthis$av_kw),]

# add to data folder
devtools::use_data(benthis, overwrite = TRUE)

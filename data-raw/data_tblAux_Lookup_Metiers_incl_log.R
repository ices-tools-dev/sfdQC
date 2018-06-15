
# packages
library(RODBC)
library(icesTAF)
library(jsonlite)

# settings
config <- read_json("data-raw//config.json", simplifyVector = TRUE)

# connect to DB
conn <- odbcDriverConnect(connection = config$db_connection)

# set up sql command
sqlq <-
"select LE_MET_level6,
        Benthis_metiers,
        Metier_level5,
        Metier_level4,
        JNCC_grouping,
        Fishing_category,
        Description,
        Fishing_category_FO
from tblAux_Lookup_Metiers_incl_log"

# fetch
metier_lookup <- sqlQuery(conn, sqlq)

# disconnect
odbcClose(conn)

# add to data folder
devtools::use_data(metier_lookup, overwrite = TRUE)

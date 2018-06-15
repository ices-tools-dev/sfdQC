#' @docType data
#'
#' @name metier_lookup
#'
#' @title Lookup table to aggregate metier level 6 gear groupings
#'
#' @description
#' A table.
#'
#' @usage
#' catage.xtab
#'
#' @format
#' Data frame with containing eight columns:
#' \tabular{ll}{
#'   \code{LE_MET_level6} \tab Metier level 6 gear code\cr
#'   \code{Benthis_metiers} \tab Benthis metier used to define bottom fishing pressure\cr
#'   \code{Metier_level5} \tab Metier level 5 gear codes\cr
#'   \code{Metier_level4} \tab Metier level 5 gear codes\cr
#'   \code{JNCC_grouping} \tab JNCC gear groupings\cr
#'   \code{Fishing_category} \tab Fishing category\cr
#'   \code{Description} \tab Text description of the gear code\cr
#'   \code{Fishing_category_FO} \tab Fishing category used in ICES fishery overview reports
#' }
#'
#' @details
#' Metier level 6 gear groups have been linked to higher level groupings, such as, the 
#' Benthis gear groups and the JNCC gear groups.
#'
#' @source
#' ICES. 2016. Report of the working group on spatial fisheries data (WGSFD).
#'
#' @seealso
#' \code{\link{sfdQC-package}} gives an overview of the package.
#'
#'
#' @examples
#' head(metier_lookup)
#' 
#' testvms <- data.frame(LE_MET_level6 = 'TBB_CRU_0_0_0')
#' merge(testvms, metier_lookup)

NA

#' @docType data
#'
#' @name benthis
#'
#' @title Lookup table to apply the benthis project methods
#'
#' @description
#' A table.
#'
#' @usage
#' benthis
#'
#' @format
#' Data frame with containing eight columns:
#' \tabular{ll}{
#'   \code{benthis_met} \tab Benthis metier used to define bottom fishing pressure\cr
#'   \code{av_kw} \tab average kilowatt hours\cr
#'   \code{av_loa} \tab average vessel length\cr
#'   \code{av_fspeed} \tab average fishing speed\cr
#'   \code{subsurface_prop} \tab proportion of the gear that fishes below 2cm\cr
#'   \code{gearWidth} \tab width of the fishing gear in km\cr
#'   \code{FirstFactor} \tab first parameter in the equations used to calculate abraision\cr
#'   \code{SecondFactor} \tab second parameter in the equations used to calculate abraision
#' }
#'
#' @details
#' Fill in values for variables such as average kilowatt hours and gear width
#' for benthis gear categories.  These are applied if there is no information
#' on these quantities in the dataset being analysed.
#'
#' @source
#' Ole R. Eigaard, Francois Bastardie, Mike Breen, Grete E. Dinesen, Niels T. Hintzen, 
#' Pascal Laffargue, Lars O. Mortensen, J. Rasmus Nielsen, Hans C. Nilsson, 
#' Finbarr G. O'Neill, Hans Polet, David G. Reid, Antonello Sala, Mattias Skold, 
#' Chris Smith, Thomas K. Sorensen, Oliver Tully, Mustafa Zengin, Adriaan D. Rijnsdorp; 
#' Estimating seabed pressure from demersal trawls, seines, and dredges based on gear 
#' design and dimensions, ICES Journal of Marine Science, Volume 73, Issue suppl_1, 1 January 2016,
#' Pages i27-i43, https://doi.org/10.1093/icesjms/fsv099
#'
#' @seealso
#' \code{\link{sfdQC-package}} gives an overview of the package.
#'
#'
#' @examples
#' benthis
#' 
#' testvms <- data.frame(benthis_met = 'OT_MIX_DMF_PEL')
#' merge(testvms, benthis)

NA

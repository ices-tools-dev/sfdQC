#' @export
data_coverage <- function(coordGrd, spatBound, res) {

  # create a fortied polygon of csquares
  polVMS <- make_polVMS(coordGrd, resolution = res)
  polVMS$year <- rep(coordGrd$year, each = 5)
  polVMS$cols <- "red"

  spatialplot(polVMS, spatBound) +
    facet_wrap(~ year, ncol = 2) +
    theme_icesqc()
}

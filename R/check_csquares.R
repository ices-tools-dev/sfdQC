#' @export
check_csquares <- function(vms) {

  # convert c_sqaures to lat and long
  latlong <- suppressWarnings(CSquare2LonLat(vms$c_square))

  # check for NA => not valid sqaure
  validsquares <- complete.cases(latlong)

  # return
  if (any(!validsquares)) {
    kable(table(`C-Square` = vms$c_square[!validsquares],
                Year = vms$year[!validsquares]), booktabs = TRUE)
  } else {
    x <- "There were no invalid Statistical Rectangles reported"
    attr(x, "format") <- "markdown"
    attr(x, "class") <- "knit_asis"
    x
  }

}

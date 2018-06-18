#' @export
spatial_extent <- function(vms) {

  # convert c_sqaures to lat and long
  latlong <- suppressWarnings(CSquare2LonLat(vms$c_square))


  tab <-
    cbind(
      aggregate(latlong$longitude, by = list(Year = vms$year), FUN = range),
      aggregate(latlong$latitude, by=list(Year = vms$year),FUN = range)[,-1]
    )
  colnames(tab) <- c("Year", "min lon", "max lon", "min lat", "max lat")

  kable(tab, booktabs = TRUE)
}

#' @export
make_polVMS <- function(coordGrd, resolution = 0.05) {
  polVMS <- data.frame(long = rep(c(-1, -1, 1,  1, -1), nrow(coordGrd)) * resolution/2,
                       lat  = rep(c(-1,  1, 1, -1, -1), nrow(coordGrd)) * resolution/2)
  polVMS$long <- polVMS$long + rep(coordGrd$SI_LONG, each = 5)
  polVMS$lat <- polVMS$lat + rep(coordGrd$SI_LATI, each = 5)
  polVMS$order <- rep(1:5, nrow(coordGrd))
  polVMS$hole <- FALSE
  polVMS$piece <- 1
  polVMS$id <- rep(1:nrow(coordGrd), each = 5)
  polVMS$group <- paste0(polVMS$id, ".", polVMS$piece)

  polVMS
}

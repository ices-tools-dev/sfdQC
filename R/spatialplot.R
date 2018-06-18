#' @export
spatialplot <- function(data, xyrange = spatCore) {
  ggplot(polLand, aes(long, lat)) +
    geom_polygon(aes(group=group), fill = "light grey") +
    coord_quickmap(xlim = xyrange$xrange,
                   ylim = xyrange$yrange) +
    labs(x = "Longitude", y = "Latitude") +
    geom_polygon(data = data,
                 aes(long, lat, group = group, fill = cols)) +
    geom_polygon(data = polLand,
                 aes(long, lat, group = group),
                 colour = "black", size = 0.25, fill = "transparent")
}

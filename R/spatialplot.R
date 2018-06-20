#' @export
spatialplot <- function(data, xyrange = spatCore) {

  map_data("world",
           xlim = xyrange$xrange,
           ylim = xyrange$yrange) %>%
    ggplot(aes(long, lat)) +
    geom_polygon(aes(group=group), fill = "light grey") +
    coord_quickmap(xlim = xyrange$xrange,
                   ylim = xyrange$yrange) +
    labs(x = "Longitude", y = "Latitude") +
    geom_polygon(data = data,
                 aes(long, lat, group = group, fill = cols)) +
    geom_path(aes(long, lat, group = group),
              colour = "black", size = 0.25)
}

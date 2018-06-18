#' @export
records_by_year <- function(vms, what = c("table", "plot")) {
  tab <- table(Year = vms$year)

  if (what == "table") {
    kable(tab, booktabs = TRUE)
  } else {
    tab %>%
      data.frame %>%
      ggplot(aes(Year, Freq)) +
        geom_bar(stat="identity") +
        xlab("Year") +
        ylab("Number of records") +
        theme_icesqc()    
  }
}

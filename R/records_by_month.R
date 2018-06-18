#' @export
records_by_month <- function(vms, what = c("table", "plot")) {
  tab <- table(Month = vms$month, Year = vms$year)

  what <- match.arg(what)
  if (what == "table") {
    kable(tab, booktabs = TRUE)
  } else {
  qplot(factor(year), geom = "bar", fill = factor(month), data = vms) +
    xlab("Years") +
    ylab ("Count") +
    scale_fill_grey(guide=guide_legend(title="Month")) +
    theme_icesqc()
  }
}

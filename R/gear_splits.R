#' @export
gear_splits <- function(response, data = ICES_VE, ylab_text, func = sum, year_groups = 1, gear_groups = 1) {
  dat2tab <-
    with(data,
         tapply(response, list(gear_code = gear_code, year = year), func, na.rm = TRUE))

  # split by year?
  out <- ""
  if (year_groups == 1) {
    out <- c(out, kable(dat2tab, booktabs = TRUE))
  } else {
    grp <- cut(as.numeric(colnames(dat2tab)), year_groups)
    for (igrp in levels(grp)) {
      out <- c(out, kable(dat2tab[, grp == igrp, drop = FALSE], booktabs = TRUE), "\n")
    }
  }

  dat2plot <- as.data.frame.table(dat2tab, responseName = "response")
  dat2plot <- dat2plot[complete.cases(dat2plot),]
  max <- tapply(dat2plot$response, dat2plot$gear_code, max, na.rm = TRUE)
  if (gear_groups == 1 || length(unique(max)) == 1) {
    grp <- rep(1, length(max))
  } else {
    max[!is.finite(max)] <- min(max, na.rm = TRUE)
    grp <- as.numeric(cut(sqrt(max), gear_groups))
  }

  p <-
    lapply(sort(unique(grp), decreasing = TRUE), function(i) {
      dat <- dat2plot[dat2plot$gear_code %in% names(max)[grp == i],]

      ggplot(dat, aes(x = year, y = response)) +
      geom_line(aes(group = gear_code, colour = gear_code), lwd=1.5) +
      xlab("Year") + ylab(ylab_text) +
      theme_icesqc(legend.position = "right")
    })

  list(table = structure(paste(out, collapse = "\n"), format = "latex", class = "knitr_kable"),
       plots = p)
}

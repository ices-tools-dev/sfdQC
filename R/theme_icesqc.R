#' @export
theme_icesqc <- function(legend.position = "none")
  theme(axis.text.y   = element_text(colour="black"),
        axis.text.x   = element_text(colour="black"),
        axis.title.y  = element_text(size=14,face="bold"),
        axis.title.x  = element_text(size=14,face="bold"),
        legend.position = legend.position,
        panel.background = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black"),
        panel.border = element_rect(colour = "black", fill=NA))

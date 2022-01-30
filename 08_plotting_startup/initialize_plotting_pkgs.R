
# Step 1: Install packages ------------------------

# List installed packages
source('../project_fxns.R')

pkgs <-
    c('gt', 'ggridges', 'ggpubr', 'plotly')

install_and_list_packages(pkgs)

# Step 2: Validate installations -------------------------------------------
# Validate installation of gt
# https://gt.rstudio.com/articles/intro-creating-gt-tables.html
library('dplyr')
islands_tbl <-
    tibble(
        name = names(islands),
        size = islands
    ) %>% 
    arrange(desc(size)) %>% 
    slice(1:10)
islands_tbl

gt::gt(islands_tbl)

# Validate installation of ggridges
# https://github.com/wilkelab/ggridges
library(ggplot2)
ggplot(diamonds, aes(x = price, y = cut)) +
    ggridges::geom_density_ridges(scale = 4) + 
    scale_y_discrete(expand = c(0, 0)) +
    scale_x_continuous(expand = c(0, 0)) +
    coord_cartesian(clip = "off") +
    ggridges::theme_ridges()

# Validate installation of ggpubr
# https://rpkgs.datanovia.com/ggpubr/
set.seed(1234)
wdata = data.frame(
    sex = factor(rep(c("F", "M"), each=200)),
    weight = c(rnorm(200, 55), rnorm(200, 58)))
head(wdata, 4)

ggpubr::ggdensity(wdata, x = "weight",
          add = "mean", rug = TRUE,
          color = "sex", fill = "sex",
          palette = c("#00AFBB", "#E7B800"))

# Validate installation of plotly
# https://plotly.com/r/getting-started/
plotly::plot_ly(midwest, x = ~percollege, color = ~state, type = "box")


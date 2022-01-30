
# Step 1: Install packages for rmarkdown ----------------------------------

# List installed packages
source('../project_fxns.R')

# Install necessary packages
pkgs <-
    c('base64enc', 'htmltools', 'jquerylib', 'markdown', 'rmarkdown', 'tinytex', 'png', 'reticulate', 'shiny', 'flexdashboard', 'xaringan')

install_and_list_packages(pkgs)

# Step 2: Validate installations -----

# Create and render simple .Rmd file with python chunk ------------
rmarkdown::render('init_py_in_Rmd.Rmd')

# Create simple shiny app
# https://mastering-shiny.org/basic-app.html
ui <- shiny::fluidPage(
    "Hello, world!"
)

server <- function(input, output, session) {
}

shiny::shinyApp(ui, server)

# Flex dashboard: https://pkgs.rstudio.com/flexdashboard/
# https://beta.rstudioconnect.com/jjallaire/htmlwidgets-ggplotly-geoms/htmlwidgets-ggplotly-geoms.html#geom_point
rmarkdown::render('ggplotly geoms.Rmd')

# Validate installation of xaringan
# https://bookdown.org/yihui/rmarkdown/xaringan-start.html
rmarkdown::render('demo_xaringan.Rmd')


# Step 1: Install packages ------------------------

# List installed packages
source('../project_fxns.R')

pkgs <-
    c('openxlsx', 'dlookr', 'skimr', 'visdat')

install_and_list_packages(pkgs)

# Step 2: Validate installations -------------------------------------------

# Validate installation of openxlsx
# https://cran.r-project.org/web/packages/openxlsx/vignettes/Introduction.html

openxlsx::write.xlsx(iris, file = 'writeXLSX1.xlsx')
openxlsx::write.xlsx(iris, file = 'writeXLSXTable1.xlsx', asTable = T)

# Validate installation of dlookr
# https://www.kaggle.com/mollywiener/dlookr-getting-started
# https://cran.r-project.org/web/packages/dlookr/dlookr.pdf
dlookr::diagnose(iris)
dlookr::eda_paged_report(iris, target = NULL, output_format = 'pdf', output_file = 'Non-targeted EDA report.pdf', output_dir = '.', browse = F)

# Validate installation of skimr
# https://cran.r-project.org/web/packages/skimr/vignettes/skimr.html
skimr::skim(iris)

# Validate installation of visdat
# https://docs.ropensci.org/visdat/
visdat::vis_dat(airquality)


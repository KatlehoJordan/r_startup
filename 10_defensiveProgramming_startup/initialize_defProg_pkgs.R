
# Step 1: Install packages for running R in VS Code ------------------------

# List installed packages
source('../project_fxns.R')

pkgs_for_R_in_VSCode <-
    c('testit')

install_and_list_packages(pkgs_for_R_in_VSCode)

# Step 2: Validate installation -------------------------------------------
# Validate installation of testit
# https://cran.r-project.org/web/packages/testit/testit.pdf
testit::has_warning(1 + 1)
testit::has_warning(1:2 + 1:3)
testit::has_error(2 - 3)
testit::has_error(1 + "a")
testit::has_error(stop("err"), silent = TRUE)

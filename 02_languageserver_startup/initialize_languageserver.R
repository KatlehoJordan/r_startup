
# Step 1: Install packages for running R in VS Code ------------------------

# List installed packages
source('../project_fxns.R')


pkgs_for_R_in_VSCode <-
    c('languageserver')

install_and_list_packages(pkgs_for_R_in_VSCode)

# Step 2: Validate installation -------------------------------------------
# Open VS Code and see if you can run an R-script
shell('code-insiders testscript.r')

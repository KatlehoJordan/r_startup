

# Step 1: Install packages for shiny --------------------------------------

# List installed packages
source('../project_fxns.R')
install_and_list_packages('IRkernel')



# Step 2: Make IRKernel visible to Jupyter --------------------------------

# https://irkernel.github.io/installation/
IRkernel::installspec(user = FALSE)


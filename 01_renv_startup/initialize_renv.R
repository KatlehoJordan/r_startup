#  Step 1: Call renv::init() ----------------------------------------------

# List installed packages
source('../project_fxns.R')

pkgs_this_vignette <- c('')

list_all_pkgs(pkgs_this_vignette)

pkgs_this_vignette <- ('renv')

# Install renv
# If get a warning, install Rtools now.
# Rtools needed to use `install.packages(<pkg>, type = 'source')`
# as well as later creating own packages.
# Rtools may not be necessary on Mac or Linux...
install.packages(pkgs_this_vignette, dependencies = T)



# List installed packages
list_all_pkgs(pkgs_this_vignette)

# Follow recommended vignette found here:
# https://rstudio.github.io/renv/articles/renv.html
vignette('renv')

# In most projects, best to specify project root and
# use it when referring to relative paths since
# they might change if the script is run in place
# or while being sourced from another script
# In this example, the project root will just be
# where this script resides
project_root <- "."

# Not covered in vignette, but I have found that 
# it is best to explicitly set `project = project_root`
# in renv functions since the functions may be called
# from different locations and thus it is best to always
# point them to the project root explicitly so they do not
# create nested projects or nested renv directories
renv::init(project = project_root, bare = T)

# Not covered in the vignette, but after initializing renv
# R may restart without 'activating' the project. Therefore, use
# renv::activate
renv::activate(project = project_root)

# Step 2: Install and remove packages -------------------------------------

# Install a package
pkgs_this_vignette <- append(pkgs_this_vignette, 'vip')

install.packages(pkgs_this_vignette, dependencies = F)

# View the installation
list_all_pkgs(pkgs_this_vignette)

# Install another that will then be dropped
pkg_to_add_then_drop <- 'xgboost'

pkgs_this_vignette <- append(pkgs_this_vignette, pkg_to_add_then_drop)

install.packages(pkgs_this_vignette, dependencies = F)

# Remove a package
remove.packages(pkg_to_drop)

pkgs_this_vignette <- pkgs_this_vignette[pkgs_this_vignette != pkg_to_drop]

# View the removal
list_all_pkgs(pkgs_this_vignette)

# Step 3: Call renv::snapshot() -------------------------------------------

# Must use type = 'all' to explicitly save the libraries in the lockfile
renv::snapshot(project = project_root, type = 'all')


# Step 4: Install and remove more packages --------------------------------

# Install another
pkgs_this_vignette <- append(pkgs_this_vignette, 'testit')

install.packages(pkgs_this_vignette, dependencies = F)

# View the installation
list_all_pkgs(pkgs_this_vignette)


# Step 5: Revert to earlier snapshot --------------------------------------

# Must use clean = T to remove libraries that have been installed since snapshot
renv::restore(project = project_root, clean = T)

# View the installation
list_all_pkgs(pkgs_this_vignette)

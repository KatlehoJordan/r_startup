
# Step 1: Install packages ------------------------

# List installed packages
source('../project_fxns.R')

pkgs <-
    c('netstat', 'RSelenium')

install_and_list_packages(pkgs)

# Step 2: Validate installations -------------------------------------------
# Validate the installation of netstat
# https://cran.r-project.org/web/packages/netstat/netstat.pdf

netstat::ports_in_use()
netstat::free_port()

# Validate the installation of RSelenium
# http://joshuamccrain.com/tutorials/web_scraping_R_selenium.html
# You may not be able to run RSelenium without the Java Development Kit:
# https://www.oracle.com/java/technologies/downloads/

rD <- RSelenium::rsDriver(browser="firefox", port=4545L, verbose=F)
remDr <- rD[["client"]]
remDr$navigate("https://www.fcc.gov/media/engineering/dtvmaps")
remDr$findElement(using = "id", value = "startpoint")$sendKeysToElement(list("30308"))
remDr$findElements("id", "btnSub")[[1]]$clickElement()
Sys.sleep(5) # give the page time to fully load
rD$client$close()

################################################################
## CRAN packages
# UpSetR https://cran.r-project.org/web/packages/UpSetR/index.html
# gplots https://cran.r-project.org/web/packages/gplots
r <- getOption("repos")             # hard code the US repo for CRAN
r["CRAN"] <- "http://cran.us.r-project.org"
options(repos = r)

cran_pkg = c("UpSetR", "gplots","devtools","BiocManager")

for(pkg in cran_pkg){
 print(pkg)
  if (!require(pkg, character.only=TRUE)) install.packages(pkg)
}



################################################################
## Bioconductor packages  R version >= 3.5 


if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

bioc_pkg = c("graph", "RBGL")

for(pkg in bioc_pkg){
 print(pkg)
  if (!require(pkg, character.only=TRUE)) BiocManager::install(pkg)
}

# Lists all the packages installed locally
#library()

################################################################
# Vennerable https://github.com/js229/Vennerable

library("devtools")
install_github("js229/Vennerable")

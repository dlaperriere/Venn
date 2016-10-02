##   list2venn.pl : convert a list of genelist to venn diagrams

###   Usage
        perl list2venn.pl list_file.txt
        R --no-save < list_file.R

###   list file format (tsv)

        list        | genelist file
        ------------|------------------------------------------------
        up_E2       | geneset.DUTERTRE_ESTRADIOL_RESPONSE_24HR_UP.txt
        down_E2     | geneset.DUTERTRE_ESTRADIOL_RESPONSE_24HR_DN.txt
        E2F_targets | geneset.HALLMARK_E2F_TARGETS.txt

###       Output

 R script that generate venn diagrams

![venn3](images/venn3.png?raw=true)
![venn4](images/venn4.png?raw=true)
![upset4](images/upset4.png?raw=true)

###   Required R packages

  **gplots**  https://cran.r-project.org/web/packages/gplots
  
     install.packages("gplots")


**UpSetR** https://cran.r-project.org/web/packages/UpSetR/index.html

    install.packages("UpSetR")


**Vennerable** https://github.com/js229/Vennerable

     library(devtools)
     install_github("js229/Vennerable")
     
     source("http://bioconductor.org/biocLite.R")
     biocLite("graph")
     biocLite("RBGL")
     
     # older version 
     # https://r-forge.r-project.org/projects/vennerable/
     # install.packages("Vennerable", repos="http://R-Forge.R-project.org")

   
###   Author
 David Laperriere dlaperriere@outlook.com

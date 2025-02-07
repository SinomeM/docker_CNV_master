options(repos = list(CRAN="http://cran.rstudio.com/"))

# CRAN packages
install.packages(c("data.table",
                   "ggplot2",
                   "cowplot",
                   "devtools",
                   "fpc",
                   "R.utils",
                   "scales",
                   "tidyverse",
                   "ggpubr",
                   "shiny",
                   "imager",
                   "igraph",
                   "knitr",
                   "qpdf",
                   "lubridate",
                   "testthat",
                   "torch"))

torch::install_torch()

# torch add-on packages
install.packages(c("torchvision", "luz"))

# Bioconductor packages
if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install(c("GenomicRanges",
                       "igvR",
                       "VariantAnnotaion",
                       "Rsamtools",
                       "biomaRt",
                       "BiocParallel",
                       "ggbio"), ask = FALSE)

# GitHub packages
devtools::install_github("sinomem/QCtreeCNV")
devtools::install_github("sinomem/CNValidatron_fl")

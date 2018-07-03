## Plot 5 -

## Load data - filtered and formatted (if null)
source("load_data.R")
if (is.null(data)) {
  data<-load_data()
}

## plot Hist
library(datasets)
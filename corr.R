corr<-function(directory,threshold=0) {
  ## keeping the path & extn as string in here
  filepath <-"C:/Users/User/Coursera/"
  fileextn <- ".csv"
  id<-1:332

  corr<-numeric(0)
  
  ## for loop which reads the file in id vector
  for (i in id) {
    rfilename<-paste(filepath,directory,"/",sprintf("%03d", i),fileextn,sep="")
    dataraw<-read.csv(rfilename,header=T,sep=",")
    clnrows<-complete.cases(dataraw)
    datacomplete<- dataraw[clnrows,]
    nob<-nrow(datacomplete)
    if (nob>threshold) {
      cr<-cor(datacomplete["sulfate"],datacomplete["nitrate"])  
      if (!is.na(cr)) {
        corr <- append(corr, cr)
      }
    }
  
  }
  corr
  
}
complete<-function(directory,id=1:332){
  ## keeping the path & extn as string in here
  filepath <-"C:/Users/User/Coursera/"
  fileextn <- ".csv"
  
  ## data frame initialized to append the counts for final print
  cnt<-length(id)
  printtbl<-data.frame(id=integer(cnt),nobs=integer(cnt),stringsAsFactors = FALSE)
  cntr<-1
  
  ## for loop which reads the file in id vector
  for (i in id) {
    rfilename<-paste(filepath,directory,"/",sprintf("%03d", i),fileextn,sep="")
    dataraw<-read.csv(rfilename,header=T,sep=",")
    clnrows<-complete.cases(dataraw)
    datacomplete<- dataraw[clnrows,]
    nob<-nrow(datacomplete)
    printtbl$id[cntr]<-i
    printtbl$nobs[cntr]<-nob
    cntr<-cntr+1
  }
  printtbl
  
}
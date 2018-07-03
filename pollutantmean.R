pollutantmean<-function(directory,pollutant,id=1:332){

## keeping the path & extn as string in here
  filepath <-"C:/Users/User/Coursera/"

  fileextn <- ".csv"
  
## initialize vector for appending values from file(s)
  finalvector <-c()
  
## for loop which reads the file in id vector
  for (i in id) {
      rfilename<-paste(filepath,directory,"/",sprintf("%03d", i),fileextn,sep="")
      dataraw<-read.csv(rfilename,header=T,sep=",")
      datacln<-dataraw[!is.na(dataraw[,pollutant]),pollutant]
      finalvector<-c(finalvector,datacln)
  }
  finalmean<-mean(finalvector)
  round(finalmean,3)
}
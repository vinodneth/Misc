HelloWorld <- function(num){
  for (i in num) {
    cat(i)
    cat("\n")
  }
  chars <- nchar("Hello World") * num
  chars
}
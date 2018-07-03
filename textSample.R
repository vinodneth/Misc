setwd("C:/Users/User/Coursera/TextProc/2006")

convert_mbox_eml("2006.txt","../2006F")

library(tm)
library(tm.plugin.mail)
library(SnowballC)
setwd("C:/Users/User/Coursera/TextProc")
rdevel<-Corpus(DirSource("2006F/"),readerControl = list(reader=readMail ,language = "en_US", load=TRUE))
## rdevel<-tm_map(rdevel,asPlain) does not work in tm latest version
##rdevel<-tm_map(rdevel,asPlain)
rdevel<-tm_map(rdevel,content_transformer(tolower))
rdevel<-tm_map(rdevel,stripWhitespace)
## getTransformations() - to get possible calls to tm_map.. like stripWhitespace....
rdevel<-tm_map(rdevel,stemDocument)
rdevel<-tm_map(rdevel,removeWords,c(stopwords("english")))
myWords<-c("a", "about", "above", "above", "across", "after", "afterwards", "again", "against", "all", "almost", "alone", "along", "already", "also","although","always","am","among", "amongst", "amoungst", "amount",  "an", "and", "another", "any","anyhow","anyone","anything","anyway", "anywhere", "are", "around", "as",  "at", "back","be","became", "because","become","becomes", "becoming", "been", "before", "beforehand", "behind", "being", "below", "beside", "besides", "between", "beyond", "bill", "both", "bottom","but", "by", "call", "can", "cannot", "cant", "co", "con", "could", "couldnt", "cry", "de", "describe", "detail", "do", "done", "down", "due", "during", "each", "eg", "eight", "either", "eleven","else", "elsewhere", "empty", "enough", "etc", "even", "ever", "every", "everyone", "everything", "everywhere", "except", "few", "fifteen", "fify", "fill", "find", "fire", "first", "five", "for", "former", "formerly", "forty", "found", "four", "from", "front", "full", "further", "get", "give", "go", "had", "has", "hasnt", "have", "he", "hence", "her", "here", "hereafter", "hereby", "herein", "hereupon", "hers", "herself", "him", "himself", "his", "how", "however", "hundred", "ie", "if", "in", "inc", "indeed", "interest", "into", "is", "it", "its", "itself", "keep", "last", "latter", "latterly", "least", "less", "ltd", "made", "many", "may", "me", "meanwhile", "might", "mill", "mine", "more", "moreover", "most", "mostly", "move", "much", "must", "my", "myself", "name", "namely", "neither", "never", "nevertheless", "next", "nine", "no", "nobody", "none", "noone", "nor", "not", "nothing", "now", "nowhere", "of", "off", "often", "on", "once", "one", "only", "onto", "or", "other", "others", "otherwise", "our", "ours", "ourselves", "out", "over", "own","part", "per", "perhaps", "please", "put", "rather", "re", "same", "see", "seem", "seemed", "seeming", "seems", "serious", "several", "she", "should", "show", "side", "since", "sincere", "six", "sixty", "so", "some", "somehow", "someone", "something", "sometime", "sometimes", "somewhere", "still", "such", "system", "take", "ten", "than", "that", "the", "their", "them", "themselves", "then", "thence", "there", "thereafter", "thereby", "therefore", "therein", "thereupon", "these", "they", "thickv", "thin", "third", "this", "those", "though", "three", "through", "throughout", "thru", "thus", "to", "together", "too", "top", "toward", "towards", "twelve", "twenty", "two", "un", "under", "until", "up", "upon", "us", "very", "via", "was", "we", "well", "were", "what", "whatever", "when", "whence", "whenever", "where", "whereafter", "whereas", "whereby", "wherein", "whereupon", "wherever", "whether", "which", "while", "whither", "who", "whoever", "whole", "whom", "whose", "why", "will", "with", "within", "without", "would", "yet", "you", "your", "yours", "yourself", "yourselves", "the")

##summary(rdevel)
##str(rdevel)


tdm<-TermDocumentMatrix(rdevel)


authors<-meta(rdevel,tag="author")
authors<-lapply(rdevel,meta,tag="author")
authors <- sapply(authors, paste, collapse = " ")
sort(table(authors), decreasing = TRUE)[1:3]

Headings<-lapply(rdevel,meta,tag="heading")
Headings <- sapply(Headings, paste, collapse = " ")
(bigTopicsTable <- sort(table(Headings), decreasing = TRUE)[1:3])
bigTopics <- names(bigTopicsTable)
topicCol<-rdevel[Headings == bigTopics]
## unique(sapply(topicCol, Author))
unique(sapply(topicCol,meta,tag="author"))


##(bugCol <- tm_filter(rdevel,FUN = searchFullText, pattern="[^[:alpha:]]+bug[^[:alpha:]]+",doclevel = TRUE))
(bugCol <- tm_filter(rdevel,FUN = grep, pattern="[^[:alpha:]]+bug[^[:alpha:]]+"))

bugColAuthors <- lapply(bugCol, meta,tag="author")
bugColAuthors <- sapply(bugColAuthors, paste, collapse = " ")
sort(table(bugColAuthors), decreasing = TRUE)[1:3]

f <- findFreqTerms(tdm, 30, 31)
sort(f[-grep("[0-9]", f)])

rdevelInc<-tm_map(rdevel,removeSignature)
rdevelInc<-tm_map(rdevelInc,removeCitation)

tdmInc<-TermDocumentMatrix(rdevelInc)
fInc <- findFreqTerms(tdmInc, 30, 31)
sort(fInc[-grep("[0-9]", fInc)])


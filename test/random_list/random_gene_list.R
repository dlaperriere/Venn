# generate random lists of fake genes
list_size = 400

name <- function() paste(sample(LETTERS,5,replace=TRUE),collapse="")
gene_names <- replicate(1000, name())

num <- c(rep(1:10))
for (n in num){
  write.table(x=sample(gene_names, list_size, replace=FALSE),file=paste("genelist",n,".txt",sep=""),quote=FALSE,col.names=FALSE,row.names=FALSE)
}

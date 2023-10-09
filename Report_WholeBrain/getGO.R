#Get GO
getGO <- function(org.db, keys, keytype, GOALL = FALSE,
                  summarizeBy = "gene", EGorSYM = "EG") {
  
  
  require(GO.db)
  
  summarizeBy <- match.arg(summarizeBy, c("gene", "go", "none"))
  EGorSYM <- match.arg(EGorSYM, c("EG","SYM"))
  
  if(GOALL){
    temp.GO <- AnnotationDbi::select(org.db, keys = keys, keytype=keytype, columns = c("GOALL","ONTOLOGYALL"))
    #Remove NAs and duplicates due to > evidence code
    temp.GO <- temp.GO[!is.na(temp.GO$GO),]
    temp.GO <- temp.GO[!duplicated(paste0(temp.GO$ENTREZID, temp.GO$GO)),]
    #Get terms
    temp.GO <- cbind(temp.GO, AnnotationDbi::select(GO.db, key=temp.GO$GO,keytype="GOID",columns="TERM"))
    temp.GO$idterm <- paste(temp.GO$GO, temp.GO$TERM, sep=" ")
    
  } else{
    temp.GO <- AnnotationDbi::select(org.db, keys = keys, keytype=keytype, columns = c("GO","ONTOLOGY"))
    #Remove NAs and duplicates due to > evidence code
    temp.GO <- temp.GO[!is.na(temp.GO$GO),]
    temp.GO <- temp.GO[!duplicated(paste0(temp.GO$ENTREZID, temp.GO$GO)),]
    #Get terms
    temp.GO <- cbind(temp.GO, AnnotationDbi::select(GO.db, key=temp.GO$GO,keytype="GOID",columns="TERM"))
    temp.GO$idterm <- paste(temp.GO$GO, temp.GO$TERM, sep=" ")
  }
  
  
  if(EGorSYM == "SYM"){
    temp.GO$SYMBOL <- mapIds(org.db,keys = temp.GO$ENTREZID, 
                             keytype = "ENTREZID", column = "SYMBOL")
  }
  
  
  if(summarizeBy == "none") {
    return(temp.GO)
  }
  
  
  if(summarizeBy == "gene") {
    if(EGorSYM == "SYM"){
      temp.GO2 <- tapply(temp.GO$idterm, list(temp.GO$SYMBOL, temp.GO$ONTOLOGY), paste, collapse="; ")
      return(data.frame(SYMBOL = rownames(temp.GO2), temp.GO2))
    } else {
      temp.GO2 <- tapply(temp.GO$idterm, list(temp.GO$ENTREZID, temp.GO$ONTOLOGY), paste, collapse="; ")
      return(data.frame(ENTREZID = rownames(temp.GO2), temp.GO2))
    }
  }
  
  if(summarizeBy == "go"){
    if(EGorSYM == "SYM"){
      temp.GO2 <- tapply(temp.GO$SYMBOL, list(temp.GO$GOID), function(x) paste(sort(unique(x)), collapse="; "))
      return(data.frame(GOID = names(temp.GO2), SYMBOL = temp.GO2))
    } else {
      temp.GO2 <- tapply(temp.GO$ENTREZID, list(temp.GO$GOID), function(x) paste(sort(unique(x)), collapse="; "))
      return(data.frame(GOID = names(temp.GO2), ENTREZID = temp.GO2))
      
    }
  }
}

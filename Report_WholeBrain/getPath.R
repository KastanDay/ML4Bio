getPath <- function(org.db, keys = NULL, keytype = NULL, updatePath = FALSE, 
                    species = "hsa", summarizeBy = "gene", EGorSYM = "EG",
                    keepSpecies = FALSE) {
  
  summarizeBy <- match.arg(summarizeBy, c("gene", "pathway", "none"))
  EGorSYM <- match.arg(EGorSYM, c("EG","SYM"))
  
  if(!updatePath) {
    require(KEGG.db)
    temp.PATH <- AnnotationDbi::select(org.db, keys = keys, keytype=keytype, columns = "PATH")
    temp.PATH<- temp.PATH[!is.na(temp.PATH$PATH),]
    temp.PATH$name <- unlist(mget(temp.PATH$PATH, KEGGPATHID2NAME))
    if(summarizeBy == "none") {
      return(temp.PATH)
    }
    if(summarizeBy == "gene") {
      temp.PATH2 <- tapply(paste(temp.PATH$PATH, temp.PATH$name), temp.PATH[,1], 
                           paste, collapse="; ")
      return(temp.PATH2)
    }
    if(summarizeBy == "pathway") {
      temp.PATH2 <- tapply(temp.PATH[,1], paste(temp.PATH$PATH,temp.PATH$name), 
                           paste, collapse="; ")
      return(temp.PATH2)
    }
  }
  
  else {
    require(KEGGREST)
    cat(paste("Downloading updated pathways via KEGGREST on", date(), "\n"))
    keggpathway2gene <- keggLink(species, "pathway")
    temp <- paste0(species, ":")
    keggpathway2gene <- gsub(temp, "", keggpathway2gene)
    names(keggpathway2gene) <- gsub(paste0("path:",species), "", names(keggpathway2gene))
    pathway2name <- keggList("pathway")
    names(pathway2name) <- gsub("path:map", "", names(pathway2name))
    
    #check against input IDs types, if given
    if (!is.null(keys)) {
      if (sum(keggpathway2gene %in% keys) == 0) {
        warning("Updated KEGG species-specific gene IDs do not match the input keys. KEGG's gene IDs with pathways will be output")
      }
      else {
        keggpathway2gene <- keggpathway2gene[keggpathway2gene %in% keys]
        cat("Only outputting pathways for input keys")
      }
    }
    
    temp.PATH <- data.frame(ENTREZID = keggpathway2gene, 
                            PATHID = names(keggpathway2gene),
                            Pathway = pathway2name[names(keggpathway2gene)])
    
    if(EGorSYM == "SYM"){
      temp.PATH$SYMBOL <- mapIds(org.db,keys = temp.PATH$ENTREZID, keytype = "ENTREZID", column = "SYMBOL")
    }
    
    if(keepSpecies){
      temp.PATH$PATHID <- paste0(paste0("path:",species), temp.PATH$PATHID)
    }
    
    if(summarizeBy == "none") {
      return(temp.PATH)
    }
    if(summarizeBy == "gene") {
      temp.PATH2 <- tapply(paste(temp.PATH$PATHID, temp.PATH$Pathway), temp.PATH[,1], 
                           paste, collapse="; ")
      out <- data.frame(ENTREZID = names(temp.PATH2), Pathway = temp.PATH2)
      rownames(out) <- NULL
      return(out)
    }
    if(summarizeBy == "pathway") {
      if(EGorSYM == "EG") {
        temp.PATH2 <- tapply(temp.PATH$ENTREZID, temp.PATH$PATHID, 
                             function(x) paste(sort(x), collapse="; "))
        out <- data.frame(PATHID = names(temp.PATH2), ENTREZID = temp.PATH2)
        rownames(out) <- NULL
        return(out)
      } else {
        temp.PATH2 <- tapply(temp.PATH$SYMBOL, temp.PATH$PATHID,
                             function(x) paste(sort(x), collapse="; "))
        out <- data.frame(PATHID = names(temp.PATH2), SYMBOL = temp.PATH2)
        rownames(out) <- NULL
        return(out)
      }
      
    }
    
  }
}





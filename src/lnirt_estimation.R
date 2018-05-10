lf<-list.files(pattern="*.txt")
pf<-function(fn) {
    x<-read.table(fn,header=TRUE)
    tmp<-split(x,x$id) 
    if (length(unique(lapply(tmp,nrow)))>1) stop("need same number of items and for them to be in order")
    ##make rt & acc matrices
    rt<-do.call("rbind",lapply(tmp,function(x) x$rt)) ##i am really depending on the items being ordered here.    
    acc<-do.call("rbind",lapply(tmp,function(x) x$acc)) ##i am really depending on the items being ordered here.
    library(LNIRT)
    m<-LNIRT(RT=rt,Y=acc)
    summary(m)
}

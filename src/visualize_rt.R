lf<-list.files(pattern="*.txt")
pf<-function(fn) {
    x<-read.table(fn,header=TRUE)
    plot(density(x$rt,na.rm=TRUE),xlab="",xlim=c(0,20),main="")
    legend("topright",bty="n",fn,cex=.8)
    m<-loess(acc~rt,x)
    tmp<-cbind(m$x,m$fitted)
    tmp<-tmp[order(tmp[,1]),]
    plot(tmp,type="l",ylim=c(0,1),xlim=c(0,20),ylab="acc")
}
par(mfrow=c(length(lf),2),mgp=c(2,1,0),mar=c(2.5,2.5,.5,.5),oma=rep(.5,4))
lapply(lf,pf)

##rr98
library(rtdists)
rr98$correct -> rr98$acc
write.table(rr98,"rr98.txt",quote=FALSE,row.names=FALSE)

##speed_acc
library(rtdists)
as.character(speed_acc$stim_cat)==as.character(speed_acc$response) -> speed_acc$acc
ifelse(speed_acc$rt>25,NA,speed_acc$rt)->speed_acc$rt
write.table(speed_acc,"speed_acc.txt",quote=FALSE,row.names=FALSE)

##mental_rotation
library(diffIRT)
data(rotation)
c(150,50,100,150,50,100,150,50,150,100)->angle
L<-list()
for (i in 1:10) {
    cbind(1:nrow(rotation),rotation[,i],rotation[,i+10],rep(angle[i],nrow(rotation)))->L[[i]]
}
data.frame(do.call("rbind",L))->rot
names(rot)<-c("id","acc","rt","angle")
write.table(rot,"mental_rotation.txt",quote=FALSE,row.names=FALSE)

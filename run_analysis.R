run_analysis<-function() {
        ##reshape2 contains melt and dcast, used to tidy the data
        require(reshape2)
        
        ##Begin by reading the data into R. 
        ##This assumes you have the directory "UCI HAR Dataset" in your working directory.
        features<-read.table("./UCI HAR Dataset/features.txt")
        
        ##Here, the activity labels (WALKING,WALKING_UPSTAIRS,ect.) are read in
        ##Labels are converted to lowercase character strings
        activity_labels<-read.table("./UCI HAR Dataset/activity_labels.txt")
        activity_labels[,2]<-tolower(as.character(activity_labels[,2]))
        activity_labels[,2]<-gsub("_","",activity_labels[,2])
        
        X_train<-read.table("./UCI HAR Dataset/train/X_train.txt")
        X_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
        
        subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
        subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
        
        y_train<-read.table("./UCI HAR Dataset/train/y_train.txt")
        y_test<-read.table("./UCI HAR Dataset/test/y_test.txt")
        
        ##Feature interpreted as a character string
        ##Not converted to lowercase as one "Mean" we want to ignore later
        ##happens to be uppercase
        featmeas<-as.character(features[,2])
        
        ##adding two more columns for the data that will be combined next.
        columns<-c("activity","subject",featmeas)
        
        ##Per David Hood's FAQ and other documentation, piecing
        ##data together "like Lego blocks"
        featuresblock<-rbind(X_train,X_test)
        
        subjectblock<-rbind(subject_train,subject_test)
        
        activityblock<-rbind(y_train,y_test)
        
        bigblock<-cbind(activityblock,subjectblock,featuresblock)
        
        
        colnames(bigblock)<-columns
        
        
        ##substituting activity names for numbers of activities
        for (i in 1:6){
                bigblock$activity<-gsub(i,activity_labels[i,2],bigblock$activity)
        }
        
        
        ##Only using columns including mean and std measurements.
        ##Also including subject (the person) and activity
        meanmaxcols<-bigblock[,grep("mean|std|subject|activity",colnames(bigblock),ignore.case=FALSE)]
        
        ##The following lines clean up the column names to remove whitespace, punctuation
        ##and lengthen words (e.g. x->xaxis)
        ##I imagine there is a shorter way to do this with a list or a loop.
        columnnames<-colnames(meanmaxcols)
        
        colliesstart<-(columnnames)[1:2]
        colliesend<-(columnnames)[3:length(columnnames)]
        colliesend<-tolower(gsub("([xyz+]$)","\\1axis",colliesend,ignore.case=T,perl=T))
        colliesend<-gsub("-","",colliesend,ignore.case=T,perl=T)
        colliesend<-gsub("\\(","",colliesend,ignore.case=T,perl=T)
        colliesend<-gsub("\\)","",colliesend,ignore.case=T,perl=T)
        colliesend<-gsub("^t","time",colliesend,ignore.case=T,perl=T)
        colliesend<-gsub("^f","frequency",colliesend,ignore.case=T,perl=T)
        colliesend<-gsub("acc","acceleration",colliesend,ignore.case=T,perl=T)
       
        ##After cleaning up those column names, change the data's names to improved names.
        colnames(meanmaxcols)<-c(colliesstart,colliesend)
        
        ##create a molten dataset using activity as first identifier and the subject
        md<-melt(meanmaxcols,id=(c("activity","subject")))
        
        ##casting molten data into tidy data. Aggregating by mean of variable per activity and subject.
        casty<-dcast(md,activity+subject~variable,mean)
        
        
        ##Write a table for the tidy data named "data"
        write.table(casty,file = "./data.txt",row.name=FALSE)
     
}
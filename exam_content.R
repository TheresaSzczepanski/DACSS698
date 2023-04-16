###Exam Content Functions -------------------------------------------------------


##Function for number of points available by question type
#------------------------------------------------------------------------------
##Function for number of points available by question type:
# Math: CR, SA, SR
#ELA: ES, SR
# Sci: CR, SR
Item_Type_Points <-function(itemType, subjectItemDF){
  
  if(itemType == "ES"){
    subjectItemDF%>%
      select(`Type`, `item Possible Points`)%>%
      group_by(`Type`)%>%
      summarize(available_points = .5*sum(`item Possible Points`, na.rm=TRUE))%>%
      filter(`Type` == itemType)
    
  }else{
    subjectItemDF%>%
      select(`Type`, `item Possible Points`)%>%
      group_by(`Type`)%>%
      summarize(available_points = sum(`item Possible Points`, na.rm=TRUE))%>%
      filter(`Type` == itemType)
  }
}       



##Function for available points by practice category/cluster

#-------------------------------------------------------------------------------

Practice_Cat_Points <-function(subject, practiceCategory, subjectItemDF){
  if(subject == "science"){
    subjectItemDF%>%
      select(`sitem`, `item Possible Points`, `Practice Category`)%>%
      group_by(`Practice Category`)%>%
      summarize(available_points = sum(`item Possible Points`, na.rm=TRUE))%>%
      filter(`Practice Category` == practiceCategory)
  }
  ##To-Do Need to Identify Equivalent to Practice category in math (perhaps representation type?)
  # else if (subject == "math"){
  #   subjectItemDF%>%
  #     select(`mitem`, `item Possible Points`, `Reporting Category`)%>%
  #     group_by(`Reporting Category`)%>%
  #     summarise(available_points = sum(`item Possible Points`, na.rm=TRUE))
  
  #} 
  else if (subject == "ela"){
    subjectItemDF%>%
      select(`eitem`, `item Possible Points`, `Cluster`)%>%
      group_by(`Cluster`)%>%
      summarise(available_points = sum(`item Possible Points`, na.rm=TRUE))%>%
      filter(`Cluster` == practiceCategory)
    
  }
}    


##Function for dataframe with points available by reporting category------------

Reporting_Cat_Points <-function(subject, reportingCategory, subjectItemDF){
  if(subject == "science"){
    subjectItemDF%>%
      select(`sitem`, `item Possible Points`, `Reporting Category`)%>%
      group_by(`Reporting Category`)%>%
      summarize(available_points = sum(`item Possible Points`, na.rm=TRUE))%>%
      filter(`Reporting Category` == reportingCategory)
  }
  else if (subject == "math"){
    subjectItemDF%>%
      select(`mitem`, `item Possible Points`, `Reporting Category`)%>%
      group_by(`Reporting Category`)%>%
      summarise(available_points = sum(`item Possible Points`, na.rm=TRUE))%>%
      filter(`Reporting Category` == reportingCategory)
    
  } 
  else if (subject == "ela"){
    subjectItemDF%>%
      select(`eitem`, `item Possible Points`, `Reporting Category`)%>%
      group_by(`Reporting Category`)%>%
      summarise(available_points = sum(`item Possible Points`, na.rm=TRUE))%>%
      filter(`Reporting Category` == reportingCategory)
    
  }
}
## ELA xWalk Points Functions--------------------------------------------------
# Fiction-Non
ELA_Fiction_Points<-function(value, subjectItemDF){
  subjectItemDF%>%
    select(contains("item"), `Fiction-Non`)%>%
    filter(!str_detect(eitem,"LA|WR"))%>%
    group_by(`Fiction-Non`)%>%
    summarise(available_points = sum(`item Possible Points`, na.rm=TRUE))%>%
    filter(`Fiction-Non` == value)
}

## ELA: Num Texts
ELA_NumText_Points<-function(value, subjectItemDF){
  subjectItemDF%>%
    select(contains("item"), `Num Texts`)%>%
    filter(!str_detect(eitem,"LA|WR"))%>%
    group_by(`Num Texts`)%>%
    summarise(available_points = sum(`item Possible Points`, na.rm=TRUE))%>%
    filter(`Num Texts` == value)
}


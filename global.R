

source('dependencies.R')

## Read In Function Library---------------------------------------------------

## Function Read-in Item
#Item analysis Read in Function: Input: file_path, sheet_name, subject; return: 
#student item report for a given grade level and subject.
#subject must be: "math", "ela", or "science"
#-------------------------------------------------------------------------------

read_item<-function(file_path, sheet_name, subject){
  subject_item<-case_when(
    subject == "science"~"sitem",
    subject == "math"~"mitem",
    subject == "ela"~"eitem"
  )
  if(subject == "science"){
    read_excel(file_path, sheet = sheet_name, 
               skip = 1, col_names= c(subject_item, "Type", "Reporting Category", 
                                      "Standard", "item Desc", "delete", 
                                      "item Possible Points","RT Percent Points", 
                                      "State Percent Points", "RT-State Diff")) %>%
      select(!contains("delete"))%>%
      filter(!str_detect(sitem,"Legend|legend"))%>%
      mutate(sitem= as.character(sitem))%>%
      separate(c(1), c("sitem", "delete"))%>%
      select(!contains("delete"))%>%
      mutate(sitem =
               str_c(subject_item, sitem))
  }
  else if(subject == "math"){
    read_excel(file_path, sheet = sheet_name, 
               skip = 1, col_names= c(subject_item, "Type", "Reporting Category", 
                                      "Standard", "item Desc", "delete", 
                                      "item Possible Points", "RT Percent Points", 
                                      "State Percent Points", "RT-State Diff"))%>%
      select(!contains("delete"))%>%
      filter(!str_detect(mitem,"Legend|legend"))%>%
      mutate(mitem = as.character(mitem))%>%
      separate(c(1), c("mitem", "delete"))%>%
      select(!contains("delete"))%>%
      mutate(mitem =
               str_c(subject_item, mitem))
    
  }
  
  else if(subject == "ela"){
    read_excel(file_path, sheet = sheet_name, 
               skip = 1, col_names= c(subject_item, "Type", "Reporting Category", 
                                      "Standard", "item Desc", "delete", 
                                      "item Possible Points","RT Percent Points", 
                                      "State Percent Points", "RT-State Diff"))%>%
      select(!contains("delete"))%>%
      filter(!str_detect(eitem,"Legend|legend"))%>%
      mutate(eitem = as.character(eitem))%>%
      separate(c(1), c("eitem", "delete"))%>%
      select(!contains("delete"))%>%
      mutate(eitem =
               str_c(subject_item, eitem))
    }
  
}

##Item xWalk Read in Function----------------------------------------------------
#subject must be: "math", "ela", or "science"
#-------------------------------------------------------------------------------

read_item_xwalk<-function(file_path, sheet_name, subject){
  subject_item<-case_when(
    subject == "science"~"sitem",
    subject == "math"~"mitem",
    subject == "ela"~"eitem"
  )
  if(subject == "science"){
    read_excel(file_path, sheet = sheet_name, 
               skip = 1, col_names= c(subject_item, "Practice Category")) %>%
      mutate(sitem= as.character(sitem))%>%
      separate(c(1), c("sitem", "delete"))%>%
      select(!contains("delete"))%>%
      mutate(sitem =
               str_c(subject_item, sitem))
  }
  else if(subject == "math"){
    read_excel(file_path, sheet = sheet_name, 
               skip = 1, col_names= c(subject_item, "Type", "Reporting Category", 
                                      "Standard", "item Desc", "delete", 
                                      "item Possible Points","delete",
                                      "RT Percent Points", "State Percent Points", 
                                      "RT-State Diff"))%>%
      select(!contains("delete"))%>%
      filter(!str_detect(mitem,"Legend|legend"))%>%
      mutate(mitem = as.character(mitem))%>%
      separate(c(1), c("mitem", "delete"))%>%
      select(!contains("delete"))%>%
      mutate(mitem =
               str_c(subject_item, mitem))
    
  }
  else if(subject == "ela"){
    read_excel(file_path, sheet = sheet_name, 
               skip = 1, col_names= c(subject_item, "Num Texts", "Fiction-Non", 
                                      "delete"))%>%
      select(!contains("delete"))%>%
      mutate(eitem = as.character(eitem))%>%
      separate(c(1), c("eitem", "delete"))%>%
      select(!contains("delete"))%>%
      mutate(eitem =
               str_c(subject_item, eitem))
    
  }
  
}

##Function to Join Item DF with Item xWalk---------------------------------------
#subject must be: "math", "ela", or "science"
#-------------------------------------------------------------------------------
Join_Item_Xwalk<-function(subject, subjectItemDF, subjectItemXwalkDF){
  if(subject == "science"){
    left_join(subjectItemDF, subjectItemXwalkDF, "sitem")
  }
  else if(subject == "ela"){
    left_join(subjectItemDF, subjectItemXwalkDF, "eitem")
  }
  else if(subject == "math"){
    left_join(subjectItemDF, subjectItemXwalkDF, "mitem")
  }
}

##Function to Read in ELA Cluster xWalk---------------------------------------

read_ela_clusterXwalk<-function( cluster_file_path, cluster_sheet_name){
  read_excel(cluster_file_path, sheet = cluster_sheet_name, 
             skip = 1, col_names= c("Standard", "Cluster", "delete"))%>%
    select(!contains("delete"))
}


## Function to Join Grade Level ELA to Cluster----------------------------------

Join_ELAItem_Cluster<-function(elaItemDF, clusterXwalk){
  
  left_join(elaItemDF, clusterXwalk, "Standard")
}

## Create Science Item Data Frames----------------------------------------------

#Science G9
SG9_item <-read_item("data/2022MCASItemAnalysis.xlsx", "SG9Physics", "science")
SG9_xWalk<-read_item_xwalk("data/2022MCASItemXWalk.xlsx", "SG9_practice_xwalk", 
                           "science")
SG9_item<-Join_Item_Xwalk("science", SG9_item, SG9_xWalk)

# Science G8
SG8_item <-read_item("data/2022MCASItemAnalysis.xlsx", "SG8", "science")
SG8_xWalk<-read_item_xwalk("data/2022MCASItemXWalk.xlsx", "SG8_practice_xwalk", 
                           "science")
SG8_item<-Join_Item_Xwalk("science", SG8_item, SG8_xWalk)

#Science G5
SG5_item <-read_item("data/2022MCASItemAnalysis.xlsx", "SG5", "science")
SG5_xWalk<-read_item_xwalk("data/2022MCASItemXWalk.xlsx", "SG5_practice_xwalk", 
                           "science")
SG5_item<-Join_Item_Xwalk("science", SG5_item, SG5_xWalk)

##Exam Content Functions -------------------------------------------------------


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
      filter(`Practice Category` == practiceCategory)#%>%
    
    
    
  }
  ##To-Do Need to Identify Equivalent to Practice category in math (perhaps representation type?)
  # else if (subject == "math"){
  #   subjectItemDF%>%
  #     select(`mitem`, `item Possible Points`, `Reporting Category`)%>%
  #     group_by(`Reporting Category`)%>%
  #     summarise(available_points = sum(`item Possible Points`, na.rm=TRUE))
  
  #} 
  else if (subject == "ELA"){
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
      summarise(available_points = sum(`item Possible Points`, na.rm=TRUE))
    
  } 
  else if (subject == "ELA"){
    subjectItemDF%>%
      select(`eitem`, `item Possible Points`, `Reporting Category`)%>%
      group_by(`Reporting Category`)%>%
      summarise(available_points = sum(`item Possible Points`, na.rm=TRUE))
    
  }
}

## Create Points Available by Category Data Frames------------------------------
#To-Do, look up reporting Category for science grade levels
SG9_CR_PTS<-Item_Type_Points("CR", SG9_item)
SG9_SR_PTS<-Item_Type_Points("SR", SG9_item)
SG9_MD_PTS<-Practice_Cat_Points("science", "Mathematics and Data", SG9_item)
SG9_ERM_PTS<-Practice_Cat_Points("science", "Evidence, Reasoning, and Modeling", SG9_item)
SG9_IQ_PTS<-Practice_Cat_Points("science", "Investigations and Questioning", SG9_item)
SG9_MF_PTS<-Reporting_Cat_Points("science", "MF", SG9_item)
SG9_EN_PTS<-Reporting_Cat_Points("science", "EN", SG9_item)
SG9_WA_PTS<-Reporting_Cat_Points("science", "WA", SG9_item)

##-----------------------------------------------------------------------------


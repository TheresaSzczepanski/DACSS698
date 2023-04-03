

source('dependencies.R')

## Read In Function Library---------------------------------------------------

## Function Read-in Item
#Item analysis Read in Function: Input: sheet_name, subject, grade; return: 
#student item report for a given grade level and subject.
#subject must be: "math", "ela", or "science"

#To-Do1: Update this function to include ELA
#To-Do2: Update this function for column names that are added to the item reports
read_item<-function(sheet_name, subject, grade){
  subject_item<-case_when(
    subject == "science"~"sitem",
    subject == "math"~"mitem",
    subject == "ela"~"eitem"
  )
  if(subject == "science"){
    read_excel("data/2022MCASItemAnalysis.xlsx", sheet = sheet_name,
              skip = 1, col_names= c(subject_item, "Type", "Reporting Category", "Standard", "item Desc", "delete", "item Possible Points","RT Percent Points", "State Percent Points", "RT-State Diff", "Science Practice Category")) %>%
      select(!contains("delete"))%>%
      filter(!str_detect(sitem,"Legend|legend"))%>%
      mutate(sitem= as.character(sitem))%>%
      separate(c(1), c("sitem", "delete"))%>%
      select(!contains("delete"))%>%
      mutate(sitem =
              str_c(subject_item, sitem))
  }
  else if(subject == "math" && grade < 10){
    read_excel("data/2022MCASItemAnalysis.xlsx", sheet = sheet_name,
              skip = 1, col_names= c(subject_item, "Type", "Reporting Category", "Standard", "item Desc", "delete", "item Possible Points","delete","RT Percent Points", "State Percent Points", "RT-State Diff"))%>%
      select(!contains("delete"))%>%
      filter(!str_detect(mitem,"Legend|legend"))%>%
      mutate(mitem = as.character(mitem))%>%
      separate(c(1), c("mitem", "delete"))%>%
      select(!contains("delete"))%>%
      mutate(mitem =
              str_c(subject_item, mitem))

  }
  else if(subject == "math" && grade == 10){
    read_excel("data/2022MCASItemAnalysis.xlsx", sheet = sheet_name,
              skip = 1, col_names= c(subject_item, "Type", "Reporting Category", "Standard", "item Desc", "delete", "item Possible Points","RT Percent Points", "State Percent Points", "RT-State Diff"))%>%
      select(!contains("delete"))%>%
      filter(!str_detect(mitem,"Legend|legend"))%>%
      mutate(mitem = as.character(mitem))%>%
      separate(c(1), c("mitem", "delete"))%>%
      select(!contains("delete"))%>%
      mutate(mitem =
              str_c(subject_item, mitem))

  }

}
## Create Item Data Frame-----------------------------------###
SG9_item <-read_item("SG9Physics", "science", 9)
SG9_item

##Exam Content Functions -----------------------#####

##Function for dataframe with points available by reporting category

Reporting_Cat_Points <-function(subject, reportingCategory, subjectItemDF){
  if(subject == "science"){
    subjectItemDF%>%
      select(`sitem`, `item Possible Points`, `Reporting Category`)%>%
      group_by(`Reporting Category`)%>%
      summarize(available_points = sum(`item Possible Points`, na.rm=TRUE))#%>%
      #filter(`Reporting Category` == reportingCategory)
    
    
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

## Create Exam Content Data Frames

SG9_EN_PTS<-Reporting_Cat_Points("science", "MF", SG9_item)
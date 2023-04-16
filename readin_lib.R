## Read In Function Library---------------------------------------------------

## Function Read-in Item
#Item analysis Read in Function: Input: file_path, sheet_name, subject; return: 
#student item report for a given grade level and subject.
#subject must be: "math", "ela", or "science"
#-------------------------------------------------------------------------------
library(dplyr)

read_item<-function(file_path, sheet_name, subject){
  subject_item<-case_when(
    subject == "science"~"sitem",
    subject == "math"~"mitem",
    subject == "ela"~"eitem"
  )
  if(subject == "science" && sheet_name == "SG11Bio"){
    read_excel(file_path, sheet = sheet_name, 
               skip = 1, col_names= c(subject_item, "Type", "Reporting Category",
                                      "Standard", "item Desc", "delete", 
                                      "item Possible Points","delete", "State Percent Points",
                                      "delete")) %>%
      select(!contains("delete"))%>%
      filter(!str_detect(sitem,"Legend|legend"))%>%
      mutate(sitem= as.character(sitem))%>%
      separate(c(1), c("sitem", "delete"))%>%
      select(!contains("delete"))%>%
      mutate(sitem =
               str_c(subject_item, sitem))
  }
  else if(subject == "science" && sheet_name != "SG11Bio"){
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

#subject must be: "math", "ela", or "science"
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
               skip = 1, col_names= c(subject_item, "Num Texts", "Fiction-Non", "delete"))%>%
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


## Function to Read in Student Performance Data---------------------------------
#Filter, rename variables, and mutate values of variables on read-in

##To-Do, ask if it is ok to include Gender, IEP, and 504 given the size of those groups, right now be safe and don't include:
###: "gender", "IEP", "plan504"
###: Did not include any perpospts, orpts, mcpts (percent possible points raw score, multiple choice points, open response points, as we can calculate it.
#kept raw score in case want to see correlation between raw and scaled)
#file_path: "_data/Spring2022_MCAS_full_preliminary_results_04830305.xlsx"
read_MCAS_Prelim_Private<-function(format, file_path){
  if(format=="csv"){
    read_csv(file_path)%>%
      
      #Recode all nominal variables as characters
      ##6 = NextGen Phys, 2 = Legacy Chem
      mutate(ssubject = as.character(ssubject))%>%
      
      #Recode all ordinal variable as factors
      
      mutate(grade = as.factor(grade))%>%
      #To-Do will need to change this for each year...perhaps don't use this variable?
      mutate(grade2021 = as.factor(grade2021))%>%
      mutate(eperf2 = recode_factor(eperf2,
                                    "E" = "Exceeding",
                                    "M" = "Meeting",
                                    "PM" = "Partially Meeting",
                                    "NM"= "Not Meeting",
                                    .ordered = TRUE))%>%
      mutate(eperflev = recode_factor(eperflev,
                                      "E" = "E",
                                      "M" = "M",
                                      "PM" = "PM",
                                      "NM"= "NM",
                                      "DNT" = "DNT",
                                      "ABS" = "ABS",
                                      .ordered = TRUE))%>%
      mutate(mperf2 = recode_factor(mperf2,
                                    "E" = "Exceeding",
                                    "M" = "Meeting",
                                    "PM" = "Partially Meeting",
                                    "NM"= "Not Meeting",
                                    .ordered = TRUE))%>%
      mutate(mperflev = recode_factor(mperflev,
                                      "E" = "E",
                                      "M" = "M",
                                      "PM" = "PM",
                                      "NM"= "NM",
                                      "INV" = "INV",
                                      "ABS" = "ABS",
                                      .ordered = TRUE))%>%
      
      # The science variables contain a mixture of legacy performance levels and
      # next generation performance levels which needs to be addressed in the ordering
      # of these factors.
      mutate(sperf2 = recode_factor(sperflev,
                                    "E" = "Exceeding",
                                    "M" = "Meeting",
                                    "PM" = "Partially Meeting",
                                    "NM"= "Not Meeting",
                                    .ordered = TRUE))%>%
      mutate(sperflev = recode_factor(sperf2,
                                      "E" = "E",
                                      "M" = "M",
                                      "PM" = "PM",
                                      "NM"= "NM",
                                      "INV" = "INV",
                                      "ABS" = "ABS",
                                      .ordered = TRUE))
  }
  else{read_xlsx(file_path)%>%
      
      #Recode all nominal variables as characters
      ##6 = NextGen Phys, 2 = Legacy Chem
      mutate(ssubject = as.character(ssubject))%>%
      
      #Recode all ordinal variable as factors
      
      mutate(grade = as.factor(grade))%>%
      #To-Do will need to change this for each year...perhaps don't use this variable?
      mutate(grade2021 = as.factor(grade2021))%>%
      mutate(eperf2 = recode_factor(eperf2,
                                    "E" = "Exceeding",
                                    "M" = "Meeting",
                                    "PM" = "Partially Meeting",
                                    "NM"= "Not Meeting",
                                    .ordered = TRUE))%>%
      mutate(eperflev = recode_factor(eperflev,
                                      "E" = "E",
                                      "M" = "M",
                                      "PM" = "PM",
                                      "NM"= "NM",
                                      "DNT" = "DNT",
                                      "ABS" = "ABS",
                                      .ordered = TRUE))%>%
      mutate(mperf2 = recode_factor(mperf2,
                                    "E" = "Exceeding",
                                    "M" = "Meeting",
                                    "PM" = "Partially Meeting",
                                    "NM"= "Not Meeting",
                                    .ordered = TRUE))%>%
      mutate(mperflev = recode_factor(mperflev,
                                      "E" = "E",
                                      "M" = "M",
                                      "PM" = "PM",
                                      "NM"= "NM",
                                      "INV" = "INV",
                                      "ABS" = "ABS",
                                      .ordered = TRUE))%>%
      
      # The science variables contain a mixture of legacy performance levels and
      # next generation performance levels which needs to be addressed in the ordering
      # of these factors.
      mutate(sperf2 = recode_factor(sperflev,
                                    "E" = "Exceeding",
                                    "M" = "Meeting",
                                    "PM" = "Partially Meeting",
                                    "NM"= "Not Meeting",
                                    .ordered = TRUE))%>%
      mutate(sperflev = recode_factor(sperf2,
                                      "E" = "E",
                                      "M" = "M",
                                      "PM" = "PM",
                                      "NM"= "NM",
                                      "INV" = "INV",
                                      "ABS" = "ABS",
                                      .ordered = TRUE))
  }
  
}

student_itemDF<-read_MCAS_Prelim_Private("csv","data/PrivProtectSpring2022_MCAS_full_preliminary_results_04830305.csv")
view(student_itemDF)

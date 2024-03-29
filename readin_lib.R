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
      separate(c(1), c("eitem", "esubitem"))%>%
     # select(!contains("sub"))%>%
      mutate(eitem =
               str_c(subject_item, eitem))%>%
      mutate(esubitem = str_to_lower(esubitem))%>%
      mutate(esubitem = as.character(esubitem))%>%
      replace_with_na(replace = list(esubitem = "0"))
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
      #To-do mutate the idea items so they join with item report
      # mutate(idea1 = recode_factor(idea1,
      #                              "BL"=-2,
      #                              "OT"=-1))%>%
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

## Function to Create Tidy Student Performance Data Frame by Grade level and Subject
## subject = science, math, ela, physics, or biology
Student_Perf<-function(subject, gradeLevel, rawStudentPerfDF){
  if(subject == "science"){
    select( rawStudentPerfDF, grade, contains("scaleds"), contains("perf"), contains("sgp"),
            contains("sitem"), contains("attempt"), contains("subject"))%>%
      filter((grade == gradeLevel) & sattempt != "N")%>%
      pivot_longer(contains("sitem"), names_to = "sitem", values_to = "sitem_score")
        }else if (subject == "physics"){
          select( rawStudentPerfDF, grade, contains("scaleds"), contains("perf"), 
                  contains("sgp"),contains("sitem"), contains("attempt"), contains("subject"))%>%
            filter((grade == gradeLevel) & sattempt != "N")%>%
            filter(ssubject==6)%>%
            pivot_longer(contains("sitem"), names_to = "sitem", values_to = "sitem_score")
        }#To-Do add function for other science tests?
        else if (subject == "math"){
          select( rawStudentPerfDF, grade, contains("scaleds"), contains("perf"), 
          contains("sgp"),contains("mitem"), contains("attempt"), contains("subject"))%>%
            filter((grade == gradeLevel) & mattempt != "N")%>%
            pivot_longer(contains("mitem"), names_to = "mitem", values_to = "mitem_score")
          }
#T0-Do review the eitem codings in raw performance data
          else if(subject == "ela"){
            select(rawStudentPerfDF, grade, contains("scaleds"),contains("perf"), 
                    contains("sgp"),contains("eitem"),contains("conv"),contains("idea"),
                   contains("attempt"), contains("subject"))%>%
              filter((grade == gradeLevel) & eattempt != "N")%>%
              #ToDo-Address the Essay subscores and Item report join to student performance
             
              #pivot_longer(contains("conv1")|contains("conv2")|contains("conv3")|contains("idea1")|contains("idea2")|contains("idea3"), 
               #names_to = "esubitem", values_to = "esubitem_score")%>%
              # mutate(eitem_conv1 = recode_factor(conv1,
              #                                     "OT" = "0.0",
              #                                     "0.0" = "0.0",
              #                                     "1.0" = "1.0",
              #                                     "2.0" = "2.0",
              #                                     "3.0" = "3.0",
              #                                     "4.0" = "4.0",
              #                                     "5.0" = "5.0"))%>%
              # mutate(eitem_conv1 = as.integer(eitem_conv1))%>%
              #to-do figure out how to add the essay idea and conv. sub scores
              pivot_longer(contains("eitem"), 
                           names_to = "eitem", values_to = "eitem_score")
            #pivot_longer(contains("idea1")|contains("idea2")
            #)
          }
}

### Function to Create ELA Writing only Data Frame? with Essay subscore


### Function to Join Student Performance Data Frame to Subject Item Data Frame


Student_Item_Perf<-function(subject, subjectItemDF, studentPerfDF){
  if(subject == "science"){
    item_type = "sitem"
    left_join(subjectItemDF, studentPerfDF, item_type)%>%
      filter(`item Possible Points` >=1)
    
  }else if(subject == "math"){
    item_type = "mitem"
    left_join(subjectItemDF, studentPerfDF, item_type)%>%
      filter(`item Possible Points` >=1)
  }#To-Do review the eitem codings in raw performance data for the essay subscores...
  ##and address in crosswalk or read?
  else if(subject == "ela"){
    item_type = "eitem"
    subjectItemDFJoin<-subjectItemDF%>%
      select(!contains("esubitem"))%>%
      filter(!str_detect(eitem,"WR|LA"))
    studentPerfDFJoin<-studentPerfDF%>%
      select(!contains("esubitem"))
    left_join(subjectItemDFJoin, studentPerfDFJoin, item_type)%>%
      filter(`item Possible Points` >=1)
  }
  
  
  
}




Student_Essay_Perf<-function(gradeLevel, rawStudentPerfDF, ELAItemDF){
  #create Essay subscore DF only
  studentEssayPerfDF<-select(rawStudentPerfDF, grade, contains("scaleds"),contains("perf"), 
        contains("sgp"),contains("conv"),contains("idea"),
        contains("attempt"), contains("subject"))%>%
        filter((grade == gradeLevel) & eattempt != "N")%>%
        pivot_longer(contains("conv1")|contains("conv2")|contains("conv3")|
                       contains("idea1")|contains("idea2")|contains("idea3"), 
        names_to = "esubitem", values_to = "esubitem_score")%>%
        replace_with_na(replace = list(esubitem_score = "OT"))%>%
        mutate(esubitem_score = as.integer(esubitem_score))
  ELAsubItemDF<-ELAItemDF%>%
    filter(str_detect(`esubitem`, "conv") | str_detect(`esubitem`, "idea"))
  left_join(ELAsubItemDF, studentEssayPerfDF, "esubitem")
    
}

 # Student_Essay_subItem_Perf<-function(studentEssayPerfDF, ELAItemDF){
 #   ELAItemDF%>%
 #     filter(str_detect(`esubitem`, "conv") | str_detect(`esubitem`, "idea"))%>%
 #     left_join(ELAItemDF, studentEssayPerfDF, "esubitem")
 # }





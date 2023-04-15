

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
               skip = 1, col_names= c(subject_item, "Type", "Reporting Category", "Standard", "item Desc", "delete", "item Possible Points","delete","RT Percent Points", "State Percent Points", "RT-State Diff"))%>%
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

## Create Science Item Data Frames----------------------------------------------
#Science G11 Bio
SG11_item<-read_item("data/2022MCASItemAnalysis.xlsx", "SG11Bio", "science")
SG11_xWalk<-read_item_xwalk("data/2022MCASItemXWalk.xlsx", "SG11_practice_xwalk", 
                           "science")
SG11_item<-Join_Item_Xwalk("science", SG11_item, SG11_xWalk)

#Science G9 Physics
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

##Create Math Item Data Frames--------------------------------------------------
MG10_item <-read_item("data/2022MCASItemAnalysis.xlsx", "MG10", "math")

MG8_item <-read_item("data/2022MCASItemAnalysis.xlsx", "MG8", "math")

MG7_item <-read_item("data/2022MCASItemAnalysis.xlsx", "MG7", "math")

MG6_item <-read_item("data/2022MCASItemAnalysis.xlsx", "MG6", "math")

MG5_item <-read_item("data/2022MCASItemAnalysis.xlsx", "MG5", "math")

##Create ELA Item Data Frames--------------------------------------------------
##Read in ELA Cluster xWalk for all grades
ELA_cluster_xwalk<-read_ela_clusterXwalk("data/2022MCASItemXWalk.xlsx", "ELA_cluster_xwalk")

#G10 ELA
ELA10_item<-read_item("data/2022MCASItemAnalysis.xlsx", "EG10", "ela")
ELA10_xWalk<-read_item_xwalk("data/2022MCASItemXWalk.xlsx", "ELA10_xwalk", 
                           "ela")
ELA10_item<-Join_Item_Xwalk("ela", ELA10_item, ELA10_xWalk)
ELA10_item<-Join_ELAItem_Cluster(ELA10_item, ELA_cluster_xwalk)
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
      filter(`Reporting Category` == reportingCategory)#%>%

    
    
  }
  else if (subject == "math"){
    subjectItemDF%>%
      select(`mitem`, `item Possible Points`, `Reporting Category`)%>%
      group_by(`Reporting Category`)%>%
      summarise(available_points = sum(`item Possible Points`, na.rm=TRUE))%>%
      filter(`Reporting Category` == reportingCategory)
    
  } 
  else if (subject == "ELA"){
    subjectItemDF%>%
      select(`eitem`, `item Possible Points`, `Reporting Category`)%>%
      group_by(`Reporting Category`)%>%
      summarise(available_points = sum(`item Possible Points`, na.rm=TRUE))%>%
      filter(`Reporting Category` == reportingCategory)
    
  }
}

## Create Points Available by Category Data Frames------------------------------
#Reporting Categories: HS Bio: "EC", "EV", "HE", "MO" for science grade levels
#G11 Biology
SG11_CR_PTS<-Item_Type_Points("CR", SG11_item)
SG11_SR_PTS<-Item_Type_Points("SR", SG11_item)
SG11_MD_PTS<-Practice_Cat_Points("science", "Mathematics and Data", SG11_item)
SG11_ERM_PTS<-Practice_Cat_Points("science", "Evidence, Reasoning, and Modeling", SG11_item)
SG11_IQ_PTS<-Practice_Cat_Points("science", "Investigations and Questioning", SG11_item)
SG11_EC_PTS<-Reporting_Cat_Points("science", "EC", SG11_item)
SG11_EV_PTS<-Reporting_Cat_Points("science", "EV", SG11_item)
SG11_HE_PTS<-Reporting_Cat_Points("science", "HE", SG11_item)
SG11_MO_PTS<-Reporting_Cat_Points("science", "MO", SG11_item)

#Reporting Categories: Intro Physics: "MF", "EN", "WA" for science grade levels
#G9 Intro Physics
SG9_CR_PTS<-Item_Type_Points("CR", SG9_item)
SG9_SR_PTS<-Item_Type_Points("SR", SG9_item)
SG9_MD_PTS<-Practice_Cat_Points("science", "Mathematics and Data", SG9_item)
SG9_ERM_PTS<-Practice_Cat_Points("science", "Evidence, Reasoning, and Modeling", SG9_item)
SG9_IQ_PTS<-Practice_Cat_Points("science", "Investigations and Questioning", SG9_item)
SG9_MF_PTS<-Reporting_Cat_Points("science", "MF", SG9_item)
SG9_EN_PTS<-Reporting_Cat_Points("science", "EN", SG9_item)
SG9_WA_PTS<-Reporting_Cat_Points("science", "WA", SG9_item)

#Reporting Categories: Intro Physics: "MF", "EN", "WA" for science grade levels
#G8 STE: "ES", ""LS", PS", "TE"
SG8_CR_PTS<-Item_Type_Points("CR", SG8_item)
SG8_SR_PTS<-Item_Type_Points("SR", SG8_item)
SG8_MD_PTS<-Practice_Cat_Points("science", "Mathematics and Data", SG8_item)
SG8_ERM_PTS<-Practice_Cat_Points("science", "Evidence, Reasoning, and Modeling", SG8_item)
SG8_IQ_PTS<-Practice_Cat_Points("science", "Investigations and Questioning", SG8_item)
SG8_ES_PTS<-Reporting_Cat_Points("science", "ES", SG8_item)
SG8_LS_PTS<-Reporting_Cat_Points("science", "LS", SG8_item)
SG8_PS_PTS<-Reporting_Cat_Points("science", "PS", SG8_item)
SG8_TE_PTS<-Reporting_Cat_Points("science", "TE", SG8_item)

#G5 STE: "ES", ""LS", PS", "TE"
SG5_CR_PTS<-Item_Type_Points("CR", SG5_item)
SG5_SR_PTS<-Item_Type_Points("SR", SG5_item)
SG5_MD_PTS<-Practice_Cat_Points("science", "Mathematics and Data", SG5_item)
SG5_ERM_PTS<-Practice_Cat_Points("science", "Evidence, Reasoning, and Modeling", SG5_item)
SG5_IQ_PTS<-Practice_Cat_Points("science", "Investigations and Questioning", SG5_item)
SG5_ES_PTS<-Reporting_Cat_Points("science", "ES", SG5_item)
SG5_LS_PTS<-Reporting_Cat_Points("science", "LS", SG5_item)
SG5_PS_PTS<-Reporting_Cat_Points("science", "PS", SG5_item)
SG5_TE_PTS<-Reporting_Cat_Points("science", "TE", SG5_item)

#Reporting Categories: G10 Math: 
    #"AF":Algebra and Functions,
    #GE":Geometry,
    #"NQ": Number and Quantity,
    # "SP": Statistics and Probability
# Question Type: G10 Math:
    #"CR": Constructed Response, "SA": Short Answer, "SR": Selected Response

MG10_CR_PTS<-Item_Type_Points("CR", MG10_item)
MG10_SA_PTS<-Item_Type_Points("SA", MG10_item)
MG10_SR_PTS<-Item_Type_Points("SR", MG10_item)
MG10_AF_PTS<-Reporting_Cat_Points("math", "AF", MG10_item)
MG10_GE_PTS<-Reporting_Cat_Points("math", "GE", MG10_item)
MG10_NQ_PTS<-Reporting_Cat_Points("math", "NQ", MG10_item)
MG10_SP_PTS<-Reporting_Cat_Points("math", "SP", MG10_item)

#Reporting Categories: G8 Math: 
# "FN": Functions
#"GE":Geometry,
# "NSEE":Number System & Expressions and Eqns,
# "SP": Statistics and Probability
# Question Type: G8 Math:
#"CR": Constructed Response, "SA": Short Answer, "SR": Selected Response


MG8_CR_PTS<-Item_Type_Points("CR", MG8_item)
MG8_SA_PTS<-Item_Type_Points("SA", MG8_item)
MG8_SR_PTS<-Item_Type_Points("SR", MG8_item)
MG8_FN_PTS<-Reporting_Cat_Points("math", "FN", MG8_item)
MG8_GE_PTS<-Reporting_Cat_Points("math", "GE", MG8_item)
MG8_NSEE_PTS<-Reporting_Cat_Points("math", "NSEE", MG8_item)


MG8_RP_PTS<-Reporting_Cat_Points("math", "RP", MG8_item)
MG8_SP_PTS<-Reporting_Cat_Points("math", "SP", MG8_item)

#Reporting Categories: G7 Math: 
# 
#"GE":Geometry, "MD":Measurement and Data
# "NS": The Number System,
# "RP": Ratios and Proportional Relationships, "SP": Statistics and Probability
# Question Type: G6 Math:
#"CR": Constructed Response, "SA": Short Answer, "SR": Selected Response

MG7_CR_PTS<-Item_Type_Points("CR", MG7_item)
MG7_SA_PTS<-Item_Type_Points("SA", MG7_item)
MG7_SR_PTS<-Item_Type_Points("SR", MG7_item)
MG7_EE_PTS<-Reporting_Cat_Points("math", "EE", MG7_item)
MG7_GE_PTS<-Reporting_Cat_Points("math", "GE", MG7_item)
MG7_NS_PTS<-Reporting_Cat_Points("math", "NS", MG7_item)

MG7_RP_PTS<-Reporting_Cat_Points("math", "RP", MG7_item)
MG7_SP_PTS<-Reporting_Cat_Points("math", "SP", MG7_item)

#Reporting Categories: G6 Math: 
# 
#"GE":Geometry, "MD":Measurement and Data
# "NS": The Number System,
# "RP": Ratios and Proportional Relationships, "SP": Statistics and Probability
# Question Type: G6 Math:
#"CR": Constructed Response, "SA": Short Answer, "SR": Selected Response

MG6_CR_PTS<-Item_Type_Points("CR", MG6_item)
MG6_SA_PTS<-Item_Type_Points("SA", MG6_item)
MG6_SR_PTS<-Item_Type_Points("SR", MG6_item)
MG6_EE_PTS<-Reporting_Cat_Points("math", "EE", MG6_item)
MG6_GE_PTS<-Reporting_Cat_Points("math", "GE", MG6_item)
MG6_NS_PTS<-Reporting_Cat_Points("math", "NS", MG6_item)

MG6_RP_PTS<-Reporting_Cat_Points("math", "RP", MG6_item)
MG6_SP_PTS<-Reporting_Cat_Points("math", "SP", MG6_item)

#Reporting Categories: G5 Math: 
# 
#"GE":Geometry, 
#"MD":Measurement and Data
# "NS": The Number System,
# "NT": Numbers and Operations Base Ten, 
#"OA": Operations and Algebraic Thinking
# Question Type: G6 Math:
#"CR": Constructed Response, "SA": Short Answer, "SR": Selected Response

MG5_CR_PTS<-Item_Type_Points("CR", MG5_item)
MG5_SA_PTS<-Item_Type_Points("SA", MG5_item)
MG5_SR_PTS<-Item_Type_Points("SR", MG5_item)

MG5_GE_PTS<-Reporting_Cat_Points("math", "GE", MG5_item)
MG5_MD_PTS<-Reporting_Cat_Points("math", "MD", MG5_item)
MG5_NF_PTS<-Reporting_Cat_Points("math", "NF", MG5_item)
MG5_NT_PTS<-Reporting_Cat_Points("math", "NT", MG5_item)
MG5_OA_PTS<-Reporting_Cat_Points("math", "OA", MG5_item)

#Reporting Categories: G10 ELA: 
# 
#"LA":E, 
#"RE":Reading
# "WR": Writing,

# Question Type: G10 ELA:
#"ES": Essay,  "SR": Selected Response


ELA10_ES_PTS<-Item_Type_Points("ES", ELA10_item)
#ELA10_SA_PTS<-Item_Type_Points("SA", ELA10_item)
ELA10_SR_PTS<-Item_Type_Points("SR", ELA10_item)

ELA10_LA_PTS<-Reporting_Cat_Points("ela", "LA", ELA10_item)
ELA10_RE_PTS<-Reporting_Cat_Points("ela", "RE", ELA10_item)
ELA10_WR_PTS<-Reporting_Cat_Points("ela", "WR", ELA10_item)

##-----------------------------------------------------------------------------


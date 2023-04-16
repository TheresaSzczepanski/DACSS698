source('dependencies.R')


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

## Create Student Item Data Frames----------------------------------------------
student_itemDF<-read_MCAS_Prelim_Private("csv","data/PrivProtectSpring2022_MCAS_full_preliminary_results_04830305.csv")
view(student_itemDF)

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
#"LA":E, 
#"RE":Reading
# "WR": Writing,
#
# Question Type: G10 ELA:
#"ES": Essay,  "SR": Selected Response

ELA10_ES_PTS<-Item_Type_Points("ES", ELA10_item)
#ELA10_SA_PTS<-Item_Type_Points("SA", ELA10_item)
ELA10_SR_PTS<-Item_Type_Points("SR", ELA10_item)

ELA10_RE_PTS<-Reporting_Cat_Points("ela", "RE", ELA10_item)
ELA10_WR_PTS<-Reporting_Cat_Points("ela", "WR", ELA10_item)

## Writing language Points
ELA10_ESLA_item<-ELA10_item %>%
  filter(str_detect(eitem,"LA"))
ELA10_ESLA_pts<-Reporting_Cat_Points("ela", "LA", ELA10_ESLA_item)

## Reading Language Points
ELA10_RELA_item<-ELA10_item %>%
  filter(!str_detect(eitem,"LA"))
ELA10_RELA_PTS<-Reporting_Cat_Points("ela", "LA", ELA10_RELA_item)

# Domain Cluster Points

ELA10_CS_PTS<-Practice_Cat_Points("ela", "Craft and Structure", ELA10_item)
ELA10_CV_PTS<-Practice_Cat_Points("ela", "Conventions", ELA10_item)
ELA10_KD_PTS<-Practice_Cat_Points("ela", "Key Ideas and Details", ELA10_item)
ELA10_KL_PTS<-Practice_Cat_Points("ela", "Knowledge of Language", ELA10_item)
ELA10_ID_PTS<-Practice_Cat_Points("ela", "Idea Development", ELA10_item)
ELA10_IK_PTS<-Practice_Cat_Points("ela", "Integration of Knowledge and Ideas", ELA10_item)
ELA10_VA_PTS<-Practice_Cat_Points("ela", "Vocabulary Acquisition and Use", ELA10_item)
ELA10_WC_PTS<-Practice_Cat_Points("ela", "Writing Combined (Conv/Idea Dev)", ELA10_item)
ELA10_F_PTS<-ELA_Fiction_Points("Fiction", ELA10_item)
ELA10_NF_PTS<-ELA_Fiction_Points("Non-Fiction", ELA10_item)
ELA10_2Text_PTS<-ELA_NumText_Points("More than 1", ELA10_item)
ELA10_1Text_PTS<-ELA_NumText_Points("1.0", ELA10_item)

# Med RT-State Diff
ELA10_F_Diff<-ELA_Fiction_RTState("Fiction", ELA10_item)
ELA10_NF_Diff<-ELA_Fiction_RTState("Non-Fiction", ELA10_item)
ELA10_2Text_Diff<-ELA_NumText_RTState("More than 1", ELA10_item)
ELA10_1Text_Diff<-ELA_NumText_RTState("1.0", ELA10_item)

##-----------------------------------------------------------------------------


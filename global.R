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
EG10_item<-read_item("data/2022MCASItemAnalysis.xlsx", "EG10", "ela")
EG10_xWalk<-read_item_xwalk("data/2022MCASItemXWalk.xlsx", "EG10_xwalk", 
                           "ela")
EG10_item<-Join_Item_Xwalk("ela", EG10_item, EG10_xWalk)
EG10_item<-Join_ELAItem_Cluster(EG10_item, ELA_cluster_xwalk)
#view(EG10_item)
## Create Student Item Data Frames----------------------------------------------
student_itemDF<-read_MCAS_Prelim_Private("csv","data/PrivProtectSpring2022_MCAS_full_preliminary_results_04830305.csv")
#view(student_itemDF)

SG9_student_perf<-Student_Perf("physics", 9, student_itemDF)
SG9_student_item_perf<-Student_Item_Perf("science", SG9_item, SG9_student_perf)
#view(SG9_student_item_perf)
#view(SG9_student_perf)

SG8_student_perf<-Student_Perf("science", 8, student_itemDF)
#view(SG8_student_perf)
SG8_student_item_perf<-Student_Item_Perf("science", SG8_item, SG8_student_perf)

SG5_student_perf<-Student_Perf("science", 5, student_itemDF)
SG5_student_item_perf<-Student_Item_Perf("science", SG5_item, SG5_student_perf)
#view(SG5_student_perf)


MG10_student_perf<-Student_Perf("math", 10, student_itemDF)
#view(MG10_student_perf)
MG10_student_item_perf<-Student_Item_Perf("math", MG10_item, MG10_student_perf)
#view(MG10_student_item_perf)
MG8_student_perf<-Student_Perf("math", 8, student_itemDF)
MG8_student_item_perf<-Student_Item_Perf("math", MG8_item, MG8_student_perf)
MG7_student_perf<-Student_Perf("math", 7, student_itemDF)
MG7_student_item_perf<-Student_Item_Perf("math", MG7_item, MG7_student_perf)
MG6_student_perf<-Student_Perf("math", 6, student_itemDF)
MG6_student_item_perf<-Student_Item_Perf("math", MG6_item, MG6_student_perf)
MG5_student_perf<-Student_Perf("math", 5, student_itemDF)
MG5_student_item_perf<-Student_Item_Perf("math", MG5_item, MG5_student_perf)

EG10_student_perf<-Student_Perf("ela", 10, student_itemDF)
EG10_student_item_perf<-Student_Item_Perf("ela", EG10_item, EG10_student_perf)
view(EG10_item)
view(EG10_student_item_perf)
view(EG10_student_perf)
EG10_student_essay_perf<-Student_Essay_Perf(10, student_itemDF, EG10_item)
view(EG10_student_essay_perf)

EG10_ESconv_Diff<-ELA_Subitem_Diff("conv", EG10_student_essay_perf)
view(EG10_ESconv_Diff)
EG10_ESidea_Diff<-ELA_Subitem_Diff("idea", EG10_student_essay_perf)
view(EG10_ESidea_Diff)
## Create Points Available and RT-State Diff by Category Data Frames------------------------------
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
#RT-State Diff
#G9 Intro Physics
#To-Do: Change the name of this function to mimic the points naming convention?
#view(SG9_student_item_perf)
SG9_CR_Diff<-Item_Type_Diff("science", "CR", SG9_student_item_perf)
#view(SG9_CR_Diff)
SG9_SR_Diff<-Item_Type_Diff("science", "SR", SG9_student_item_perf)
SG9_MD_Diff<-Practice_Cat_Diff("science", "Mathematics and Data", SG9_student_item_perf)
#view(SG9_MD_Diff)
SG9_ERM_Diff<-Practice_Cat_Diff("science", "Evidence, Reasoning, and Modeling", SG9_student_item_perf)
SG9_IQ_Diff<-Practice_Cat_Diff("science", "Investigations and Questioning", SG9_student_item_perf)
SG9_MF_PTS<-Reporting_Cat_Points("science", "MF", SG9_item)
SG9_MF_Diff<-Reporting_Cat_Diff("science", "MF", SG9_student_item_perf)
SG9_EN_PTS<-Reporting_Cat_Points("science", "EN", SG9_item)
SG9_EN_Diff<-Reporting_Cat_Diff("science", "EN", SG9_student_item_perf)
SG9_WA_PTS<-Reporting_Cat_Points("science", "WA", SG9_item)
SG9_WA_Diff<-Reporting_Cat_Diff("science", "WA", SG9_student_item_perf)

#Reporting Categories: G8STE: "MF", "EN", "WA" for science grade levels
#G8 STE: "ES", ""LS", PS", "TE"
#view(SG8_student_item_perf)
SG8_CR_PTS<-Item_Type_Points("CR", SG8_item)
SG8_CR_Diff<-Item_Type_Diff("science", "CR", SG8_student_item_perf)


SG8_SR_PTS<-Item_Type_Points("SR", SG8_item)
SG8_SR_Diff<-Item_Type_Diff("science", "SR", SG8_student_item_perf)


SG8_MD_PTS<-Practice_Cat_Points("science", "Mathematics and Data", SG8_item)
SG8_MD_Diff<-Practice_Cat_Diff("science", "Mathematics and Data", SG8_student_item_perf)
SG8_ERM_PTS<-Practice_Cat_Points("science", "Evidence, Reasoning, and Modeling", SG8_item)
SG8_ERM_Diff<-Practice_Cat_Diff("science", "Evidence, Reasoning, and Modeling", SG8_student_item_perf)
SG8_IQ_PTS<-Practice_Cat_Points("science", "Investigations and Questioning", SG8_item)
SG8_IQ_Diff<-Practice_Cat_Diff("science", "Investigations and Questioning", SG8_student_item_perf)

SG8_ES_PTS<-Reporting_Cat_Points("science", "ES", SG8_item)
SG8_ES_Diff<-Reporting_Cat_Diff("science", "ES", SG8_student_item_perf)
SG8_LS_PTS<-Reporting_Cat_Points("science", "LS", SG8_item)
SG8_LS_Diff<-Reporting_Cat_Diff("science", "LS", SG8_student_item_perf)
SG8_PS_PTS<-Reporting_Cat_Points("science", "PS", SG8_item)
SG8_TE_PTS<-Reporting_Cat_Points("science", "TE", SG8_item)
SG8_PS_Diff<-Reporting_Cat_Diff("science", "PS", SG8_student_item_perf)
SG8_TE_Diff<-Reporting_Cat_Diff("science", "TE", SG8_student_item_perf)

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

SG5_CR_Diff<-Item_Type_Diff("science", "CR", SG5_student_item_perf)
SG5_SR_Diff<-Item_Type_Diff("science","SR", SG5_student_item_perf)
SG5_MD_Diff<-Practice_Cat_Diff("science", "Mathematics and Data", SG5_student_item_perf)
SG5_ERM_Diff<-Practice_Cat_Diff("science", "Evidence, Reasoning, and Modeling", SG5_student_item_perf)
SG5_IQ_Diff<-Practice_Cat_Diff("science", "Investigations and Questioning", SG5_student_item_perf)
SG5_ES_Diff<-Reporting_Cat_Diff("science", "ES", SG5_student_item_perf)
SG5_LS_Diff<-Reporting_Cat_Diff("science", "LS", SG5_student_item_perf)
SG5_PS_Diff<-Reporting_Cat_Diff("science", "PS", SG5_student_item_perf)
SG5_TE_Diff<-Reporting_Cat_Diff("science", "TE", SG5_student_item_perf)

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

MG10_CR_Diff<-Item_Type_Diff("math", "CR", MG10_student_item_perf)
MG10_SA_Diff<-Item_Type_Diff("math", "SA", MG10_student_item_perf)
MG10_SR_Diff<-Item_Type_Diff("math", "SR", MG10_student_item_perf)
MG10_AF_Diff<-Reporting_Cat_Diff("math", "AF", MG10_student_item_perf)
MG10_GE_Diff<-Reporting_Cat_Diff("math", "GE", MG10_student_item_perf)
MG10_NQ_Diff<-Reporting_Cat_Diff("math", "NQ", MG10_student_item_perf)
MG10_SP_Diff<-Reporting_Cat_Diff("math", "SP", MG10_student_item_perf)

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

MG8_CR_Diff<-Item_Type_Diff("math", "CR", MG8_student_item_perf)
MG8_SA_Diff<-Item_Type_Diff("math", "SA", MG8_student_item_perf)
MG8_SR_Diff<-Item_Type_Diff("math", "SR", MG8_student_item_perf)
MG8_FN_Diff<-Reporting_Cat_Diff("math", "FN", MG8_student_item_perf)
MG8_GE_Diff<-Reporting_Cat_Diff("math", "GE", MG8_student_item_perf)
MG8_NSEE_Diff<-Reporting_Cat_Diff("math", "NSEE", MG8_student_item_perf)


MG8_RP_Diff<-Reporting_Cat_Diff("math", "RP", MG8_student_item_perf)
MG8_SP_Diff<-Reporting_Cat_Diff("math", "SP", MG8_student_item_perf)

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

MG7_CR_Diff<-Item_Type_Diff("math", "CR", MG7_student_item_perf)
MG7_SA_Diff<-Item_Type_Diff("math", "SA", MG7_student_item_perf)
MG7_SR_Diff<-Item_Type_Diff("math", "SR", MG7_student_item_perf)
MG7_EE_Diff<-Reporting_Cat_Diff("math", "EE", MG7_student_item_perf)
MG7_GE_Diff<-Reporting_Cat_Diff("math", "GE", MG7_student_item_perf)
MG7_NS_Diff<-Reporting_Cat_Diff("math", "NS", MG7_student_item_perf)

MG7_RP_Diff<-Reporting_Cat_Diff("math", "RP", MG7_student_item_perf)
MG7_SP_Diff<-Reporting_Cat_Diff("math", "SP", MG7_student_item_perf)

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

MG6_CR_Diff<-Item_Type_Diff("math", "CR", MG6_student_item_perf)
MG6_SA_Diff<-Item_Type_Diff("math", "SA", MG6_student_item_perf)
MG6_SR_Diff<-Item_Type_Diff("math","SR", MG6_student_item_perf)
MG6_EE_Diff<-Reporting_Cat_Diff("math", "EE", MG6_student_item_perf)
MG6_GE_Diff<-Reporting_Cat_Diff("math", "GE", MG6_student_item_perf)
MG6_NS_Diff<-Reporting_Cat_Diff("math", "NS", MG6_student_item_perf)

MG6_RP_Diff<-Reporting_Cat_Diff("math", "RP", MG6_student_item_perf)
MG6_SP_Diff<-Reporting_Cat_Diff("math", "SP", MG6_student_item_perf)

#Reporting Categories: G5 Math: 
# 
#"GE":Geometry, 
#"MD":Measurement and Data
# "NS": The Number System,
# "NT": Numbers and Operations Base Ten, 
#"OA": Operations and Algebraic Thinking
# Question Type: G6 Math:
#"CR": Constructed Response, "SA": Short Answer, "SR": Selected Response

MG5_CR_PTS<-Item_Type_Points( "CR", MG5_item)
MG5_SA_PTS<-Item_Type_Points( "SA", MG5_item)
MG5_SR_PTS<-Item_Type_Points( "SR", MG5_item)

MG5_GE_PTS<-Reporting_Cat_Points("math", "GE", MG5_item)
MG5_MD_PTS<-Reporting_Cat_Points("math", "MD", MG5_item)
MG5_NF_PTS<-Reporting_Cat_Points("math", "NF", MG5_item)
MG5_NT_PTS<-Reporting_Cat_Points("math", "NT", MG5_item)
MG5_OA_PTS<-Reporting_Cat_Points("math", "OA", MG5_item)


MG5_CR_Diff<-Item_Type_Diff("math", "CR", MG5_student_item_perf)
MG5_SA_Diff<-Item_Type_Diff("math", "SA", MG5_student_item_perf)
MG5_SR_Diff<-Item_Type_Diff("math", "SR", MG5_student_item_perf)

MG5_GE_Diff<-Reporting_Cat_Diff("math", "GE", MG5_student_item_perf)
MG5_MD_Diff<-Reporting_Cat_Diff("math", "MD", MG5_student_item_perf)
MG5_NF_Diff<-Reporting_Cat_Diff("math", "NF", MG5_student_item_perf)
MG5_NT_Diff<-Reporting_Cat_Diff("math", "NT", MG5_student_item_perf)
MG5_OA_Diff<-Reporting_Cat_Diff("math", "OA", MG5_student_item_perf)
#Reporting Categories: G10 ELA: 
#"LA":E, 
#"RE":Reading
# "WR": Writing,
#
# Question Type: G10 ELA:
#"ES": Essay,  "SR": Selected Response

EG10_ES_PTS<-Item_Type_Points("ES", EG10_item)
EG10_SR_PTS<-Item_Type_Points("SR", EG10_item)

###RT-State Diff by Question Type
EG10_SR_Diff<-Item_Type_Diff("ela", "SR", EG10_student_item_perf)
EG10_ES_Diff<-Item_Type_Diff("ela", "ES", EG10_student_item_perf)


EG10_RE_PTS<-Reporting_Cat_Points("ela", "RE", EG10_item)
EG10_WR_PTS<-Reporting_Cat_Points("ela", "WR", EG10_item)

## Writing language Points
EG10_ESLA_item<-EG10_item %>%
  filter(str_detect(eitem,"LA"))
EG10_ESLA_pts<-Reporting_Cat_Points("ela", "LA", EG10_ESLA_item)

## Reading Language Points
EG10_RELA_item<-EG10_item %>%
  filter(!str_detect(eitem,"LA"))
EG10_RELA_PTS<-Reporting_Cat_Points("ela", "LA", EG10_RELA_item)

##Diff by LA and RE (need to separate WR LA and RE LA)
EG10_LA_Diff<-Reporting_Cat_Diff("ela", "LA", EG10_student_item_perf)
#view(EG10_LA_Diff)
EG10_RE_Diff<-Reporting_Cat_Diff("ela", "RE", EG10_student_item_perf)
#view(EG10_RE_Diff)

# Domain Cluster Points

EG10_CS_PTS<-Practice_Cat_Points("ela", "Craft and Structure", EG10_item)

EG10_CV_PTS<-Practice_Cat_Points("ela", "Conventions", EG10_item)

EG10_KD_PTS<-Practice_Cat_Points("ela", "Key Ideas and Details", EG10_item)
EG10_KL_PTS<-Practice_Cat_Points("ela", "Knowledge of Language", EG10_item)
EG10_ID_PTS<-Practice_Cat_Points("ela", "Idea Development", EG10_item)
EG10_IK_PTS<-Practice_Cat_Points("ela", "Integration of Knowledge and Ideas", EG10_item)
EG10_VA_PTS<-Practice_Cat_Points("ela", "Vocabulary Acquisition and Use", EG10_item)
EG10_WC_PTS<-Practice_Cat_Points("ela", "Writing Combined (Conv/Idea Dev)", EG10_item)

##Domain Cluster RT-State
EG10_CS_Diff<-Practice_Cat_Diff("ela", "Craft and Structure", EG10_student_item_perf)
EG10_CV_Diff<-Practice_Cat_Diff("ela", "Conventions", EG10_student_item_perf)
#view(EG10_CV_Diff)
EG10_KD_Diff<-Practice_Cat_Diff("ela", "Key Ideas and Details", EG10_student_item_perf)
#view(EG10_KD_Diff)
EG10_KL_Diff<-Practice_Cat_Diff("ela", "Knowledge of Language", EG10_student_item_perf)
#view(EG10_KL_Diff)
EG10_ID_Diff<-Practice_Cat_Diff("ela", "Idea Development", EG10_student_item_perf)
#view(EG10_ID_Diff)
EG10_IK_Diff<-Practice_Cat_Diff("ela", "Integration of Knowledge and Ideas", EG10_student_item_perf)
#view(EG10_IK_Diff)
EG10_VA_Diff<-Practice_Cat_Diff("ela", "Vocabulary Acquisition and Use", EG10_student_item_perf)
#view(EG10_VA_Diff)
EG10_WC_Diff<-Practice_Cat_Diff("ela", "Writing Combined (Conv/Idea Dev)", EG10_student_item_perf)
#view(EG10_WC_Diff)

# xWalk Items Pts & RT-State Diff
EG10_F_PTS<-ELA_Fiction_Points("Fiction", EG10_item)
EG10_NF_PTS<-ELA_Fiction_Points("Non-Fiction", EG10_item)
EG10_2Text_PTS<-ELA_NumText_Points("More than 1", EG10_item)
EG10_1Text_PTS<-ELA_NumText_Points("1.0", EG10_item)
EG10_F_Diff<-ELA_Fiction_RTState("Fiction", EG10_student_item_perf)
EG10_NF_Diff<-ELA_Fiction_RTState("Non-Fiction", EG10_student_item_perf)
EG10_2Text_Diff<-ELA_NumText_RTState("More than 1", EG10_student_item_perf)
EG10_1Text_Diff<-ELA_NumText_RTState("1.0", EG10_student_item_perf)

# EG10_test<-EG10_student_item_perf%>%
#   group_by(`Cluster`)%>%
#   summarise(available_points = sum(`item Possible Points`, na.rm=TRUE),
#             RT_points = sum(`eitem_score`, na.rm = TRUE),
#             RT_Percent_Points = 100*round(RT_points/available_points,2),
#             State_Percent_Points = 100*round(sum(`State Percent Points`*`item Possible Points`/available_points, na.rm = TRUE),2))%>%
#   mutate(`RT-State Diff` =RT_Percent_Points-State_Percent_Points)
#   
# view(EG10_test)

##-----------------------------------------------------------------------------


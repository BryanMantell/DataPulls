* Encoding: UTF-8.
*STEP 0: NOTES
*Child Behavior Checklist (CBCL).
 
*10-01-21(BM): Adapted STEPS 1-16 from A1 Syntax.
*12-07-21(AZ): Edited syntax to include changes 
*1-13-22(BM): Checked and Edited comment in STEP 5A.
*1-20-22(AAC): CHECKED. Updated STEP 6, STEP 10, STEP 11, and STEP 13 notes to match syntax template. 
*1-21-22(BM): Recoded the IDs that were not administered the CBCL.
*1-27-22(BM): Fixed remaining system missing.
*2-5-22(AAC): CHECKED

*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------.
*STEP 1: OPENING RAW DATA.
*Insert the correct file path and file name. Use syntax to open raw data file.
GET
 FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/DBT Moms R01 Study Time 2 Mother Survey_December 3, 2021_13.49.sav'.

*STEP 2: SAVING QUESTIONNAIRE SPECIFIC RAW DATA. 
*Insert the correct file path and file name. Save this file with only those variables that you need, in the following order; ID, Start Date, Questionnaire Items (i.e., DERS_1 to DERS_36).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OCBCL_Cleaned.sav'
  /KEEP 
  FQ2ID 
  STARTDATE
  FQ2CBCL_1 TO FQ2CBCL_100_TEXT
  /COMPRESSED.
  EXECUTE.

*STEP 3: OPEN NEW DATA FILE.  
*Insert the correct file path and file name. Open the file you just created and saved so that you are able to clean the data.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OCBCL_Cleaned.sav'.

*STEP 4: TRANSFORM VARIABLES AND SORT IDS ASCENDING ORDER.
*Transforming ID from a string to a numeric variable, change the date format of startdate, and sort IDs in ascending order.
ALTER TYPE FQ2ID (F10.0).
EXECUTE.
FORMATS STARTDATE (adate10).
EXECUTE.
SORT CASES BY FQ2ID(A).
EXECUTE.

*STEP 5: RENAME ‘RAW DATA’ VARIABLES TO ‘CLEANED’ VARIABLES NAMES. 
*Rename all variables so they reflect our naming scheme. ID should always be labeled as 'ID'. Item should be numbers 01-36 or 001-106. 
RENAME VARIABLE (FQ2ID=ID).
EXECUTE.
RENAME VARIABLE (STARTDATE=FQ2OCBCLDATE).
EXECUTE.
RENAME VARIABLE (FQ2CBCL_1 = FQ2OCBCL001) (FQ2CBCL_2 = FQ2OCBCL002) (FQ2CBCL_3 = FQ2OCBCL003) (FQ2CBCL_4 = FQ2OCBCL004) (FQ2CBCL_5 = FQ2OCBCL005)
                            (FQ2CBCL_6 = FQ2OCBCL006) (FQ2CBCL_7 = FQ2OCBCL007) (FQ2CBCL_8 = FQ2OCBCL008) (FQ2CBCL_9 = FQ2OCBCL009) (FQ2CBCL_10 = FQ2OCBCL010)
                            (FQ2CBCL_11 = FQ2OCBCL011) (FQ2CBCL_12 = FQ2OCBCL012) (FQ2CBCL_13 = FQ2OCBCL013) (FQ2CBCL_14 = FQ2OCBCL014) (FQ2CBCL_15 = FQ2OCBCL015)
                            (FQ2CBCL_16 = FQ2OCBCL016) (FQ2CBCL_17 = FQ2OCBCL017) (FQ2CBCL_18 = FQ2OCBCL018) (FQ2CBCL_19 = FQ2OCBCL019) (FQ2CBCL_20 = FQ2OCBCL020)
                            (FQ2CBCL_21 = FQ2OCBCL021) (FQ2CBCL_22 = FQ2OCBCL022) (FQ2CBCL_23 = FQ2OCBCL023) (FQ2CBCL_24 = FQ2OCBCL024) (FQ2CBCL_25 = FQ2OCBCL025)
                            (FQ2CBCL_26 = FQ2OCBCL026) (FQ2CBCL_27 = FQ2OCBCL027) (FQ2CBCL_28 = FQ2OCBCL028) (FQ2CBCL_29 = FQ2OCBCL029) (FQ2CBCL_30 = FQ2OCBCL030)
                            (FQ2CBCL_31 = FQ2OCBCL031) (FQ2CBCL_32 = FQ2OCBCL032) (FQ2CBCL_33 = FQ2OCBCL033) (FQ2CBCL_34 = FQ2OCBCL034) (FQ2CBCL_35 = FQ2OCBCL035)
                            (FQ2CBCL_36 = FQ2OCBCL036) (FQ2CBCL_37 = FQ2OCBCL037) (FQ2CBCL_38 = FQ2OCBCL038) (FQ2CBCL_39 = FQ2OCBCL039) (FQ2CBCL_40 = FQ2OCBCL040)
                            (FQ2CBCL_41 = FQ2OCBCL041) (FQ2CBCL_42 = FQ2OCBCL042) (FQ2CBCL_43 = FQ2OCBCL043) (FQ2CBCL_44 = FQ2OCBCL044) (FQ2CBCL_45 = FQ2OCBCL045)
                            (FQ2CBCL_46 = FQ2OCBCL046) (FQ2CBCL_47 = FQ2OCBCL047) (FQ2CBCL_48 = FQ2OCBCL048) (FQ2CBCL_49 = FQ2OCBCL049) (FQ2CBCL_50 = FQ2OCBCL050)
                            (FQ2CBCL_51 = FQ2OCBCL051) (FQ2CBCL_52 = FQ2OCBCL052) (FQ2CBCL_53 = FQ2OCBCL053) (FQ2CBCL_54 = FQ2OCBCL054) (FQ2CBCL_55 = FQ2OCBCL055)
                            (FQ2CBCL_56 = FQ2OCBCL056) (FQ2CBCL_57 = FQ2OCBCL057) (FQ2CBCL_58 = FQ2OCBCL058) (FQ2CBCL_59 = FQ2OCBCL059) (FQ2CBCL_60 = FQ2OCBCL060)
                            (FQ2CBCL_61 = FQ2OCBCL061) (FQ2CBCL_62 = FQ2OCBCL062) (FQ2CBCL_63 = FQ2OCBCL063) (FQ2CBCL_64 = FQ2OCBCL064) (FQ2CBCL_65 = FQ2OCBCL065)
                            (FQ2CBCL_66 = FQ2OCBCL066) (FQ2CBCL_67 = FQ2OCBCL067) (FQ2CBCL_68 = FQ2OCBCL068) (FQ2CBCL_69 = FQ2OCBCL069) (FQ2CBCL_70 = FQ2OCBCL070)
                            (FQ2CBCL_71 = FQ2OCBCL071) (FQ2CBCL_72 = FQ2OCBCL072) (FQ2CBCL_73 = FQ2OCBCL073) (FQ2CBCL_74 = FQ2OCBCL074) (FQ2CBCL_75 = FQ2OCBCL075)
                            (FQ2CBCL_76 = FQ2OCBCL076) (FQ2CBCL_77 = FQ2OCBCL077) (FQ2CBCL_78 = FQ2OCBCL078) (FQ2CBCL_79 = FQ2OCBCL079) (FQ2CBCL_80 = FQ2OCBCL080) 
                            (FQ2CBCL_81 = FQ2OCBCL081) (FQ2CBCL_82 = FQ2OCBCL082) (FQ2CBCL_83 = FQ2OCBCL083) (FQ2CBCL_84 = FQ2OCBCL084) (FQ2CBCL_85 = FQ2OCBCL085)
                            (FQ2CBCL_86 = FQ2OCBCL086) (FQ2CBCL_87 = FQ2OCBCL087) (FQ2CBCL_88 = FQ2OCBCL088) (FQ2CBCL_89 = FQ2OCBCL089) (FQ2CBCL_90 = FQ2OCBCL090)
                            (FQ2CBCL_91 = FQ2OCBCL091) (FQ2CBCL_92 = FQ2OCBCL092) (FQ2CBCL_93 = FQ2OCBCL093) (FQ2CBCL_94 = FQ2OCBCL094) (FQ2CBCL_95 = FQ2OCBCL095)
                            (FQ2CBCL_96 = FQ2OCBCL096) (FQ2CBCL_97 = FQ2OCBCL097) (FQ2CBCL_98 = FQ2OCBCL098) (FQ2CBCL_99 = FQ2OCBCL099) (FQ2CBCL_100 = FQ2OCBCL100).
EXECUTE.
RENAME VARIABLE (FQ2CBCL_24_TEXT = FQ2OCBCL024A) (FQ2CBCL_31_TEXT = FQ2OCBCL031A) (FQ2CBCL_32_TEXT = FQ2OCBCL032A) (FQ2CBCL_46_TEXT = FQ2OCBCL046A) 
                            (FQ2CBCL_54_TEXT = FQ2OCBCL054A) (FQ2CBCL_57_TEXT = FQ2OCBCL057A) (FQ2CBCL_65_TEXT = FQ2OCBCL065A) (FQ2CBCL_74_TEXT = FQ2OCBCL074A)
                            (FQ2CBCL_76_TEXT = FQ2OCBCL076A) (FQ2CBCL_80_TEXT = FQ2OCBCL080A) (FQ2CBCL_92_TEXT = FQ2OCBCL092A) (FQ2CBCL_100_TEXT = FQ2OCBCL100A).
EXECUTE.
*Remember to save your data file.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OCBCL_Cleaned.sav'.
EXECUTE.

*STEP 5A: MERGING FINAL ID FILE WITH CURRENT DATA FILE.
*This will ensure that all files have the correct # of enrolled and eligible IDs (Pitt=90; UO=88). Any missingness should be investigated (should they be missing?) and
labeled in STEP XX using information from the status (STAT) variable. If the status variable does not 'tell the whole story' (i.e., visit occurred but data is missing),
missingness should be labeled by ID using syntax and notes in the syntax should provide information to justify the missing code.
*When using the syntax include which variables you want to DROP from the Assessment Summary file -- THE FULL LIST OF VARIABLES IS BELOW -- 
You should retain the real date (RD) and status (STAT) for the wave you are using (example below is A1; FD1ORD FD1OSTAT are REMOVED so that they are NOT dropped from the file):
FD0OSTAT FD0ORD
FD1OSTAT FD1OTD FD1ORD FD1ODIFF
FD2OSTAT FD2OTD FD2ORD FD2ODIFF
FD3OSTAT FD3OTD FD3ORD FD3ODIFF
FD4OSTAT FD4OTD FD4ORD FD4ODIFF
FD4AOSTAT FD4AOTD FD4AORD FD4AODIFF.
MATCH FILES
/FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FD0OACS_Cleaned.sav'
/IN=f
/FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OCBCL_Cleaned.sav'
/BY ID
/DROP=
FD0OSTAT FD0ORD
FD1OSTAT FD1OTD FD1ORD FD1ODIFF
FD2OTD FD2ODIFF
FD3OSTAT FD3OTD FD3ORD FD3ODIFF
FD4OSTAT FD4OTD FD4ORD FD4ODIFF
FD4AOSTAT FD4AOTD FD4AORD FD4AODIFF.
SELECT IF f=1.
EXECUTE.
*Comparing REDCap and Qualtrics dates of completion. Be sure to update the date variables used to reflect the accurate RD and questionnaire date.
COMPUTE DATEDIFF = DATEDIFF(FD2ORD,FQ2OCBCLDATE,'days').
EXECUTE.
COUNT DATEDIFF0=DATEDIFF(Lowest thru -1) DATEDIFF(1 thru Highest).
EXECUTE.
FREQUENCIES VARIABLES=DATEDIFF0
  /ORDER=ANALYSIS.
SORT CASES BY DATEDIFF0(D).
*CHECK ALL IDS WITH DISCREPANT DATES TO DETERMINE WHAT IS CORRECT. CONSULT BEFORE MAKING ANY CHANGES TO RAW DATA IN REDCAP OR QUALTRICS.
*INCLUDE NOTES HERE FOR EACH ID THAT WAS DISCREPANT (EXAMPLE BELOW - ADAPT AS NEEDED)
*THE FOLLOWING IDs (90996, 91133, 91292) HAVE A A2 QUALTRICS DATE [FQ2OXXXDATE] THAT DOES NOT MATCH THEIR A2 VISIT DATE [FD2ORD]. 
*THIS WAS INVESTIGATED BY STAFF (BM: 1-13-22) AND VISIT DATE [FD2ORD] WAS CONFIRMED USING MULTIPLE SOURCES.
SORT CASES BY ID(A).
*DROPPING VARIABLES THAT ARE NO LONGER RELEVANT TO FINAL DATA FILE.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OCBCL_Cleaned.sav'
/DROP
FQ2OCBCLDATE
DATEDIFF
DATEDIFF0
f.
EXECUTE.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OCBCL_Cleaned.sav'.
EXECUTE.

**STEP 6 (DELETE SYNTAX - NOT NOTES - IF NOT NEEDED): RECODING VALUES (INCLUDING MISSING VALUES). 
*Check to be sure the variables are coded correctly (should appear as numbers). If they are not, recode all variables. 
**-99 'Missing'                                                                            /* (unknown) */
**-97 'Missing due to COVID Shutdown'                                         /* (missed due to no in-person visits) */
**-96 'Child Abuse (perpetrator)'                                                     /* (Child Abuse (perpetrator)'  */
**-95 'Higher Level of Care Required'                                              /* (Higher Level of Care Required) */
**-88 'Not scorable'                                                                     /* (noisy data: movement, etc.) */
**-87 'Suspect data'                                                                     /* (out of range values: medical condition, medication use, invalid self-report packet, etc.) */
**-77 'Technical problem'                                                             /* (mindware crash, poor audio/visual quality, etc.) */
**-66 'Participant refusal'                                                              /* (no consent to videotape, left in middle of interaction/interview) */
**-65 'Participant failed to demonstrate comprehension'                  /* (participant did not comprehend task)
**-56 'Consent Withdrawn'                                                            /*(consent withdrawn) */
**-55 'Not able to complete'                                                          /* (PI decision) */
**-54 'Deemed ineligible'                                                              /* (deemed ineligible)
**-44 'Question skipped'                                                             /* (correct skipped question: e.g. demographics, etc.) */
**-43 'Question skipped (participant refused root question)'            /* (participant refused root question: e.g., prefer not answer)*/
**-41 'Instrument not part of the protocol'                                      /* (instrument added later, not in this version) */
**-33 'Staff Error'                                                                         /* (question incorrectly skipped by staff, PANAS/EMA not administered, etc.) */
**-22 'Not applicable (Staff/Clinician)'                                            /* (KSADS, behavior codes) */
**-21 'Not applicable (Participant)'                                                /* (Questionnaires - participant decided) */
**-17 'Unable to contact teacher'                                                    /* (Staff unable to contact teacher for TRF) */
**-16 'Participant search exhausted'                                              /* (Participant search exhausted - PI decision */    
**-14 'Participant repeated cancellations/delays'                            /* (Participant repeated cancellations/delays */
**-12 'Pariticipant refused follow-up'                                             /* (Participant refused follow-up) */     
**-11 'Participant (child) deceased'                                                /* (Participant (child) deceased) */
**-10 'Prefer not to answer'                                                           /* (Participant selected prefer not to answer) */.
RECODE 
    FQ2OCBCL001 to FQ2OCBCL024 
    FQ2OCBCL025 to FQ2OCBCL031 
    FQ2OCBCL032
    FQ2OCBCL033 to FQ2OCBCL046 
    FQ2OCBCL047 to FQ2OCBCL054 
    FQ2OCBCL055 to FQ2OCBCL057
    FQ2OCBCL058 to FQ2OCBCL065 
    FQ2OCBCL066 to FQ2OCBCL074 
    FQ2OCBCL075 to FQ2OCBCL076 
    FQ2OCBCL077 to FQ2OCBCL080 
    FQ2OCBCL081 to FQ2OCBCL092 
    FQ2OCBCL093 to FQ2OCBCL100 
    (4=-10).
EXECUTE.

*11 IDs were not administered the measure. 
IF (ID=90687 OR ID=91637 OR ID=90999 OR ID=91123 OR ID=90754 OR ID=90975 OR ID=91759 OR ID=90443 OR ID=90449 OR ID=90230 OR ID=90238) FD2OSTAT = -41.    
EXECUTE. 

*90250 skipped 3 questions. 
DO IF (ID=90250). 
    RECODE
    FQ2OCBCL001 FQ2OCBCL002 FQ2OCBCL003
    (SYSMIS=-41).
END IF.
EXECUTE.

*90739 skipped a question.
DO IF (ID=90739). 
    RECODE
    FQ2OCBCL002
    (SYSMIS=-41).
END IF.
EXECUTE.

*90990 skipped two questions.
DO IF (ID=90990). 
    RECODE
    FQ2OCBCL004 FQ2OCBCL100
    (SYSMIS=-41).
END IF.
EXECUTE.
    
*90083 skipped a question.
DO IF (ID=90083). 
    RECODE
    FQ2OCBCL036
    (SYSMIS=-41).
END IF.
EXECUTE.    

*90417 skipped a question.
DO IF (ID=90417). 
    RECODE
    FQ2OCBCL042
    (SYSMIS=-41).
END IF.
EXECUTE.   

*90945 skipped two questions.
DO IF (ID=90945). 
    RECODE
    FQ2OCBCL077 FQ2OCBCL100
    (SYSMIS=-41).
END IF.
EXECUTE.  

*91995 skipped a question.
DO IF (ID=91995). 
    RECODE
    FQ2OCBCL088 
    (SYSMIS=-41).
END IF.
EXECUTE.  

*91487 skipped two questions.
DO IF (ID=91487). 
    RECODE
    FQ2OCBCL093 FQ2OCBCL100
    (SYSMIS=-41).
END IF.
EXECUTE.  

*Item 100 was skipped by a few remaining IDs.
IF (ID=90234 OR ID=90564 OR ID=90991 OR ID=91081 OR ID=91165 OR ID=91621 OR ID=91858) FQ2OCBCL100 = -41.    
EXECUTE. 

**STEP 7 (DELETE IF NOT NEEDED): CREATING NEW VARIABLES FOR REVERSED SCORED ITEMS.
**Reverse-Scored Items; see scoring document to determine if there are reverse-scored items. If no reverse-scored items, delete this syntax.
**CHECKED AND NOT NEEDED.

*STEP 7A: RECODING SYSMIS (PARTICIPANTS THAT MISSED THE ASSESSMENT).
*This will use the STAT variable to recode all SYSMIS data. CHANGE THE STAT VARIABLE TO MATCH THE ASSESSMENT WAVE YOU ARE WORKING IN.
*Include full list of numeric variables (including new reverse-scored items).
DO IF MISSING(FD2OSTAT).
DO REPEAT x = FQ2OCBCL001 to FQ2OCBCL024 
    FQ2OCBCL025 to FQ2OCBCL031 
    FQ2OCBCL032
    FQ2OCBCL033 to FQ2OCBCL046 
    FQ2OCBCL047 to FQ2OCBCL054 
    FQ2OCBCL055 to FQ2OCBCL057
    FQ2OCBCL058 to FQ2OCBCL065 
    FQ2OCBCL066 to FQ2OCBCL074 
    FQ2OCBCL075 to FQ2OCBCL076 
    FQ2OCBCL077 to FQ2OCBCL080 
    FQ2OCBCL081 to FQ2OCBCL092 
    FQ2OCBCL093 to FQ2OCBCL100.
RECODE FD2OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.

*STEP 8: STANDARDIZING DECIMAL PLACES (CANNOT INCLUDE TEXT/STRING VARIABLES).
*Making all variables have the same number of decimal places. Ensure that variables include all new reverse-scored variables. Change the number AFTER the decimal place as needed.
FORMATS 
    FQ2OCBCL001 to FQ2OCBCL024 (F8.0)
    FQ2OCBCL025 to FQ2OCBCL031 (F8.0)
    FQ2OCBCL032 (F8.0)
    FQ2OCBCL033 to FQ2OCBCL046 (F8.0)
    FQ2OCBCL047 to FQ2OCBCL054 (F8.0)
    FQ2OCBCL055 to FQ2OCBCL057 (F8.0)
    FQ2OCBCL058 to FQ2OCBCL065 (F8.0)
    FQ2OCBCL066 to FQ2OCBCL074 (F8.0)
    FQ2OCBCL075 to FQ2OCBCL076 (F8.0)
    FQ2OCBCL077 to FQ2OCBCL080 (F8.0)
    FQ2OCBCL081 to FQ2OCBCL092 (F8.0)
    FQ2OCBCL093 to FQ2OCBCL100 (F8.0).
EXECUTE.

*STEP 9: CREATING VARIABLE LABLES.
*Label all variables. Use the original questionnaire to include the exact text that participants saw. Include the questionnaire name and number at the end of the label.
VARIABLE LABELS  ID 'Participant ID'.
EXECUTE.

VARIABLE LABELS 
FQ2OCBCL001 'Aches or pains (without medical cause; do not include stomach or headaches). [FQ2OCBCL001]'
FQ2OCBCL002 'Acts too young for age. [FQ2OCBCL002]'
FQ2OCBCL003 'Afraid to try new things. [FQ2OCBCL003]'
FQ2OCBCL004 'Avoids looking others in the eye. [FQ2OCBCL004]'
FQ2OCBCL005 'Cant concentrate, cant pay attention for long. [FQ2OCBCL005]'
FQ2OCBCL006 'Cant sit still, restless, or hyperactive. [FQ2OCBCL006]'
FQ2OCBCL007 'Cant stand having things out of place. [FQ2OCBCL007]'
FQ2OCBCL008 'Cant stand waiting; wants everything now. [FQ2OCBCL008]'
FQ2OCBCL009 'Chews on things that arent edible. [FQ2OCBCL009]'
FQ2OCBCL010 'Clings to adults or too dependent. [FQ2OCBCL010]'
FQ2OCBCL011 'Constantly seeks help. [FQ2OCBCL011]'
FQ2OCBCL012 'Constipated, doesnt move bowels (when not sick). [FQ2OCBCL012]'
FQ2OCBCL013 'Cries a lot. [FQ2OCBCL013]'
FQ2OCBCL014 'Cruel to animals. [FQ2OCBCL014]'
FQ2OCBCL015 'Defiant. [FQ2OCBCL015]'
FQ2OCBCL016 'Demands must be met immediately. [FQ2OCBCL016]'
FQ2OCBCL017 'Destroys his/her own things. [FQ2OCBCL017]'
FQ2OCBCL018 'Destroys things belonging to his/her family or other children. [FQ2OCBCL018]'
FQ2OCBCL019 'Diarrhea or loose bowels (when not sick). [FQ2OCBCL019]'
FQ2OCBCL020 'Disobedient. [FQ2OCBCL020]'
FQ2OCBCL021 'Disturbed by any change in routine. [FQ2OCBCL021]'
FQ2OCBCL022 'Doesnt want to sleep alone. [FQ2OCBCL022]'
FQ2OCBCL023 'Doesnt answer when people talk to him/her. [FQ2OCBCL023]'
FQ2OCBCL024 'Doesnt eat well (describe). [FQ2OCBCL024]'
FQ2OCBCL024A 'Describe: Doesnt eat well. [FQ2OCBCL024A]'
FQ2OCBCL025 'Doesnt get along with other children. [FQ2OCBCL025]'
FQ2OCBCL026 'Doesnt know how to have fun; acts like a little adult. [FQ2OCBCL026]'
FQ2OCBCL027 'Doesnt seem to feel guilty after misbehaving. [FQ2OCBCL027]'
FQ2OCBCL028 'Doesnt want to go out of home. [FQ2OCBCL028]'
FQ2OCBCL029 'Easily frustrated. [FQ2OCBCL029]'
FQ2OCBCL030 'Easily jealous. [FQ2OCBCL030]'
FQ2OCBCL031 'Eats or drinks things that are not food - dont include sweets (describe). [FQ2OCBCL031]'
FQ2OCBCL031A 'Describe: Eats or drinks things that are not food - dont include sweets. [FQ2OCBCL031A]'
FQ2OCBCL032 'Fears certain animals, situations, or places (describe). [FQ2OCBCL032]'
FQ2OCBCL032A 'Describe: Fears certain animals, situations, or places. [FQ2OCBCL032A]'
FQ2OCBCL033 'Feelings are easily hurt. [FQ2OCBCL033]'
FQ2OCBCL034 'Gets hurt a lot, accident-prone. [FQ2OCBCL034]'
FQ2OCBCL035 'Gets in many fights. [FQ2OCBCL035]'
FQ2OCBCL036 'Gets into everything. [FQ2OCBCL036]'
FQ2OCBCL037 'Gets too upset when separated from parents. [FQ2OCBCL037]'
FQ2OCBCL038 'Has trouble getting to sleep. [FQ2OCBCL038]'
FQ2OCBCL039 'Headaches (without medical cause). [FQ2OCBCL039]'
FQ2OCBCL040 'Hits others. [FQ2OCBCL040]'
FQ2OCBCL041 'Holds his/her breath. [FQ2OCBCL041]'
FQ2OCBCL042 'Hurts animals or people without meaning to. [FQ2OCBCL042]'
FQ2OCBCL043 'Looks unhappy without good reason. [FQ2OCBCL043]'
FQ2OCBCL044 'Angry moods. [FQ2OCBCL044]'
FQ2OCBCL045 'Nausea, feels sick (without medical cause). [FQ2OCBCL045]'
FQ2OCBCL046 'Nervous movements or twitching (describe). [FQ2OCBCL046]'
FQ2OCBCL046A 'Describe: Nervous movements or twitching. [FQ2OCBCL046A]'
FQ2OCBCL047 'Nervous, high-strung, or tense. [FQ2OCBCL047]'
FQ2OCBCL048 'Nightmares. [FQ2OCBCL048]'
FQ2OCBCL049 'Overeating. [FQ2OCBCL049]'
FQ2OCBCL050 'Overtired. [FQ2OCBCL050]'
FQ2OCBCL051 'Shows panic for no good reason. [FQ2OCBCL051]'
FQ2OCBCL052 'Painful bowel movements (without medical cause). [FQ2OCBCL052]'
FQ2OCBCL053 'Physically attacks people. [FQ2OCBCL053]'
FQ2OCBCL054 'Picks nose, skin, or other parts of body (describe). [FQ2OCBCL054]'
FQ2OCBCL054A 'Describe: Picks nose, skin, or other parts of body. [FQ2OCBCL054A]'
FQ2OCBCL055 'Plays with own sex parts too much. [FQ2OCBCL055]'
FQ2OCBCL056 'Poorly coordinated or clumsy. [FQ2OCBCL056]'
FQ2OCBCL057 'Problems with eyes (without medical cause)(describe). [FQ2OCBCL057]'
FQ2OCBCL057A 'Describe: Problems with eyes (without medical cause). [FQ2OCBCL057A]'
FQ2OCBCL058 'Punishment doesnt change his/her behavior. [FQ2OCBCL058]'
FQ2OCBCL059 'Quickly shifts from one activity to another. [FQ2OCBCL059]'
FQ2OCBCL060 'Rashes or other skin problems (without medical cause). [FQ2OCBCL060]'
FQ2OCBCL061 'Refuses to eat. [FQ2OCBCL061]'
FQ2OCBCL062 'Refuses to play active games. [FQ2OCBCL062]'
FQ2OCBCL063 'Repeatedly rocks head or body. [FQ2OCBCL063]'
FQ2OCBCL064 'Resists going to bed at night. [FQ2OCBCL064]'
FQ2OCBCL065 'Resists toilet training (describe). [FQ2OCBCL065]'
FQ2OCBCL065A 'Describe: Resists toilet training. [FQ2OCBCL065A]'
FQ2OCBCL066 'Screams a lot. [FQ2OCBCL066]'
FQ2OCBCL067 'Seems unresponsive to affection. [FQ2OCBCL067]'
FQ2OCBCL068 'Self-conscious or easily embarrassed. [FQ2OCBCL068]'
FQ2OCBCL069 'Selfish or wont share. [FQ2OCBCL069]'
FQ2OCBCL070 'Shows little affection toward people. [FQ2OCBCL070]'
FQ2OCBCL071 'Shows little interest in things about him/herself. [FQ2OCBCL071]'
FQ2OCBCL072 'Shows too little fear of getting hurt. [FQ2OCBCL072]'
FQ2OCBCL073 'Too shy or timid. [FQ2OCBCL073]'
FQ2OCBCL074 'Sleeps less than most kids during day and/or night (describe). [FQ2OCBCL074]'
FQ2OCBCL074A 'Describe: Sleeps less than most kids during day and/or night. [FQ2OCBCL074A]'
FQ2OCBCL075 'Smears or plays with bowel movements. [FQ2OCBCL075]'
FQ2OCBCL076 'Speech problem (describe). [FQ2OCBCL076]'
FQ2OCBCL076A 'Describe: Speech problem. [FQ2OCBCL076A]'
FQ2OCBCL077 'Stares into space or seems preoccupied. [FQ2OCBCL077]'
FQ2OCBCL078 'Stomachaches or cramps (without medical cause). [FQ2OCBCL078]'
FQ2OCBCL079 'Rapid shifts between sadness and excitement. [FQ2OCBCL079]'
FQ2OCBCL080 'Strange behavior (describe). [FQ2OCBCL080]'
FQ2OCBCL080A 'Describe: Strange behavior. [FQ2OCBCL080A]'
FQ2OCBCL081 'Stubborn, sullen, or irritable. [FQ2OCBCL081]'
FQ2OCBCL082 'Sudden changes in mood or feelings. [FQ2OCBCL082]'
FQ2OCBCL083 'Sulks a lot. [FQ2OCBCL083]'
FQ2OCBCL084 'Talks or cries in sleep. [FQ2OCBCL084]'
FQ2OCBCL085 'Temper tantrums or hot temper. [FQ2OCBCL085]'
FQ2OCBCL086 'Too concerned with neatness or cleanliness. [FQ2OCBCL086]'
FQ2OCBCL087 'Too fearful or anxious. [FQ2OCBCL087]'
FQ2OCBCL088 'Uncooperative. [FQ2OCBCL088]'
FQ2OCBCL089 'Under-active, slow moving, or lack energy. [FQ2OCBCL089]'
FQ2OCBCL090 'Unhappy, sad, or depressed. [FQ2OCBCL090]'
FQ2OCBCL091 'Unusually loud. [FQ2OCBCL091]'
FQ2OCBCL092 'Upset by new people or situations (describe). [FQ2OCBCL092]'
FQ2OCBCL092A 'Describe: Upset by new people or situations. [FQ2OCBCL092A]'
FQ2OCBCL093 'Vomiting, throwing up (without medical cause). [FQ2OCBCL093]'
FQ2OCBCL094 'Wakes up often at night. [FQ2OCBCL094]'
FQ2OCBCL095 'Wanders away. [FQ2OCBCL095]'
FQ2OCBCL096 'Wants a lot of attention. [FQ2OCBCL096]'
FQ2OCBCL097 'Whining. [FQ2OCBCL097]'
FQ2OCBCL098 'Withdrawn, doesnt get involved with others. [FQ2OCBCL098]'
FQ2OCBCL099 'Worries. [FQ2OCBCL099]'
FQ2OCBCL100 'There are problems the child has that were not listen above (describe). [FQ2OCBCL100]'
FQ2OCBCL100A 'Describe: There are problems the child has that were not listen above. [FQ2OCBCL100A]'.
EXECUTE. 

*STEP 10: ADD VALUE LABELS.
*Include missing values like 'Prefer not to Answer' (or something similar) if applicable.
*Include ALL missing value labels (SEE ABOVE FOR FULL LIST).
VALUE LABELS
FQ2OCBCL001 FQ2OCBCL002 FQ2OCBCL003 FQ2OCBCL004 FQ2OCBCL005
FQ2OCBCL006 FQ2OCBCL007 FQ2OCBCL008 FQ2OCBCL009 FQ2OCBCL010
FQ2OCBCL011 FQ2OCBCL012 FQ2OCBCL013 FQ2OCBCL014 FQ2OCBCL015
FQ2OCBCL016 FQ2OCBCL017 FQ2OCBCL018 FQ2OCBCL019 FQ2OCBCL020
FQ2OCBCL021 FQ2OCBCL022 FQ2OCBCL023 FQ2OCBCL024 FQ2OCBCL025
FQ2OCBCL026 FQ2OCBCL027 FQ2OCBCL028 FQ2OCBCL029 FQ2OCBCL030
FQ2OCBCL031 FQ2OCBCL032 FQ2OCBCL033 FQ2OCBCL034 FQ2OCBCL035
FQ2OCBCL036 FQ2OCBCL037 FQ2OCBCL038 FQ2OCBCL039 FQ2OCBCL040
FQ2OCBCL041 FQ2OCBCL042 FQ2OCBCL043 FQ2OCBCL044 FQ2OCBCL045
FQ2OCBCL046 FQ2OCBCL047 FQ2OCBCL048 FQ2OCBCL049 FQ2OCBCL050
FQ2OCBCL051 FQ2OCBCL052 FQ2OCBCL053 FQ2OCBCL054 FQ2OCBCL055
FQ2OCBCL056 FQ2OCBCL057 FQ2OCBCL058 FQ2OCBCL059 FQ2OCBCL060
FQ2OCBCL061 FQ2OCBCL062 FQ2OCBCL063 FQ2OCBCL064 FQ2OCBCL065
FQ2OCBCL066 FQ2OCBCL067 FQ2OCBCL068 FQ2OCBCL069 FQ2OCBCL070
FQ2OCBCL071 FQ2OCBCL072 FQ2OCBCL073 FQ2OCBCL074 FQ2OCBCL075
FQ2OCBCL076 FQ2OCBCL077 FQ2OCBCL078 FQ2OCBCL079 FQ2OCBCL080
FQ2OCBCL081 FQ2OCBCL082 FQ2OCBCL083 FQ2OCBCL084 FQ2OCBCL085
FQ2OCBCL086 FQ2OCBCL087 FQ2OCBCL088 FQ2OCBCL089 FQ2OCBCL090
FQ2OCBCL091 FQ2OCBCL092 FQ2OCBCL093 FQ2OCBCL094 FQ2OCBCL095
FQ2OCBCL096 FQ2OCBCL097 FQ2OCBCL098 FQ2OCBCL099 FQ2OCBCL100
-99 'Missing (-99)'    
-97 'Missing due to COVID Shutdown (-97)'           
-96 'Child Abuse (perpetrator) (-96)'                       
-95 'Higher Level of Care Required (-95)'               
-88 'Not scorable (-88)'                                         
-87 'Suspect data (-87)'                                            
-77 'Technical problem (-77)'                                                         
-66 'Participant refusal (-66)'                                                           
-65 'Participant failed to demonstrate comprehension (-65)'            
-56 'Consent Withdrawn (-56)'                                                      
-55 'Not able to complete (-55)'                                                         
-54 'Deemed ineligible (-54)'                                                
-44 'Question skipped (-44)'                                                            
-43 'Question skipped (participant refused root question) (-43)'     
-41 'Instrument not part of the protocol (-41)'                                     
-33 'Staff Error (-33)'                                                                        
-22 'Not applicable (Staff/Clinician) (-22)'                  
-21 'Not applicable (Participant) (-21)'                            
-17 'Unable to contact teacher (-17)'                                    
-16 'Participant search exhausted (-16)'                                     
-14 'Participant repeated cancellations/delays (-14)'                      
-12 'Pariticipant refused follow-up (-12)'                                        
-11 'Participant (parent or child) deceased (-11)'                                                
-10 'Prefer not to answer (-10)'   
0 'Not True (as far as you know) (0)'
1 'Somewhat or Sometimes True (1)'
2 'Very True or Often True (2)'.
EXECUTE.

*STEP 11: LABELING MISSING VALUES AS MISSING.
*Recoding all negative numbers as missing.
MISSING VALUES
FQ2OCBCL001 FQ2OCBCL002 FQ2OCBCL003 FQ2OCBCL004 FQ2OCBCL005
FQ2OCBCL006 FQ2OCBCL007 FQ2OCBCL008 FQ2OCBCL009 FQ2OCBCL010
FQ2OCBCL011 FQ2OCBCL012 FQ2OCBCL013 FQ2OCBCL014 FQ2OCBCL015
FQ2OCBCL016 FQ2OCBCL017 FQ2OCBCL018 FQ2OCBCL019 FQ2OCBCL020
FQ2OCBCL021 FQ2OCBCL022 FQ2OCBCL023 FQ2OCBCL024 FQ2OCBCL025
FQ2OCBCL026 FQ2OCBCL027 FQ2OCBCL028 FQ2OCBCL029 FQ2OCBCL030
FQ2OCBCL031 FQ2OCBCL032 FQ2OCBCL033 FQ2OCBCL034 FQ2OCBCL035
FQ2OCBCL036 FQ2OCBCL037 FQ2OCBCL038 FQ2OCBCL039 FQ2OCBCL040
FQ2OCBCL041 FQ2OCBCL042 FQ2OCBCL043 FQ2OCBCL044 FQ2OCBCL045
FQ2OCBCL046 FQ2OCBCL047 FQ2OCBCL048 FQ2OCBCL049 FQ2OCBCL050
FQ2OCBCL051 FQ2OCBCL052 FQ2OCBCL053 FQ2OCBCL054 FQ2OCBCL055
FQ2OCBCL056 FQ2OCBCL057 FQ2OCBCL058 FQ2OCBCL059 FQ2OCBCL060
FQ2OCBCL061 FQ2OCBCL062 FQ2OCBCL063 FQ2OCBCL064 FQ2OCBCL065
FQ2OCBCL066 FQ2OCBCL067 FQ2OCBCL068 FQ2OCBCL069 FQ2OCBCL070
FQ2OCBCL071 FQ2OCBCL072 FQ2OCBCL073 FQ2OCBCL074 FQ2OCBCL075
FQ2OCBCL076 FQ2OCBCL077 FQ2OCBCL078 FQ2OCBCL079 FQ2OCBCL080
FQ2OCBCL081 FQ2OCBCL082 FQ2OCBCL083 FQ2OCBCL084 FQ2OCBCL085
FQ2OCBCL086 FQ2OCBCL087 FQ2OCBCL088 FQ2OCBCL089 FQ2OCBCL090
FQ2OCBCL091 FQ2OCBCL092 FQ2OCBCL093 FQ2OCBCL094 FQ2OCBCL095
FQ2OCBCL096 FQ2OCBCL097 FQ2OCBCL098 FQ2OCBCL099 FQ2OCBCL100
    (LO THRU -1).
EXECUTE.

*STEP 12: SAVE CLEANED DATA FILE.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OCBCL_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.

*STEP 13: CHECK FREQUENCIES.
*Checking frequencies of all items before creating constructs.
*Include STAT variable here to be sure all missingness was coded correctly.
FREQUENCIES VARIABLES= FD2OSTAT FQ2OCBCL001 FQ2OCBCL002 FQ2OCBCL003 FQ2OCBCL004 FQ2OCBCL005
FQ2OCBCL006 FQ2OCBCL007 FQ2OCBCL008 FQ2OCBCL009 FQ2OCBCL010
FQ2OCBCL011 FQ2OCBCL012 FQ2OCBCL013 FQ2OCBCL014 FQ2OCBCL015
FQ2OCBCL016 FQ2OCBCL017 FQ2OCBCL018 FQ2OCBCL019 FQ2OCBCL020
FQ2OCBCL021 FQ2OCBCL022 FQ2OCBCL023 FQ2OCBCL024 
FQ2OCBCL025 FQ2OCBCL026 FQ2OCBCL027 FQ2OCBCL028 FQ2OCBCL029
FQ2OCBCL030 FQ2OCBCL031 FQ2OCBCL032
FQ2OCBCL033 FQ2OCBCL034 FQ2OCBCL035 FQ2OCBCL036 FQ2OCBCL037
FQ2OCBCL038 FQ2OCBCL039 FQ2OCBCL040 FQ2OCBCL041 FQ2OCBCL042
FQ2OCBCL043 FQ2OCBCL044 FQ2OCBCL045 FQ2OCBCL046 
FQ2OCBCL047 FQ2OCBCL048 FQ2OCBCL049 FQ2OCBCL050 FQ2OCBCL051
FQ2OCBCL052 FQ2OCBCL053 FQ2OCBCL054 FQ2OCBCL055
FQ2OCBCL056 FQ2OCBCL057 FQ2OCBCL058 FQ2OCBCL059
FQ2OCBCL060 FQ2OCBCL061 FQ2OCBCL062 FQ2OCBCL063 FQ2OCBCL064
FQ2OCBCL065 FQ2OCBCL066 FQ2OCBCL067 FQ2OCBCL068
FQ2OCBCL069 FQ2OCBCL070 FQ2OCBCL071 FQ2OCBCL072 FQ2OCBCL073
FQ2OCBCL074 FQ2OCBCL075 FQ2OCBCL076
FQ2OCBCL077 FQ2OCBCL078 FQ2OCBCL079 FQ2OCBCL080
FQ2OCBCL081 FQ2OCBCL082 FQ2OCBCL083 FQ2OCBCL084 FQ2OCBCL085
FQ2OCBCL086 FQ2OCBCL087 FQ2OCBCL088 FQ2OCBCL089 FQ2OCBCL090
FQ2OCBCL091 FQ2OCBCL092 FQ2OCBCL093 FQ2OCBCL094
FQ2OCBCL095 FQ2OCBCL096 FQ2OCBCL097 FQ2OCBCL098 FQ2OCBCL099
FQ2OCBCL100
  /ORDER=ANALYSIS.

*STEP 14: CHECK DESCRIPTIVES.
*Checking descriptives for all items before creating constructs.
DESCRIPTIVES VARIABLES=FQ2OCBCL001 FQ2OCBCL002 FQ2OCBCL003 FQ2OCBCL004 FQ2OCBCL005
FQ2OCBCL006 FQ2OCBCL007 FQ2OCBCL008 FQ2OCBCL009 FQ2OCBCL010
FQ2OCBCL011 FQ2OCBCL012 FQ2OCBCL013 FQ2OCBCL014 FQ2OCBCL015
FQ2OCBCL016 FQ2OCBCL017 FQ2OCBCL018 FQ2OCBCL019 FQ2OCBCL020
FQ2OCBCL021 FQ2OCBCL022 FQ2OCBCL023 FQ2OCBCL024 
FQ2OCBCL025 FQ2OCBCL026 FQ2OCBCL027 FQ2OCBCL028 FQ2OCBCL029
FQ2OCBCL030 FQ2OCBCL031 FQ2OCBCL032
FQ2OCBCL033 FQ2OCBCL034 FQ2OCBCL035 FQ2OCBCL036 FQ2OCBCL037
FQ2OCBCL038 FQ2OCBCL039 FQ2OCBCL040 FQ2OCBCL041 FQ2OCBCL042
FQ2OCBCL043 FQ2OCBCL044 FQ2OCBCL045 FQ2OCBCL046 
FQ2OCBCL047 FQ2OCBCL048 FQ2OCBCL049 FQ2OCBCL050 FQ2OCBCL051
FQ2OCBCL052 FQ2OCBCL053 FQ2OCBCL054 FQ2OCBCL055
FQ2OCBCL056 FQ2OCBCL057 FQ2OCBCL058 FQ2OCBCL059
FQ2OCBCL060 FQ2OCBCL061 FQ2OCBCL062 FQ2OCBCL063 FQ2OCBCL064
FQ2OCBCL065 FQ2OCBCL066 FQ2OCBCL067 FQ2OCBCL068
FQ2OCBCL069 FQ2OCBCL070 FQ2OCBCL071 FQ2OCBCL072 FQ2OCBCL073
FQ2OCBCL074 FQ2OCBCL075 FQ2OCBCL076
FQ2OCBCL077 FQ2OCBCL078 FQ2OCBCL079 FQ2OCBCL080
FQ2OCBCL081 FQ2OCBCL082 FQ2OCBCL083 FQ2OCBCL084 FQ2OCBCL085
FQ2OCBCL086 FQ2OCBCL087 FQ2OCBCL088 FQ2OCBCL089 FQ2OCBCL090
FQ2OCBCL091 FQ2OCBCL092 FQ2OCBCL093 FQ2OCBCL094
FQ2OCBCL095 FQ2OCBCL096 FQ2OCBCL097 FQ2OCBCL098 FQ2OCBCL099
FQ2OCBCL100 
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 15: SAVE CLEANED DATA FILE.
*Sorting the data file by ID and resaving the final file.
*To reorder items, use /KEEP {list all variables in order} -- insert in line after file name.
SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/SPSS/FQ2OCBCL_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OCBCL_Cleaned.sav'.
EXECUTE.

*STEP 16: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE
 OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OCBCL_Cleaned.spv'
 LOCK=NO.

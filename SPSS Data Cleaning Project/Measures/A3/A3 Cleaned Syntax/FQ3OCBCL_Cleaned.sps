* Encoding: UTF-8.
*STEP 0: NOTES
*Child Behavior Checklist (CBCL).
 
*10-01-21(BM): Adapted STEPS 1-16 from A1 Syntax.
*04-12-2022 (BM):Adapted Syntax to Match Updated Template + Pass in Updated Data. 
*04-13-2022 (BM):Updated Recoding. 
*04-13-22(AAC): Checked.
*04-18-2022(BM): Double Checked and Fixed Missing Codes.
*04-20-22(AAC): Checked.
*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------.
*STEP 1: OPENING RAW DATA.
*Insert the correct file path and file name. Use syntax to open raw data file.
GET
 FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/DBT Moms R01 Study Time 3 Mother Survey_April 12, 2022_17.38.sav'.

*STEP 2: SAVING QUESTIONNAIRE SPECIFIC RAW DATA. 
*Insert the correct file path and file name. Save this file with only those variables that you need, in the following order; ID, Start Date, Questionnaire Items (i.e., DERS_1 to DERS_36).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OCBCL_Cleaned.sav'
  /KEEP 
  FQ3ID 
  STARTDATE
  FQ3CBCL_1 TO FQ3CBCL_100_TEXT
  /COMPRESSED.
  EXECUTE.

*STEP 3: OPEN NEW DATA FILE.  
*Insert the correct file path and file name. Open the file you just created and saved so that you are able to clean the data.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OCBCL_Cleaned.sav'.

*STEP 4: TRANSFORM VARIABLES AND SORT IDS ASCENDING ORDER.
*Transforming ID from a string to a numeric variable, change the date format of startdate, and sort IDs in ascending order.
ALTER TYPE FQ3ID (F10.0).
EXECUTE.
FORMATS STARTDATE (adate10).
EXECUTE.
SORT CASES BY FQ3ID(A).
EXECUTE.

*STEP 5: RENAME ‘RAW DATA’ VARIABLES TO ‘CLEANED’ VARIABLES NAMES. 
*Rename all variables so they reflect our naming scheme. ID should always be labeled as 'ID'. Item should be numbers 01-36 or 001-106. 
RENAME VARIABLE (FQ3ID=ID).
EXECUTE.
RENAME VARIABLE (STARTDATE=FQ3OCBCLDATE).
EXECUTE.
RENAME VARIABLE (FQ3CBCL_1 = FQ3OCBCL001) (FQ3CBCL_2 = FQ3OCBCL002) (FQ3CBCL_3 = FQ3OCBCL003) (FQ3CBCL_4 = FQ3OCBCL004) (FQ3CBCL_5 = FQ3OCBCL005)
                            (FQ3CBCL_6 = FQ3OCBCL006) (FQ3CBCL_7 = FQ3OCBCL007) (FQ3CBCL_8 = FQ3OCBCL008) (FQ3CBCL_9 = FQ3OCBCL009) (FQ3CBCL_10 = FQ3OCBCL010)
                            (FQ3CBCL_11 = FQ3OCBCL011) (FQ3CBCL_12 = FQ3OCBCL012) (FQ3CBCL_13 = FQ3OCBCL013) (FQ3CBCL_14 = FQ3OCBCL014) (FQ3CBCL_15 = FQ3OCBCL015)
                            (FQ3CBCL_16 = FQ3OCBCL016) (FQ3CBCL_17 = FQ3OCBCL017) (FQ3CBCL_18 = FQ3OCBCL018) (FQ3CBCL_19 = FQ3OCBCL019) (FQ3CBCL_20 = FQ3OCBCL020)
                            (FQ3CBCL_21 = FQ3OCBCL021) (FQ3CBCL_22 = FQ3OCBCL022) (FQ3CBCL_23 = FQ3OCBCL023) (FQ3CBCL_24 = FQ3OCBCL024) (FQ3CBCL_25 = FQ3OCBCL025)
                            (FQ3CBCL_26 = FQ3OCBCL026) (FQ3CBCL_27 = FQ3OCBCL027) (FQ3CBCL_28 = FQ3OCBCL028) (FQ3CBCL_29 = FQ3OCBCL029) (FQ3CBCL_30 = FQ3OCBCL030)
                            (FQ3CBCL_31 = FQ3OCBCL031) (FQ3CBCL_32 = FQ3OCBCL032) (FQ3CBCL_33 = FQ3OCBCL033) (FQ3CBCL_34 = FQ3OCBCL034) (FQ3CBCL_35 = FQ3OCBCL035)
                            (FQ3CBCL_36 = FQ3OCBCL036) (FQ3CBCL_37 = FQ3OCBCL037) (FQ3CBCL_38 = FQ3OCBCL038) (FQ3CBCL_39 = FQ3OCBCL039) (FQ3CBCL_40 = FQ3OCBCL040)
                            (FQ3CBCL_41 = FQ3OCBCL041) (FQ3CBCL_42 = FQ3OCBCL042) (FQ3CBCL_43 = FQ3OCBCL043) (FQ3CBCL_44 = FQ3OCBCL044) (FQ3CBCL_45 = FQ3OCBCL045)
                            (FQ3CBCL_46 = FQ3OCBCL046) (FQ3CBCL_47 = FQ3OCBCL047) (FQ3CBCL_48 = FQ3OCBCL048) (FQ3CBCL_49 = FQ3OCBCL049) (FQ3CBCL_50 = FQ3OCBCL050)
                            (FQ3CBCL_51 = FQ3OCBCL051) (FQ3CBCL_52 = FQ3OCBCL052) (FQ3CBCL_53 = FQ3OCBCL053) (FQ3CBCL_54 = FQ3OCBCL054) (FQ3CBCL_55 = FQ3OCBCL055)
                            (FQ3CBCL_56 = FQ3OCBCL056) (FQ3CBCL_57 = FQ3OCBCL057) (FQ3CBCL_58 = FQ3OCBCL058) (FQ3CBCL_59 = FQ3OCBCL059) (FQ3CBCL_60 = FQ3OCBCL060)
                            (FQ3CBCL_61 = FQ3OCBCL061) (FQ3CBCL_62 = FQ3OCBCL062) (FQ3CBCL_63 = FQ3OCBCL063) (FQ3CBCL_64 = FQ3OCBCL064) (FQ3CBCL_65 = FQ3OCBCL065)
                            (FQ3CBCL_66 = FQ3OCBCL066) (FQ3CBCL_67 = FQ3OCBCL067) (FQ3CBCL_68 = FQ3OCBCL068) (FQ3CBCL_69 = FQ3OCBCL069) (FQ3CBCL_70 = FQ3OCBCL070)
                            (FQ3CBCL_71 = FQ3OCBCL071) (FQ3CBCL_72 = FQ3OCBCL072) (FQ3CBCL_73 = FQ3OCBCL073) (FQ3CBCL_74 = FQ3OCBCL074) (FQ3CBCL_75 = FQ3OCBCL075)
                            (FQ3CBCL_76 = FQ3OCBCL076) (FQ3CBCL_77 = FQ3OCBCL077) (FQ3CBCL_78 = FQ3OCBCL078) (FQ3CBCL_79 = FQ3OCBCL079) (FQ3CBCL_80 = FQ3OCBCL080) 
                            (FQ3CBCL_81 = FQ3OCBCL081) (FQ3CBCL_82 = FQ3OCBCL082) (FQ3CBCL_83 = FQ3OCBCL083) (FQ3CBCL_84 = FQ3OCBCL084) (FQ3CBCL_85 = FQ3OCBCL085)
                            (FQ3CBCL_86 = FQ3OCBCL086) (FQ3CBCL_87 = FQ3OCBCL087) (FQ3CBCL_88 = FQ3OCBCL088) (FQ3CBCL_89 = FQ3OCBCL089) (FQ3CBCL_90 = FQ3OCBCL090)
                            (FQ3CBCL_91 = FQ3OCBCL091) (FQ3CBCL_92 = FQ3OCBCL092) (FQ3CBCL_93 = FQ3OCBCL093) (FQ3CBCL_94 = FQ3OCBCL094) (FQ3CBCL_95 = FQ3OCBCL095)
                            (FQ3CBCL_96 = FQ3OCBCL096) (FQ3CBCL_97 = FQ3OCBCL097) (FQ3CBCL_98 = FQ3OCBCL098) (FQ3CBCL_99 = FQ3OCBCL099) (FQ3CBCL_100 = FQ3OCBCL100).
EXECUTE.
RENAME VARIABLE (FQ3CBCL_24_TEXT = FQ3OCBCL024A) (FQ3CBCL_31_TEXT = FQ3OCBCL031A) (FQ3CBCL_32_TEXT = FQ3OCBCL032A) (FQ3CBCL_46_TEXT = FQ3OCBCL046A) 
                            (FQ3CBCL_54_TEXT = FQ3OCBCL054A) (FQ3CBCL_57_TEXT = FQ3OCBCL057A) (FQ3CBCL_65_TEXT = FQ3OCBCL065A) (FQ3CBCL_74_TEXT = FQ3OCBCL074A)
                            (FQ3CBCL_76_TEXT = FQ3OCBCL076A) (FQ3CBCL_80_TEXT = FQ3OCBCL080A) (FQ3CBCL_92_TEXT = FQ3OCBCL092A) (FQ3CBCL_100_TEXT = FQ3OCBCL100A).
EXECUTE.
*Remember to save your data file.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OCBCL_Cleaned.sav'.
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
/FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FD0OACS_Constructs.sav'
/IN=f
/FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OCBCL_Cleaned.sav'
/BY ID
/DROP=
FD0OSTAT FD0ORD
FD1OSTAT FD1OTD FD1ORD FD1ODIFF
FD2OSTAT FD2OTD FD2ORD FD2ODIFF
FD3OTD FD3ODIFF
FD4OSTAT FD4OTD FD4ORD FD4ODIFF
FD4AOSTAT FD4AOTD FD4AORD FD4AODIFF.
SELECT IF f=1.
EXECUTE.
*Comparing REDCap and Qualtrics dates of completion. Be sure to update the date variables used to reflect the accurate RD and questionnaire date.
COMPUTE DATEDIFF = DATEDIFF(FD3ORD,FQ3OCBCLDATE,'days').
EXECUTE.
COUNT DATEDIFF0=DATEDIFF(Lowest thru -1) DATEDIFF(1 thru Highest).
EXECUTE.
FREQUENCIES VARIABLES=DATEDIFF0
  /ORDER=ANALYSIS.
SORT CASES BY DATEDIFF0(D).
*CHECK ALL IDS WITH DISCREPANT DATES TO DETERMINE WHAT IS CORRECT. CONSULT BEFORE MAKING ANY CHANGES TO RAW DATA IN REDCAP OR QUALTRICS.
*INCLUDE NOTES HERE FOR EACH ID THAT WAS DISCREPANT (EXAMPLE BELOW - ADAPT AS NEEDED)
*THE FOLLOWING IDs (91768 and 91133) HAVE A A3 QUALTRICS DATE [FQ3OXXXDATE] THAT DOES NOT MATCH THEIR A3 VISIT DATE [FD3ORD]. 
*THIS WAS INVESTIGATED BY STAFF (BM: 4-11-22) AND VISIT DATE [FD3ORD] WAS CONFIRMED USING MULTIPLE SOURCES.
SORT CASES BY ID(A).
*DROPPING VARIABLES THAT ARE NO LONGER RELEVANT TO FINAL DATA FILE.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OCBCL_Cleaned.sav'
/DROP
FQ3OCBCLDATE
DATEDIFF
DATEDIFF0
f.
EXECUTE.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OCBCL_Cleaned.sav'.
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
**-12 'Participant refused follow-up'                                             /* (Participant refused follow-up) */     
**-11 'Participant (parent or child) deceased'                                 /* (Participant (parent or child) deceased) */
**-10 'Prefer not to answer'                                                           /* (Participant selected prefer not to answer) */.
RECODE 
    FQ3OCBCL001 to FQ3OCBCL024 
    FQ3OCBCL025 to FQ3OCBCL031 
    FQ3OCBCL032
    FQ3OCBCL033 to FQ3OCBCL046 
    FQ3OCBCL047 to FQ3OCBCL054 
    FQ3OCBCL055 to FQ3OCBCL057
    FQ3OCBCL058 to FQ3OCBCL065 
    FQ3OCBCL066 to FQ3OCBCL074 
    FQ3OCBCL075 to FQ3OCBCL076 
    FQ3OCBCL077 to FQ3OCBCL080 
    FQ3OCBCL081 to FQ3OCBCL092 
    FQ3OCBCL093 to FQ3OCBCL100 
    (4=-10).
EXECUTE.

*ID was not administered the measure. 
IF (ID=91637) FD3OSTAT = -41.    
EXECUTE. 

*91069 skipped 1 question(s). 
DO IF (ID=91069). 
    RECODE
    FQ3OCBCL001
    (SYSMIS=-10).
END IF.
EXECUTE.

*90975 skipped 1 question(s). 
DO IF (ID=90975). 
    RECODE
    FQ3OCBCL010
    (SYSMIS=-10).
END IF.
EXECUTE.

*90443 skipped 1 question(s). 
DO IF (ID=90443). 
    RECODE
    FQ3OCBCL018
    (SYSMIS=-10).
END IF.
EXECUTE.

*90841 skipped 1 question(s). 
DO IF (ID=90841). 
    RECODE
    FQ3OCBCL050
    (SYSMIS=-10).
END IF.
EXECUTE.

*90945 skipped 1 question(s). 
DO IF (ID=90945). 
    RECODE
    FQ3OCBCL065
    (SYSMIS=-10).
END IF.
EXECUTE.

*90975 skipped 1 question(s). 
DO IF (ID=90975). 
    RECODE
    FQ3OCBCL069
    (SYSMIS=-10).
END IF.
EXECUTE.

*90739 skipped 1 question(s). 
DO IF (ID=90739). 
    RECODE
    FQ3OCBCL078
    (SYSMIS=-10).
END IF.
EXECUTE.

*90210 skipped 1 question(s). 
DO IF (ID=90210). 
    RECODE
    FQ3OCBCL084
    (SYSMIS=-10).
END IF.
EXECUTE.

*Two IDs were missing Item 41.
IF (ID=90417 OR ID=90975) FQ3OCBCL041 = -10.    
EXECUTE. 

*Item 100 was skipped by a few remaining IDs.
IF (ID=90104 OR ID=90234 OR ID=90443 OR ID=90945 OR ID=91143 OR ID=91233 OR ID=91339) FQ3OCBCL100 = -10.    
EXECUTE. 

**STEP 7 (DELETE IF NOT NEEDED): CREATING NEW VARIABLES FOR REVERSED SCORED ITEMS.
**Reverse-Scored Items; see scoring document to determine if there are reverse-scored items. If no reverse-scored items, delete this syntax.
**CHECKED AND NOT NEEDED.

*STEP 7A: RECODING SYSMIS (PARTICIPANTS THAT MISSED THE ASSESSMENT).
*This will use the STAT variable to recode all SYSMIS data. CHANGE THE STAT VARIABLE TO MATCH THE ASSESSMENT WAVE YOU ARE WORKING IN.
*Include full list of numeric variables (including new reverse-scored items).
DO IF MISSING(FD3OSTAT).
DO REPEAT x = FQ3OCBCL001 to FQ3OCBCL024 
    FQ3OCBCL025 to FQ3OCBCL031 
    FQ3OCBCL032
    FQ3OCBCL033 to FQ3OCBCL046 
    FQ3OCBCL047 to FQ3OCBCL054 
    FQ3OCBCL055 to FQ3OCBCL057
    FQ3OCBCL058 to FQ3OCBCL065 
    FQ3OCBCL066 to FQ3OCBCL074 
    FQ3OCBCL075 to FQ3OCBCL076 
    FQ3OCBCL077 to FQ3OCBCL080 
    FQ3OCBCL081 to FQ3OCBCL092 
    FQ3OCBCL093 to FQ3OCBCL100.
RECODE FD3OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.

*STEP 8: STANDARDIZING DECIMAL PLACES (CANNOT INCLUDE TEXT/STRING VARIABLES).
*Making all variables have the same number of decimal places. Ensure that variables include all new reverse-scored variables. Change the number AFTER the decimal place as needed.
FORMATS 
    FQ3OCBCL001 to FQ3OCBCL024 (F8.0)
    FQ3OCBCL025 to FQ3OCBCL031 (F8.0)
    FQ3OCBCL032 (F8.0)
    FQ3OCBCL033 to FQ3OCBCL046 (F8.0)
    FQ3OCBCL047 to FQ3OCBCL054 (F8.0)
    FQ3OCBCL055 to FQ3OCBCL057 (F8.0)
    FQ3OCBCL058 to FQ3OCBCL065 (F8.0)
    FQ3OCBCL066 to FQ3OCBCL074 (F8.0)
    FQ3OCBCL075 to FQ3OCBCL076 (F8.0)
    FQ3OCBCL077 to FQ3OCBCL080 (F8.0)
    FQ3OCBCL081 to FQ3OCBCL092 (F8.0)
    FQ3OCBCL093 to FQ3OCBCL100 (F8.0).
EXECUTE.

*STEP 9: CREATING VARIABLE LABLES.
*Label all variables. Use the original questionnaire to include the exact text that participants saw. Include the questionnaire name and number at the end of the label.
VARIABLE LABELS  ID 'Participant ID'.
EXECUTE.

VARIABLE LABELS 
FQ3OCBCL001 'Aches or pains (without medical cause; do not include stomach or headaches). [FQ3OCBCL001]'
FQ3OCBCL002 'Acts too young for age. [FQ3OCBCL002]'
FQ3OCBCL003 'Afraid to try new things. [FQ3OCBCL003]'
FQ3OCBCL004 'Avoids looking others in the eye. [FQ3OCBCL004]'
FQ3OCBCL005 'Cant concentrate, cant pay attention for long. [FQ3OCBCL005]'
FQ3OCBCL006 'Cant sit still, restless, or hyperactive. [FQ3OCBCL006]'
FQ3OCBCL007 'Cant stand having things out of place. [FQ3OCBCL007]'
FQ3OCBCL008 'Cant stand waiting; wants everything now. [FQ3OCBCL008]'
FQ3OCBCL009 'Chews on things that arent edible. [FQ3OCBCL009]'
FQ3OCBCL010 'Clings to adults or too dependent. [FQ3OCBCL010]'
FQ3OCBCL011 'Constantly seeks help. [FQ3OCBCL011]'
FQ3OCBCL012 'Constipated, doesnt move bowels (when not sick). [FQ3OCBCL012]'
FQ3OCBCL013 'Cries a lot. [FQ3OCBCL013]'
FQ3OCBCL014 'Cruel to animals. [FQ3OCBCL014]'
FQ3OCBCL015 'Defiant. [FQ3OCBCL015]'
FQ3OCBCL016 'Demands must be met immediately. [FQ3OCBCL016]'
FQ3OCBCL017 'Destroys his/her own things. [FQ3OCBCL017]'
FQ3OCBCL018 'Destroys things belonging to his/her family or other children. [FQ3OCBCL018]'
FQ3OCBCL019 'Diarrhea or loose bowels (when not sick). [FQ3OCBCL019]'
FQ3OCBCL020 'Disobedient. [FQ3OCBCL020]'
FQ3OCBCL021 'Disturbed by any change in routine. [FQ3OCBCL021]'
FQ3OCBCL022 'Doesnt want to sleep alone. [FQ3OCBCL022]'
FQ3OCBCL023 'Doesnt answer when people talk to him/her. [FQ3OCBCL023]'
FQ3OCBCL024 'Doesnt eat well (describe). [FQ3OCBCL024]'
FQ3OCBCL024A 'Describe: Doesnt eat well. [FQ3OCBCL024A]'
FQ3OCBCL025 'Doesnt get along with other children. [FQ3OCBCL025]'
FQ3OCBCL026 'Doesnt know how to have fun; acts like a little adult. [FQ3OCBCL026]'
FQ3OCBCL027 'Doesnt seem to feel guilty after misbehaving. [FQ3OCBCL027]'
FQ3OCBCL028 'Doesnt want to go out of home. [FQ3OCBCL028]'
FQ3OCBCL029 'Easily frustrated. [FQ3OCBCL029]'
FQ3OCBCL030 'Easily jealous. [FQ3OCBCL030]'
FQ3OCBCL031 'Eats or drinks things that are not food - dont include sweets (describe). [FQ3OCBCL031]'
FQ3OCBCL031A 'Describe: Eats or drinks things that are not food - dont include sweets. [FQ3OCBCL031A]'
FQ3OCBCL032 'Fears certain animals, situations, or places (describe). [FQ3OCBCL032]'
FQ3OCBCL032A 'Describe: Fears certain animals, situations, or places. [FQ3OCBCL032A]'
FQ3OCBCL033 'Feelings are easily hurt. [FQ3OCBCL033]'
FQ3OCBCL034 'Gets hurt a lot, accident-prone. [FQ3OCBCL034]'
FQ3OCBCL035 'Gets in many fights. [FQ3OCBCL035]'
FQ3OCBCL036 'Gets into everything. [FQ3OCBCL036]'
FQ3OCBCL037 'Gets too upset when separated from parents. [FQ3OCBCL037]'
FQ3OCBCL038 'Has trouble getting to sleep. [FQ3OCBCL038]'
FQ3OCBCL039 'Headaches (without medical cause). [FQ3OCBCL039]'
FQ3OCBCL040 'Hits others. [FQ3OCBCL040]'
FQ3OCBCL041 'Holds his/her breath. [FQ3OCBCL041]'
FQ3OCBCL042 'Hurts animals or people without meaning to. [FQ3OCBCL042]'
FQ3OCBCL043 'Looks unhappy without good reason. [FQ3OCBCL043]'
FQ3OCBCL044 'Angry moods. [FQ3OCBCL044]'
FQ3OCBCL045 'Nausea, feels sick (without medical cause). [FQ3OCBCL045]'
FQ3OCBCL046 'Nervous movements or twitching (describe). [FQ3OCBCL046]'
FQ3OCBCL046A 'Describe: Nervous movements or twitching. [FQ3OCBCL046A]'
FQ3OCBCL047 'Nervous, high-strung, or tense. [FQ3OCBCL047]'
FQ3OCBCL048 'Nightmares. [FQ3OCBCL048]'
FQ3OCBCL049 'Overeating. [FQ3OCBCL049]'
FQ3OCBCL050 'Overtired. [FQ3OCBCL050]'
FQ3OCBCL051 'Shows panic for no good reason. [FQ3OCBCL051]'
FQ3OCBCL052 'Painful bowel movements (without medical cause). [FQ3OCBCL052]'
FQ3OCBCL053 'Physically attacks people. [FQ3OCBCL053]'
FQ3OCBCL054 'Picks nose, skin, or other parts of body (describe). [FQ3OCBCL054]'
FQ3OCBCL054A 'Describe: Picks nose, skin, or other parts of body. [FQ3OCBCL054A]'
FQ3OCBCL055 'Plays with own sex parts too much. [FQ3OCBCL055]'
FQ3OCBCL056 'Poorly coordinated or clumsy. [FQ3OCBCL056]'
FQ3OCBCL057 'Problems with eyes (without medical cause)(describe). [FQ3OCBCL057]'
FQ3OCBCL057A 'Describe: Problems with eyes (without medical cause). [FQ3OCBCL057A]'
FQ3OCBCL058 'Punishment doesnt change his/her behavior. [FQ3OCBCL058]'
FQ3OCBCL059 'Quickly shifts from one activity to another. [FQ3OCBCL059]'
FQ3OCBCL060 'Rashes or other skin problems (without medical cause). [FQ3OCBCL060]'
FQ3OCBCL061 'Refuses to eat. [FQ3OCBCL061]'
FQ3OCBCL062 'Refuses to play active games. [FQ3OCBCL062]'
FQ3OCBCL063 'Repeatedly rocks head or body. [FQ3OCBCL063]'
FQ3OCBCL064 'Resists going to bed at night. [FQ3OCBCL064]'
FQ3OCBCL065 'Resists toilet training (describe). [FQ3OCBCL065]'
FQ3OCBCL065A 'Describe: Resists toilet training. [FQ3OCBCL065A]'
FQ3OCBCL066 'Screams a lot. [FQ3OCBCL066]'
FQ3OCBCL067 'Seems unresponsive to affection. [FQ3OCBCL067]'
FQ3OCBCL068 'Self-conscious or easily embarrassed. [FQ3OCBCL068]'
FQ3OCBCL069 'Selfish or wont share. [FQ3OCBCL069]'
FQ3OCBCL070 'Shows little affection toward people. [FQ3OCBCL070]'
FQ3OCBCL071 'Shows little interest in things about him/herself. [FQ3OCBCL071]'
FQ3OCBCL072 'Shows too little fear of getting hurt. [FQ3OCBCL072]'
FQ3OCBCL073 'Too shy or timid. [FQ3OCBCL073]'
FQ3OCBCL074 'Sleeps less than most kids during day and/or night (describe). [FQ3OCBCL074]'
FQ3OCBCL074A 'Describe: Sleeps less than most kids during day and/or night. [FQ3OCBCL074A]'
FQ3OCBCL075 'Smears or plays with bowel movements. [FQ3OCBCL075]'
FQ3OCBCL076 'Speech problem (describe). [FQ3OCBCL076]'
FQ3OCBCL076A 'Describe: Speech problem. [FQ3OCBCL076A]'
FQ3OCBCL077 'Stares into space or seems preoccupied. [FQ3OCBCL077]'
FQ3OCBCL078 'Stomachaches or cramps (without medical cause). [FQ3OCBCL078]'
FQ3OCBCL079 'Rapid shifts between sadness and excitement. [FQ3OCBCL079]'
FQ3OCBCL080 'Strange behavior (describe). [FQ3OCBCL080]'
FQ3OCBCL080A 'Describe: Strange behavior. [FQ3OCBCL080A]'
FQ3OCBCL081 'Stubborn, sullen, or irritable. [FQ3OCBCL081]'
FQ3OCBCL082 'Sudden changes in mood or feelings. [FQ3OCBCL082]'
FQ3OCBCL083 'Sulks a lot. [FQ3OCBCL083]'
FQ3OCBCL084 'Talks or cries in sleep. [FQ3OCBCL084]'
FQ3OCBCL085 'Temper tantrums or hot temper. [FQ3OCBCL085]'
FQ3OCBCL086 'Too concerned with neatness or cleanliness. [FQ3OCBCL086]'
FQ3OCBCL087 'Too fearful or anxious. [FQ3OCBCL087]'
FQ3OCBCL088 'Uncooperative. [FQ3OCBCL088]'
FQ3OCBCL089 'Under-active, slow moving, or lack energy. [FQ3OCBCL089]'
FQ3OCBCL090 'Unhappy, sad, or depressed. [FQ3OCBCL090]'
FQ3OCBCL091 'Unusually loud. [FQ3OCBCL091]'
FQ3OCBCL092 'Upset by new people or situations (describe). [FQ3OCBCL092]'
FQ3OCBCL092A 'Describe: Upset by new people or situations. [FQ3OCBCL092A]'
FQ3OCBCL093 'Vomiting, throwing up (without medical cause). [FQ3OCBCL093]'
FQ3OCBCL094 'Wakes up often at night. [FQ3OCBCL094]'
FQ3OCBCL095 'Wanders away. [FQ3OCBCL095]'
FQ3OCBCL096 'Wants a lot of attention. [FQ3OCBCL096]'
FQ3OCBCL097 'Whining. [FQ3OCBCL097]'
FQ3OCBCL098 'Withdrawn, doesnt get involved with others. [FQ3OCBCL098]'
FQ3OCBCL099 'Worries. [FQ3OCBCL099]'
FQ3OCBCL100 'There are problems the child has that were not listen above (describe). [FQ3OCBCL100]'
FQ3OCBCL100A 'Describe: There are problems the child has that were not listen above. [FQ3OCBCL100A]'.
EXECUTE. 

*STEP 10: ADD VALUE LABELS.
*Include missing values like 'Prefer not to Answer' (or something similar) if applicable.
*Include ALL missing value labels (SEE ABOVE FOR FULL LIST).
VALUE LABELS
FQ3OCBCL001 FQ3OCBCL002 FQ3OCBCL003 FQ3OCBCL004 FQ3OCBCL005
FQ3OCBCL006 FQ3OCBCL007 FQ3OCBCL008 FQ3OCBCL009 FQ3OCBCL010
FQ3OCBCL011 FQ3OCBCL012 FQ3OCBCL013 FQ3OCBCL014 FQ3OCBCL015
FQ3OCBCL016 FQ3OCBCL017 FQ3OCBCL018 FQ3OCBCL019 FQ3OCBCL020
FQ3OCBCL021 FQ3OCBCL022 FQ3OCBCL023 FQ3OCBCL024 FQ3OCBCL025
FQ3OCBCL026 FQ3OCBCL027 FQ3OCBCL028 FQ3OCBCL029 FQ3OCBCL030
FQ3OCBCL031 FQ3OCBCL032 FQ3OCBCL033 FQ3OCBCL034 FQ3OCBCL035
FQ3OCBCL036 FQ3OCBCL037 FQ3OCBCL038 FQ3OCBCL039 FQ3OCBCL040
FQ3OCBCL041 FQ3OCBCL042 FQ3OCBCL043 FQ3OCBCL044 FQ3OCBCL045
FQ3OCBCL046 FQ3OCBCL047 FQ3OCBCL048 FQ3OCBCL049 FQ3OCBCL050
FQ3OCBCL051 FQ3OCBCL052 FQ3OCBCL053 FQ3OCBCL054 FQ3OCBCL055
FQ3OCBCL056 FQ3OCBCL057 FQ3OCBCL058 FQ3OCBCL059 FQ3OCBCL060
FQ3OCBCL061 FQ3OCBCL062 FQ3OCBCL063 FQ3OCBCL064 FQ3OCBCL065
FQ3OCBCL066 FQ3OCBCL067 FQ3OCBCL068 FQ3OCBCL069 FQ3OCBCL070
FQ3OCBCL071 FQ3OCBCL072 FQ3OCBCL073 FQ3OCBCL074 FQ3OCBCL075
FQ3OCBCL076 FQ3OCBCL077 FQ3OCBCL078 FQ3OCBCL079 FQ3OCBCL080
FQ3OCBCL081 FQ3OCBCL082 FQ3OCBCL083 FQ3OCBCL084 FQ3OCBCL085
FQ3OCBCL086 FQ3OCBCL087 FQ3OCBCL088 FQ3OCBCL089 FQ3OCBCL090
FQ3OCBCL091 FQ3OCBCL092 FQ3OCBCL093 FQ3OCBCL094 FQ3OCBCL095
FQ3OCBCL096 FQ3OCBCL097 FQ3OCBCL098 FQ3OCBCL099 FQ3OCBCL100
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
-12 'Participant refused follow-up (-12)'                                        
-11 'Participant (parent or child) deceased (-11)'                                                
-10 'Prefer not to answer (-10)'   
0 'Not True (as far as you know) (0)'
1 'Somewhat or Sometimes True (1)'
2 'Very True or Often True (2)'.
EXECUTE.

*STEP 11: LABELING MISSING VALUES AS MISSING.
*Recoding all negative numbers as missing.
MISSING VALUES
FQ3OCBCL001 FQ3OCBCL002 FQ3OCBCL003 FQ3OCBCL004 FQ3OCBCL005
FQ3OCBCL006 FQ3OCBCL007 FQ3OCBCL008 FQ3OCBCL009 FQ3OCBCL010
FQ3OCBCL011 FQ3OCBCL012 FQ3OCBCL013 FQ3OCBCL014 FQ3OCBCL015
FQ3OCBCL016 FQ3OCBCL017 FQ3OCBCL018 FQ3OCBCL019 FQ3OCBCL020
FQ3OCBCL021 FQ3OCBCL022 FQ3OCBCL023 FQ3OCBCL024 FQ3OCBCL025
FQ3OCBCL026 FQ3OCBCL027 FQ3OCBCL028 FQ3OCBCL029 FQ3OCBCL030
FQ3OCBCL031 FQ3OCBCL032 FQ3OCBCL033 FQ3OCBCL034 FQ3OCBCL035
FQ3OCBCL036 FQ3OCBCL037 FQ3OCBCL038 FQ3OCBCL039 FQ3OCBCL040
FQ3OCBCL041 FQ3OCBCL042 FQ3OCBCL043 FQ3OCBCL044 FQ3OCBCL045
FQ3OCBCL046 FQ3OCBCL047 FQ3OCBCL048 FQ3OCBCL049 FQ3OCBCL050
FQ3OCBCL051 FQ3OCBCL052 FQ3OCBCL053 FQ3OCBCL054 FQ3OCBCL055
FQ3OCBCL056 FQ3OCBCL057 FQ3OCBCL058 FQ3OCBCL059 FQ3OCBCL060
FQ3OCBCL061 FQ3OCBCL062 FQ3OCBCL063 FQ3OCBCL064 FQ3OCBCL065
FQ3OCBCL066 FQ3OCBCL067 FQ3OCBCL068 FQ3OCBCL069 FQ3OCBCL070
FQ3OCBCL071 FQ3OCBCL072 FQ3OCBCL073 FQ3OCBCL074 FQ3OCBCL075
FQ3OCBCL076 FQ3OCBCL077 FQ3OCBCL078 FQ3OCBCL079 FQ3OCBCL080
FQ3OCBCL081 FQ3OCBCL082 FQ3OCBCL083 FQ3OCBCL084 FQ3OCBCL085
FQ3OCBCL086 FQ3OCBCL087 FQ3OCBCL088 FQ3OCBCL089 FQ3OCBCL090
FQ3OCBCL091 FQ3OCBCL092 FQ3OCBCL093 FQ3OCBCL094 FQ3OCBCL095
FQ3OCBCL096 FQ3OCBCL097 FQ3OCBCL098 FQ3OCBCL099 FQ3OCBCL100
    (LO THRU -1).
EXECUTE.

*STEP 12: SAVE CLEANED DATA FILE.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OCBCL_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.

*STEP 13: CHECK FREQUENCIES.
*Checking frequencies of all items before creating constructs.
*Include STAT variable here to be sure all missingness was coded correctly.
FREQUENCIES VARIABLES= FD3OSTAT FQ3OCBCL001 FQ3OCBCL002 FQ3OCBCL003 FQ3OCBCL004 FQ3OCBCL005
FQ3OCBCL006 FQ3OCBCL007 FQ3OCBCL008 FQ3OCBCL009 FQ3OCBCL010
FQ3OCBCL011 FQ3OCBCL012 FQ3OCBCL013 FQ3OCBCL014 FQ3OCBCL015
FQ3OCBCL016 FQ3OCBCL017 FQ3OCBCL018 FQ3OCBCL019 FQ3OCBCL020
FQ3OCBCL021 FQ3OCBCL022 FQ3OCBCL023 FQ3OCBCL024 
FQ3OCBCL025 FQ3OCBCL026 FQ3OCBCL027 FQ3OCBCL028 FQ3OCBCL029
FQ3OCBCL030 FQ3OCBCL031 FQ3OCBCL032
FQ3OCBCL033 FQ3OCBCL034 FQ3OCBCL035 FQ3OCBCL036 FQ3OCBCL037
FQ3OCBCL038 FQ3OCBCL039 FQ3OCBCL040 FQ3OCBCL041 FQ3OCBCL042
FQ3OCBCL043 FQ3OCBCL044 FQ3OCBCL045 FQ3OCBCL046 
FQ3OCBCL047 FQ3OCBCL048 FQ3OCBCL049 FQ3OCBCL050 FQ3OCBCL051
FQ3OCBCL052 FQ3OCBCL053 FQ3OCBCL054 FQ3OCBCL055
FQ3OCBCL056 FQ3OCBCL057 FQ3OCBCL058 FQ3OCBCL059
FQ3OCBCL060 FQ3OCBCL061 FQ3OCBCL062 FQ3OCBCL063 FQ3OCBCL064
FQ3OCBCL065 FQ3OCBCL066 FQ3OCBCL067 FQ3OCBCL068
FQ3OCBCL069 FQ3OCBCL070 FQ3OCBCL071 FQ3OCBCL072 FQ3OCBCL073
FQ3OCBCL074 FQ3OCBCL075 FQ3OCBCL076
FQ3OCBCL077 FQ3OCBCL078 FQ3OCBCL079 FQ3OCBCL080
FQ3OCBCL081 FQ3OCBCL082 FQ3OCBCL083 FQ3OCBCL084 FQ3OCBCL085
FQ3OCBCL086 FQ3OCBCL087 FQ3OCBCL088 FQ3OCBCL089 FQ3OCBCL090
FQ3OCBCL091 FQ3OCBCL092 FQ3OCBCL093 FQ3OCBCL094
FQ3OCBCL095 FQ3OCBCL096 FQ3OCBCL097 FQ3OCBCL098 FQ3OCBCL099
FQ3OCBCL100
  /ORDER=ANALYSIS.

*STEP 14: CHECK DESCRIPTIVES.
*Checking descriptives for all items before creating constructs.
DESCRIPTIVES VARIABLES=FQ3OCBCL001 FQ3OCBCL002 FQ3OCBCL003 FQ3OCBCL004 FQ3OCBCL005
FQ3OCBCL006 FQ3OCBCL007 FQ3OCBCL008 FQ3OCBCL009 FQ3OCBCL010
FQ3OCBCL011 FQ3OCBCL012 FQ3OCBCL013 FQ3OCBCL014 FQ3OCBCL015
FQ3OCBCL016 FQ3OCBCL017 FQ3OCBCL018 FQ3OCBCL019 FQ3OCBCL020
FQ3OCBCL021 FQ3OCBCL022 FQ3OCBCL023 FQ3OCBCL024 
FQ3OCBCL025 FQ3OCBCL026 FQ3OCBCL027 FQ3OCBCL028 FQ3OCBCL029
FQ3OCBCL030 FQ3OCBCL031 FQ3OCBCL032
FQ3OCBCL033 FQ3OCBCL034 FQ3OCBCL035 FQ3OCBCL036 FQ3OCBCL037
FQ3OCBCL038 FQ3OCBCL039 FQ3OCBCL040 FQ3OCBCL041 FQ3OCBCL042
FQ3OCBCL043 FQ3OCBCL044 FQ3OCBCL045 FQ3OCBCL046 
FQ3OCBCL047 FQ3OCBCL048 FQ3OCBCL049 FQ3OCBCL050 FQ3OCBCL051
FQ3OCBCL052 FQ3OCBCL053 FQ3OCBCL054 FQ3OCBCL055
FQ3OCBCL056 FQ3OCBCL057 FQ3OCBCL058 FQ3OCBCL059
FQ3OCBCL060 FQ3OCBCL061 FQ3OCBCL062 FQ3OCBCL063 FQ3OCBCL064
FQ3OCBCL065 FQ3OCBCL066 FQ3OCBCL067 FQ3OCBCL068
FQ3OCBCL069 FQ3OCBCL070 FQ3OCBCL071 FQ3OCBCL072 FQ3OCBCL073
FQ3OCBCL074 FQ3OCBCL075 FQ3OCBCL076
FQ3OCBCL077 FQ3OCBCL078 FQ3OCBCL079 FQ3OCBCL080
FQ3OCBCL081 FQ3OCBCL082 FQ3OCBCL083 FQ3OCBCL084 FQ3OCBCL085
FQ3OCBCL086 FQ3OCBCL087 FQ3OCBCL088 FQ3OCBCL089 FQ3OCBCL090
FQ3OCBCL091 FQ3OCBCL092 FQ3OCBCL093 FQ3OCBCL094
FQ3OCBCL095 FQ3OCBCL096 FQ3OCBCL097 FQ3OCBCL098 FQ3OCBCL099
FQ3OCBCL100 
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 15: SAVE CLEANED DATA FILE.
*Sorting the data file by ID and resaving the final file.
*To reorder items, use /KEEP {list all variables in order} -- insert in line after file name.
SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OCBCL_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OCBCL_Cleaned.sav'.
EXECUTE.

*STEP 16: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE
 OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OCBCL_Cleaned.spv'
 LOCK=NO.


* Encoding: UTF-8.
*STEP 0: NOTES
*Child Behavior Checklist (CBCL).
 
*10-01-21(BM): Adapted STEPS 1-16 from A1 Syntax.
*04-13-2022 (BM):Adapted Syntax to Match Updated Template + Pass in Updated Data. 
*04-15-22(AAC): Checked.
*04-18-2022(BM): Double Checked and Fixed Missing Codes.
*04-21-22(AAC): Checked.
*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------.
*STEP 1: OPENING RAW DATA.
*Insert the correct file path and file name. Use syntax to open raw data file.
GET
 FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/DBT Moms R01 Study Time 4 Mother Survey_April 18, 2022_16.19.sav'.

*STEP 2: SAVING QUESTIONNAIRE SPECIFIC RAW DATA. 
*Insert the correct file path and file name. Save this file with only those variables that you need, in the following order; ID, Start Date, Questionnaire Items (i.e., DERS_1 to DERS_36).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OCBCL_Cleaned.sav'
  /KEEP 
  FQ4ID 
  STARTDATE
  FQ4CBCL_1 TO FQ4CBCL_100_TEXT
  /COMPRESSED.
  EXECUTE.

*STEP 3: OPEN NEW DATA FILE.  
*Insert the correct file path and file name. Open the file you just created and saved so that you are able to clean the data.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OCBCL_Cleaned.sav'.

*STEP 4: TRANSFORM VARIABLES AND SORT IDS ASCENDING ORDER.
*Transforming ID from a string to a numeric variable, change the date format of startdate, and sort IDs in ascending order.
ALTER TYPE FQ4ID (F10.0).
EXECUTE.
FORMATS STARTDATE (adate10).
EXECUTE.
SORT CASES BY FQ4ID(A).
EXECUTE.

*STEP 5: RENAME ‘RAW DATA’ VARIABLES TO ‘CLEANED’ VARIABLES NAMES. 
*Rename all variables so they reflect our naming scheme. ID should always be labeled as 'ID'. Item should be numbers 01-36 or 001-106. 
RENAME VARIABLE (FQ4ID=ID).
EXECUTE.
RENAME VARIABLE (STARTDATE=FQ4OCBCLDATE).
EXECUTE.
RENAME VARIABLE (FQ4CBCL_1 = FQ4OCBCL001) (FQ4CBCL_2 = FQ4OCBCL002) (FQ4CBCL_3 = FQ4OCBCL003) (FQ4CBCL_4 = FQ4OCBCL004) (FQ4CBCL_5 = FQ4OCBCL005)
                            (FQ4CBCL_6 = FQ4OCBCL006) (FQ4CBCL_7 = FQ4OCBCL007) (FQ4CBCL_8 = FQ4OCBCL008) (FQ4CBCL_9 = FQ4OCBCL009) (FQ4CBCL_10 = FQ4OCBCL010)
                            (FQ4CBCL_11 = FQ4OCBCL011) (FQ4CBCL_12 = FQ4OCBCL012) (FQ4CBCL_13 = FQ4OCBCL013) (FQ4CBCL_14 = FQ4OCBCL014) (FQ4CBCL_15 = FQ4OCBCL015)
                            (FQ4CBCL_16 = FQ4OCBCL016) (FQ4CBCL_17 = FQ4OCBCL017) (FQ4CBCL_18 = FQ4OCBCL018) (FQ4CBCL_19 = FQ4OCBCL019) (FQ4CBCL_20 = FQ4OCBCL020)
                            (FQ4CBCL_21 = FQ4OCBCL021) (FQ4CBCL_22 = FQ4OCBCL022) (FQ4CBCL_23 = FQ4OCBCL023) (FQ4CBCL_24 = FQ4OCBCL024) (FQ4CBCL_25 = FQ4OCBCL025)
                            (FQ4CBCL_26 = FQ4OCBCL026) (FQ4CBCL_27 = FQ4OCBCL027) (FQ4CBCL_28 = FQ4OCBCL028) (FQ4CBCL_29 = FQ4OCBCL029) (FQ4CBCL_30 = FQ4OCBCL030)
                            (FQ4CBCL_31 = FQ4OCBCL031) (FQ4CBCL_32 = FQ4OCBCL032) (FQ4CBCL_33 = FQ4OCBCL033) (FQ4CBCL_34 = FQ4OCBCL034) (FQ4CBCL_35 = FQ4OCBCL035)
                            (FQ4CBCL_36 = FQ4OCBCL036) (FQ4CBCL_37 = FQ4OCBCL037) (FQ4CBCL_38 = FQ4OCBCL038) (FQ4CBCL_39 = FQ4OCBCL039) (FQ4CBCL_40 = FQ4OCBCL040)
                            (FQ4CBCL_41 = FQ4OCBCL041) (FQ4CBCL_42 = FQ4OCBCL042) (FQ4CBCL_43 = FQ4OCBCL043) (FQ4CBCL_44 = FQ4OCBCL044) (FQ4CBCL_45 = FQ4OCBCL045)
                            (FQ4CBCL_46 = FQ4OCBCL046) (FQ4CBCL_47 = FQ4OCBCL047) (FQ4CBCL_48 = FQ4OCBCL048) (FQ4CBCL_49 = FQ4OCBCL049) (FQ4CBCL_50 = FQ4OCBCL050)
                            (FQ4CBCL_51 = FQ4OCBCL051) (FQ4CBCL_52 = FQ4OCBCL052) (FQ4CBCL_53 = FQ4OCBCL053) (FQ4CBCL_54 = FQ4OCBCL054) (FQ4CBCL_55 = FQ4OCBCL055)
                            (FQ4CBCL_56 = FQ4OCBCL056) (FQ4CBCL_57 = FQ4OCBCL057) (FQ4CBCL_58 = FQ4OCBCL058) (FQ4CBCL_59 = FQ4OCBCL059) (FQ4CBCL_60 = FQ4OCBCL060)
                            (FQ4CBCL_61 = FQ4OCBCL061) (FQ4CBCL_62 = FQ4OCBCL062) (FQ4CBCL_63 = FQ4OCBCL063) (FQ4CBCL_64 = FQ4OCBCL064) (FQ4CBCL_65 = FQ4OCBCL065)
                            (FQ4CBCL_66 = FQ4OCBCL066) (FQ4CBCL_67 = FQ4OCBCL067) (FQ4CBCL_68 = FQ4OCBCL068) (FQ4CBCL_69 = FQ4OCBCL069) (FQ4CBCL_70 = FQ4OCBCL070)
                            (FQ4CBCL_71 = FQ4OCBCL071) (FQ4CBCL_72 = FQ4OCBCL072) (FQ4CBCL_73 = FQ4OCBCL073) (FQ4CBCL_74 = FQ4OCBCL074) (FQ4CBCL_75 = FQ4OCBCL075)
                            (FQ4CBCL_76 = FQ4OCBCL076) (FQ4CBCL_77 = FQ4OCBCL077) (FQ4CBCL_78 = FQ4OCBCL078) (FQ4CBCL_79 = FQ4OCBCL079) (FQ4CBCL_80 = FQ4OCBCL080) 
                            (FQ4CBCL_81 = FQ4OCBCL081) (FQ4CBCL_82 = FQ4OCBCL082) (FQ4CBCL_83 = FQ4OCBCL083) (FQ4CBCL_84 = FQ4OCBCL084) (FQ4CBCL_85 = FQ4OCBCL085)
                            (FQ4CBCL_86 = FQ4OCBCL086) (FQ4CBCL_87 = FQ4OCBCL087) (FQ4CBCL_88 = FQ4OCBCL088) (FQ4CBCL_89 = FQ4OCBCL089) (FQ4CBCL_90 = FQ4OCBCL090)
                            (FQ4CBCL_91 = FQ4OCBCL091) (FQ4CBCL_92 = FQ4OCBCL092) (FQ4CBCL_93 = FQ4OCBCL093) (FQ4CBCL_94 = FQ4OCBCL094) (FQ4CBCL_95 = FQ4OCBCL095)
                            (FQ4CBCL_96 = FQ4OCBCL096) (FQ4CBCL_97 = FQ4OCBCL097) (FQ4CBCL_98 = FQ4OCBCL098) (FQ4CBCL_99 = FQ4OCBCL099) (FQ4CBCL_100 = FQ4OCBCL100).
EXECUTE.
RENAME VARIABLE (FQ4CBCL_24_TEXT = FQ4OCBCL024A) (FQ4CBCL_31_TEXT = FQ4OCBCL031A) (FQ4CBCL_32_TEXT = FQ4OCBCL032A) (FQ4CBCL_46_TEXT = FQ4OCBCL046A) 
                            (FQ4CBCL_54_TEXT = FQ4OCBCL054A) (FQ4CBCL_57_TEXT = FQ4OCBCL057A) (FQ4CBCL_65_TEXT = FQ4OCBCL065A) (FQ4CBCL_74_TEXT = FQ4OCBCL074A)
                            (FQ4CBCL_76_TEXT = FQ4OCBCL076A) (FQ4CBCL_80_TEXT = FQ4OCBCL080A) (FQ4CBCL_92_TEXT = FQ4OCBCL092A) (FQ4CBCL_100_TEXT = FQ4OCBCL100A).
EXECUTE.
*Remember to save your data file.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OCBCL_Cleaned.sav'.
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
/FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OCBCL_Cleaned.sav'
/BY ID
/DROP=
FD0OSTAT FD0ORD
FD1OSTAT FD1OTD FD1ORD FD1ODIFF
FD2OSTAT FD2OTD FD2ORD FD2ODIFF
FD3OSTAT FD3OTD FD3ORD FD3ODIFF
FD4OTD FD4ODIFF
FD4AOSTAT FD4AOTD FD4AORD FD4AODIFF.
SELECT IF f=1.
EXECUTE.
*Comparing REDCap and Qualtrics dates of completion. Be sure to update the date variables used to reflect the accurate RD and questionnaire date.
COMPUTE DATEDIFF = DATEDIFF(FD4ORD,FQ4OCBCLDATE,'days').
EXECUTE.
COUNT DATEDIFF0=DATEDIFF(Lowest thru -1) DATEDIFF(1 thru Highest).
EXECUTE.
FREQUENCIES VARIABLES=DATEDIFF0
  /ORDER=ANALYSIS.
SORT CASES BY DATEDIFF0(D).
*CHECK ALL IDS WITH DISCREPANT DATES TO DETERMINE WHAT IS CORRECT. CONSULT BEFORE MAKING ANY CHANGES TO RAW DATA IN REDCAP OR QUALTRICS.
*INCLUDE NOTES HERE FOR EACH ID THAT WAS DISCREPANT (EXAMPLE BELOW - ADAPT AS NEEDED)
*THE FOLLOWING IDs (90754 and 91123) HAVE A A4 QUALTRICS DATE [FQ4OXXXDATE] THAT DOES NOT MATCH THEIR A4 VISIT DATE [FD4ORD]. 
*THIS WAS INVESTIGATED BY STAFF (BM: 4-11-22) AND VISIT DATE [FQ4OXXXDATE] WAS CONFIRMED TO BE THE CORRECT DATE FOR QUALTRICS DATA USING MULTIPLE SOURCES.
IF(ID=90754)FD4ORD=13768849370.
EXECUTE.
IF(ID=91123)FD4ORD=13768849370.
EXECUTE.

SORT CASES BY ID(A).
*DROPPING VARIABLES THAT ARE NO LONGER RELEVANT TO FINAL DATA FILE.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OCBCL_Cleaned.sav'
/DROP
FQ4OCBCLDATE
DATEDIFF
DATEDIFF0
f.
EXECUTE.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OCBCL_Cleaned.sav'.
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
**-11 'Participant (parent or child) deceased'                               = /* (Participant (parent or child) deceased) */
**-10 'Prefer not to answer'                                                           /* (Participant selected prefer not to answer) */.
RECODE 
    FQ4OCBCL001 to FQ4OCBCL024 
    FQ4OCBCL025 to FQ4OCBCL031 
    FQ4OCBCL032
    FQ4OCBCL033 to FQ4OCBCL046 
    FQ4OCBCL047 to FQ4OCBCL054 
    FQ4OCBCL055 to FQ4OCBCL057
    FQ4OCBCL058 to FQ4OCBCL065 
    FQ4OCBCL066 to FQ4OCBCL074 
    FQ4OCBCL075 to FQ4OCBCL076 
    FQ4OCBCL077 to FQ4OCBCL080 
    FQ4OCBCL081 to FQ4OCBCL092 
    FQ4OCBCL093 to FQ4OCBCL100 
    (4=-10).
EXECUTE.

*90730 skipped 1 question(s). 
DO IF (ID=90730). 
    RECODE
    FQ4OCBCL001
    (SYSMIS=-10).
END IF.
EXECUTE.

*90671 skipped 1 question(s). 
DO IF (ID=90671). 
    RECODE
    FQ4OCBCL079
    (SYSMIS=-10).
END IF.
EXECUTE.

*90417 skipped 1 question(s). 
DO IF (ID=90417). 
    RECODE
    FQ4OCBCL076
    (SYSMIS=-10).
END IF.
EXECUTE.

*90083 skipped 1 question(s). 
DO IF (ID=90083). 
    RECODE
    FQ4OCBCL063
    (SYSMIS=-10).
END IF.
EXECUTE.

*90872 skipped 1 question(s). 
DO IF (ID=90872). 
    RECODE
    FQ4OCBCL013
    (SYSMIS=-10).
END IF.
EXECUTE.

*90975 skipped 1 question(s). 
DO IF (ID=90975). 
    RECODE
    FQ4OCBCL072
    (SYSMIS=-10).
END IF.
EXECUTE.

*90196 skipped 1 question(s). 
DO IF (ID=90196). 
    RECODE
    FQ4OCBCL024 FQ4OCBCL054
    (SYSMIS=-10).
END IF.
EXECUTE.

*90417 skipped 1 question(s). 
DO IF (ID=90417). 
    RECODE
    FQ4OCBCL039
    (SYSMIS=-10).
END IF.
EXECUTE.

*91768 skipped 1 question(s). 
DO IF (ID=91768). 
    RECODE
    FQ4OCBCL056
    (SYSMIS=-10).
END IF.
EXECUTE.

*90887 skipped 1 question(s). 
DO IF (ID=90887). 
    RECODE
    FQ4OCBCL080
    (SYSMIS=-10).
END IF.
EXECUTE.

*Item 100 was skipped by a few remaining IDs.
IF (ID=90230 OR ID=90104 OR ID=90687 OR ID=90234 OR ID=90564 OR ID=90724 OR ID=91040 OR
    ID=90872 OR ID=91133 OR ID=91995 OR ID=90386 OR ID=90097) FQ4OCBCL100 = -10.    
EXECUTE. 

**STEP 7 (DELETE IF NOT NEEDED): CREATING NEW VARIABLES FOR REVERSED SCORED ITEMS.
**Reverse-Scored Items; see scoring document to determine if there are reverse-scored items. If no reverse-scored items, delete this syntax.
**CHECKED AND NOT NEEDED.

*STEP 7A: RECODING SYSMIS (PARTICIPANTS THAT MISSED THE ASSESSMENT).
*This will use the STAT variable to recode all SYSMIS data. CHANGE THE STAT VARIABLE TO MATCH THE ASSESSMENT WAVE YOU ARE WORKING IN.
*Include full list of numeric variables (including new reverse-scored items).
DO IF MISSING(FD4OSTAT).
DO REPEAT x = FQ4OCBCL001 to FQ4OCBCL024 
    FQ4OCBCL025 to FQ4OCBCL031 
    FQ4OCBCL032
    FQ4OCBCL033 to FQ4OCBCL046 
    FQ4OCBCL047 to FQ4OCBCL054 
    FQ4OCBCL055 to FQ4OCBCL057
    FQ4OCBCL058 to FQ4OCBCL065 
    FQ4OCBCL066 to FQ4OCBCL074 
    FQ4OCBCL075 to FQ4OCBCL076 
    FQ4OCBCL077 to FQ4OCBCL080 
    FQ4OCBCL081 to FQ4OCBCL092 
    FQ4OCBCL093 to FQ4OCBCL100.
RECODE FD4OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.

*STEP 8: STANDARDIZING DECIMAL PLACES (CANNOT INCLUDE TEXT/STRING VARIABLES).
*Making all variables have the same number of decimal places. Ensure that variables include all new reverse-scored variables. Change the number AFTER the decimal place as needed.
FORMATS 
    FQ4OCBCL001 to FQ4OCBCL024 (F8.0)
    FQ4OCBCL025 to FQ4OCBCL031 (F8.0)
    FQ4OCBCL032 (F8.0)
    FQ4OCBCL033 to FQ4OCBCL046 (F8.0)
    FQ4OCBCL047 to FQ4OCBCL054 (F8.0)
    FQ4OCBCL055 to FQ4OCBCL057 (F8.0)
    FQ4OCBCL058 to FQ4OCBCL065 (F8.0)
    FQ4OCBCL066 to FQ4OCBCL074 (F8.0)
    FQ4OCBCL075 to FQ4OCBCL076 (F8.0)
    FQ4OCBCL077 to FQ4OCBCL080 (F8.0)
    FQ4OCBCL081 to FQ4OCBCL092 (F8.0)
    FQ4OCBCL093 to FQ4OCBCL100 (F8.0).
EXECUTE.

*STEP 9: CREATING VARIABLE LABLES.
*Label all variables. Use the original questionnaire to include the exact text that participants saw. Include the questionnaire name and number at the end of the label.
VARIABLE LABELS  ID 'Participant ID'.
EXECUTE.

VARIABLE LABELS 
FQ4OCBCL001 'Aches or pains (without medical cause; do not include stomach or headaches). [FQ4OCBCL001]'
FQ4OCBCL002 'Acts too young for age. [FQ4OCBCL002]'
FQ4OCBCL003 'Afraid to try new things. [FQ4OCBCL003]'
FQ4OCBCL004 'Avoids looking others in the eye. [FQ4OCBCL004]'
FQ4OCBCL005 'Cant concentrate, cant pay attention for long. [FQ4OCBCL005]'
FQ4OCBCL006 'Cant sit still, restless, or hyperactive. [FQ4OCBCL006]'
FQ4OCBCL007 'Cant stand having things out of place. [FQ4OCBCL007]'
FQ4OCBCL008 'Cant stand waiting; wants everything now. [FQ4OCBCL008]'
FQ4OCBCL009 'Chews on things that arent edible. [FQ4OCBCL009]'
FQ4OCBCL010 'Clings to adults or too dependent. [FQ4OCBCL010]'
FQ4OCBCL011 'Constantly seeks help. [FQ4OCBCL011]'
FQ4OCBCL012 'Constipated, doesnt move bowels (when not sick). [FQ4OCBCL012]'
FQ4OCBCL013 'Cries a lot. [FQ4OCBCL013]'
FQ4OCBCL014 'Cruel to animals. [FQ4OCBCL014]'
FQ4OCBCL015 'Defiant. [FQ4OCBCL015]'
FQ4OCBCL016 'Demands must be met immediately. [FQ4OCBCL016]'
FQ4OCBCL017 'Destroys his/her own things. [FQ4OCBCL017]'
FQ4OCBCL018 'Destroys things belonging to his/her family or other children. [FQ4OCBCL018]'
FQ4OCBCL019 'Diarrhea or loose bowels (when not sick). [FQ4OCBCL019]'
FQ4OCBCL020 'Disobedient. [FQ4OCBCL020]'
FQ4OCBCL021 'Disturbed by any change in routine. [FQ4OCBCL021]'
FQ4OCBCL022 'Doesnt want to sleep alone. [FQ4OCBCL022]'
FQ4OCBCL023 'Doesnt answer when people talk to him/her. [FQ4OCBCL023]'
FQ4OCBCL024 'Doesnt eat well (describe). [FQ4OCBCL024]'
FQ4OCBCL024A 'Describe: Doesnt eat well. [FQ4OCBCL024A]'
FQ4OCBCL025 'Doesnt get along with other children. [FQ4OCBCL025]'
FQ4OCBCL026 'Doesnt know how to have fun; acts like a little adult. [FQ4OCBCL026]'
FQ4OCBCL027 'Doesnt seem to feel guilty after misbehaving. [FQ4OCBCL027]'
FQ4OCBCL028 'Doesnt want to go out of home. [FQ4OCBCL028]'
FQ4OCBCL029 'Easily frustrated. [FQ4OCBCL029]'
FQ4OCBCL030 'Easily jealous. [FQ4OCBCL030]'
FQ4OCBCL031 'Eats or drinks things that are not food - dont include sweets (describe). [FQ4OCBCL031]'
FQ4OCBCL031A 'Describe: Eats or drinks things that are not food - dont include sweets. [FQ4OCBCL031A]'
FQ4OCBCL032 'Fears certain animals, situations, or places (describe). [FQ4OCBCL032]'
FQ4OCBCL032A 'Describe: Fears certain animals, situations, or places. [FQ4OCBCL032A]'
FQ4OCBCL033 'Feelings are easily hurt. [FQ4OCBCL033]'
FQ4OCBCL034 'Gets hurt a lot, accident-prone. [FQ4OCBCL034]'
FQ4OCBCL035 'Gets in many fights. [FQ4OCBCL035]'
FQ4OCBCL036 'Gets into everything. [FQ4OCBCL036]'
FQ4OCBCL037 'Gets too upset when separated from parents. [FQ4OCBCL037]'
FQ4OCBCL038 'Has trouble getting to sleep. [FQ4OCBCL038]'
FQ4OCBCL039 'Headaches (without medical cause). [FQ4OCBCL039]'
FQ4OCBCL040 'Hits others. [FQ4OCBCL040]'
FQ4OCBCL041 'Holds his/her breath. [FQ4OCBCL041]'
FQ4OCBCL042 'Hurts animals or people without meaning to. [FQ4OCBCL042]'
FQ4OCBCL043 'Looks unhappy without good reason. [FQ4OCBCL043]'
FQ4OCBCL044 'Angry moods. [FQ4OCBCL044]'
FQ4OCBCL045 'Nausea, feels sick (without medical cause). [FQ4OCBCL045]'
FQ4OCBCL046 'Nervous movements or twitching (describe). [FQ4OCBCL046]'
FQ4OCBCL046A 'Describe: Nervous movements or twitching. [FQ4OCBCL046A]'
FQ4OCBCL047 'Nervous, high-strung, or tense. [FQ4OCBCL047]'
FQ4OCBCL048 'Nightmares. [FQ4OCBCL048]'
FQ4OCBCL049 'Overeating. [FQ4OCBCL049]'
FQ4OCBCL050 'Overtired. [FQ4OCBCL050]'
FQ4OCBCL051 'Shows panic for no good reason. [FQ4OCBCL051]'
FQ4OCBCL052 'Painful bowel movements (without medical cause). [FQ4OCBCL052]'
FQ4OCBCL053 'Physically attacks people. [FQ4OCBCL053]'
FQ4OCBCL054 'Picks nose, skin, or other parts of body (describe). [FQ4OCBCL054]'
FQ4OCBCL054A 'Describe: Picks nose, skin, or other parts of body. [FQ4OCBCL054A]'
FQ4OCBCL055 'Plays with own sex parts too much. [FQ4OCBCL055]'
FQ4OCBCL056 'Poorly coordinated or clumsy. [FQ4OCBCL056]'
FQ4OCBCL057 'Problems with eyes (without medical cause)(describe). [FQ4OCBCL057]'
FQ4OCBCL057A 'Describe: Problems with eyes (without medical cause). [FQ4OCBCL057A]'
FQ4OCBCL058 'Punishment doesnt change his/her behavior. [FQ4OCBCL058]'
FQ4OCBCL059 'Quickly shifts from one activity to another. [FQ4OCBCL059]'
FQ4OCBCL060 'Rashes or other skin problems (without medical cause). [FQ4OCBCL060]'
FQ4OCBCL061 'Refuses to eat. [FQ4OCBCL061]'
FQ4OCBCL062 'Refuses to play active games. [FQ4OCBCL062]'
FQ4OCBCL063 'Repeatedly rocks head or body. [FQ4OCBCL063]'
FQ4OCBCL064 'Resists going to bed at night. [FQ4OCBCL064]'
FQ4OCBCL065 'Resists toilet training (describe). [FQ4OCBCL065]'
FQ4OCBCL065A 'Describe: Resists toilet training. [FQ4OCBCL065A]'
FQ4OCBCL066 'Screams a lot. [FQ4OCBCL066]'
FQ4OCBCL067 'Seems unresponsive to affection. [FQ4OCBCL067]'
FQ4OCBCL068 'Self-conscious or easily embarrassed. [FQ4OCBCL068]'
FQ4OCBCL069 'Selfish or wont share. [FQ4OCBCL069]'
FQ4OCBCL070 'Shows little affection toward people. [FQ4OCBCL070]'
FQ4OCBCL071 'Shows little interest in things about him/herself. [FQ4OCBCL071]'
FQ4OCBCL072 'Shows too little fear of getting hurt. [FQ4OCBCL072]'
FQ4OCBCL073 'Too shy or timid. [FQ4OCBCL073]'
FQ4OCBCL074 'Sleeps less than most kids during day and/or night (describe). [FQ4OCBCL074]'
FQ4OCBCL074A 'Describe: Sleeps less than most kids during day and/or night. [FQ4OCBCL074A]'
FQ4OCBCL075 'Smears or plays with bowel movements. [FQ4OCBCL075]'
FQ4OCBCL076 'Speech problem (describe). [FQ4OCBCL076]'
FQ4OCBCL076A 'Describe: Speech problem. [FQ4OCBCL076A]'
FQ4OCBCL077 'Stares into space or seems preoccupied. [FQ4OCBCL077]'
FQ4OCBCL078 'Stomachaches or cramps (without medical cause). [FQ4OCBCL078]'
FQ4OCBCL079 'Rapid shifts between sadness and excitement. [FQ4OCBCL079]'
FQ4OCBCL080 'Strange behavior (describe). [FQ4OCBCL080]'
FQ4OCBCL080A 'Describe: Strange behavior. [FQ4OCBCL080A]'
FQ4OCBCL081 'Stubborn, sullen, or irritable. [FQ4OCBCL081]'
FQ4OCBCL082 'Sudden changes in mood or feelings. [FQ4OCBCL082]'
FQ4OCBCL083 'Sulks a lot. [FQ4OCBCL083]'
FQ4OCBCL084 'Talks or cries in sleep. [FQ4OCBCL084]'
FQ4OCBCL085 'Temper tantrums or hot temper. [FQ4OCBCL085]'
FQ4OCBCL086 'Too concerned with neatness or cleanliness. [FQ4OCBCL086]'
FQ4OCBCL087 'Too fearful or anxious. [FQ4OCBCL087]'
FQ4OCBCL088 'Uncooperative. [FQ4OCBCL088]'
FQ4OCBCL089 'Under-active, slow moving, or lack energy. [FQ4OCBCL089]'
FQ4OCBCL090 'Unhappy, sad, or depressed. [FQ4OCBCL090]'
FQ4OCBCL091 'Unusually loud. [FQ4OCBCL091]'
FQ4OCBCL092 'Upset by new people or situations (describe). [FQ4OCBCL092]'
FQ4OCBCL092A 'Describe: Upset by new people or situations. [FQ4OCBCL092A]'
FQ4OCBCL093 'Vomiting, throwing up (without medical cause). [FQ4OCBCL093]'
FQ4OCBCL094 'Wakes up often at night. [FQ4OCBCL094]'
FQ4OCBCL095 'Wanders away. [FQ4OCBCL095]'
FQ4OCBCL096 'Wants a lot of attention. [FQ4OCBCL096]'
FQ4OCBCL097 'Whining. [FQ4OCBCL097]'
FQ4OCBCL098 'Withdrawn, doesnt get involved with others. [FQ4OCBCL098]'
FQ4OCBCL099 'Worries. [FQ4OCBCL099]'
FQ4OCBCL100 'There are problems the child has that were not listen above (describe). [FQ4OCBCL100]'
FQ4OCBCL100A 'Describe: There are problems the child has that were not listen above. [FQ4OCBCL100A]'.
EXECUTE. 

*STEP 10: ADD VALUE LABELS.
*Include missing values like 'Prefer not to Answer' (or something similar) if applicable.
*Include ALL missing value labels (SEE ABOVE FOR FULL LIST).
VALUE LABELS
FQ4OCBCL001 FQ4OCBCL002 FQ4OCBCL003 FQ4OCBCL004 FQ4OCBCL005
FQ4OCBCL006 FQ4OCBCL007 FQ4OCBCL008 FQ4OCBCL009 FQ4OCBCL010
FQ4OCBCL011 FQ4OCBCL012 FQ4OCBCL013 FQ4OCBCL014 FQ4OCBCL015
FQ4OCBCL016 FQ4OCBCL017 FQ4OCBCL018 FQ4OCBCL019 FQ4OCBCL020
FQ4OCBCL021 FQ4OCBCL022 FQ4OCBCL023 FQ4OCBCL024 FQ4OCBCL025
FQ4OCBCL026 FQ4OCBCL027 FQ4OCBCL028 FQ4OCBCL029 FQ4OCBCL030
FQ4OCBCL031 FQ4OCBCL032 FQ4OCBCL033 FQ4OCBCL034 FQ4OCBCL035
FQ4OCBCL036 FQ4OCBCL037 FQ4OCBCL038 FQ4OCBCL039 FQ4OCBCL040
FQ4OCBCL041 FQ4OCBCL042 FQ4OCBCL043 FQ4OCBCL044 FQ4OCBCL045
FQ4OCBCL046 FQ4OCBCL047 FQ4OCBCL048 FQ4OCBCL049 FQ4OCBCL050
FQ4OCBCL051 FQ4OCBCL052 FQ4OCBCL053 FQ4OCBCL054 FQ4OCBCL055
FQ4OCBCL056 FQ4OCBCL057 FQ4OCBCL058 FQ4OCBCL059 FQ4OCBCL060
FQ4OCBCL061 FQ4OCBCL062 FQ4OCBCL063 FQ4OCBCL064 FQ4OCBCL065
FQ4OCBCL066 FQ4OCBCL067 FQ4OCBCL068 FQ4OCBCL069 FQ4OCBCL070
FQ4OCBCL071 FQ4OCBCL072 FQ4OCBCL073 FQ4OCBCL074 FQ4OCBCL075
FQ4OCBCL076 FQ4OCBCL077 FQ4OCBCL078 FQ4OCBCL079 FQ4OCBCL080
FQ4OCBCL081 FQ4OCBCL082 FQ4OCBCL083 FQ4OCBCL084 FQ4OCBCL085
FQ4OCBCL086 FQ4OCBCL087 FQ4OCBCL088 FQ4OCBCL089 FQ4OCBCL090
FQ4OCBCL091 FQ4OCBCL092 FQ4OCBCL093 FQ4OCBCL094 FQ4OCBCL095
FQ4OCBCL096 FQ4OCBCL097 FQ4OCBCL098 FQ4OCBCL099 FQ4OCBCL100
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
FQ4OCBCL001 FQ4OCBCL002 FQ4OCBCL003 FQ4OCBCL004 FQ4OCBCL005
FQ4OCBCL006 FQ4OCBCL007 FQ4OCBCL008 FQ4OCBCL009 FQ4OCBCL010
FQ4OCBCL011 FQ4OCBCL012 FQ4OCBCL013 FQ4OCBCL014 FQ4OCBCL015
FQ4OCBCL016 FQ4OCBCL017 FQ4OCBCL018 FQ4OCBCL019 FQ4OCBCL020
FQ4OCBCL021 FQ4OCBCL022 FQ4OCBCL023 FQ4OCBCL024 FQ4OCBCL025
FQ4OCBCL026 FQ4OCBCL027 FQ4OCBCL028 FQ4OCBCL029 FQ4OCBCL030
FQ4OCBCL031 FQ4OCBCL032 FQ4OCBCL033 FQ4OCBCL034 FQ4OCBCL035
FQ4OCBCL036 FQ4OCBCL037 FQ4OCBCL038 FQ4OCBCL039 FQ4OCBCL040
FQ4OCBCL041 FQ4OCBCL042 FQ4OCBCL043 FQ4OCBCL044 FQ4OCBCL045
FQ4OCBCL046 FQ4OCBCL047 FQ4OCBCL048 FQ4OCBCL049 FQ4OCBCL050
FQ4OCBCL051 FQ4OCBCL052 FQ4OCBCL053 FQ4OCBCL054 FQ4OCBCL055
FQ4OCBCL056 FQ4OCBCL057 FQ4OCBCL058 FQ4OCBCL059 FQ4OCBCL060
FQ4OCBCL061 FQ4OCBCL062 FQ4OCBCL063 FQ4OCBCL064 FQ4OCBCL065
FQ4OCBCL066 FQ4OCBCL067 FQ4OCBCL068 FQ4OCBCL069 FQ4OCBCL070
FQ4OCBCL071 FQ4OCBCL072 FQ4OCBCL073 FQ4OCBCL074 FQ4OCBCL075
FQ4OCBCL076 FQ4OCBCL077 FQ4OCBCL078 FQ4OCBCL079 FQ4OCBCL080
FQ4OCBCL081 FQ4OCBCL082 FQ4OCBCL083 FQ4OCBCL084 FQ4OCBCL085
FQ4OCBCL086 FQ4OCBCL087 FQ4OCBCL088 FQ4OCBCL089 FQ4OCBCL090
FQ4OCBCL091 FQ4OCBCL092 FQ4OCBCL093 FQ4OCBCL094 FQ4OCBCL095
FQ4OCBCL096 FQ4OCBCL097 FQ4OCBCL098 FQ4OCBCL099 FQ4OCBCL100
    (LO THRU -1).
EXECUTE.

*STEP 12: SAVE CLEANED DATA FILE.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OCBCL_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.

*STEP 13: CHECK FREQUENCIES.
*Checking frequencies of all items before creating constructs.
*Include STAT variable here to be sure all missingness was coded correctly.
FREQUENCIES VARIABLES= FD4OSTAT FQ4OCBCL001 FQ4OCBCL002 FQ4OCBCL003 FQ4OCBCL004 FQ4OCBCL005
FQ4OCBCL006 FQ4OCBCL007 FQ4OCBCL008 FQ4OCBCL009 FQ4OCBCL010
FQ4OCBCL011 FQ4OCBCL012 FQ4OCBCL013 FQ4OCBCL014 FQ4OCBCL015
FQ4OCBCL016 FQ4OCBCL017 FQ4OCBCL018 FQ4OCBCL019 FQ4OCBCL020
FQ4OCBCL021 FQ4OCBCL022 FQ4OCBCL023 FQ4OCBCL024 
FQ4OCBCL025 FQ4OCBCL026 FQ4OCBCL027 FQ4OCBCL028 FQ4OCBCL029
FQ4OCBCL030 FQ4OCBCL031 FQ4OCBCL032
FQ4OCBCL033 FQ4OCBCL034 FQ4OCBCL035 FQ4OCBCL036 FQ4OCBCL037
FQ4OCBCL038 FQ4OCBCL039 FQ4OCBCL040 FQ4OCBCL041 FQ4OCBCL042
FQ4OCBCL043 FQ4OCBCL044 FQ4OCBCL045 FQ4OCBCL046 
FQ4OCBCL047 FQ4OCBCL048 FQ4OCBCL049 FQ4OCBCL050 FQ4OCBCL051
FQ4OCBCL052 FQ4OCBCL053 FQ4OCBCL054 FQ4OCBCL055
FQ4OCBCL056 FQ4OCBCL057 FQ4OCBCL058 FQ4OCBCL059
FQ4OCBCL060 FQ4OCBCL061 FQ4OCBCL062 FQ4OCBCL063 FQ4OCBCL064
FQ4OCBCL065 FQ4OCBCL066 FQ4OCBCL067 FQ4OCBCL068
FQ4OCBCL069 FQ4OCBCL070 FQ4OCBCL071 FQ4OCBCL072 FQ4OCBCL073
FQ4OCBCL074 FQ4OCBCL075 FQ4OCBCL076
FQ4OCBCL077 FQ4OCBCL078 FQ4OCBCL079 FQ4OCBCL080
FQ4OCBCL081 FQ4OCBCL082 FQ4OCBCL083 FQ4OCBCL084 FQ4OCBCL085
FQ4OCBCL086 FQ4OCBCL087 FQ4OCBCL088 FQ4OCBCL089 FQ4OCBCL090
FQ4OCBCL091 FQ4OCBCL092 FQ4OCBCL093 FQ4OCBCL094
FQ4OCBCL095 FQ4OCBCL096 FQ4OCBCL097 FQ4OCBCL098 FQ4OCBCL099
FQ4OCBCL100
  /ORDER=ANALYSIS.

*STEP 14: CHECK DESCRIPTIVES.
*Checking descriptives for all items before creating constructs.
DESCRIPTIVES VARIABLES=FQ4OCBCL001 FQ4OCBCL002 FQ4OCBCL003 FQ4OCBCL004 FQ4OCBCL005
FQ4OCBCL006 FQ4OCBCL007 FQ4OCBCL008 FQ4OCBCL009 FQ4OCBCL010
FQ4OCBCL011 FQ4OCBCL012 FQ4OCBCL013 FQ4OCBCL014 FQ4OCBCL015
FQ4OCBCL016 FQ4OCBCL017 FQ4OCBCL018 FQ4OCBCL019 FQ4OCBCL020
FQ4OCBCL021 FQ4OCBCL022 FQ4OCBCL023 FQ4OCBCL024 
FQ4OCBCL025 FQ4OCBCL026 FQ4OCBCL027 FQ4OCBCL028 FQ4OCBCL029
FQ4OCBCL030 FQ4OCBCL031 FQ4OCBCL032
FQ4OCBCL033 FQ4OCBCL034 FQ4OCBCL035 FQ4OCBCL036 FQ4OCBCL037
FQ4OCBCL038 FQ4OCBCL039 FQ4OCBCL040 FQ4OCBCL041 FQ4OCBCL042
FQ4OCBCL043 FQ4OCBCL044 FQ4OCBCL045 FQ4OCBCL046 
FQ4OCBCL047 FQ4OCBCL048 FQ4OCBCL049 FQ4OCBCL050 FQ4OCBCL051
FQ4OCBCL052 FQ4OCBCL053 FQ4OCBCL054 FQ4OCBCL055
FQ4OCBCL056 FQ4OCBCL057 FQ4OCBCL058 FQ4OCBCL059
FQ4OCBCL060 FQ4OCBCL061 FQ4OCBCL062 FQ4OCBCL063 FQ4OCBCL064
FQ4OCBCL065 FQ4OCBCL066 FQ4OCBCL067 FQ4OCBCL068
FQ4OCBCL069 FQ4OCBCL070 FQ4OCBCL071 FQ4OCBCL072 FQ4OCBCL073
FQ4OCBCL074 FQ4OCBCL075 FQ4OCBCL076
FQ4OCBCL077 FQ4OCBCL078 FQ4OCBCL079 FQ4OCBCL080
FQ4OCBCL081 FQ4OCBCL082 FQ4OCBCL083 FQ4OCBCL084 FQ4OCBCL085
FQ4OCBCL086 FQ4OCBCL087 FQ4OCBCL088 FQ4OCBCL089 FQ4OCBCL090
FQ4OCBCL091 FQ4OCBCL092 FQ4OCBCL093 FQ4OCBCL094
FQ4OCBCL095 FQ4OCBCL096 FQ4OCBCL097 FQ4OCBCL098 FQ4OCBCL099
FQ4OCBCL100 
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 15: SAVE CLEANED DATA FILE.
*Sorting the data file by ID and resaving the final file.
*To reorder items, use /KEEP {list all variables in order} -- insert in line after file name.
SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OCBCL_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OCBCL_Cleaned.sav'.
EXECUTE.

*STEP 16: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE
 OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OCBCL_Cleaned.spv'
 LOCK=NO.

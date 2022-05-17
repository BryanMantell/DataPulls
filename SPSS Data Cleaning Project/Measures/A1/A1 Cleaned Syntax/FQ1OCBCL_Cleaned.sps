* Encoding: UTF-8.
*STEP 0: NOTES
*Child Behavior Checklist (CBCL).
 
*06-16-21(AB): Completed STEPS 1-12.
*06-17-21(AB): Completed STEPS 13-16.
*06-21-21(JL): Checked STEPS 1-16; edits in STEP 8 (to create 2 decimal places).
*07-12-21(JL): Edited text of notes for STEPS 1-16; added start date variable to STEP 2.
*7-23-21(BM): Edited text of notes and code for steps 2, 4, 6, 10, 11 to match updated template.
*8-4-21 (AAC): Small changes to STEP 0 to make more consistent with template (removing EX ("example") from text), inserted code in STEP 4 to format the date of STARTDATE in line with SOP, changed the name of START DATE in STEP 5 and 9 to reflect SOP.
*8-4-21 (AAC; continued from above) added a period to item label of F!Q1OCBCL001 in STEP 8 to make consistent with other items.
*8-10-21 (AAC): Small changes (typos, etc.), added code for -43 in STEP 6, slight addition to comment in STEP 15, made quotation marks into apostrophes, added CHECKED AND NOT NEEDED TO STEP 7.
*8-11-21 (AAC): Edited missing value labels in STEP 10.
*11-8-21 (BM): Adapted syntax to match template.
*11-10-21(BM): Updated STEP 6 comment.
*11-10-21(AAC): Checked. Smalle changes in comments section to reflect latest template
 *12-13-21(AAC): Minor change in comment in STEP 11


*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------.
*STEP 1: OPENING RAW DATA.
*Insert the correct file path and file name. Use syntax to open raw data file.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/DBT Moms R01 Study Time 1 Mother Survey_November 10, 2021_12.48.sav'.

*STEP 2: SAVING QUESTIONNAIRE SPECIFIC RAW DATA. 
*Insert the correct file path and file name. Save this file with only those variables that you need, in the following order; ID, Start Date, Questionnaire Items (i.e., DERS_1 to DERS_36).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OCBCL_Cleaned.sav'
  /KEEP 
  FQ1ID 
  STARTDATE
  FQ1CBCL_1 TO FQ1CBCL_100_TEXT
  /COMPRESSED.
  EXECUTE.

*STEP 3: OPEN NEW DATA FILE.  
*Insert the correct file path and file name. Open the file you just created and saved so that you are able to clean the data.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OCBCL_Cleaned.sav'.

*STEP 4: TRANSFORM VARIABLES AND SORT IDS ASCENDING ORDER.
*Transforming ID from a string to a numeric variable, change the date format of startdate, and sort IDs in ascending order.
ALTER TYPE FQ1ID (F10.0).
EXECUTE.
FORMATS STARTDATE (adate10).
EXECUTE.
SORT CASES BY FQ1ID(A).
EXECUTE.

*STEP 5: RENAME ‘RAW DATA’ VARIABLES TO ‘CLEANED’ VARIABLES NAMES. 
*Rename all variables so they reflect our naming scheme. ID should always be labeled as 'ID'. Item should be numbers 01-36 or 001-106. 
RENAME VARIABLE (FQ1ID=ID).
EXECUTE.
RENAME VARIABLE (STARTDATE=FQ1OCBCLDATE).
EXECUTE.
RENAME VARIABLE (FQ1CBCL_1 = FQ1OCBCL001) (FQ1CBCL_2 = FQ1OCBCL002) (FQ1CBCL_3 = FQ1OCBCL003) (FQ1CBCL_4 = FQ1OCBCL004) (FQ1CBCL_5 = FQ1OCBCL005)
                            (FQ1CBCL_6 = FQ1OCBCL006) (FQ1CBCL_7 = FQ1OCBCL007) (FQ1CBCL_8 = FQ1OCBCL008) (FQ1CBCL_9 = FQ1OCBCL009) (FQ1CBCL_10 = FQ1OCBCL010)
                            (FQ1CBCL_11 = FQ1OCBCL011) (FQ1CBCL_12 = FQ1OCBCL012) (FQ1CBCL_13 = FQ1OCBCL013) (FQ1CBCL_14 = FQ1OCBCL014) (FQ1CBCL_15 = FQ1OCBCL015)
                            (FQ1CBCL_16 = FQ1OCBCL016) (FQ1CBCL_17 = FQ1OCBCL017) (FQ1CBCL_18 = FQ1OCBCL018) (FQ1CBCL_19 = FQ1OCBCL019) (FQ1CBCL_20 = FQ1OCBCL020)
                            (FQ1CBCL_21 = FQ1OCBCL021) (FQ1CBCL_22 = FQ1OCBCL022) (FQ1CBCL_23 = FQ1OCBCL023) (FQ1CBCL_24 = FQ1OCBCL024) (FQ1CBCL_25 = FQ1OCBCL025)
                            (FQ1CBCL_26 = FQ1OCBCL026) (FQ1CBCL_27 = FQ1OCBCL027) (FQ1CBCL_28 = FQ1OCBCL028) (FQ1CBCL_29 = FQ1OCBCL029) (FQ1CBCL_30 = FQ1OCBCL030)
                            (FQ1CBCL_31 = FQ1OCBCL031) (FQ1CBCL_32 = FQ1OCBCL032) (FQ1CBCL_33 = FQ1OCBCL033) (FQ1CBCL_34 = FQ1OCBCL034) (FQ1CBCL_35 = FQ1OCBCL035)
                            (FQ1CBCL_36 = FQ1OCBCL036) (FQ1CBCL_37 = FQ1OCBCL037) (FQ1CBCL_38 = FQ1OCBCL038) (FQ1CBCL_39 = FQ1OCBCL039) (FQ1CBCL_40 = FQ1OCBCL040)
                            (FQ1CBCL_41 = FQ1OCBCL041) (FQ1CBCL_42 = FQ1OCBCL042) (FQ1CBCL_43 = FQ1OCBCL043) (FQ1CBCL_44 = FQ1OCBCL044) (FQ1CBCL_45 = FQ1OCBCL045)
                            (FQ1CBCL_46 = FQ1OCBCL046) (FQ1CBCL_47 = FQ1OCBCL047) (FQ1CBCL_48 = FQ1OCBCL048) (FQ1CBCL_49 = FQ1OCBCL049) (FQ1CBCL_50 = FQ1OCBCL050)
                            (FQ1CBCL_51 = FQ1OCBCL051) (FQ1CBCL_52 = FQ1OCBCL052) (FQ1CBCL_53 = FQ1OCBCL053) (FQ1CBCL_54 = FQ1OCBCL054) (FQ1CBCL_55 = FQ1OCBCL055)
                            (FQ1CBCL_56 = FQ1OCBCL056) (FQ1CBCL_57 = FQ1OCBCL057) (FQ1CBCL_58 = FQ1OCBCL058) (FQ1CBCL_59 = FQ1OCBCL059) (FQ1CBCL_60 = FQ1OCBCL060)
                            (FQ1CBCL_61 = FQ1OCBCL061) (FQ1CBCL_62 = FQ1OCBCL062) (FQ1CBCL_63 = FQ1OCBCL063) (FQ1CBCL_64 = FQ1OCBCL064) (FQ1CBCL_65 = FQ1OCBCL065)
                            (FQ1CBCL_66 = FQ1OCBCL066) (FQ1CBCL_67 = FQ1OCBCL067) (FQ1CBCL_68 = FQ1OCBCL068) (FQ1CBCL_69 = FQ1OCBCL069) (FQ1CBCL_70 = FQ1OCBCL070)
                            (FQ1CBCL_71 = FQ1OCBCL071) (FQ1CBCL_72 = FQ1OCBCL072) (FQ1CBCL_73 = FQ1OCBCL073) (FQ1CBCL_74 = FQ1OCBCL074) (FQ1CBCL_75 = FQ1OCBCL075)
                            (FQ1CBCL_76 = FQ1OCBCL076) (FQ1CBCL_77 = FQ1OCBCL077) (FQ1CBCL_78 = FQ1OCBCL078) (FQ1CBCL_79 = FQ1OCBCL079) (FQ1CBCL_80 = FQ1OCBCL080) 
                            (FQ1CBCL_81 = FQ1OCBCL081) (FQ1CBCL_82 = FQ1OCBCL082) (FQ1CBCL_83 = FQ1OCBCL083) (FQ1CBCL_84 = FQ1OCBCL084) (FQ1CBCL_85 = FQ1OCBCL085)
                            (FQ1CBCL_86 = FQ1OCBCL086) (FQ1CBCL_87 = FQ1OCBCL087) (FQ1CBCL_88 = FQ1OCBCL088) (FQ1CBCL_89 = FQ1OCBCL089) (FQ1CBCL_90 = FQ1OCBCL090)
                            (FQ1CBCL_91 = FQ1OCBCL091) (FQ1CBCL_92 = FQ1OCBCL092) (FQ1CBCL_93 = FQ1OCBCL093) (FQ1CBCL_94 = FQ1OCBCL094) (FQ1CBCL_95 = FQ1OCBCL095)
                            (FQ1CBCL_96 = FQ1OCBCL096) (FQ1CBCL_97 = FQ1OCBCL097) (FQ1CBCL_98 = FQ1OCBCL098) (FQ1CBCL_99 = FQ1OCBCL099) (FQ1CBCL_100 = FQ1OCBCL100).
EXECUTE.
RENAME VARIABLE (FQ1CBCL_24_TEXT = FQ1OCBCL024A) (FQ1CBCL_31_TEXT = FQ1OCBCL031A) (FQ1CBCL_32_TEXT = FQ1OCBCL032A) (FQ1CBCL_46_TEXT = FQ1OCBCL046A) 
                            (FQ1CBCL_54_TEXT = FQ1OCBCL054A) (FQ1CBCL_57_TEXT = FQ1OCBCL057A) (FQ1CBCL_65_TEXT = FQ1OCBCL065A) (FQ1CBCL_74_TEXT = FQ1OCBCL074A)
                            (FQ1CBCL_76_TEXT = FQ1OCBCL076A) (FQ1CBCL_80_TEXT = FQ1OCBCL080A) (FQ1CBCL_92_TEXT = FQ1OCBCL092A) (FQ1CBCL_100_TEXT = FQ1OCBCL100A).
EXECUTE.

*Remember to save your data file.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OCBCL_Cleaned.sav'.
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
/FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OCBCL_Cleaned.sav'
/BY ID
/DROP=
FD0OSTAT FD0ORD
FD1OTD FD1ODIFF
FD2OSTAT FD2OTD FD2ORD FD2ODIFF
FD3OSTAT FD3OTD FD3ORD FD3ODIFF
FD4OSTAT FD4OTD FD4ORD FD4ODIFF
FD4AOSTAT FD4AOTD FD4AORD FD4AODIFF.
SELECT IF f=1.
EXECUTE.
*Comparing REDCap and Qualtrics dates of completion. Be sure to update the date variables used to reflect the accurate RD and questionnaire date.
COMPUTE DATEDIFF = DATEDIFF(FD1ORD,FQ1OCBCLDATE,'days').
EXECUTE.
COUNT DATEDIFF0=DATEDIFF(Lowest thru -1) DATEDIFF(1 thru Highest).
EXECUTE.
FREQUENCIES VARIABLES=DATEDIFF0
  /ORDER=ANALYSIS.
SORT CASES BY DATEDIFF0(D).
*CHECK ALL IDS WITH DISCREPANT DATES TO DETERMINE WHAT IS CORRECT. CONSULT BEFORE MAKING ANY CHANGES TO RAW DATA IN REDCAP OR QUALTRICS.
*INCLUDE NOTES HERE FOR EACH ID THAT WAS DISCREPANT (EXAMPLE BELOW - ADAPT AS NEEDED)
*THE FOLLOWING IDs (90210, 90331, and 90800) HAVE A A1 QUALTRICS DATE [FQ1OCBCLDATE] THAT DOES NOT MATCH THEIR A1 VISIT DATE [FD1ORD]. 
*THIS WAS INVESTIGATED BY STAFF (BM: 10-29-21) AND VISIT DATE [FD1ORD] WAS CONFIRMED USING MULTIPLE SOURCES.
SORT CASES BY ID(A).
*DROPPING VARIABLES THAT ARE NO LONGER RELEVANT TO FINAL DATA FILE.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OCBCL_Cleaned.sav'
/DROP
FQ1OCBCLDATE
DATEDIFF
DATEDIFF0
f.
EXECUTE.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OCBCL_Cleaned.sav'.
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
    FQ1OCBCL001 to FQ1OCBCL024 
    FQ1OCBCL025 to FQ1OCBCL031 
    FQ1OCBCL032
    FQ1OCBCL033 to FQ1OCBCL046 
    FQ1OCBCL047 to FQ1OCBCL054 
    FQ1OCBCL055 to FQ1OCBCL057
    FQ1OCBCL058 to FQ1OCBCL065 
    FQ1OCBCL066 to FQ1OCBCL074 
    FQ1OCBCL075 to FQ1OCBCL076 
    FQ1OCBCL077 to FQ1OCBCL080 
    FQ1OCBCL081 to FQ1OCBCL092 
    FQ1OCBCL093 to FQ1OCBCL100 
    (4=-10).
EXECUTE.

**STEP 7 (DELETE IF NOT NEEDED): CREATING NEW VARIABLES FOR REVERSED SCORED ITEMS.
**Reverse-Scored Items; see scoring document to determine if there are reverse-scored items. If no reverse-scored items, delete this syntax.
**CHECKED AND NOT NEEDED.

*STEP 7A: RECODING SYSMIS (PARTICIPANTS THAT MISSED THE ASSESSMENT).
*This will use the STAT variable to recode all SYSMIS data. CHANGE THE STAT VARIABLE TO MATCH THE ASSESSMENT WAVE YOU ARE WORKING IN.
*Include full list of numeric variables (including new reverse-scored items).
DO IF MISSING(FD1OSTAT).
DO REPEAT x =    FQ1OCBCL001 to FQ1OCBCL024 
    FQ1OCBCL025 to FQ1OCBCL031 
    FQ1OCBCL032
    FQ1OCBCL033 to FQ1OCBCL046 
    FQ1OCBCL047 to FQ1OCBCL054 
    FQ1OCBCL055 to FQ1OCBCL057
    FQ1OCBCL058 to FQ1OCBCL065 
    FQ1OCBCL066 to FQ1OCBCL074 
    FQ1OCBCL075 to FQ1OCBCL076 
    FQ1OCBCL077 to FQ1OCBCL080 
    FQ1OCBCL081 to FQ1OCBCL092 
    FQ1OCBCL093 to FQ1OCBCL100 .
RECODE FD1OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.

*STEP 8: STANDARDIZING DECIMAL PLACES.
*Making all variables have the same number of decimal places. Ensure that variables include all new reverse-scored variables. Change the number AFTER the decimal place as needed.
FORMATS 
    FQ1OCBCL001 to FQ1OCBCL024 (F8.0)
    FQ1OCBCL025 to FQ1OCBCL031 (F8.0)
    FQ1OCBCL032 (F8.0)
    FQ1OCBCL033 to FQ1OCBCL046 (F8.0)
    FQ1OCBCL047 to FQ1OCBCL054 (F8.0)
    FQ1OCBCL055 to FQ1OCBCL057 (F8.0)
    FQ1OCBCL058 to FQ1OCBCL065 (F8.0)
    FQ1OCBCL066 to FQ1OCBCL074 (F8.0)
    FQ1OCBCL075 to FQ1OCBCL076 (F8.0)
    FQ1OCBCL077 to FQ1OCBCL080 (F8.0)
    FQ1OCBCL081 to FQ1OCBCL092 (F8.0)
    FQ1OCBCL093 to FQ1OCBCL100 (F8.0).
EXECUTE.

*STEP 9: CREATING VARIABLE LABLES.
*Label all variables. Use the original questionnaire to include the exact text that participants saw. Include the questionnaire name and number at the end of the label.
VARIABLE LABELS  ID 'Participant ID'.
EXECUTE.

VARIABLE LABELS 
FQ1OCBCL001 'Aches or pains (without medical cause; do not include stomach or headaches). [FQ1OCBCL001]'
FQ1OCBCL002 'Acts too young for age. [FQ1OCBCL002]'
FQ1OCBCL003 'Afraid to try new things. [FQ1OCBCL003]'
FQ1OCBCL004 'Avoids looking others in the eye. [FQ1OCBCL004]'
FQ1OCBCL005 'Cant concentrate, cant pay attention for long. [FQ1OCBCL005]'
FQ1OCBCL006 'Cant sit still, restless, or hyperactive. [FQ1OCBCL006]'
FQ1OCBCL007 'Cant stand having things out of place. [FQ1OCBCL007]'
FQ1OCBCL008 'Cant stand waiting; wants everything now. [FQ1OCBCL008]'
FQ1OCBCL009 'Chews on things that arent edible. [FQ1OCBCL009]'
FQ1OCBCL010 'Clings to adults or too dependent. [FQ1OCBCL010]'
FQ1OCBCL011 'Constantly seeks help. [FQ1OCBCL011]'
FQ1OCBCL012 'Constipated, doesnt move bowels (when not sick). [FQ1OCBCL012]'
FQ1OCBCL013 'Cries a lot. [FQ1OCBCL013]'
FQ1OCBCL014 'Cruel to animals. [FQ1OCBCL014]'
FQ1OCBCL015 'Defiant. [FQ1OCBCL015]'
FQ1OCBCL016 'Demands must be met immediately. [FQ1OCBCL016]'
FQ1OCBCL017 'Destroys his/her own things. [FQ1OCBCL017]'
FQ1OCBCL018 'Destroys things belonging to his/her family or other children. [FQ1OCBCL018]'
FQ1OCBCL019 'Diarrhea or loose bowels (when not sick). [FQ1OCBCL019]'
FQ1OCBCL020 'Disobedient. [FQ1OCBCL020]'
FQ1OCBCL021 'Disturbed by any change in routine. [FQ1OCBCL021]'
FQ1OCBCL022 'Doesnt want to sleep alone. [FQ1OCBCL022]'
FQ1OCBCL023 'Doesnt answer when people talk to him/her. [FQ1OCBCL023]'
FQ1OCBCL024 'Doesnt eat well (describe). [FQ1OCBCL024]'
FQ1OCBCL024A 'Describe: Doesnt eat well. [FQ1OCBCL024A]'
FQ1OCBCL025 'Doesnt get along with other children. [FQ1OCBCL025]'
FQ1OCBCL026 'Doesnt know how to have fun; acts like a little adult. [FQ1OCBCL026]'
FQ1OCBCL027 'Doesnt seem to feel guilty after misbehaving. [FQ1OCBCL027]'
FQ1OCBCL028 'Doesnt want to go out of home. [FQ1OCBCL028]'
FQ1OCBCL029 'Easily frustrated. [FQ1OCBCL029]'
FQ1OCBCL030 'Easily jealous. [FQ1OCBCL030]'
FQ1OCBCL031 'Eats or drinks things that are not food - dont include sweets (describe). [FQ1OCBCL031]'
FQ1OCBCL031A 'Describe: Eats or drinks things that are not food - dont include sweets. [FQ1OCBCL031A]'
FQ1OCBCL032 'Fears certain animals, situations, or places (describe). [FQ1OCBCL032]'
FQ1OCBCL032A 'Describe: Fears certain animals, situations, or places. [FQ1OCBCL032A]'
FQ1OCBCL033 'Feelings are easily hurt. [FQ1OCBCL033]'
FQ1OCBCL034 'Gets hurt a lot, accident-prone. [FQ1OCBCL034]'
FQ1OCBCL035 'Gets in many fights. [FQ1OCBCL035]'
FQ1OCBCL036 'Gets into everything. [FQ1OCBCL036]'
FQ1OCBCL037 'Gets too upset when separated from parents. [FQ1OCBCL037]'
FQ1OCBCL038 'Has trouble getting to sleep. [FQ1OCBCL038]'
FQ1OCBCL039 'Headaches (without medical cause). [FQ1OCBCL039]'
FQ1OCBCL040 'Hits others. [FQ1OCBCL040]'
FQ1OCBCL041 'Holds his/her breath. [FQ1OCBCL041]'
FQ1OCBCL042 'Hurts animals or people without meaning to. [FQ1OCBCL042]'
FQ1OCBCL043 'Looks unhappy without good reason. [FQ1OCBCL043]'
FQ1OCBCL044 'Angry moods. [FQ1OCBCL044]'
FQ1OCBCL045 'Nausea, feels sick (without medical cause). [FQ1OCBCL045]'
FQ1OCBCL046 'Nervous movements or twitching (describe). [FQ1OCBCL046]'
FQ1OCBCL046A 'Describe: Nervous movements or twitching. [FQ1OCBCL046A]'
FQ1OCBCL047 'Nervous, high-strung, or tense. [FQ1OCBCL047]'
FQ1OCBCL048 'Nightmares. [FQ1OCBCL048]'
FQ1OCBCL049 'Overeating. [FQ1OCBCL049]'
FQ1OCBCL050 'Overtired. [FQ1OCBCL050]'
FQ1OCBCL051 'Shows panic for no good reason. [FQ1OCBCL051]'
FQ1OCBCL052 'Painful bowel movements (without medical cause). [FQ1OCBCL052]'
FQ1OCBCL053 'Physically attacks people. [FQ1OCBCL053]'
FQ1OCBCL054 'Picks nose, skin, or other parts of body (describe). [FQ1OCBCL054]'
FQ1OCBCL054A 'Describe: Picks nose, skin, or other parts of body. [FQ1OCBCL054A]'
FQ1OCBCL055 'Plays with own sex parts too much. [FQ1OCBCL055]'
FQ1OCBCL056 'Poorly coordinated or clumsy. [FQ1OCBCL056]'
FQ1OCBCL057 'Problems with eyes (without medical cause)(describe). [FQ1OCBCL057]'
FQ1OCBCL057A 'Describe: Problems with eyes (without medical cause). [FQ1OCBCL057A]'
FQ1OCBCL058 'Punishment doesnt change his/her behavior. [FQ1OCBCL058]'
FQ1OCBCL059 'Quickly shifts from one activity to another. [FQ1OCBCL059]'
FQ1OCBCL060 'Rashes or other skin problems (without medical cause). [FQ1OCBCL060]'
FQ1OCBCL061 'Refuses to eat. [FQ1OCBCL061]'
FQ1OCBCL062 'Refuses to play active games. [FQ1OCBCL062]'
FQ1OCBCL063 'Repeatedly rocks head or body. [FQ1OCBCL063]'
FQ1OCBCL064 'Resists going to bed at night. [FQ1OCBCL064]'
FQ1OCBCL065 'Resists toilet training (describe). [FQ1OCBCL065]'
FQ1OCBCL065A 'Describe: Resists toilet training. [FQ1OCBCL065A]'
FQ1OCBCL066 'Screams a lot. [FQ1OCBCL066]'
FQ1OCBCL067 'Seems unresponsive to affection. [FQ1OCBCL067]'
FQ1OCBCL068 'Self-conscious or easily embarrassed. [FQ1OCBCL068]'
FQ1OCBCL069 'Selfish or wont share. [FQ1OCBCL069]'
FQ1OCBCL070 'Shows little affection toward people. [FQ1OCBCL070]'
FQ1OCBCL071 'Shows little interest in things about him/herself. [FQ1OCBCL071]'
FQ1OCBCL072 'Shows too little fear of getting hurt. [FQ1OCBCL072]'
FQ1OCBCL073 'Too shy or timid. [FQ1OCBCL073]'
FQ1OCBCL074 'Sleeps less than most kids during day and/or night (describe). [FQ1OCBCL074]'
FQ1OCBCL074A 'Describe: Sleeps less than most kids during day and/or night. [FQ1OCBCL074A]'
FQ1OCBCL075 'Smears or plays with bowel movements. [FQ1OCBCL075]'
FQ1OCBCL076 'Speech problem (describe). [FQ1OCBCL076]'
FQ1OCBCL076A 'Describe: Speech problem. [FQ1OCBCL076A]'
FQ1OCBCL077 'Stares into space or seems preoccupied. [FQ1OCBCL077]'
FQ1OCBCL078 'Stomachaches or cramps (without medical cause). [FQ1OCBCL078]'
FQ1OCBCL079 'Rapid shifts between sadness and excitement. [FQ1OCBCL079]'
FQ1OCBCL080 'Strange behavior (describe). [FQ1OCBCL080]'
FQ1OCBCL080A 'Describe: Strange behavior. [FQ1OCBCL080A]'
FQ1OCBCL081 'Stubborn, sullen, or irritable. [FQ1OCBCL081]'
FQ1OCBCL082 'Sudden changes in mood or feelings. [FQ1OCBCL082]'
FQ1OCBCL083 'Sulks a lot. [FQ1OCBCL083]'
FQ1OCBCL084 'Talks or cries in sleep. [FQ1OCBCL084]'
FQ1OCBCL085 'Temper tantrums or hot temper. [FQ1OCBCL085]'
FQ1OCBCL086 'Too concerned with neatness or cleanliness. [FQ1OCBCL086]'
FQ1OCBCL087 'Too fearful or anxious. [FQ1OCBCL087]'
FQ1OCBCL088 'Uncooperative. [FQ1OCBCL088]'
FQ1OCBCL089 'Under-active, slow moving, or lack energy. [FQ1OCBCL089]'
FQ1OCBCL090 'Unhappy, sad, or depressed. [FQ1OCBCL090]'
FQ1OCBCL091 'Unusually loud. [FQ1OCBCL091]'
FQ1OCBCL092 'Upset by new people or situations (describe). [FQ1OCBCL092]'
FQ1OCBCL092A 'Describe: Upset by new people or situations. [FQ1OCBCL092A]'
FQ1OCBCL093 'Vomiting, throwing up (without medical cause). [FQ1OCBCL093]'
FQ1OCBCL094 'Wakes up often at night. [FQ1OCBCL094]'
FQ1OCBCL095 'Wanders away. [FQ1OCBCL095]'
FQ1OCBCL096 'Wants a lot of attention. [FQ1OCBCL096]'
FQ1OCBCL097 'Whining. [FQ1OCBCL097]'
FQ1OCBCL098 'Withdrawn, doesnt get involved with others. [FQ1OCBCL098]'
FQ1OCBCL099 'Worries. [FQ1OCBCL099]'
FQ1OCBCL100 'There are problems the child has that were not listen above (describe). [FQ1OCBCL100]'
FQ1OCBCL100A 'Describe: There are problems the child has that were not listen above. [FQ1OCBCL100A]'.
EXECUTE. 

*STEP 10: ADD VALUE LABELS.
*Include missing values like 'Prefer not to Answer' (or something similar) if applicable.
*Include ALL missing value labels (SEE ABOVE FOR FULL LIST).
VALUE LABELS
FQ1OCBCL001 FQ1OCBCL002 FQ1OCBCL003 FQ1OCBCL004 FQ1OCBCL005
FQ1OCBCL006 FQ1OCBCL007 FQ1OCBCL008 FQ1OCBCL009 FQ1OCBCL010
FQ1OCBCL011 FQ1OCBCL012 FQ1OCBCL013 FQ1OCBCL014 FQ1OCBCL015
FQ1OCBCL016 FQ1OCBCL017 FQ1OCBCL018 FQ1OCBCL019 FQ1OCBCL020
FQ1OCBCL021 FQ1OCBCL022 FQ1OCBCL023 FQ1OCBCL024 FQ1OCBCL025
FQ1OCBCL026 FQ1OCBCL027 FQ1OCBCL028 FQ1OCBCL029 FQ1OCBCL030
FQ1OCBCL031 FQ1OCBCL032 FQ1OCBCL033 FQ1OCBCL034 FQ1OCBCL035
FQ1OCBCL036 FQ1OCBCL037 FQ1OCBCL038 FQ1OCBCL039 FQ1OCBCL040
FQ1OCBCL041 FQ1OCBCL042 FQ1OCBCL043 FQ1OCBCL044 FQ1OCBCL045
FQ1OCBCL046 FQ1OCBCL047 FQ1OCBCL048 FQ1OCBCL049 FQ1OCBCL050
FQ1OCBCL051 FQ1OCBCL052 FQ1OCBCL053 FQ1OCBCL054 FQ1OCBCL055
FQ1OCBCL056 FQ1OCBCL057 FQ1OCBCL058 FQ1OCBCL059 FQ1OCBCL060
FQ1OCBCL061 FQ1OCBCL062 FQ1OCBCL063 FQ1OCBCL064 FQ1OCBCL065
FQ1OCBCL066 FQ1OCBCL067 FQ1OCBCL068 FQ1OCBCL069 FQ1OCBCL070
FQ1OCBCL071 FQ1OCBCL072 FQ1OCBCL073 FQ1OCBCL074 FQ1OCBCL075
FQ1OCBCL076 FQ1OCBCL077 FQ1OCBCL078 FQ1OCBCL079 FQ1OCBCL080
FQ1OCBCL081 FQ1OCBCL082 FQ1OCBCL083 FQ1OCBCL084 FQ1OCBCL085
FQ1OCBCL086 FQ1OCBCL087 FQ1OCBCL088 FQ1OCBCL089 FQ1OCBCL090
FQ1OCBCL091 FQ1OCBCL092 FQ1OCBCL093 FQ1OCBCL094 FQ1OCBCL095
FQ1OCBCL096 FQ1OCBCL097 FQ1OCBCL098 FQ1OCBCL099 FQ1OCBCL100
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
-41 'Instrument not part of the protoco (-41)'                                     
-33 'Staff Error (-33)'                                                                        
-22 'Not applicable (Staff/Clinician) (-22)'                  
-21 'Not applicable (Participant) (-21)'                            
-17 'Unable to contact teacher (-17)'                                    
-16 'Participant search exhausted (-16)'                                     
-14 'Participant repeated cancellations/delays (-14)'                      
-12 'Pariticipant refused follow-up (-12)'                                        
-11 'Participant (child) deceased (-11)'                                                
-10 'Prefer not to answer (-10)'  
0 'Not True (as far as you know) (0)'
1 'Somewhat or Sometimes True (1)'
2 'Very True or Often True (2)'.
EXECUTE.

*STEP 11: LABELING MISSING VALUES AS MISSING.
*Recoding all negative numbers as missing.
MISSING VALUES
FQ1OCBCL001 FQ1OCBCL002 FQ1OCBCL003 FQ1OCBCL004 FQ1OCBCL005
FQ1OCBCL006 FQ1OCBCL007 FQ1OCBCL008 FQ1OCBCL009 FQ1OCBCL010
FQ1OCBCL011 FQ1OCBCL012 FQ1OCBCL013 FQ1OCBCL014 FQ1OCBCL015
FQ1OCBCL016 FQ1OCBCL017 FQ1OCBCL018 FQ1OCBCL019 FQ1OCBCL020
FQ1OCBCL021 FQ1OCBCL022 FQ1OCBCL023 FQ1OCBCL024 FQ1OCBCL025
FQ1OCBCL026 FQ1OCBCL027 FQ1OCBCL028 FQ1OCBCL029 FQ1OCBCL030
FQ1OCBCL031 FQ1OCBCL032 FQ1OCBCL033 FQ1OCBCL034 FQ1OCBCL035
FQ1OCBCL036 FQ1OCBCL037 FQ1OCBCL038 FQ1OCBCL039 FQ1OCBCL040
FQ1OCBCL041 FQ1OCBCL042 FQ1OCBCL043 FQ1OCBCL044 FQ1OCBCL045
FQ1OCBCL046 FQ1OCBCL047 FQ1OCBCL048 FQ1OCBCL049 FQ1OCBCL050
FQ1OCBCL051 FQ1OCBCL052 FQ1OCBCL053 FQ1OCBCL054 FQ1OCBCL055
FQ1OCBCL056 FQ1OCBCL057 FQ1OCBCL058 FQ1OCBCL059 FQ1OCBCL060
FQ1OCBCL061 FQ1OCBCL062 FQ1OCBCL063 FQ1OCBCL064 FQ1OCBCL065
FQ1OCBCL066 FQ1OCBCL067 FQ1OCBCL068 FQ1OCBCL069 FQ1OCBCL070
FQ1OCBCL071 FQ1OCBCL072 FQ1OCBCL073 FQ1OCBCL074 FQ1OCBCL075
FQ1OCBCL076 FQ1OCBCL077 FQ1OCBCL078 FQ1OCBCL079 FQ1OCBCL080
FQ1OCBCL081 FQ1OCBCL082 FQ1OCBCL083 FQ1OCBCL084 FQ1OCBCL085
FQ1OCBCL086 FQ1OCBCL087 FQ1OCBCL088 FQ1OCBCL089 FQ1OCBCL090
FQ1OCBCL091 FQ1OCBCL092 FQ1OCBCL093 FQ1OCBCL094 FQ1OCBCL095
FQ1OCBCL096 FQ1OCBCL097 FQ1OCBCL098 FQ1OCBCL099 FQ1OCBCL100
    (LO THRU -1).
EXECUTE.

*STEP 12: SAVE CLEANED DATA FILE.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OCBCL_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.

*STEP 13: CHECK FREQUENCIES.
*Checking frequencies of all items before creating constructs.
*Include STAT variable here to be sure all missingness was coded correctly.
FREQUENCIES VARIABLES=FD1OSTAT FQ1OCBCL001 FQ1OCBCL002 FQ1OCBCL003 FQ1OCBCL004 FQ1OCBCL005
FQ1OCBCL006 FQ1OCBCL007 FQ1OCBCL008 FQ1OCBCL009 FQ1OCBCL010
FQ1OCBCL011 FQ1OCBCL012 FQ1OCBCL013 FQ1OCBCL014 FQ1OCBCL015
FQ1OCBCL016 FQ1OCBCL017 FQ1OCBCL018 FQ1OCBCL019 FQ1OCBCL020
FQ1OCBCL021 FQ1OCBCL022 FQ1OCBCL023 FQ1OCBCL024 
FQ1OCBCL025 FQ1OCBCL026 FQ1OCBCL027 FQ1OCBCL028 FQ1OCBCL029
FQ1OCBCL030 FQ1OCBCL031 FQ1OCBCL032
FQ1OCBCL033 FQ1OCBCL034 FQ1OCBCL035 FQ1OCBCL036 FQ1OCBCL037
FQ1OCBCL038 FQ1OCBCL039 FQ1OCBCL040 FQ1OCBCL041 FQ1OCBCL042
FQ1OCBCL043 FQ1OCBCL044 FQ1OCBCL045 FQ1OCBCL046 
FQ1OCBCL047 FQ1OCBCL048 FQ1OCBCL049 FQ1OCBCL050 FQ1OCBCL051
FQ1OCBCL052 FQ1OCBCL053 FQ1OCBCL054 FQ1OCBCL055
FQ1OCBCL056 FQ1OCBCL057 FQ1OCBCL058 FQ1OCBCL059
FQ1OCBCL060 FQ1OCBCL061 FQ1OCBCL062 FQ1OCBCL063 FQ1OCBCL064
FQ1OCBCL065 FQ1OCBCL066 FQ1OCBCL067 FQ1OCBCL068
FQ1OCBCL069 FQ1OCBCL070 FQ1OCBCL071 FQ1OCBCL072 FQ1OCBCL073
FQ1OCBCL074 FQ1OCBCL075 FQ1OCBCL076
FQ1OCBCL077 FQ1OCBCL078 FQ1OCBCL079 FQ1OCBCL080
FQ1OCBCL081 FQ1OCBCL082 FQ1OCBCL083 FQ1OCBCL084 FQ1OCBCL085
FQ1OCBCL086 FQ1OCBCL087 FQ1OCBCL088 FQ1OCBCL089 FQ1OCBCL090
FQ1OCBCL091 FQ1OCBCL092 FQ1OCBCL093 FQ1OCBCL094
FQ1OCBCL095 FQ1OCBCL096 FQ1OCBCL097 FQ1OCBCL098 FQ1OCBCL099
FQ1OCBCL100
  /ORDER=ANALYSIS.

*STEP 14: CHECK DESCRIPTIVES.
*Checking descriptives for all items before creating constructs.
DESCRIPTIVES VARIABLES=FQ1OCBCL001 FQ1OCBCL002 FQ1OCBCL003 FQ1OCBCL004 FQ1OCBCL005
FQ1OCBCL006 FQ1OCBCL007 FQ1OCBCL008 FQ1OCBCL009 FQ1OCBCL010
FQ1OCBCL011 FQ1OCBCL012 FQ1OCBCL013 FQ1OCBCL014 FQ1OCBCL015
FQ1OCBCL016 FQ1OCBCL017 FQ1OCBCL018 FQ1OCBCL019 FQ1OCBCL020
FQ1OCBCL021 FQ1OCBCL022 FQ1OCBCL023 FQ1OCBCL024 
FQ1OCBCL025 FQ1OCBCL026 FQ1OCBCL027 FQ1OCBCL028 FQ1OCBCL029
FQ1OCBCL030 FQ1OCBCL031 FQ1OCBCL032
FQ1OCBCL033 FQ1OCBCL034 FQ1OCBCL035 FQ1OCBCL036 FQ1OCBCL037
FQ1OCBCL038 FQ1OCBCL039 FQ1OCBCL040 FQ1OCBCL041 FQ1OCBCL042
FQ1OCBCL043 FQ1OCBCL044 FQ1OCBCL045 FQ1OCBCL046 
FQ1OCBCL047 FQ1OCBCL048 FQ1OCBCL049 FQ1OCBCL050 FQ1OCBCL051
FQ1OCBCL052 FQ1OCBCL053 FQ1OCBCL054 FQ1OCBCL055
FQ1OCBCL056 FQ1OCBCL057 FQ1OCBCL058 FQ1OCBCL059
FQ1OCBCL060 FQ1OCBCL061 FQ1OCBCL062 FQ1OCBCL063 FQ1OCBCL064
FQ1OCBCL065 FQ1OCBCL066 FQ1OCBCL067 FQ1OCBCL068
FQ1OCBCL069 FQ1OCBCL070 FQ1OCBCL071 FQ1OCBCL072 FQ1OCBCL073
FQ1OCBCL074 FQ1OCBCL075 FQ1OCBCL076
FQ1OCBCL077 FQ1OCBCL078 FQ1OCBCL079 FQ1OCBCL080
FQ1OCBCL081 FQ1OCBCL082 FQ1OCBCL083 FQ1OCBCL084 FQ1OCBCL085
FQ1OCBCL086 FQ1OCBCL087 FQ1OCBCL088 FQ1OCBCL089 FQ1OCBCL090
FQ1OCBCL091 FQ1OCBCL092 FQ1OCBCL093 FQ1OCBCL094
FQ1OCBCL095 FQ1OCBCL096 FQ1OCBCL097 FQ1OCBCL098 FQ1OCBCL099
FQ1OCBCL100 
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 15: SAVE CLEANED DATA FILE.
*Sorting the data file by ID and resaving the final file.
*To reorder items, use /KEEP {list all variables in order} -- insert in line after file name.
SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OCBCL_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.

*STEP 16: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE
 OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OCBCL_Cleaned.spv'
 LOCK=NO.

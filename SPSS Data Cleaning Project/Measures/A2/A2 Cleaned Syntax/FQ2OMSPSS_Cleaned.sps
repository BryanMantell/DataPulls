* Encoding: UTF-8.
*STEP 0: NOTES
*Multidimensional Scale of Perceived Social Support (MSPSS). 
 
*INCLUDE DATE(INITIALS): DESCRIPTION OF WHAT YOU DID. EVERY TIME THE SYNTAX IS EDITED, THERE SHOULD BE DETAILED NOTES ABOUT IT.
*08-02-21(AZ): Completed STEPS 1-16.
*08-25-21(AZ): Edited STEPS 6 and 11 to code missing data. 
*09-25-21(AAC): Added missing missing code to STEP 6.
*11-10-21(AZ):  Edited syntax to include new Steps (end of 5d, 5A, 7A, 10b, 11, 13ab, 15da)
*11-10-21(AAC): Checked. Fixed typo in Step 10, Added updated comments to Step 6
*11-19-21(AZ): Edited and ran syntax for T2. 
*12-06-21(AZ): Edited file path to new data file and ran syntax for T2. 
*1-13-22(BM): Checked and Edited comment in STEP 5A.
*1-20-22(AAC): CHECKED. Updated notes of STEP 10, 11, 13 to match template.

*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------.
*STEP 1: OPENING RAW DATA.
*Insert the correct file path and file name. Use syntax to open raw data file.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/DBT Moms R01 Study Time 2 Mother Survey_December 3, 2021_13.49.sav'.

*STEP 2: SAVING QUESTIONNAIRE SPECIFIC RAW DATA. 
*Insert the correct file path and file name. Save this file with only those variables that you need, in the following order; ID, Start Date, Questionnaire Items (i.e., MSPSS_1 to MSPSS_36).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OMSPSS_Cleaned.sav'
  /KEEP 
  FQ2ID 
  STARTDATE
  FQ2MSPSS_1 TO FQ2MSPSS_12
  /COMPRESSED.
  EXECUTE.

*STEP 3: OPEN NEW DATA FILE.  
*Insert the correct file path and file name. Open the file you just created and saved so that you are able to clean the data.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OMSPSS_Cleaned.sav'.

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
RENAME VARIABLE (STARTDATE=FQ2OMSPSSDATE).
EXECUTE.
RENAME VARIABLE (FQ2MSPSS_1 = FQ2OMSPSS01) (FQ2MSPSS_2 = FQ2OMSPSS02) (FQ2MSPSS_3 = FQ2OMSPSS03) (FQ2MSPSS_4 = FQ2OMSPSS04) (FQ2MSPSS_5 = FQ2OMSPSS05) (FQ2MSPSS_6 = FQ2OMSPSS06).
EXECUTE.
RENAME VARIABLE (FQ2MSPSS_7 = FQ2OMSPSS07) (FQ2MSPSS_8 = FQ2OMSPSS08) (FQ2MSPSS_9 = FQ2OMSPSS09) (FQ2MSPSS_10 = FQ2OMSPSS10) (FQ2MSPSS_11 = FQ2OMSPSS11) (FQ2MSPSS_12 = FQ2OMSPSS12).
EXECUTE.
*Remember to save your data file.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OMSPSS_Cleaned.sav'.
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
/FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OMSPSS_Cleaned.sav'
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
COMPUTE DATEDIFF = DATEDIFF(FD2ORD,FQ2OMSPSSDATE,'days').
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
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OMSPSS_Cleaned.sav'
/DROP
FQ2OMSPSSDATE
DATEDIFF
DATEDIFF0
f.
EXECUTE.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OMSPSS_Cleaned.sav'.
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
**-11 'Participant (parent or child) deceased'                                 /* (Participant (parent or child) deceased) */
**-10 'Prefer not to answer'                                                           /* (Participant selected prefer not to answer) */.
*CHECKED AND NOT NEEDED.
    
**STEP 7 (DELETE IF NOT NEEDED): CREATING NEW VARIABLES FOR REVERSED SCORED ITEMS.
**Reverse-Scored Items; see scoring document to determine if there are reverse-scored items. If no reverse-scored items, delete this syntax.
**CHECKED AND NOT NEEDED.

*STEP 7A: RECODING SYSMIS (PARTICIPANTS THAT MISSED THE ASSESSMENT).
*This will use the STAT variable to recode all SYSMIS data. CHANGE THE STAT VARIABLE TO MATCH THE ASSESSMENT WAVE YOU ARE WORKING IN.
*Include full list of numeric variables (including new reverse-scored items).
DO IF MISSING(FD2OSTAT).
DO REPEAT x = FQ2OMSPSS01 TO FQ2OMSPSS12.
RECODE FD2OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.

*STEP 8: STANDARDIZING DECIMAL PLACES (CANNOT INCLUDE TEXT/STRING VARIABLES).
*Making all variables have the same number of decimal places. Ensure that variables include all new reverse-scored variables. Change the number AFTER the decimal place as needed.
FORMATS FQ2OMSPSS01 to FQ2OMSPSS12 (F8.0).
EXECUTE.

*STEP 9: CREATING VARIABLE LABLES.
*Label all variables. Use the original questionnaire to include the exact text that participants saw. Include the questionnaire name and number at the end of the label.
VARIABLE LABELS  ID 'Participant ID'.
EXECUTE.

VARIABLE LABELS 
FQ2OMSPSS01 'There is a special person who is around when I am in need [FQ2OMSPSS01]'
FQ2OMSPSS02 'There is a special person with whom I can share joys and sorrows [FQ2OMSPSS02]'
FQ2OMSPSS03 'My family really tries to help me [FQ2OMSPSS03]'
FQ2OMSPSS04 'I get the emotional help & support I need from my family [FQ2OMSPSS04]'
FQ2OMSPSS05 'I have a special person who is a real source of comfort to me [FQ2OMSPSS05]'
FQ2OMSPSS06 'My friends really try to help me [FQ2OMSPSS06]'
FQ2OMSPSS07 'I can count on my friends when things go wrong [FQ2OMSPSS07]'
FQ2OMSPSS08 'I can talk about my problems with my family [FQ2OMSPSS08]'
FQ2OMSPSS09 'I have friends with whom I can share my joys and sorrows [FQ2OMSPSS09]'
FQ2OMSPSS10 'There is a special person in my life who cares about my feelings [FQ2OMSPSS10]'
FQ2OMSPSS11 'My family is willing to help me make decisions [FQ2OMSPSS11]'
FQ2OMSPSS12 'I can talk about my problems with my friends [FQ2OMSPSS12]'.
EXECUTE. 

*STEP 10: ADD VALUE LABELS.
*Include missing values like 'Prefer not to Answer' (or something similar) if applicable.
*Include ALL missing value labels (SEE ABOVE FOR FULL LIST).
VALUE LABELS
FQ2OMSPSS01 FQ2OMSPSS02 FQ2OMSPSS03 FQ2OMSPSS04 FQ2OMSPSS05 FQ2OMSPSS06 FQ2OMSPSS07 
FQ2OMSPSS08 FQ2OMSPSS09 FQ2OMSPSS10 FQ2OMSPSS11 FQ2OMSPSS12 
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
1 'Very Strongly Disagree (1)'
2 'Strongly Disagree (2)'
3 'Mildly Disagree (3)'
4 'Neutral (4)'
5 'Mildly Agree (5)'
6 'Strongly Agree (6)'
7 'Very Strongly Agree (7)'.  
EXECUTE.

*STEP 11: LABELING MISSING VALUES AS MISSING.
*Recoding all negative numbers as missing.
MISSING VALUES
    FQ2OMSPSS01 FQ2OMSPSS02 FQ2OMSPSS03 FQ2OMSPSS04 FQ2OMSPSS05 FQ2OMSPSS06 FQ2OMSPSS07 
    FQ2OMSPSS08 FQ2OMSPSS09 FQ2OMSPSS10 FQ2OMSPSS11 FQ2OMSPSS12 
(LO THRU -1). 

*STEP 12: SAVE CLEANED DATA FILE.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OMSPSS_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.

*STEP 13: CHECK FREQUENCIES.
*Checking frequencies of all items before creating constructs.
*Include STAT variable here to be sure all missingness was coded correctly.
FREQUENCIES VARIABLES=FD2OSTAT FQ2OMSPSS01 FQ2OMSPSS02 FQ2OMSPSS03 FQ2OMSPSS04 FQ2OMSPSS05 FQ2OMSPSS06 FQ2OMSPSS07 FQ2OMSPSS08 
    FQ2OMSPSS09 FQ2OMSPSS10 FQ2OMSPSS11 FQ2OMSPSS12
  /ORDER=ANALYSIS.

*STEP 14: CHECK DESCRIPTIVES.
*Checking descriptives for all items before creating constructs.
DESCRIPTIVES VARIABLES=FQ2OMSPSS01 FQ2OMSPSS02 FQ2OMSPSS03 FQ2OMSPSS04 FQ2OMSPSS05 FQ2OMSPSS06 FQ2OMSPSS07 FQ2OMSPSS08 
    FQ2OMSPSS09 FQ2OMSPSS10 FQ2OMSPSS11 FQ2OMSPSS12 
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 15: SAVE CLEANED DATA FILE.
*Sorting the data file by ID and resaving the final file.
*To reorder items, use /KEEP {list all variales in order} -- insert in line after file name.
SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OMSPSS_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OMSPSS_Cleaned.sav'.
EXECUTE.

*STEP 16: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE
 OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OMSPSS_Cleaned.spv'
 LOCK=NO.

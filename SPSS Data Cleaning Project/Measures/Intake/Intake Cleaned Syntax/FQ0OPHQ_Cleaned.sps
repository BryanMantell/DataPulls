﻿* Encoding: UTF-8.
*STEP 0: NOTES
*PATIENT HEALTH QUESTIONAIRE (PHQ).
 
*INCLUDE DATE(INITIALS): DESCRIPTION OF WHAT YOU DID. EVERY TIME THE SYNTAX IS EDITED, THERE SHOULD BE DETAILED NOTES ABOUT IT.
*11-17-21(BM): Completed STEPS 1-16.
*02-08-22(BM) Took care of missing data.  
*02-14-22(BM) Fixed Date diff issues. 
*02-16-22(AAC): CHECKED. 
*02-17-22(BM):Double checked missing. 

*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------.
*STEP 1: OPENING RAW DATA.
*Insert the correct file path and file name. Use syntax to open raw data file.
GET
  FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\DBT Moms R01 Study SBQ_PHQ_PAI-BOR Survey_February 14, 2022_16.26.sav'.

*STEP 2: SAVING QUESTIONNAIRE SPECIFIC RAW DATA. 
*Insert the correct file path and file name. Save this file with only those variables that you need, in the following order; ID, Start Date, Questionnaire Items (i.e., DERS_1 to DERS_36).
SAVE OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ0OPHQ_Cleaned.sav'
  /KEEP 
  ID 
  STARTDATE
  FQ0OPHQ_1 TO FQ0OPHQ10
  /COMPRESSED.
  EXECUTE.

*STEP 3: OPEN NEW DATA FILE.  
*Insert the correct file path and file name. Open the file you just created and saved so that you are able to clean the data.
GET
  FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ0OPHQ_Cleaned.sav'.

*STEP 4: TRANSFORM VARIABLES AND SORT IDS ASCENDING ORDER.
*Transforming ID from a string to a numeric variable, change the date format of startdate, and sort IDs in ascending order.
ALTER TYPE ID (F10.0).
EXECUTE.
FORMATS STARTDATE (adate10).
EXECUTE.
SORT CASES BY ID(A).
EXECUTE.

*STEP 5: RENAME ‘RAW DATA’ VARIABLES TO ‘CLEANED’ VARIABLES NAMES. 
*Rename all variables so they reflect our naming scheme. ID should always be labeled as 'ID'. Item should be numbers 01-36 or 001-106. 
RENAME VARIABLE  (STARTDATE=FQ0OPHQDATE) (FQ0OPHQ_1 = FQ0OPHQ01) (FQ0OPHQ_2 = FQ0OPHQ02) (FQ0OPHQ_3 = FQ0OPHQ03) (FQ0OPHQ_4 = FQ0OPHQ04)
    (FQ0OPHQ_5 = FQ0OPHQ05) (FQ0OPHQ_6 = FQ0OPHQ06) (FQ0OPHQ_7 = FQ0OPHQ07) (FQ0OPHQ_8 = FQ0OPHQ08) (FQ0OPHQ_9 = FQ0OPHQ09).
EXECUTE.
*Remember to save your data file.
SAVE OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ0OPHQ_Cleaned.sav'.
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
/FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FD0OACS_Cleaned.sav'
/IN=f
/FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ0OPHQ_Cleaned.sav'
/BY ID
/DROP=
FD1OSTAT FD1OTD FD1ORD FD1ODIFF
FD2OSTAT FD2OTD FD2ORD FD2ODIFF
FD3OSTAT FD3OTD FD3ORD FD3ODIFF
FD4OSTAT FD4OTD FD4ORD FD4ODIFF
FD4AOSTAT FD4AOTD FD4AORD FD4AODIFF.
SELECT IF f=1.
EXECUTE.
*Comparing REDCap and Qualtrics dates of completion. Be sure to update the date variables used to reflect the accurate RD and questionnaire date.
COMPUTE DATEDIFF = DATEDIFF(FD0ORD,FQ0OPHQDATE,'days').
EXECUTE.
COUNT DATEDIFF0=DATEDIFF(Lowest thru -1) DATEDIFF(1 thru Highest).
EXECUTE.
FREQUENCIES VARIABLES=DATEDIFF0
  /ORDER=ANALYSIS.
SORT CASES BY DATEDIFF0(D).
*CHECK ALL IDS WITH DISCREPANT DATES TO DETERMINE WHAT IS CORRECT. CONSULT BEFORE MAKING ANY CHANGES TO RAW DATA IN REDCAP OR QUALTRICS.
*INCLUDE NOTES HERE FOR EACH ID THAT WAS DISCREPANT (EXAMPLE BELOW - ADAPT AS NEEDED)
*THE FOLLOWING IDs (INCLUDE IDs) HAVE A A0 QUALTRICS DATE [FQ0OPHQDATE] THAT DOES NOT MATCH THEIR A0 VISIT DATE [FD0ORD]. 
*90027, 90083, 90102, 90104, 90196, 90210, 90230, 90234, 90238, 90417, 90439, 
90443, 90449, 90564, 90687, 90739, 90754, 90830, 90841, 90846, 90887, 90933, 
90975, 90990, 90996, 90999, 91069, 91081, 91123, 91133, 91143, 91165, 91260, 
91292, 91548, 91552, 91607, 91637, 91641, 91759, 91768, 91858, 91995.
*THIS WAS INVESTIGATED BY STAFF (BM: 02-14-22) AND VISIT DATE [FD0ORD] WAS CONFIRMED USING MULTIPLE SOURCES.
SORT CASES BY ID(A).
*DROPPING VARIABLES THAT ARE NO LONGER RELEVANT TO FINAL DATA FILE.
SAVE OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ0OPHQ_Cleaned.sav'
/DROP
FQ0OPHQDATE
DATEDIFF
DATEDIFF0
f.
EXECUTE.
GET
  FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ0OPHQ_Cleaned.sav'.
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
IF (ID = 90027 OR ID = 90112 OR ID = 90203 OR ID = 90417 OR ID = 90476 OR ID = 90687 OR ID = 90933 OR ID = 91123 OR ID = 91607 OR ID = 91637) FQ0OPHQ01= -33.
IF (ID = 90027 OR ID = 90112 OR ID = 90203 OR ID = 90417 OR ID = 90476 OR ID = 90687 OR ID = 90933 OR ID = 91123 OR ID = 91607 OR ID = 91637) FQ0OPHQ02= -33.
IF (ID = 90027 OR ID = 90112 OR ID = 90203 OR ID = 90417 OR ID = 90476 OR ID = 90687 OR ID = 90933 OR ID = 91123 OR ID = 91607 OR ID = 91637) FQ0OPHQ03= -33.
IF (ID = 90027 OR ID = 90112 OR ID = 90203 OR ID = 90417 OR ID = 90476 OR ID = 90687 OR ID = 90933 OR ID = 91123 OR ID = 91607 OR ID = 91637) FQ0OPHQ04= -33.
IF (ID = 90027 OR ID = 90112 OR ID = 90203 OR ID = 90417 OR ID = 90476 OR ID = 90687 OR ID = 90933 OR ID = 91123 OR ID = 91607 OR ID = 91637) FQ0OPHQ05= -33.
IF (ID = 90027 OR ID = 90112 OR ID = 90203 OR ID = 90417 OR ID = 90476 OR ID = 90687 OR ID = 90933 OR ID = 91123 OR ID = 91607 OR ID = 91637) FQ0OPHQ06= -33.
IF (ID = 90027 OR ID = 90112 OR ID = 90203 OR ID = 90417 OR ID = 90476 OR ID = 90687 OR ID = 90933 OR ID = 91123 OR ID = 91607 OR ID = 91637) FQ0OPHQ07= -33.
IF (ID = 90027 OR ID = 90112 OR ID = 90203 OR ID = 90417 OR ID = 90476 OR ID = 90687 OR ID = 90933 OR ID = 91123 OR ID = 91607 OR ID = 91637) FQ0OPHQ08= -33.
IF (ID = 90027 OR ID = 90112 OR ID = 90203 OR ID = 90417 OR ID = 90476 OR ID = 90687 OR ID = 90933 OR ID = 91123 OR ID = 91607 OR ID = 91637) FQ0OPHQ09= -33.
IF (ID = 90027 OR ID = 90112 OR ID = 90203 OR ID = 90417 OR ID = 90476 OR ID = 90687 OR ID = 90933 OR ID = 91123 OR ID = 91607 OR ID = 91637) FQ0OPHQ10= -33.
    EXECUTE.

IF (ID = 90102 OR ID = 90210 OR ID = 90234 OR ID = 90238 OR ID = 90564 OR ID = 90739 OR ID = 90830 OR ID = 90841) FQ0OPHQ10= -44.
    EXECUTE.
    
**STEP 7 (DELETE IF NOT NEEDED): CREATING NEW VARIABLES FOR REVERSED SCORED ITEMS.
**Reverse-Scored Items; see scoring document to determine if there are reverse-scored items. If no reverse-scored items, delete this syntax.

*STEP 7A: RECODING SYSMIS (PARTICIPANTS THAT MISSED THE ASSESSMENT).
*This will use the STAT variable to recode all SYSMIS data. CHANGE THE STAT VARIABLE TO MATCH THE ASSESSMENT WAVE YOU ARE WORKING IN.
*Include full list of numeric variables (including new reverse-scored items).
DO IF MISSING(FD0OSTAT).
DO REPEAT x = FQ0OPHQ01 TO FQ0OPHQ10.
RECODE FD0OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.

*STEP 8: STANDARDIZING DECIMAL PLACES (CANNOT INCLUDE TEXT/STRING VARIABLES).
*Making all variables have the same number of decimal places. Ensure that variables include all new reverse-scored variables. Change the number AFTER the decimal place as needed.
FORMATS FQ0OPHQ01 to FQ0OPHQ10 (F8.0).
EXECUTE.

*STEP 9: CREATING VARIABLE LABLES.
*Label all variables. Use the original questionnaire to include the exact text that participants saw. Include the questionnaire name and number at the end of the label.
VARIABLE LABELS  ID 'Participant ID'.
EXECUTE.

VARIABLE LABELS 
FQ0OPHQ01 'Little interest or pleasure in doing things [FQ0OPHQ01]'
FQ0OPHQ02 'Feeling down, depressed, or hopeless [FQ0OPHQ02]'
FQ0OPHQ03 'Trouble falling or staying asleep, or sleeping too much [FQ0OPHQ03]'
FQ0OPHQ04 'Feeling tired or having little energy [FQ0OPHQ04]'
FQ0OPHQ05 'Poor appetite or overeating [FQ0OPHQ05]'
FQ0OPHQ06 'Feeling bad about yourself or that you are a failure or have let yourself or your family down [FQ0OPHQ06]'
FQ0OPHQ07 'Trouble concentrating on things, such as reading the newspaper or watching television [FQ0OPHQ07]'
FQ0OPHQ08 'Moving or speaking so slowly that other people could have noticed? Or the opposite, being so fidgety or restless that you have been moving around a lot more than usual [FQ0OPHQ08]'
FQ0OPHQ09 'Thoughts that you would be better off dead or of hurting yourself in some way [FQ0OPHQ09]'
FQ0OPHQ10 'How difficult have these problems made it for you to do your work, take care of things at home, or get along with other people? [FQ0OPHQ10]'.
EXECUTE. 

*STEP 10: ADD VALUE LABELS.
*Include missing values like 'Prefer not to Answer' (or something similar) if applicable.
*Include ALL missing value labels (SEE ABOVE FOR FULL LIST).
VALUE LABELS
FQ0OPHQ01 FQ0OPHQ02 FQ0OPHQ03 FQ0OPHQ04 FQ0OPHQ05 FQ0OPHQ06 FQ0OPHQ07 FQ0OPHQ08 FQ0OPHQ09
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
0 'Not at all (0)'
1 'Several days (1)'
2 'More than half the days (2)'
3 'Nearly every day (3)'.
EXECUTE.

VALUE LABELS
FQ0OPHQ10
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
0 'Not difficult at all (0)'
1 'Somewhat difficult (1)'
2 'Very difficult (2)'
3 'Extremely difficult (3)'.
EXECUTE.

*STEP 11: LABELING MISSING VALUES AS MISSING.
*Recoding all negative numbers as missing.
MISSING VALUES
   FQ0OPHQ01 FQ0OPHQ02 FQ0OPHQ03 FQ0OPHQ04 FQ0OPHQ05 FQ0OPHQ06 FQ0OPHQ07 FQ0OPHQ08 FQ0OPHQ09 FQ0OPHQ10
    (LO THRU -1).
EXECUTE.

*STEP 12: SAVE CLEANED DATA FILE.
SAVE OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ0OPHQ_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.

*STEP 13: CHECK FREQUENCIES.
*Checking frequencies of all items before creating constructs.
*Include STAT variable here to be sure all missingness was coded correctly.
FREQUENCIES VARIABLES=FD0OSTAT FQ0OPHQ01 FQ0OPHQ02 FQ0OPHQ03 FQ0OPHQ04 FQ0OPHQ05 FQ0OPHQ06 FQ0OPHQ07 FQ0OPHQ08 FQ0OPHQ09 FQ0OPHQ10 
  /ORDER=ANALYSIS.

*STEP 14: CHECK DESCRIPTIVES.
*Checking descriptives for all items before creating constructs.
DESCRIPTIVES VARIABLES= FQ0OPHQ01 FQ0OPHQ02 FQ0OPHQ03 FQ0OPHQ04 FQ0OPHQ05 FQ0OPHQ06 FQ0OPHQ07 FQ0OPHQ08 FQ0OPHQ09 FQ0OPHQ10 
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 15: SAVE CLEANED DATA FILE.
*Sorting the data file by ID and resaving the final file.
*To reorder items, use /KEEP {list all variables in order} -- insert in line after file name.
SORT CASES BY ID(A).
SAVE OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ0OPHQ_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.
GET
  FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ0OPHQ_Cleaned.sav'.

*STEP 16: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE
 OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ0OPHQ_Cleaned.spv'
 LOCK=NO.

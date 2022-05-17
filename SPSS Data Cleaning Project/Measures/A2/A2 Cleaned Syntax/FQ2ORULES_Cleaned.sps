﻿* Encoding: UTF-8.
*STEP 0: NOTES 
*RESPONSES TO UNCERTAINTY AND LOW ENVIORMENTAL STRUCTURE (RULES).
 
*INCLUDE DATE(INITIALS): DESCRIPTION OF WHAT YOU DID. EVERY TIME THE SYNTAX IS EDITED, THERE SHOULD BE DETAILED NOTES ABOUT IT.
*02-22-22(BM): Completed STEPS 1-16.
*02-23-22(AAC): Checked. Updated value labels.

*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------.
*STEP 1: OPENING RAW DATA.
*Insert the correct file path and file name. Use syntax to open raw data file.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/DBT Moms R01 Study Time 2 Mother Survey_February 21, 2022_14.34.sav'.

*STEP 2: SAVING QUESTIONNAIRE SPECIFIC RAW DATA. 
*Insert the correct file path and file name. Save this file with only those variables that you need, in the following order; ID, Start Date, Questionnaire Items (i.e., RULES_1 to RULES_36).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2ORULES_Cleaned.sav'
  /KEEP 
  FQ2ID 
  STARTDATE
  FQ2RULES_1 TO FQ2RULES_17
  /COMPRESSED.
  EXECUTE.

*STEP 3: OPEN NEW DATA FILE.  
*Insert the correct file path and file name. Open the file you just created and saved so that you are able to clean the data.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2ORULES_Cleaned.sav'.

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
RENAME VARIABLE (STARTDATE=FQ2ORULESDATE).
EXECUTE.
RENAME VARIABLE (FQ2RULES_1 = FQ2ORULES01) (FQ2RULES_2 = FQ2ORULES02) (FQ2RULES_3 = FQ2ORULES03) (FQ2RULES_4 = FQ2ORULES04) (FQ2RULES_5 = FQ2ORULES05) (FQ2RULES_6 = FQ2ORULES06)
     (FQ2RULES_7 = FQ2ORULES07) (FQ2RULES_8 = FQ2ORULES08) (FQ2RULES_9 = FQ2ORULES09) (FQ2RULES_10 = FQ2ORULES10) (FQ2RULES_11 = FQ2ORULES11) (FQ2RULES_12 = FQ2ORULES12)
     (FQ2RULES_13 = FQ2ORULES13) (FQ2RULES_14 = FQ2ORULES14) (FQ2RULES_15 = FQ2ORULES15) (FQ2RULES_16 = FQ2ORULES16) (FQ2RULES_17 = FQ2ORULES17).
EXECUTE.
*Remember to save your data file.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2ORULES_Cleaned.sav'.
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
/FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2ORULES_Cleaned.sav'
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
COMPUTE DATEDIFF = DATEDIFF(FD2ORD,FQ2ORULESDATE,'days').
EXECUTE.
COUNT DATEDIFF0=DATEDIFF(Lowest thru -1) DATEDIFF(1 thru Highest).
EXECUTE.
FREQUENCIES VARIABLES=DATEDIFF0
  /ORDER=ANALYSIS.
SORT CASES BY DATEDIFF0(D).
*CHECK ALL IDS WITH DISCREPANT DATES TO DETERMINE WHAT IS CORRECT. CONSULT BEFORE MAKING ANY CHANGES TO RAW DATA IN REDCAP OR QUALTRICS.
*INCLUDE NOTES HERE FOR EACH ID THAT WAS DISCREPANT (EXAMPLE BELOW - ADAPT AS NEEDED)
*THE FOLLOWING IDs (90996, 91133, and 91292) HAVE A A2 QUALTRICS DATE [FQ2OXXXXDATE] THAT DOES NOT MATCH THEIR A2 VISIT DATE [FD2ORD]. 
*THIS WAS INVESTIGATED BY STAFF (BM: 02-22-22) AND VISIT DATE [FD2ORD] WAS CONFIRMED USING MULTIPLE SOURCES.
SORT CASES BY ID(A).
*DROPPING VARIABLES THAT ARE NO LONGER RELEVANT TO FINAL DATA FILE.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2ORULES_Cleaned.sav'
/DROP
FQ2ORULESDATE
DATEDIFF
DATEDIFF0
f.
EXECUTE.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2ORULES_Cleaned.sav'.
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
COMPUTE
FQ2ORULES13 =-33.
EXECUTE.

DO IF(
ID = 90102 OR ID = 90210 OR ID = 90230 OR ID = 90234 OR ID = 90238 OR ID = 90443 OR 
ID = 90449 OR ID = 90564 OR ID = 90671 OR ID = 90687 OR ID = 90724 OR ID = 90739 OR
ID = 90754 OR ID = 90800 OR ID = 90830 OR ID = 90841 OR ID = 90861 OR ID = 90945 OR 
ID = 90975 OR ID = 90996 OR ID = 90999 OR ID = 91123 OR ID = 91165 OR ID = 91469 OR
ID = 91637 OR ID = 91759 OR ID = 91768).
   RECODE 
    FQ2ORULES01 TO FQ2ORULES17
   (SYSMIS=-41).
END IF.
EXECUTE.

**STEP 7 (DELETE IF NOT NEEDED): CREATING NEW VARIABLES FOR REVERSED SCORED ITEMS.
**Reverse-Scored Items; see scoring document to determine if there are reverse-scored items. If no reverse-scored items, delete this syntax.

*STEP 7A: RECODING SYSMIS (PARTICIPANTS THAT MISSED THE ASSESSMENT).
*This will use the STAT variable to recode all SYSMIS data. CHANGE THE STAT VARIABLE TO MATCH THE ASSESSMENT WAVE YOU ARE WORKING IN.
*Include full list of numeric variables (including new reverse-scored items).
DO IF MISSING(FD2OSTAT).
DO REPEAT x = FQ2ORULES01 TO FQ2ORULES17.
RECODE FD2OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.

*STEP 8: STANDARDIZING DECIMAL PLACES (CANNOT INCLUDE TEXT/STRING VARIABLES).
*Making all variables have the same number of decimal places. Ensure that variables include all new reverse-scored variables. Change the number AFTER the decimal place as needed.
FORMATS FQ2ORULES01 to FQ2ORULES17 (F8.0).
EXECUTE.

*STEP 9: CREATING VARIABLE LABLES.
*Label all variables. Use the original questionnaire to include the exact text that participants saw. Include the questionnaire name and number at the end of the label.
VARIABLE LABELS  ID 'Participant ID'.
EXECUTE.

VARIABLE LABELS 
FQ2ORULES01 'My child gets tense when unexpected events or transitions occur in his/her environment [FQ2ORULES01]'
FQ2ORULES02 'My child has a hard time coping with even minor changes [FQ2ORULES02]'
FQ2ORULES03 'My child says, "It is unfair" when he/she cannot know what will happen next [FQ2ORULES03]'
FQ2ORULES04 'My child always wants to know ahead of the time what the plan is [FQ2ORULES04]'
FQ2ORULES05 'My child becomes upset if he/she has to enter a new situation [FQ2ORULES05]'
FQ2ORULES06 'My child seeks reassurance prior to entering an unfamiliar situation [FQ2ORULES06]'
FQ2ORULES07 'My child cries when he/she finds him/herself in an unfamiliar situation [FQ2ORULES07]'
FQ2ORULES08 'My child gets down on him/herself if he/she does not know what will happen next [FQ2ORULES08]'
FQ2ORULES09 'My child performs best in highly structured environments [FQ2ORULES09]'
FQ2ORULES10 'My child tantrums when an unexpected event occurs [FQ2ORULES10]'
FQ2ORULES11 'My child avoids unstructured situations [FQ2ORULES11]'
FQ2ORULES12 'My child cannot relax if he/she does not know what will happen next [FQ2ORULES12]'
FQ2ORULES13 'My child cannot sleep if he anticipates an upcoming change [FQ2ORULES13]'
FQ2ORULES14 'My child becomes fidgety during transitions [FQ2ORULES14]'
FQ2ORULES15 'My child freezes up in the face of unexpected events [FQ2ORULES15]'
FQ2ORULES16 'Transitions are difficult for my child [FQ2ORULES16]'
FQ2ORULES17 'My child complains of physical symptoms when he/she is about to enter a new situation [FQ2ORULES17]'.
EXECUTE. 

*STEP 10: ADD VALUE LABELS.
*Include missing values like 'Prefer not to Answer' (or something similar) if applicable.
*Include ALL missing value labels (SEE ABOVE FOR FULL LIST).
VALUE LABELS
FQ2ORULES01 FQ2ORULES02 FQ2ORULES03 FQ2ORULES04 FQ2ORULES05 FQ2ORULES06 FQ2ORULES07
FQ2ORULES08 FQ2ORULES09 FQ2ORULES10 FQ2ORULES11 FQ2ORULES12 FQ2ORULES13
FQ2ORULES14 FQ2ORULES15 FQ2ORULES16  FQ2ORULES17
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
-11 'Participant (child) deceased (-11)'                                                
-10 'Prefer not to answer (-10)'   
1 'Not at all (1)'
2 '(2)'
3 'Somewhat (3)'
4 '(4)'
5 'Very much (5)'.
EXECUTE.

*STEP 11: LABELING MISSING VALUES AS MISSING.
*Recoding all negative numbers as missing.
MISSING VALUES
    FQ2ORULES01 FQ2ORULES02 FQ2ORULES03 FQ2ORULES04 FQ2ORULES05 FQ2ORULES06 FQ2ORULES07 FQ2ORULES08 FQ2ORULES09
    FQ2ORULES10 FQ2ORULES11 FQ2ORULES12 FQ2ORULES13 FQ2ORULES14 FQ2ORULES15 FQ2ORULES16 FQ2ORULES17
    (LO THRU -1).
EXECUTE.

*STEP 12: SAVE CLEANED DATA FILE.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2ORULES_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.

*STEP 13: CHECK FREQUENCIES.
*Checking frequencies of all items before creating constructs.
*Include STAT variable here to be sure all missingness was coded correctly.
FREQUENCIES VARIABLES=FD2OSTAT FQ2ORULES01 FQ2ORULES02 FQ2ORULES03 FQ2ORULES04 FQ2ORULES05 FQ2ORULES06 FQ2ORULES07 FQ2ORULES08 
    FQ2ORULES09 FQ2ORULES10 FQ2ORULES11 FQ2ORULES12 FQ2ORULES13 FQ2ORULES14 FQ2ORULES15 FQ2ORULES16 FQ2ORULES17 
  /ORDER=ANALYSIS.

*STEP 14: CHECK DESCRIPTIVES.
*Checking descriptives for all items before creating constructs.
DESCRIPTIVES VARIABLES= FQ2ORULES01 FQ2ORULES02 FQ2ORULES03 FQ2ORULES04 FQ2ORULES05 FQ2ORULES06 FQ2ORULES07 FQ2ORULES08 
    FQ2ORULES09 FQ2ORULES10 FQ2ORULES11 FQ2ORULES12 FQ2ORULES13 FQ2ORULES14 FQ2ORULES15 FQ2ORULES16 FQ2ORULES17 
  /STATISTICS=MEAN STDDEV MIN MAX.


*STEP 15: SAVE CLEANED DATA FILE.
*Sorting the data file by ID and resaving the final file.
*To reorder items, use /KEEP {list all variables in order} -- insert in line after file name.
SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2ORULES_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2ORULES_Cleaned.sav'.

*STEP 16: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE
 OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2ORULES_Cleaned.spv'
 LOCK=NO.

* Encoding: UTF-8.
*STEP 0: NOTES
*ALABAMA PARENTING QUESTIONNAIRE-PRESCHOOL REVISION (APQ-PR).
 
*07-20-21(JL): Adapting template for APQ-PR.
*07-23-21(JL): Edited text of notes and syntax for STEPS 6,10,11.
*09-03-21 (JL): Edited syntax STEP 1 since new raw data file, STEPS 5-14 since items were administered to participants by scale instead of the order presented in the original measure.
*09-04-21 (AZ): Edited syntax to match UO
*09-14-21(AZ): Continued to edit syntax to match UO - mainly steps 5 and 9
*10-04-21(AAC): Added a space for consistency in one item label
*10-06-21(AZ): Edited syntax in preparation for T3 data, ran T3 data. 
*10-13-21(AZ): Edited syntax in preparation for T3 data, ran T3 data.
*04-12-2022 (BM):Adapted Syntax to Match Updated Template + Pass in Updated Data.
*04-13-2022 (BM):Moved Recoding from step 7 to step 6.
*4-13-22(AAC): Checked.
*04-18-2022(BM): Double Checked and Fixed Missing Codes.
*04-20-22(AAC): Checked.
*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------.
*STEP 1: OPENING RAW DATA.
*Insert the correct file path and file name. Use syntax to open raw data file.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/DBT Moms R01 Study Time 3 Mother Survey_April 12, 2022_17.38.sav'.

*STEP 2: SAVING QUESTIONNAIRE SPECIFIC RAW DATA. 
*Insert the correct file path and file name. Save this file with only those variables that you need, in the following order; ID, Start Date, Questionnaire Items (i.e., DERS_1 to DERS_36).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OAPQ_Cleaned.sav'
  /KEEP 
  FQ3ID 
  STARTDATE
  FQ3APQ_1 TO FQ3APQ_29
  /COMPRESSED.
  EXECUTE.

*STEP 3: OPEN NEW DATA FILE.  
*Insert the correct file path and file name. Open the file you just created and saved so that you are able to clean the data.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OAPQ_Cleaned.sav'.

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
RENAME VARIABLE (FQ3ID=ID) (STARTDATE=FQ3OAPQDATE) (FQ3APQ_1 = FQ3OAPQ01) (FQ3APQ_12 = FQ3OAPQ02) (FQ3APQ_13 = FQ3OAPQ03) 
    (FQ3APQ_2 = FQ3OAPQ04) (FQ3APQ_3 = FQ3OAPQ06) (FQ3APQ_14 = FQ3OAPQ07) (FQ3APQ_4 = FQ3OAPQ08) (FQ3APQ_5 = FQ3OAPQ09) 
    (FQ3APQ_15 = FQ3OAPQ10) (FQ3APQ_6 = FQ3OAPQ11) (FQ3APQ_7 = FQ3OAPQ13) (FQ3APQ_8 = FQ3OAPQ14) (FQ3APQ_9 = FQ3OAPQ15) 
    (FQ3APQ_16 = FQ3OAPQ16) (FQ3APQ_17 = FQ3OAPQ17) (FQ3APQ_18 = FQ3OAPQ18) (FQ3APQ_10 = FQ3OAPQ20) (FQ3APQ_19 = FQ3OAPQ22) 
    (FQ3APQ_20 = FQ3OAPQ25) (FQ3APQ_21 = FQ3OAPQ30) (FQ3APQ_11 = FQ3OAPQ31).
EXECUTE.

*Adding Item 24, 26, and 29 from the APQ-PR manual to the data file even though UO do not administer this item.
COMPUTE FQ3OAPQ24 = -41.
EXECUTE.
COMPUTE FQ3OAPQ26 = -41.
EXECUTE.
COMPUTE FQ3OAPQ29 = -41.
EXECUTE.

*Remember to save your data file.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OAPQ_Cleaned.sav'.
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
/FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OAPQ_Cleaned.sav'
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
COMPUTE DATEDIFF = DATEDIFF(FD3ORD,FQ3OAPQDATE,'days').
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
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OAPQ_Cleaned.sav'
/DROP
FQ3OAPQDATE
DATEDIFF
DATEDIFF0
f.
EXECUTE.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OAPQ_Cleaned.sav'.
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
IF (ID= 90443) FQ3OAPQ22= -10.
EXECUTE.
IF (ID= 90027) FQ3OAPQ08= -10.
EXECUTE.


**STEP 7 (DELETE IF NOT NEEDED): CREATING NEW VARIABLES FOR REVERSED SCORED ITEMS.
**Reverse-Scored Items; see scoring document to determine if there are reverse-scored items. If no reverse-scored items, delete this syntax.

*STEP 7A: RECODING SYSMIS (PARTICIPANTS THAT MISSED THE ASSESSMENT).
*This will use the STAT variable to recode all SYSMIS data. CHANGE THE STAT VARIABLE TO MATCH THE ASSESSMENT WAVE YOU ARE WORKING IN.
*Include full list of numeric variables (including new reverse-scored items).
DO IF MISSING(FD3OSTAT).
DO REPEAT x = FQ3OAPQ01 TO FQ3OAPQ29.
RECODE FD3OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.

*STEP 8: STANDARDIZING DECIMAL PLACES (CANNOT INCLUDE TEXT/STRING VARIABLES).
*Making all variables have the same number of decimal places. Ensure that variables include all new reverse-scored variables. Change the number AFTER the decimal place as needed.
FORMATS FQ3OAPQ01 to FQ3OAPQ29 (F8.0).
EXECUTE.

*STEP 9: CREATING VARIABLE LABLES.
*Label all variables. Use the original questionnaire to include the exact text that participants saw. Include the questionnaire name and number at the end of the label.
VARIABLE LABELS  ID 'Participant ID'.
EXECUTE.

VARIABLE LABELS 
FQ3OAPQ01 'You have a friendly talk with your child. [FQ3OAPQ01]'
FQ3OAPQ02 'You let your child know when he/she is doing a good job with something. [FQ3OAPQ02]'
FQ3OAPQ03 'You threaten to punish your child and then do not actually punish him/her. FQ3OAPQ03]'
FQ3OAPQ04 'You volunteer to help with special activities that your child is involved in. [FQ3OAPQ04]'
FQ3OAPQ06 'You play games or do other fun things with your child. [FQ3OAPQ06]'
FQ3OAPQ07 'Your child talks you out of being punished after he/she has done something wrong. [FQ3OAPQ07]'
FQ3OAPQ08 'You ask your child about his/her day. [FQ3OAPQ08]'
FQ3OAPQ09 'You help your child with chores or homework. [FQ3OAPQ09]'
FQ3OAPQ10 'You feel that getting your child to obey you is more trouble than it’s worth. [FQ3OAPQ10]'
FQ3OAPQ11 'You compliment your child when he/she does something well. [FQ3OAPQ11]'
FQ3OAPQ13 'You praise your child if he/she behaves well. [FQ3OAPQ13]'
FQ3OAPQ14 'You hug or kiss your child when he/she has done something well. [FQ3OAPQ14]'
FQ3OAPQ15 'You talk to your child about his/her friends. [FQ3OAPQ15]'
FQ3OAPQ16 'You let your child out of a punishment early (e.g., lift restrictions earlier than you originally said). [FQ3OAPQ16]'
FQ3OAPQ17 'You get so busy that you forget where your child is and what he/she is doing. [FQ3OAPQ17]'
FQ3OAPQ18 'Your child is not punished when he/she has done something wrong. [FQ3OAPQ18]'
FQ3OAPQ20 'You tell your child that you like it when he/she helps around the house. [FQ3OAPQ20]'
FQ3OAPQ22 'The punishment you give your child depends on your mood. [FQ3OAPQ22]'
FQ3OAPQ24 'You spank your child with your hand when he/she has done something wrong. [FQ3OAPQ24]'
FQ3OAPQ25 'You ignore your child when he/she is misbehaving. [FQ3OAPQ25]'
FQ3OAPQ26 'You slap your child when he/she has done something wrong. [FQ3OAPQ26]'
FQ3OAPQ29 'You hit your child with a belt, switch, or other object when he/she has done something wrong. [FQ3OAPQ29]'
FQ3OAPQ30 'You yell or scream at your child when he/she has done something wrong. [FQ3OAPQ30]'
FQ3OAPQ31 'You calmly explain to your child why his/her behavior was wrong when he/she misbehaves. [FQ3OAPQ31]'.
EXECUTE. 

*STEP 10: ADD VALUE LABELS.
*Include missing values like 'Prefer not to Answer' (or something similar) if applicable.
*Include ALL missing value labels (SEE ABOVE FOR FULL LIST).
VALUE LABELS
FQ3OAPQ01 FQ3OAPQ02 FQ3OAPQ03 FQ3OAPQ04 FQ3OAPQ06 FQ3OAPQ07 FQ3OAPQ08 FQ3OAPQ09 
FQ3OAPQ10 FQ3OAPQ11 FQ3OAPQ13 FQ3OAPQ14 FQ3OAPQ15 FQ3OAPQ16 FQ3OAPQ17 FQ3OAPQ18 
FQ3OAPQ20 FQ3OAPQ22 FQ3OAPQ24 FQ3OAPQ25 FQ3OAPQ26 FQ3OAPQ29 FQ3OAPQ30 FQ3OAPQ31
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
1 'Never (1)'
2 'Almost Never (2)'
3 'Sometimes (3)'
4 'Often (4)'
5 'Always (5)'.  
EXECUTE.

**STEP 11: LABELING MISSING VALUES AS MISSING.
**Recoding all negative numbers as missing. If no missing values, delete this syntax.
MISSING VALUES
FQ3OAPQ01 FQ3OAPQ02 FQ3OAPQ03 FQ3OAPQ04 FQ3OAPQ06 FQ3OAPQ07 FQ3OAPQ08 FQ3OAPQ09
FQ3OAPQ10 FQ3OAPQ11 FQ3OAPQ13 FQ3OAPQ14 FQ3OAPQ15 FQ3OAPQ16 FQ3OAPQ17 FQ3OAPQ18
FQ3OAPQ20 FQ3OAPQ22 FQ3OAPQ24 FQ3OAPQ25 FQ3OAPQ26 FQ3OAPQ29 FQ3OAPQ30 FQ3OAPQ31
    (LO THRU -1).
EXECUTE.

*STEP 12: SAVE CLEANED DATA FILE.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OAPQ_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.

*STEP 13: CHECK FREQUENCIES.
*Checking frequencies of all items before creating constructs.
*Include STAT variable here to be sure all missingness was coded correctly.
FREQUENCIES VARIABLES=FD3OSTAT FQ3OAPQ01 FQ3OAPQ02 FQ3OAPQ03 FQ3OAPQ04 FQ3OAPQ06 
FQ3OAPQ07 FQ3OAPQ08 FQ3OAPQ09 FQ3OAPQ10 FQ3OAPQ11 FQ3OAPQ13 FQ3OAPQ14 FQ3OAPQ15 
FQ3OAPQ16 FQ3OAPQ17 FQ3OAPQ18 FQ3OAPQ20 FQ3OAPQ22 FQ3OAPQ24 FQ3OAPQ25 FQ3OAPQ26 
FQ3OAPQ29 FQ3OAPQ30 FQ3OAPQ31
  /ORDER=ANALYSIS.

*STEP 14: CHECK DESCRIPTIVES.
*Checking descriptives for all items before creating constructs.
DESCRIPTIVES VARIABLES=FQ3OAPQ01 FQ3OAPQ02 FQ3OAPQ03 FQ3OAPQ04 FQ3OAPQ06 
FQ3OAPQ07 FQ3OAPQ08 FQ3OAPQ09 FQ3OAPQ10 FQ3OAPQ11 FQ3OAPQ13 FQ3OAPQ14 FQ3OAPQ15 
FQ3OAPQ16 FQ3OAPQ17 FQ3OAPQ18 FQ3OAPQ20 FQ3OAPQ22 FQ3OAPQ24 FQ3OAPQ25 FQ3OAPQ26 
FQ3OAPQ29 FQ3OAPQ30 FQ3OAPQ31
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 15: SAVE CLEANED DATA FILE.
*Sorting the data file by ID and resaving the final file.
*To reorder items, use /KEEP {list all variables in order} -- insert in line after file name.
SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OAPQ_Cleaned.sav'
  /KEEP ID FD3OSTAT FD3ORD FQ3OAPQ01 FQ3OAPQ02 FQ3OAPQ03 FQ3OAPQ04 FQ3OAPQ06 
FQ3OAPQ07 FQ3OAPQ08 FQ3OAPQ09 FQ3OAPQ10 FQ3OAPQ11 FQ3OAPQ13 FQ3OAPQ14 FQ3OAPQ15 
FQ3OAPQ16 FQ3OAPQ17 FQ3OAPQ18 FQ3OAPQ20 FQ3OAPQ22 FQ3OAPQ24 FQ3OAPQ25 FQ3OAPQ26 
FQ3OAPQ29 FQ3OAPQ30 FQ3OAPQ31
  /COMPRESSED.
  EXECUTE.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OAPQ_Cleaned.sav'.

*STEP 16: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE
 OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OAPQ_Cleaned.spv'
 LOCK=NO.

* Encoding: UTF-8.
*STEP 0: NOTES
*ALABAMA PARENTING QUESTIONNAIRE-PRESCHOOL REVISION (APQ-PR).
 
*11-19-21(AZ): Edited and ran syntax for A2.
*12-06-21(AZ): Edited file path for new raw data file and ran syntax for A2. 
*1-13-22(BM): Checked and Edited comment in STEP 5A.
*1-20-22(AAC): CHECKED.
*3-09-22(BM): Updated to match A1 template

*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------.
*STEP 1: OPENING RAW DATA.
*Insert the correct file path and file name. Use syntax to open raw data file.
GET
  FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\DBT Moms R01 Study Time 2 Mother Survey_February 21, 2022_14.34.sav'.

*STEP 2: SAVING QUESTIONNAIRE SPECIFIC RAW DATA. 
*Insert the correct file path and file name. Save this file with only those variables that you need, in the following order; ID, Start Date, Questionnaire Items (i.e., DERS_1 to DERS_36).
SAVE OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ2OAPQ_Cleaned.sav'
  /KEEP 
  FQ2ID 
  STARTDATE
  FQ2APQ_1 TO FQ2APQ_29
  /COMPRESSED.
  EXECUTE.

*STEP 3: OPEN NEW DATA FILE.  
*Insert the correct file path and file name. Open the file you just created and saved so that you are able to clean the data.
GET
  FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ2OAPQ_Cleaned.sav'.

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
RENAME VARIABLE (FQ2ID=ID) (STARTDATE=FQ2OAPQDATE) (FQ2APQ_1 = FQ2OAPQ01) (FQ2APQ_12 = FQ2OAPQ02) (FQ2APQ_13 = FQ2OAPQ03) 
    (FQ2APQ_2 = FQ2OAPQ04) (FQ2APQ_3 = FQ2OAPQ06) (FQ2APQ_14 = FQ2OAPQ07) (FQ2APQ_4 = FQ2OAPQ08) (FQ2APQ_5 = FQ2OAPQ09) 
    (FQ2APQ_15 = FQ2OAPQ10) (FQ2APQ_6 = FQ2OAPQ11) (FQ2APQ_7 = FQ2OAPQ13) (FQ2APQ_8 = FQ2OAPQ14) (FQ2APQ_9 = FQ2OAPQ15) 
    (FQ2APQ_16 = FQ2OAPQ16) (FQ2APQ_17 = FQ2OAPQ17) (FQ2APQ_18 = FQ2OAPQ18) (FQ2APQ_10 = FQ2OAPQ20) (FQ2APQ_19 = FQ2OAPQ22) 
    (FQ2APQ_20 = FQ2OAPQ25) (FQ2APQ_21 = FQ2OAPQ30) (FQ2APQ_11 = FQ2OAPQ31).
EXECUTE.

*Adding Item 24, 26, and 29 from the APQ-PR manual to the data file even though UO do not administer this item.
COMPUTE FQ2OAPQ24 = -41.
EXECUTE.
COMPUTE FQ2OAPQ26 = -41.
EXECUTE.
COMPUTE FQ2OAPQ29 = -41.
EXECUTE.

*Remember to save your data file.
SAVE OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ2OAPQ_Cleaned.sav'.
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
/FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ2OAPQ_Cleaned.sav'
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
COMPUTE DATEDIFF = DATEDIFF(FD2ORD,FQ2OAPQDATE,'days').
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
SAVE OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ2OAPQ_Cleaned.sav'
/DROP
FQ2OAPQDATE
DATEDIFF
DATEDIFF0
f.
EXECUTE.
GET
  FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ2OAPQ_Cleaned.sav'.
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
DO REPEAT x = FQ2OAPQ01 TO FQ2OAPQ29.
RECODE FD2OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.

*STEP 8: STANDARDIZING DECIMAL PLACES (CANNOT INCLUDE TEXT/STRING VARIABLES).
*Making all variables have the same number of decimal places. Ensure that variables include all new reverse-scored variables. Change the number AFTER the decimal place as needed.
FORMATS FQ2OAPQ01 to FQ2OAPQ29 (F8.0).
EXECUTE.

*STEP 9: CREATING VARIABLE LABLES.
*Label all variables. Use the original questionnaire to include the exact text that participants saw. Include the questionnaire name and number at the end of the label.
VARIABLE LABELS  ID 'Participant ID'.
EXECUTE.

VARIABLE LABELS 
FQ2OAPQ01 'You have a friendly talk with your child. [FQ2OAPQ01]'
FQ2OAPQ02 'You let your child know when he/she is doing a good job with something. [FQ2OAPQ02]'
FQ2OAPQ03 'You threaten to punish your child and then do not actually punish him/her. FQ2OAPQ03]'
FQ2OAPQ04 'You volunteer to help with special activities that your child is involved in. [FQ2OAPQ04]'
FQ2OAPQ06 'You play games or do other fun things with your child. [FQ2OAPQ06]'
FQ2OAPQ07 'Your child talks you out of being punished after he/she has done something wrong. [FQ2OAPQ07]'
FQ2OAPQ08 'You ask your child about his/her day. [FQ2OAPQ08]'
FQ2OAPQ09 'You help your child with chores or homework. [FQ2OAPQ09]'
FQ2OAPQ10 'You feel that getting your child to obey you is more trouble than it’s worth. [FQ2OAPQ10]'
FQ2OAPQ11 'You compliment your child when he/she does something well. [FQ2OAPQ11]'
FQ2OAPQ13 'You praise your child if he/she behaves well. [FQ2OAPQ13]'
FQ2OAPQ14 'You hug or kiss your child when he/she has done something well. [FQ2OAPQ14]'
FQ2OAPQ15 'You talk to your child about his/her friends. [FQ2OAPQ15]'
FQ2OAPQ16 'You let your child out of a punishment early (e.g., lift restrictions earlier than you originally said). [FQ2OAPQ16]'
FQ2OAPQ17 'You get so busy that you forget where your child is and what he/she is doing. [FQ2OAPQ17]'
FQ2OAPQ18 'Your child is not punished when he/she has done something wrong. [FQ2OAPQ18]'
FQ2OAPQ20 'You tell your child that you like it when he/she helps around the house. [FQ2OAPQ20]'
FQ2OAPQ22 'The punishment you give your child depends on your mood. [FQ2OAPQ22]'
FQ2OAPQ24 'You spank your child with your hand when he/she has done something wrong. [FQ2OAPQ24]'
FQ2OAPQ25 'You ignore your child when he/she is misbehaving. [FQ2OAPQ25]'
FQ2OAPQ26 'You slap your child when he/she has done something wrong. [FQ2OAPQ26]'
FQ2OAPQ29 'You hit your child with a belt, switch, or other object when he/she has done something wrong. [FQ2OAPQ29]'
FQ2OAPQ30 'You yell or scream at your child when he/she has done something wrong. [FQ2OAPQ30]'
FQ2OAPQ31 'You calmly explain to your child why his/her behavior was wrong when he/she misbehaves. [FQ2OAPQ31]'.
EXECUTE. 

*STEP 10: ADD VALUE LABELS.
*Include missing values like 'Prefer not to Answer' (or something similar) if applicable.
*Include ALL missing value labels (SEE ABOVE FOR FULL LIST).
VALUE LABELS
FQ2OAPQ01 FQ2OAPQ02 FQ2OAPQ03 FQ2OAPQ04 FQ2OAPQ06 FQ2OAPQ07 FQ2OAPQ08 FQ2OAPQ09 
FQ2OAPQ10 FQ2OAPQ11 FQ2OAPQ13 FQ2OAPQ14 FQ2OAPQ15 FQ2OAPQ16 FQ2OAPQ17 FQ2OAPQ18 
FQ2OAPQ20 FQ2OAPQ22 FQ2OAPQ24 FQ2OAPQ25 FQ2OAPQ26 FQ2OAPQ29 FQ2OAPQ30 FQ2OAPQ31
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
1 'Never (1)'
2 'Almost Never (2)'
3 'Sometimes (3)'
4 'Often (4)'
5 'Always (5)'.  
EXECUTE.

**STEP 11: LABELING MISSING VALUES AS MISSING.
**Recoding all negative numbers as missing. If no missing values, delete this syntax.
MISSING VALUES
FQ2OAPQ01 FQ2OAPQ02 FQ2OAPQ03 FQ2OAPQ04 FQ2OAPQ06 FQ2OAPQ07 FQ2OAPQ08 FQ2OAPQ09
FQ2OAPQ10 FQ2OAPQ11 FQ2OAPQ13 FQ2OAPQ14 FQ2OAPQ15 FQ2OAPQ16 FQ2OAPQ17 FQ2OAPQ18
FQ2OAPQ20 FQ2OAPQ22 FQ2OAPQ24 FQ2OAPQ25 FQ2OAPQ26 FQ2OAPQ29 FQ2OAPQ30 FQ2OAPQ31
    (LO THRU -1).
EXECUTE.

*STEP 12: SAVE CLEANED DATA FILE.
SAVE OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ2OAPQ_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.

*STEP 13: CHECK FREQUENCIES.
*Checking frequencies of all items before creating constructs.
*Include STAT variable here to be sure all missingness was coded correctly.
FREQUENCIES VARIABLES=FD2OSTAT FQ2OAPQ01 FQ2OAPQ02 FQ2OAPQ03 FQ2OAPQ04 FQ2OAPQ06 
FQ2OAPQ07 FQ2OAPQ08 FQ2OAPQ09 FQ2OAPQ10 FQ2OAPQ11 FQ2OAPQ13 FQ2OAPQ14 FQ2OAPQ15 
FQ2OAPQ16 FQ2OAPQ17 FQ2OAPQ18 FQ2OAPQ20 FQ2OAPQ22 FQ2OAPQ24 FQ2OAPQ25 FQ2OAPQ26 
FQ2OAPQ29 FQ2OAPQ30 FQ2OAPQ31
  /ORDER=ANALYSIS.

*STEP 14: CHECK DESCRIPTIVES.
*Checking descriptives for all items before creating constructs.
DESCRIPTIVES VARIABLES=FQ2OAPQ01 FQ2OAPQ02 FQ2OAPQ03 FQ2OAPQ04 FQ2OAPQ06 
FQ2OAPQ07 FQ2OAPQ08 FQ2OAPQ09 FQ2OAPQ10 FQ2OAPQ11 FQ2OAPQ13 FQ2OAPQ14 FQ2OAPQ15 
FQ2OAPQ16 FQ2OAPQ17 FQ2OAPQ18 FQ2OAPQ20 FQ2OAPQ22 FQ2OAPQ24 FQ2OAPQ25 FQ2OAPQ26 
FQ2OAPQ29 FQ2OAPQ30 FQ2OAPQ31
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 15: SAVE CLEANED DATA FILE.
*Sorting the data file by ID and resaving the final file.
*To reorder items, use /KEEP {list all variables in order} -- insert in line after file name.
SORT CASES BY ID(A).
SAVE OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ2OAPQ_Cleaned.sav'
  /KEEP ID FD2OSTAT FD2ORD FQ2OAPQ01 FQ2OAPQ02 FQ2OAPQ03 FQ2OAPQ04 FQ2OAPQ06 
FQ2OAPQ07 FQ2OAPQ08 FQ2OAPQ09 FQ2OAPQ10 FQ2OAPQ11 FQ2OAPQ13 FQ2OAPQ14 FQ2OAPQ15 
FQ2OAPQ16 FQ2OAPQ17 FQ2OAPQ18 FQ2OAPQ20 FQ2OAPQ22 FQ2OAPQ24 FQ2OAPQ25 FQ2OAPQ26 
FQ2OAPQ29 FQ2OAPQ30 FQ2OAPQ31
  /COMPRESSED.
  EXECUTE.
GET
  FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ2OAPQ_Cleaned.sav'.

*STEP 16: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE
 OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ2OAPQ_Cleaned.spv'
 LOCK=NO.

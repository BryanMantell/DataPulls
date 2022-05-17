* Encoding: UTF-8.
*STEP 0: NOTES
*ALABAMA PARENTING QUESTIONNAIRE-PRESCHOOL REVISION (APQ-PR).
 
*07-20-21(JL): Adapting template for APQ-PR.
*07-23-21(JL): Edited text of notes and syntax for STEPS 6,10,11.
*09-03-21 (JL): Edited syntax STEP 1 since new raw data file, STEPS 5-14 since items were administered to participants by scale instead of the order presented in the original measure.
*09-04-21 (AZ): Edited syntax to match UO
*09-14-21(AZ): Continued to edit syntax to match UO - mainly steps 5 and 9
*10-04-21(AAC): Added a space for consistency in one item label
*11-10-21(AZ): Edited syntax to include new Steps (end of 5d, 5A, 7A, 10b, 11, 13ab, 15da)
*11-10-21(AAC): Checked. Added comment from BM for date discrepancies in 5A. Updated full list of missing codes in STEP 6. 
*12-13-21(AAC): Small changes to comments in STEP 11
*02-02-22(BM): Readapted everything becuase of item numbering issue
*02-03-22(BM): Added missing items    
*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------.
*STEP 1: OPENING RAW DATA.
*Insert the correct file path and file name. Use syntax to open raw data file.
GET
  FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\DBT Moms R01 Study Time 1 Mother Survey_January 28, 2022_13.11.sav'.

*STEP 2: SAVING QUESTIONNAIRE SPECIFIC RAW DATA. 
*Insert the correct file path and file name. Save this file with only those variables that you need, in the following order; ID, Start Date, Questionnaire Items (i.e., DERS_1 to DERS_36).
SAVE OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ1OAPQ_Cleaned.sav'
  /KEEP FQ1ID STARTDATE FQ1APQ_1 FQ1APQ_12 FQ1APQ_13 FQ1APQ_2 FQ1APQ_3 FQ1APQ_14 FQ1APQ_4 
  FQ1APQ_5 FQ1APQ_15 FQ1APQ_6 FQ1APQ_7 FQ1APQ_8 FQ1APQ_9 FQ1APQ_16 FQ1APQ_17 FQ1APQ_18 
  FQ1APQ_10 FQ1APQ_19 FQ1APQ_20 FQ1APQ_21 FQ1APQ_11
  /COMPRESSED.
  EXECUTE.

*STEP 3: OPEN NEW DATA FILE.  
*Insert the correct file path and file name. Open the file you just created and saved so that you are able to clean the data.
GET
  FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ1OAPQ_Cleaned.sav'.

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
RENAME VARIABLE (FQ1ID=ID) (STARTDATE=FQ1OAPQDATE) (FQ1APQ_1 = FQ1OAPQ01) (FQ1APQ_12 = FQ1OAPQ02) (FQ1APQ_13 = FQ1OAPQ03) 
    (FQ1APQ_2 = FQ1OAPQ04) (FQ1APQ_3 = FQ1OAPQ06) (FQ1APQ_14 = FQ1OAPQ07) (FQ1APQ_4 = FQ1OAPQ08) (FQ1APQ_5 = FQ1OAPQ09) 
    (FQ1APQ_15 = FQ1OAPQ10) (FQ1APQ_6 = FQ1OAPQ11) (FQ1APQ_7 = FQ1OAPQ13) (FQ1APQ_8 = FQ1OAPQ14) (FQ1APQ_9 = FQ1OAPQ15) 
    (FQ1APQ_16 = FQ1OAPQ16) (FQ1APQ_17 = FQ1OAPQ17) (FQ1APQ_18 = FQ1OAPQ18) (FQ1APQ_10 = FQ1OAPQ20) (FQ1APQ_19 = FQ1OAPQ22) 
    (FQ1APQ_20 = FQ1OAPQ25) (FQ1APQ_21 = FQ1OAPQ30) (FQ1APQ_11 = FQ1OAPQ31).
EXECUTE.

*Adding Item 24, 26, and 29 from the APQ-PR manual to the data file even though UO do not administer this item.
COMPUTE FQ1OAPQ24 = -41.
EXECUTE.
COMPUTE FQ1OAPQ26 = -41.
EXECUTE.
COMPUTE FQ1OAPQ29 = -41.
EXECUTE.

*Remember to save your data file.
SAVE OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ1OAPQ_Cleaned.sav'.
EXECUTE.

*STEP 5A: MERGING FINAL ID FILE WITH CURRENT DATA FILE.
*This will ensure that all files have the correct # of enrolled and eligible IDs (Pitt=90; UO=88). Any missingness should be investigated (should they be missing?) and
labeled in STEP XX using information from the status (STAT) variable. If the status variable does not 'tell the whole story' (i.e., visit occurred but data is missing),
missingness should be labeled by ID using syntax and notes in the syntax should provide information to justify the missing code.
*When using the syntax include which variables you want to DROP from the Assessment Summary file -- THE FULL LIST OF VARIABLES IS BELOW -- 
You should retain the real date (RD) and status (STAT) for the wave you are using (example below is A1; FD1PRD FD1PSTAT are REMOVED so that they are NOT dropped from the file):
FD0PSTAT FD0PRD
FD1PSTAT FD1PTD FD1PRD FD1PDIFF
FD2PSTAT FD2PTD FD2PRD FD2PDIFF
FD3PSTAT FD3PTD FD3PRD FD3PDIFF
FD4PSTAT FD4PTD FD4PRD FD4PDIFF
FD4APSTAT FD4APTD FD4APRD FD4APDIFF
FD0PMD 
GD0PTRFSTAT GD0PTRFRD GD2PTRFRD GD3PTRFRD GD4PTRFSTAT GD4PTRFRD GD5PTRFSTAT GD5PTRFRD
GD0PTRFINF GD2PTRFINF GD3PTRFINF GD4PTRFINF GD5PTRFINF.
MATCH FILES
/FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FD0OACS_Cleaned.sav'
/IN=f
/FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ1OAPQ_Cleaned.sav'
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
COMPUTE DATEDIFF= DATEDIFF(FD1ORD,FQ1OAPQDATE,'days').
EXECUTE.
COUNT DATEDIFF0=DATEDIFF(Lowest thru -1) DATEDIFF(1 thru Highest).
EXECUTE.
FREQUENCIES VARIABLES=DATEDIFF0
  /ORDER=ANALYSIS.
SORT CASES BY DATEDIFF0(D).
*CHECK ALL IDS WITH DISCREPANT DATES TO DETERMINE WHAT IS CORRECT. CONSULT BEFORE MAKING ANY CHANGES TO RAW DATA IN REDCAP OR QUALTRICS.
*INCLUDE NOTES HERE FOR EACH ID THAT WAS DISCREPANT
*THE FOLLOWING IDs (10564,10609,10775,10924,11111,11430,11939) HAVE A A1 QUALTRICS DATE [FQ1OAPQDATE] THAT DOES NOT MATCH THEIR A1 VISIT DATE [FD1PRD].
*(All date discrepancies are less than 7 days and in all instances participant just finished Qualtrics survey a few days after survey was sent)
(FD1PRD will be used for these IDs, no changes will be made to raw data in qualtrics or redcap)
10564 FD1PRD:11/27/20 FQ1OAPQDATE:11/24/20
10609 FD1PRD:12/04/20 FQ1OAPQDATE:12/03/20
10775 FD1PRD:01/29/21 FQ1OAPQDATE: 01/27/21
10924 FD1PRD:04/23/21 FQ1OAPQDATE:04/19/21
11111 FD1PRD:04/18/21 FQ1OAPQDATE:04/13/21
11430 FD1PRD:11/23/20 FQ1OAPQDATE:11/16/20
11939 FD1PRD:04/16/21 FQ1OAPQDATE:04/13/21.
*THIS WAS INVESTIGATED BY STAFF (JL: 12-10-21) AND VISIT DATE [FD1PRD] WAS CONFIRMED USING MULTIPLE SOURCES.
SORT CASES BY ID(A).
*DROPPING VARIABLES THAT ARE NO LONGER RELEVANT TO FINAL DATA FILE.
SAVE OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ1OAPQ_Cleaned.sav'
/DROP
FQ1OAPQDATE
DATEDIFF
DATEDIFF0
f.
EXECUTE.
GET
  FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ1OAPQ_Cleaned.sav'.
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
**CHECKED AND NOT NEEDED.
    
**STEP 7 (DELETE IF NOT NEEDED): CREATING NEW VARIABLES FOR REVERSED SCORED ITEMS.
**Reverse-Scored Items; see scoring document to determine if there are reverse-scored items. If no reverse-scored items, delete this syntax.
**CHECKED AND NOT NEEDED.

*STEP 7A: RECODING SYSMIS (PARTICIPANTS THAT MISSED THE ASSESSMENT).
*This will use the STAT variable to recode all SYSMIS data. CHANGE THE STAT VARIABLE TO MATCH THE ASSESSMENT WAVE YOU ARE WORKING IN.
*Include full list of numeric variables (including new reverse-scored items).
DO IF MISSING(FD1OSTAT).
DO REPEAT x = FQ1OAPQ01 TO FQ1OAPQ29.
RECODE FD1OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.

*STEP 8: STANDARDIZING DECIMAL PLACES (CANNOT INCLUDE TEXT/STRING VARIABLES).
*Making all variables have the same number of decimal places. Ensure that variables include all new reverse-scored variables. Change the number AFTER the decimal place as needed.
FORMATS FQ1OAPQ01 to FQ1OAPQ29 (F8.0).
EXECUTE.

*STEP 9: CREATING VARIABLE LABLES.
*Label all variables. Use the original questionnaire to include the exact text that participants saw. Include the questionnaire name and number at the end of the label.
VARIABLE LABELS  ID 'Participant ID'.
EXECUTE.

VARIABLE LABELS 
FQ1OAPQ01 'You have a friendly talk with your child. [FQ1OAPQ01]'
FQ1OAPQ02 'You let your child know when he/she is doing a good job with something. [FQ1OAPQ02]'
FQ1OAPQ03 'You threaten to punish your child and then do not actually punish him/her. FQ1OAPQ03]'
FQ1OAPQ04 'You volunteer to help with special activities that your child is involved in. [FQ1OAPQ04]'
FQ1OAPQ06 'You play games or do other fun things with your child. [FQ1OAPQ06]'
FQ1OAPQ07 'Your child talks you out of being punished after he/she has done something wrong. [FQ1OAPQ07]'
FQ1OAPQ08 'You ask your child about his/her day. [FQ1OAPQ08]'
FQ1OAPQ09 'You help your child with chores or homework. [FQ1OAPQ09]'
FQ1OAPQ10 'You feel that getting your child to obey you is more trouble than it’s worth. [FQ1OAPQ10]'
FQ1OAPQ11 'You compliment your child when he/she does something well. [FQ1OAPQ11]'
FQ1OAPQ13 'You praise your child if he/she behaves well. [FQ1OAPQ13]'
FQ1OAPQ14 'You hug or kiss your child when he/she has done something well. [FQ1OAPQ14]'
FQ1OAPQ15 'You talk to your child about his/her friends. [FQ1OAPQ15]'
FQ1OAPQ16 'You let your child out of a punishment early (e.g., lift restrictions earlier than you originally said). [FQ1OAPQ16]'
FQ1OAPQ17 'You get so busy that you forget where your child is and what he/she is doing. [FQ1OAPQ17]'
FQ1OAPQ18 'Your child is not punished when he/she has done something wrong. [FQ1OAPQ18]'
FQ1OAPQ20 'You tell your child that you like it when he/she helps around the house. [FQ1OAPQ20]'
FQ1OAPQ22 'The punishment you give your child depends on your mood. [FQ1OAPQ22]'
FQ1OAPQ24 'You spank your child with your hand when he/she has done something wrong. [FQ1OAPQ24]'
FQ1OAPQ25 'You ignore your child when he/she is misbehaving. [FQ1OAPQ25]'
FQ1OAPQ26 'You slap your child when he/she has done something wrong. [FQ1OAPQ26]'
FQ1OAPQ29 'You hit your child with a belt, switch, or other object when he/she has done something wrong. [FQ1OAPQ29]'
FQ1OAPQ30 'You yell or scream at your child when he/she has done something wrong. [FQ1OAPQ30]'
FQ1OAPQ31 'You calmly explain to your child why his/her behavior was wrong when he/she misbehaves. [FQ1OAPQ31]'.
EXECUTE. 

*STEP 10: ADD VALUE LABELS.
*Include missing values like 'Prefer not to Answer' (or something similar) if applicable.
*Include ALL missing value labels (SEE ABOVE FOR FULL LIST).
VALUE LABELS
FQ1OAPQ01 FQ1OAPQ02 FQ1OAPQ03 FQ1OAPQ04 FQ1OAPQ06 FQ1OAPQ07 FQ1OAPQ08 FQ1OAPQ09 
FQ1OAPQ10 FQ1OAPQ11 FQ1OAPQ13 FQ1OAPQ14 FQ1OAPQ15 FQ1OAPQ16 FQ1OAPQ17 FQ1OAPQ18 
FQ1OAPQ20 FQ1OAPQ22 FQ1OAPQ24 FQ1OAPQ25 FQ1OAPQ26 FQ1OAPQ29 FQ1OAPQ30 FQ1OAPQ31
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
FQ1OAPQ01 FQ1OAPQ02 FQ1OAPQ03 FQ1OAPQ04 FQ1OAPQ06 FQ1OAPQ07 FQ1OAPQ08 FQ1OAPQ09
FQ1OAPQ10 FQ1OAPQ11 FQ1OAPQ13 FQ1OAPQ14 FQ1OAPQ15 FQ1OAPQ16 FQ1OAPQ17 FQ1OAPQ18
FQ1OAPQ20 FQ1OAPQ22 FQ1OAPQ24 FQ1OAPQ25 FQ1OAPQ26 FQ1OAPQ29 FQ1OAPQ30 FQ1OAPQ31
    (LO THRU -1).
EXECUTE.

*STEP 12: SAVE CLEANED DATA FILE.
SAVE OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ1OAPQ_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.

*STEP 13: CHECK FREQUENCIES.
*Checking frequencies of all items before creating constructs.
*Include STAT variable here to be sure all missingness was coded correctly.
FREQUENCIES VARIABLES=FD1OSTAT FQ1OAPQ01 FQ1OAPQ02 FQ1OAPQ03 FQ1OAPQ04 FQ1OAPQ06 
FQ1OAPQ07 FQ1OAPQ08 FQ1OAPQ09 FQ1OAPQ10 FQ1OAPQ11 FQ1OAPQ13 FQ1OAPQ14 FQ1OAPQ15 
FQ1OAPQ16 FQ1OAPQ17 FQ1OAPQ18 FQ1OAPQ20 FQ1OAPQ22 FQ1OAPQ24 FQ1OAPQ25 FQ1OAPQ26 
FQ1OAPQ29 FQ1OAPQ30 FQ1OAPQ31
  /ORDER=ANALYSIS.

*STEP 14: CHECK DESCRIPTIVES.
*Checking descriptives for all items before creating constructs.
DESCRIPTIVES VARIABLES=FQ1OAPQ01 FQ1OAPQ02 FQ1OAPQ03 FQ1OAPQ04 FQ1OAPQ06 
FQ1OAPQ07 FQ1OAPQ08 FQ1OAPQ09 FQ1OAPQ10 FQ1OAPQ11 FQ1OAPQ13 FQ1OAPQ14 FQ1OAPQ15 
FQ1OAPQ16 FQ1OAPQ17 FQ1OAPQ18 FQ1OAPQ20 FQ1OAPQ22 FQ1OAPQ24 FQ1OAPQ25 FQ1OAPQ26 
FQ1OAPQ29 FQ1OAPQ30 FQ1OAPQ31
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 15: SAVE CLEANED DATA FILE.
*Sorting the data file by ID and resaving the final file.
*To reorder items, use /KEEP {list all variables in order} -- insert in line after file name.
SORT CASES BY ID(A).
SAVE OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ1OAPQ_Cleaned.sav'
  /KEEP ID FD1OSTAT FD1ORD FQ1OAPQ01 FQ1OAPQ02 FQ1OAPQ03 FQ1OAPQ04 FQ1OAPQ06 
FQ1OAPQ07 FQ1OAPQ08 FQ1OAPQ09 FQ1OAPQ10 FQ1OAPQ11 FQ1OAPQ13 FQ1OAPQ14 FQ1OAPQ15 
FQ1OAPQ16 FQ1OAPQ17 FQ1OAPQ18 FQ1OAPQ20 FQ1OAPQ22 FQ1OAPQ24 FQ1OAPQ25 FQ1OAPQ26 
FQ1OAPQ29 FQ1OAPQ30 FQ1OAPQ31
  /COMPRESSED.
  EXECUTE.
GET
  FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ1OAPQ_Cleaned.sav'.

*STEP 16: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE
 OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ1OAPQ_Cleaned.spv'
 LOCK=NO.

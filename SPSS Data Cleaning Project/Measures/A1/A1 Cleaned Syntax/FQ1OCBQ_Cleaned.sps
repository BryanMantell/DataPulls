* Encoding: UTF-8.
*STEP 0: NOTES
*CHILD BEHAVIOR QUESTIONNAIRE-VERY SHORT FORM (CBQ-VSF). 
 
*07-19-21 (AZ): Completed STEPS 1-6.
*07-20-21 (AZ): Deleted STEP 7 - no reverse scores, Completed STEPS 8-16.
*07-21-21 (AZ): Deleted STEP 6 because the file doesn't need to be recoded. Added (NA) 8 as SYSMIS in STEP 11.
*08-02-21 (AZ): Edited STEPS 7, 10, 11.
*08-03-21 (AAC): Deleted extraneous information in coding in STEP 10.
*08-10-21 (AAC): Small edits (typos, etc.)
*08-11-21 (AAC): Fixed missing value label in STEP 10
*11-10-21 (AZ): Edited syntax to include new Steps (end of 5d, 5A, 7A, 10b, 11, 13ab, 15da)
*11-10-21(AAC): Checked. Added comment from BM for date discrepancies in 5A. Updated full list of missing codes in STEP 6.
*03-14-22(AAC): Updated reverse scored items.
*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------.
*STEP 1: OPENING RAW DATA.
*Insert the correct file path and file name. Use syntax to open raw data file.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/DBT Moms R01 Study Time 1 Mother Survey_November 10, 2021_12.48.sav'.

*STEP 2: SAVING QUESTIONNAIRE SPECIFIC RAW DATA. 
*Insert the correct file path and file name. Save this file with only those variables that you need, in the following order; ID, STARTDATE, CBQ01 to CBQ36.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OCBQ_Cleaned.sav'
  /KEEP 
  FQ1ID 
  STARTDATE
  FQ1CBQ_1 TO FQ1CBQ_36
  /COMPRESSED.
  EXECUTE.

*STEP 3: OPEN NEW DATA FILE.  
*Insert the correct file path and file name. Open the file you just created and saved so that you are able to clean the data.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OCBQ_Cleaned.sav'.

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
RENAME VARIABLE (STARTDATE=FQ1OCBQDATE).
EXECUTE.
RENAME VARIABLE (FQ1CBQ_1 = FQ1OCBQ01) (FQ1CBQ_2 = FQ1OCBQ02) (FQ1CBQ_3 = FQ1OCBQ03) (FQ1CBQ_4 = FQ1OCBQ04) (FQ1CBQ_5 = FQ1OCBQ05) (FQ1CBQ_6 = FQ1OCBQ06).
EXECUTE.
RENAME VARIABLE (FQ1CBQ_7 = FQ1OCBQ07) (FQ1CBQ_8 = FQ1OCBQ08) (FQ1CBQ_9 = FQ1OCBQ09) (FQ1CBQ_10 = FQ1OCBQ10) (FQ1CBQ_11 = FQ1OCBQ11) (FQ1CBQ_12 = FQ1OCBQ12).
EXECUTE.
RENAME VARIABLE (FQ1CBQ_13 = FQ1OCBQ13) (FQ1CBQ_14 = FQ1OCBQ14) (FQ1CBQ_15 = FQ1OCBQ15) (FQ1CBQ_16 = FQ1OCBQ16) (FQ1CBQ_17 = FQ1OCBQ17) (FQ1CBQ_18 = FQ1OCBQ18).
EXECUTE.  
RENAME VARIABLE (FQ1CBQ_19 = FQ1OCBQ19) (FQ1CBQ_20 = FQ1OCBQ20) (FQ1CBQ_21 = FQ1OCBQ21) (FQ1CBQ_22 = FQ1OCBQ22) (FQ1CBQ_23 = FQ1OCBQ23) (FQ1CBQ_24 = FQ1OCBQ24).
EXECUTE. 
RENAME VARIABLE (FQ1CBQ_25 = FQ1OCBQ25) (FQ1CBQ_26 = FQ1OCBQ26) (FQ1CBQ_27 = FQ1OCBQ27) (FQ1CBQ_28 = FQ1OCBQ28) (FQ1CBQ_29 = FQ1OCBQ29) (FQ1CBQ_30 = FQ1OCBQ30).
EXECUTE.
RENAME VARIABLE (FQ1CBQ_31 = FQ1OCBQ31) (FQ1CBQ_32 = FQ1OCBQ32) (FQ1CBQ_33 = FQ1OCBQ33) (FQ1CBQ_34 = FQ1OCBQ34) (FQ1CBQ_35 = FQ1OCBQ35) (FQ1CBQ_36 = FQ1OCBQ36).
EXECUTE.
*Remember to save your data file.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OCBQ_Cleaned.sav'.
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
/FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OCBQ_Cleaned.sav'
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
COMPUTE DATEDIFF = DATEDIFF(FD1ORD,FQ1OCBQDATE,'days').
EXECUTE.
COUNT DATEDIFF0=DATEDIFF(Lowest thru -1) DATEDIFF(1 thru Highest).
EXECUTE.
FREQUENCIES VARIABLES=DATEDIFF0
  /ORDER=ANALYSIS.
SORT CASES BY DATEDIFF0(D).
*CHECK ALL IDS WITH DISCREPANT DATES TO DETERMINE WHAT IS CORRECT. CONSULT BEFORE MAKING ANY CHANGES TO RAW DATA IN REDCAP OR QUALTRICS.
*INCLUDE NOTES HERE FOR EACH ID THAT WAS DISCREPANT (EXAMPLE BELOW - ADAPT AS NEEDED)
*THE FOLLOWING IDs (90210, 90331, and 90800) HAVE A A1 QUALTRICS DATE [FQ1OCBQDATE] THAT DOES NOT MATCH THEIR A1 VISIT DATE [FD1ORD].
*THIS WAS INVESTIGATED BY STAFF (BM: 10-29-21) AND VISIT DATE [FD1ORD] WAS CONFIRMED USING MULTIPLE SOURCES.
SORT CASES BY ID(A).
*DROPPING VARIABLES THAT ARE NO LONGER RELEVANT TO FINAL DATA FILE.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OCBQ_Cleaned.sav'
/DROP
FQ1OCBQDATE
DATEDIFF
DATEDIFF0
f.
EXECUTE.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OCBQ_Cleaned.sav'.
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
**-11 'Participant (parent or child) deceased'                                  /* (Participant (parent or child) deceased) */
**-10 'Prefer not to answer'                                                           /* (Participant selected prefer not to answer) */.
RECODE FQ1OCBQ01 to FQ1OCBQ36 
    (8=-21)
    (9=-10).
EXECUTE.

**STEP 7 (DELETE IF NOT NEEDED): CREATING NEW VARIABLES FOR REVERSED SCORED ITEMS.
**Reverse-Scored Items; see scoring document to determine if there are reverse-scored items. If no reverse-scored items, delete this syntax.
RECODE FQ1OCBQ13 (1=7) (2=6) (3=5) (4=4) (5=3) (6=2) (7=1) (-10=-10) (-21 = -21) INTO FQ1OCBQ13R.
EXECUTE.
RECODE FQ1OCBQ19 (1=7) (2=6) (3=5) (4=4) (5=3) (6=2) (7=1) (-10=-10) (-21 = -21) INTO FQ1OCBQ19R.
EXECUTE.
RECODE FQ1OCBQ20 (1=7) (2=6) (3=5) (4=4) (5=3) (6=2) (7=1) (-10=-10) (-21 = -21) INTO FQ1OCBQ20R.
EXECUTE.
RECODE FQ1OCBQ22 (1=7) (2=6) (3=5) (4=4) (5=3) (6=2) (7=1) (-10=-10) (-21 = -21) INTO FQ1OCBQ22R.
EXECUTE.
RECODE FQ1OCBQ26 (1=7) (2=6) (3=5) (4=4) (5=3) (6=2) (7=1) (-10=-10) (-21 = -21) INTO FQ1OCBQ26R.
EXECUTE.
RECODE FQ1OCBQ29 (1=7) (2=6) (3=5) (4=4) (5=3) (6=2) (7=1) (-10=-10) (-21 = -21) INTO FQ1OCBQ29R.
EXECUTE.
RECODE FQ1OCBQ31 (1=7) (2=6) (3=5) (4=4) (5=3) (6=2) (7=1) (-10=-10) (-21 = -21) INTO FQ1OCBQ31R.
EXECUTE.
RECODE FQ1OCBQ34 (1=7) (2=6) (3=5) (4=4) (5=3) (6=2) (7=1) (-10=-10) (-21 = -21) INTO FQ1OCBQ34R.
EXECUTE.


*STEP 7A: RECODING SYSMIS (PARTICIPANTS THAT MISSED THE ASSESSMENT).
*This will use the STAT variable to recode all SYSMIS data. CHANGE THE STAT VARIABLE TO MATCH THE ASSESSMENT WAVE YOU ARE WORKING IN.
*Include full list of numeric variables (including new reverse-scored items).
DO IF MISSING(FD1OSTAT).
DO REPEAT x = FQ1OCBQ01 TO FQ1OCBQ34R.
RECODE FD1OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.

*STEP 8: STANDARDIZING DECIMAL PLACES (CANNOT INCLUDE TEXT/STRING VARIABLES).
*Making all variables have the same number of decimal places. Ensure that variables include all new reverse-scored variables. Change the number AFTER the decimal place as needed.
FORMATS FQ1OCBQ01 to FQ1OCBQ34R (F8.0).
EXECUTE.

*STEP 9: CREATING VARIABLE LABLES.
*Label all variables. Use the original questionnaire to include the exact text that participants saw. Include the questionnaire name and number at the end of the label.
VARIABLE LABELS  ID 'Participant ID'.
EXECUTE.

VARIABLE LABELS 
FQ1OCBQ01 'Seems always in a big hurry to get from one place to another. [FQ1OCBQ01]'
FQ1OCBQ02 'Gets quite frustrated when prevented from doing something s/he wants to do. [FQ1OCBQ02]'
FQ1OCBQ03 'When drawing or coloring in a book, shows strong concentration. [FQ1OCBQ03]'
FQ1OCBQ04 'Likes going down high slides or other adventurous activities. [FQ1OCBQ04]'
FQ1OCBQ05 'Is quite upset by a little cut or bruise. [FQ1OCBQ05]'
FQ1OCBQ06 'Prepares for trips and outings by planning things s/he will need. [FQ1OCBQ06]'
FQ1OCBQ07 'Often rushes into new situations. [FQ1OCBQ07]'
FQ1OCBQ08 'Tends to become sad if the familys plans dont work out. [FQ1OCBQ08]'
FQ1OCBQ09 'Likes being sung to. [FQ1OCBQ09]'
FQ1OCBQ10 'Seems to be at ease with almost any person. [FQ1OCBQ10]'
FQ1OCBQ11 'Is afraid of burglars or the boogie man. [FQ1OCBQ11]'
FQ1OCBQ12 'Notices it when parents are wearing new clothing. [FQ1OCBQ12]'
FQ1OCBQ13 'Prefers quiet activities to active games. FQ1OCBQ13]'
FQ1OCBQ14 'When angry about something, s/he tends to stay upset for ten minutes or longer. [FQ1OCBQ14]'
FQ1OCBQ15 'When building or putting something together, becomes very involved in what s/he is doing, and works for long periods. [FQ1OCBQ15]'
FQ1OCBQ16 'Likes to go high and fast when pushed on a swing. [FQ1OCBQ16]'
FQ1OCBQ17 'Seems to feel depressed when unable to accomplish some task. [FQ1OCBQ17]'
FQ1OCBQ18 'Is good at following instructions. [FQ1OCBQ18]'
FQ1OCBQ19 'Takes a long time in approaching new situations. [FQ1OCBQ19]'
FQ1OCBQ20 'Hardly ever complains when ill with a cold. [FQ1OCBQ20]'
FQ1OCBQ21 'Likes the sound of words, such as nursery rhymes. [FQ1OCBQ21]'
FQ1OCBQ22 'Is sometimes shy even around people s/he has known a long time. [FQ1OCBQ22]'
FQ1OCBQ23 'Is very difficult to soothe when s/he has become upset. [FQ1OCBQ23]'
FQ1OCBQ24 'Is quickly aware of some new item in the living room. [FQ1OCBQ24]'
FQ1OCBQ25 'Is full of energy, even in the evening. [FQ1OCBQ25]'
FQ1OCBQ26 'Is not afraid of the dark. [FQ1OCBQ26]'
FQ1OCBQ27 'Sometimes becomes absorbed in a picture book and looks at it for a long time. [FQ1OCBQ27]'
FQ1OCBQ28 'Likes rough and rowdy games. [FQ1OCBQ28]'
FQ1OCBQ29 'Is not very upset at minor cuts or bruises. [FQ1OCBQ29]'
FQ1OCBQ30 'Approaches places s/he has been told are dangerous slowly and cautiously. [FQ1OCBQ30]'
FQ1OCBQ31 'Is slow and unhurried in deciding what to do next. [FQ1OCBQ31]'
FQ1OCBQ32 'Gets angry when s/he cant find something s/he wants to play with. [FQ1OCBQ32]'
FQ1OCBQ33 'Enjoys gentle rhythmic activities such as rocking or swaying. [FQ1OCBQ33]'
FQ1OCBQ34 'Sometimes turns away shyly from new acquaintances. [FQ1OCBQ34]'
FQ1OCBQ35 'Becomes upset when loved relatives or friends are getting ready to leave following a visit. [FQ1OCBQ35]'
FQ1OCBQ36 'Comments when a parent has changed his/her appearance. [FQ1OCBQ36]'
FQ1OCBQ13R 'Prefers quiet activities to active games. FQ1OCBQ13R]'
FQ1OCBQ19R 'Takes a long time in approaching new situations. [FQ1OCBQ19R]'
FQ1OCBQ20R 'Hardly ever complains when ill with a cold. [FQ1OCBQ20R]'
FQ1OCBQ22R 'Is sometimes shy even around people s/he has known a long time. [FQ1OCBQ22R]'
FQ1OCBQ26R 'Is not afraid of the dark. [FQ1OCBQ26R]'
FQ1OCBQ29R 'Is not very upset at minor cuts or bruises. [FQ1OCBQ29R]'
FQ1OCBQ31R 'Is slow and unhurried in deciding what to do next. [FQ1OCBQ31R]'
FQ1OCBQ34R 'Sometimes turns away shyly from new acquaintances. [FQ1OCBQ34R]'.
EXECUTE. 

*STEP 10: ADD VALUE LABELS.
*Include missing values like 'Prefer not to Answer' (or something similar) if applicable.
*Include ALL missing value labels (SEE ABOVE FOR FULL LIST).
VALUE LABELS
FQ1OCBQ01 FQ1OCBQ02 FQ1OCBQ03 FQ1OCBQ04 FQ1OCBQ05 FQ1OCBQ06 FQ1OCBQ07 
FQ1OCBQ08 FQ1OCBQ09 FQ1OCBQ10 FQ1OCBQ11 FQ1OCBQ12 FQ1OCBQ13  
FQ1OCBQ14 FQ1OCBQ15 FQ1OCBQ16  FQ1OCBQ17 FQ1OCBQ18 FQ1OCBQ19 
FQ1OCBQ20 FQ1OCBQ21 FQ1OCBQ22 FQ1OCBQ23 FQ1OCBQ24  FQ1OCBQ25 
FQ1OCBQ26 FQ1OCBQ27 FQ1OCBQ28 FQ1OCBQ29 FQ1OCBQ30 FQ1OCBQ31 
FQ1OCBQ32 FQ1OCBQ33 FQ1OCBQ34 FQ1OCBQ35 FQ1OCBQ36 
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
1 'Extremely untrue of your child (1)'
2 'Quite untrue of your child (2)'
3 'Slightly untrue of your child (3)'
4 'Neither true nor false of your child (4)'
5 'Slightly true of your child (5)'
6 'Quite true of your child (6)'
7 'Extremely true of your child (7)'.
EXECUTE.

VALUE LABELS
FQ1OCBQ13R FQ1OCBQ19R FQ1OCBQ20R FQ1OCBQ22R
FQ1OCBQ26R FQ1OCBQ29R FQ1OCBQ31R FQ1OCBQ34R
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
7 'Extremely untrue of your child (7)'
6 'Quite untrue of your child (6)'
5 'Slightly untrue of your child (5)'
4 'Neither true nor false of your child (4)'
3 'Slightly true of your child (3)'
2 'Quite true of your child (2)'
1 'Extremely true of your child (1)'.
EXECUTE.

*STEP 11: LABELING MISSING VALUES AS MISSING.
*Recoding all negative numbers as missing.
MISSING VALUES FQ1OCBQ01 FQ1OCBQ02 FQ1OCBQ03 FQ1OCBQ04 FQ1OCBQ05 FQ1OCBQ06 FQ1OCBQ07 FQ1OCBQ08 FQ1OCBQ09
    FQ1OCBQ10 FQ1OCBQ11 FQ1OCBQ12 FQ1OCBQ13 FQ1OCBQ14 FQ1OCBQ15 FQ1OCBQ16 FQ1OCBQ17 FQ1OCBQ18 FQ1OCBQ19
    FQ1OCBQ20 FQ1OCBQ21 FQ1OCBQ22 FQ1OCBQ23 FQ1OCBQ24 FQ1OCBQ25 FQ1OCBQ26 FQ1OCBQ27 FQ1OCBQ28 FQ1OCBQ29
    FQ1OCBQ30 FQ1OCBQ31 FQ1OCBQ32 FQ1OCBQ33 FQ1OCBQ34 FQ1OCBQ35 FQ1OCBQ36 FQ1OCBQ13R FQ1OCBQ19R FQ1OCBQ20R 
    FQ1OCBQ22R FQ1OCBQ26R FQ1OCBQ29R FQ1OCBQ31R FQ1OCBQ34R
    (LO THRU -1).
EXECUTE.

*STEP 12: SAVE CLEANED DATA FILE.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OCBQ_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.

*STEP 13: CHECK FREQUENCIES.
*Checking frequencies of all items before creating constructs.
*Include STAT variable here to be sure all missingness was coded correctly.
FREQUENCIES VARIABLES=FD1OSTAT FQ1OCBQ01 FQ1OCBQ02 FQ1OCBQ03 FQ1OCBQ04 FQ1OCBQ05 FQ1OCBQ06 FQ1OCBQ07 FQ1OCBQ08 
    FQ1OCBQ09 FQ1OCBQ10 FQ1OCBQ11 FQ1OCBQ12 FQ1OCBQ13 FQ1OCBQ14 FQ1OCBQ15 FQ1OCBQ16 FQ1OCBQ17 FQ1OCBQ18 FQ1OCBQ19 
    FQ1OCBQ20 FQ1OCBQ21 FQ1OCBQ22 FQ1OCBQ23 FQ1OCBQ24 FQ1OCBQ25 FQ1OCBQ26 FQ1OCBQ27 FQ1OCBQ28 FQ1OCBQ29 FQ1OCBQ30 
    FQ1OCBQ31 FQ1OCBQ32 FQ1OCBQ33 FQ1OCBQ34 FQ1OCBQ35 FQ1OCBQ36 
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=
    FQ1OCBQ13 FQ1OCBQ13R
    FQ1OCBQ19 FQ1OCBQ19R
    FQ1OCBQ20 FQ1OCBQ20R
    FQ1OCBQ22 FQ1OCBQ22R
    FQ1OCBQ26 FQ1OCBQ26R
    FQ1OCBQ29 FQ1OCBQ29R
    FQ1OCBQ31 FQ1OCBQ31R
    FQ1OCBQ34 FQ1OCBQ34R
  /ORDER=ANALYSIS.

*STEP 14: CHECK DESCRIPTIVES.
*Checking descriptives for all items before creating constructs.
DESCRIPTIVES VARIABLES=FQ1OCBQ01 FQ1OCBQ02 FQ1OCBQ03 FQ1OCBQ04 FQ1OCBQ05 FQ1OCBQ06 FQ1OCBQ07 FQ1OCBQ08 
    FQ1OCBQ09 FQ1OCBQ10 FQ1OCBQ11 FQ1OCBQ12 FQ1OCBQ13 FQ1OCBQ14 FQ1OCBQ15 FQ1OCBQ16 FQ1OCBQ17 FQ1OCBQ18 FQ1OCBQ19 
    FQ1OCBQ20 FQ1OCBQ21 FQ1OCBQ22 FQ1OCBQ23 FQ1OCBQ24 FQ1OCBQ25 FQ1OCBQ26 FQ1OCBQ27 FQ1OCBQ28 FQ1OCBQ29 FQ1OCBQ30 
    FQ1OCBQ31 FQ1OCBQ32 FQ1OCBQ33 FQ1OCBQ34 FQ1OCBQ35 FQ1OCBQ36
  /STATISTICS=MEAN STDDEV MIN MAX.

DESCRIPTIVES VARIABLES=
    FQ1OCBQ13 FQ1OCBQ13R
    FQ1OCBQ19 FQ1OCBQ19R
    FQ1OCBQ20 FQ1OCBQ20R
    FQ1OCBQ22 FQ1OCBQ22R
    FQ1OCBQ26 FQ1OCBQ26R
    FQ1OCBQ29 FQ1OCBQ29R
    FQ1OCBQ31 FQ1OCBQ31R
    FQ1OCBQ34 FQ1OCBQ34R
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 15: SAVE CLEANED DATA FILE.
*Sorting the data file by ID and resaving the final file.
*To reorder items, use /KEEP {list all variables in order} -- insert in line after file name.
SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OCBQ_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OCBQ_Cleaned.sav'.

*STEP 16: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE
 OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OCBQ_Cleaned.spv'
 LOCK=NO.

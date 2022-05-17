* Encoding: UTF-8.
*STEP 0: NOTES
*PRESCHOOL AND KINDERGARTEN BEHAVIOR SCALE (PKBS).
 
*10-01-21(BM): Adapted STEPS 1-16 from A1 Syntax.
*10-05-21 (BM): Ran syntax on real data checked for problems.
*12-07-21(AZ): Edited T2 syntax for changes (Steps 5, 5A, 7A, 10, 13, 15) and ran syntax.
*1-13-22(BM): Checked and Edited comment in STEP 5A.
*1-20-22(AAC): CHECKED. Updated STEP 6, STEP 10, STEP 11, and STEP 13 notes to match syntax template. 
*1-21-22(BM): Recoded the IDs that were not administered the PKBS.
*1-26-22(AAC): CHECKED.
*03-09-22(BM): Updated to match A1

*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------.
*STEP 1: OPENING RAW DATA.
*Insert the correct file path and file name. Use syntax to open raw data file.
GET
  FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\DBT Moms R01 Study Time 2 Mother Survey_February 21, 2022_14.34.sav'.

*STEP 2: SAVING QUESTIONNAIRE SPECIFIC RAW DATA. 
*Insert the correct file path and file name. Save this file with only those variables that you need, in the following order; ID, Start Date, Questionnaire Items (i.e., DERS_1 to DERS_36).
SAVE OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ2OPKBS_Cleaned.sav'
  /KEEP 
  FQ2ID 
  STARTDATE
  FQ2PKBS_1 TO FQ2PKBS_33
  /COMPRESSED.
  EXECUTE.

*STEP 3: OPEN NEW DATA FILE.  
*Insert the correct file path and file name. Open the file you just created and saved so that you are able to clean the data.
GET
  FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ2OPKBS_Cleaned.sav'.

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
RENAME VARIABLE (STARTDATE=FQ2OPKBSDATE).
EXECUTE.
RENAME VARIABLE (FQ2PKBS_1 = FQ2OPKBS02) (FQ2PKBS_2 = FQ2OPKBS07) (FQ2PKBS_3 = FQ2OPKBS10) (FQ2PKBS_4 = FQ2OPKBS12) (FQ2PKBS_5 = FQ2OPKBS16) (FQ2PKBS_6 = FQ2OPKBS22).
EXECUTE.
RENAME VARIABLE (FQ2PKBS_7 = FQ2OPKBS23) (FQ2PKBS_8 = FQ2OPKBS25) (FQ2PKBS_9 = FQ2OPKBS28) (FQ2PKBS_10 = FQ2OPKBS29) (FQ2PKBS_11 = FQ2OPKBS30) (FQ2PKBS_12 = FQ2OPKBS32).
EXECUTE.
RENAME VARIABLE (FQ2PKBS_13 = FQ2OPKBS05) (FQ2PKBS_14 = FQ2OPKBS14) (FQ2PKBS_15 = FQ2OPKBS15) (FQ2PKBS_16 = FQ2OPKBS17) (FQ2PKBS_17 = FQ2OPKBS19) (FQ2PKBS_18 = FQ2OPKBS20).
EXECUTE.  
RENAME VARIABLE (FQ2PKBS_19 = FQ2OPKBS21) (FQ2PKBS_20 = FQ2OPKBS24) (FQ2PKBS_21 = FQ2OPKBS27) (FQ2PKBS_22 = FQ2OPKBS33) (FQ2PKBS_23 = FQ2OPKBS34) (FQ2PKBS_24 = FQ2OPKBS01).
EXECUTE. 
RENAME VARIABLE (FQ2PKBS_25 = FQ2OPKBS03) (FQ2PKBS_26 = FQ2OPKBS06) (FQ2PKBS_27 = FQ2OPKBS08) (FQ2PKBS_28 = FQ2OPKBS09) (FQ2PKBS_29 = FQ2OPKBS11) (FQ2PKBS_30 = FQ2OPKBS13).
EXECUTE.
RENAME VARIABLE (FQ2PKBS_31 = FQ2OPKBS18) (FQ2PKBS_32 = FQ2OPKBS26) (FQ2PKBS_33 = FQ2OPKBS31).
EXECUTE.

*Adding Item 4 from the PKBS manual to the data file even though Pitt and UO do not administer this item.
COMPUTE FQ2OPKBS04 = -33.
EXECUTE.

*Remember to save your data file.
SAVE OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ2OPKBS_Cleaned.sav'.
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
/FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ2OPKBS_Cleaned.sav'
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
COMPUTE DATEDIFF = DATEDIFF(FD2ORD,FQ2OPKBSDATE,'days').
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
SAVE OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ2OPKBS_Cleaned.sav'
/DROP
FQ2OPKBSDATE
DATEDIFF
DATEDIFF0
f.
EXECUTE.
GET
  FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ2OPKBS_Cleaned.sav'.
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
RECODE FQ2OPKBS02 to FQ2OPKBS31
     (4=-10).
EXECUTE.
    
**STEP 7 (DELETE IF NOT NEEDED): CREATING NEW VARIABLES FOR REVERSED SCORED ITEMS.
**Reverse-Scored Items; see scoring document to determine if there are reverse-scored items. If no reverse-scored items, delete this syntax.
**CHECKED AND NOT NEEDED

*STEP 7A: RECODING SYSMIS (PARTICIPANTS THAT MISSED THE ASSESSMENT).
*This will use the STAT variable to recode all SYSMIS data. CHANGE THE STAT VARIABLE TO MATCH THE ASSESSMENT WAVE YOU ARE WORKING IN.
*Include full list of numeric variables (including new reverse-scored items).
DO IF MISSING(FD2OSTAT).
DO REPEAT x = FQ2OPKBS02 TO FQ2OPKBS04.
RECODE FD2OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.

*STEP 8: STANDARDIZING DECIMAL PLACES (CANNOT INCLUDE TEXT/STRING VARIABLES).
*Making all variables have the same number of decimal places. Ensure that variables include all new reverse-scored variables. Change the number AFTER the decimal place as needed.
FORMATS FQ2OPKBS02 to FQ2OPKBS04 (F8.0).
EXECUTE.

*STEP 9: CREATING VARIABLE LABLES.
*Label all variables. Use the original questionnaire to include the exact text that participants saw. Include the questionnaire name and number at the end of the label.
VARIABLE LABELS  ID 'Participant ID'.
EXECUTE.

VARIABLE LABELS 
FQ2OPKBS01 'Works or plays independently [FQ2OPKBS01]'
FQ2OPKBS02 'Is cooperative [FQ2OPKBS02]'
FQ2OPKBS03 'Smiles and laughs with other children [FQ2OPKBS03]'
FQ2OPKBS04 'Plays with several different children [FQ2OPKBS04]'
FQ2OPKBS05 'Tries to understand another childs behavior (e.g. why are you crying?) FQ2PPKBS05]'
FQ2OPKBS06 'Is accepted and liked by ther children [FQ2OPKBS06]'
FQ2OPKBS07 'Follows instructions from adults [FQ2OPKBS07]'
FQ2OPKBS08 'Attempts new tasks before asking for help [FQ2OPKBS08]'
FQ2OPKBS09 'Makes friends easily [FQ2OPKBS09]'
FQ2OPKBS10 'Shows self-control [FQ2OPKBS10]'
FQ2OPKBS11 'Is invited by other children to play [FQ2OPKBS11]'
FQ2OPKBS12 'Uses free time in an acceptable way [FQ2OPKBS12]'
FQ2OPKBS13 'Is able to separate from parent without extreme distress [FQ2OPKBS13]'
FQ2OPKBS14 'Participates in family or classroom discussions [FQ2OPKBS14]'
FQ2OPKBS15 'Asks for help when needed [FQ2OPKBS15]'
FQ2OPKBS16 'Sits and listens when stories are being read [FQ2OPKBS16]'
FQ2OPKBS17 'Stands up for other childrens rights (e.g. thats his/hers!) [FQ2PPKBS17]'
FQ2OPKBS18 'Adapts well to different environments [FQ2OPKBS18]'
FQ2OPKBS19 'Has skills or abilities that are admired by peers [FQ2OPKBS19]'
FQ2OPKBS20 'Comforts other children who are upset [FQ2OPKBS20]'
FQ2OPKBS21 'Invites other children to play [FQ2OPKBS21]'
FQ2OPKBS22 'Cleans up his/her messes when asked [FQ2OPKBS22]'
FQ2OPKBS23 'Follows rules [FQ2OPKBS23]'
FQ2OPKBS24 'Seeks comfort from an adult when hurt [FQ2OPKBS24]'
FQ2OPKBS25 'Shares toys and other belongings [FQ2OPKBS25]'
FQ2OPKBS26 'Stands up for his/her rights [FQ2OPKBS26]'
FQ2OPKBS27 'Apologizes for accidental behavior that may upset others [FQ2OPKBS27]'
FQ2OPKBS28 'Gives in or compromises with peers when appropriate [FQ2OPKBS28]'
FQ2OPKBS29 'Accepts decisions made by adults [FQ2OPKBS29]'
FQ2OPKBS30 'Takes turns with toys and other objects [FQ2OPKBS30]'
FQ2OPKBS31 'Is confident in social interactions [FQ2OPKBS31]'
FQ2OPKBS32 'Responds appropriately when corrected [FQ2OPKBS32]'
FQ2OPKBS33 'Is sensitive to adult problems (e.g. are you sad?) [FQ2PPKBS33]'
FQ2OPKBS34 'Shows affection for other children [FQ2OPKBS34]'.
EXECUTE. 

*STEP 10: ADD VALUE LABELS.
*Include missing values like 'Prefer not to Answer' (or something similar) if applicable.
*Include ALL missing value labels (SEE ABOVE FOR FULL LIST).
VALUE LABELS
FQ2OPKBS01 FQ2OPKBS02 FQ2OPKBS03 FQ2OPKBS04 FQ2OPKBS05 FQ2OPKBS06 FQ2OPKBS07 
FQ2OPKBS08 FQ2OPKBS09 FQ2OPKBS10 FQ2OPKBS11 FQ2OPKBS12 FQ2OPKBS13  
FQ2OPKBS14 FQ2OPKBS15 FQ2OPKBS16  FQ2OPKBS17 FQ2OPKBS18 FQ2OPKBS19 
FQ2OPKBS20 FQ2OPKBS21 FQ2OPKBS22 FQ2OPKBS23 FQ2OPKBS24  FQ2OPKBS25 
FQ2OPKBS26 FQ2OPKBS27 FQ2OPKBS28 FQ2OPKBS29 FQ2OPKBS30 FQ2OPKBS31 
FQ2OPKBS32 FQ2OPKBS33 FQ2OPKBS34
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
-11 'Participant (parent or child) deceased (-11)'                                                
-10 'Prefer not to answer (-10)'   
0 'Never (0)'
1 'Rarely (1)'
2 'Sometimes (2)'
3 'Often (3)'.
EXECUTE.

*STEP 11: LABELING MISSING VALUES AS MISSING.
*Recoding all negative numbers as missing.
MISSING VALUES
FQ2OPKBS01 FQ2OPKBS02 FQ2OPKBS03 FQ2OPKBS04 FQ2OPKBS05 FQ2OPKBS06 FQ2OPKBS07 FQ2OPKBS08 FQ2OPKBS09 FQ2OPKBS10 FQ2OPKBS11 FQ2OPKBS12 FQ2OPKBS13  
FQ2OPKBS14 FQ2OPKBS15 FQ2OPKBS16  FQ2OPKBS17 FQ2OPKBS18 FQ2OPKBS19 FQ2OPKBS20 FQ2OPKBS21 FQ2OPKBS22 FQ2OPKBS23 FQ2OPKBS24  FQ2OPKBS25 
FQ2OPKBS26 FQ2OPKBS27 FQ2OPKBS28 FQ2OPKBS29 FQ2OPKBS30 FQ2OPKBS31 FQ2OPKBS32 FQ2OPKBS33 FQ2OPKBS34
    (LO THRU -1).
EXECUTE.

*STEP 12: SAVE CLEANED DATA FILE.
SAVE OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ2OPKBS_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.

*STEP 13: CHECK FREQUENCIES.
*Checking frequencies of all items before creating constructs.
*Include STAT variable here to be sure all missingness was coded correctly.
FREQUENCIES VARIABLES=FD2OSTAT FQ2OPKBS01 FQ2OPKBS02 FQ2OPKBS03 FQ2OPKBS04 FQ2OPKBS05 FQ2OPKBS06 FQ2OPKBS07 FQ2OPKBS08 FQ2OPKBS09 FQ2OPKBS10 FQ2OPKBS11 FQ2OPKBS12 FQ2OPKBS13  
FQ2OPKBS14 FQ2OPKBS15 FQ2OPKBS16  FQ2OPKBS17 FQ2OPKBS18 FQ2OPKBS19 FQ2OPKBS20 FQ2OPKBS21 FQ2OPKBS22 FQ2OPKBS23 FQ2OPKBS24  FQ2OPKBS25 
FQ2OPKBS26 FQ2OPKBS27 FQ2OPKBS28 FQ2OPKBS29 FQ2OPKBS30 FQ2OPKBS31 FQ2OPKBS32 FQ2OPKBS33 FQ2OPKBS34
  /ORDER=ANALYSIS.

*STEP 14: CHECK DESCRIPTIVES.
*Checking descriptives for all items before creating constructs.
DESCRIPTIVES VARIABLES=FQ2OPKBS01 FQ2OPKBS02 FQ2OPKBS03 FQ2OPKBS04 FQ2OPKBS05 FQ2OPKBS06 FQ2OPKBS07 FQ2OPKBS08 FQ2OPKBS09 FQ2OPKBS10 FQ2OPKBS11 FQ2OPKBS12 FQ2OPKBS13  
FQ2OPKBS14 FQ2OPKBS15 FQ2OPKBS16  FQ2OPKBS17 FQ2OPKBS18 FQ2OPKBS19 FQ2OPKBS20 FQ2OPKBS21 FQ2OPKBS22 FQ2OPKBS23 FQ2OPKBS24  FQ2OPKBS25 
FQ2OPKBS26 FQ2OPKBS27 FQ2OPKBS28 FQ2OPKBS29 FQ2OPKBS30 FQ2OPKBS31 FQ2OPKBS32 FQ2OPKBS33 FQ2OPKBS34
 /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 15: SAVE CLEANED DATA FILE.
*Sorting the data file by ID and resaving the final file.
*To reorder items, use /KEEP {list all variables in order} -- insert in line after file name.
SORT CASES BY ID(A).
SAVE OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ2OPKBS_Cleaned.sav'
    /KEEP ID FD2OSTAT FD2ORD FQ2OPKBS01 FQ2OPKBS02 FQ2OPKBS03 FQ2OPKBS04 FQ2OPKBS05 FQ2OPKBS06 FQ2OPKBS07 FQ2OPKBS08 FQ2OPKBS09 FQ2OPKBS10 FQ2OPKBS11 FQ2OPKBS12 FQ2OPKBS13  
FQ2OPKBS14 FQ2OPKBS15 FQ2OPKBS16  FQ2OPKBS17 FQ2OPKBS18 FQ2OPKBS19 FQ2OPKBS20 FQ2OPKBS21 FQ2OPKBS22 FQ2OPKBS23 FQ2OPKBS24  FQ2OPKBS25 FQ2OPKBS26 FQ2OPKBS27 
FQ2OPKBS28 FQ2OPKBS29 FQ2OPKBS30 FQ2OPKBS31 
FQ2OPKBS32 FQ2OPKBS33 FQ2OPKBS34
  /COMPRESSED.
  EXECUTE.
GET
  FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ2OPKBS_Cleaned.sav'.
EXECUTE.

*STEP 16: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE
 OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ2OPKBS_Cleaned.spv'
 LOCK=NO.

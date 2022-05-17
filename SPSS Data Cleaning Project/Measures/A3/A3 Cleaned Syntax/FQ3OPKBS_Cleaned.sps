* Encoding: UTF-8.
*STEP 0: NOTES
*PRESCHOOL AND KINDERGARTEN BEHAVIOR SCALE (PKBS).
 
*10-01-21(BM): Adapted STEPS 1-16 from A1 Syntax.
*04-12-2022 (BM):Adapted Syntax to Match Updated Template + Pass in Updated Data. 
*04-13-22(AAC): Checked.
*04-18-2022(BM): Double Checked and Fixed Missing Codes.
*04-20-22(AAC): Checked.
*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------.
*STEP 1: OPENING RAW DATA.
*Insert the correct file path and file name. Use syntax to open raw data file.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/DBT Moms R01 Study Time 3 Mother Survey_April 12, 2022_17.38.sav'.

*STEP 2: SAVING QUESTIONNAIRE SPECIFIC RAW DATA. 
*Insert the correct file path and file name. Save this file with only those variables that you need, in the following order; ID, Start Date, Questionnaire Items (i.e., DERS_1 to DERS_36).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OPKBS_Cleaned.sav'
  /KEEP 
  FQ3ID 
  STARTDATE
  FQ3PKBS_1 TO FQ3PKBS_33
  /COMPRESSED.
  EXECUTE.

*STEP 3: OPEN NEW DATA FILE.  
*Insert the correct file path and file name. Open the file you just created and saved so that you are able to clean the data.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OPKBS_Cleaned.sav'.

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
RENAME VARIABLE (FQ3ID=ID).
EXECUTE.
RENAME VARIABLE (STARTDATE=FQ3OPKBSDATE).
EXECUTE.
RENAME VARIABLE (FQ3PKBS_1 = FQ3OPKBS02) (FQ3PKBS_2 = FQ3OPKBS07) (FQ3PKBS_3 = FQ3OPKBS10) (FQ3PKBS_4 = FQ3OPKBS12) (FQ3PKBS_5 = FQ3OPKBS16) (FQ3PKBS_6 = FQ3OPKBS22).
EXECUTE.
RENAME VARIABLE (FQ3PKBS_7 = FQ3OPKBS23) (FQ3PKBS_8 = FQ3OPKBS25) (FQ3PKBS_9 = FQ3OPKBS28) (FQ3PKBS_10 = FQ3OPKBS29) (FQ3PKBS_11 = FQ3OPKBS30) (FQ3PKBS_12 = FQ3OPKBS32).
EXECUTE.
RENAME VARIABLE (FQ3PKBS_13 = FQ3OPKBS05) (FQ3PKBS_14 = FQ3OPKBS14) (FQ3PKBS_15 = FQ3OPKBS15) (FQ3PKBS_16 = FQ3OPKBS17) (FQ3PKBS_17 = FQ3OPKBS19) (FQ3PKBS_18 = FQ3OPKBS20).
EXECUTE.  
RENAME VARIABLE (FQ3PKBS_19 = FQ3OPKBS21) (FQ3PKBS_20 = FQ3OPKBS24) (FQ3PKBS_21 = FQ3OPKBS27) (FQ3PKBS_22 = FQ3OPKBS33) (FQ3PKBS_23 = FQ3OPKBS34) (FQ3PKBS_24 = FQ3OPKBS01).
EXECUTE. 
RENAME VARIABLE (FQ3PKBS_25 = FQ3OPKBS03) (FQ3PKBS_26 = FQ3OPKBS06) (FQ3PKBS_27 = FQ3OPKBS08) (FQ3PKBS_28 = FQ3OPKBS09) (FQ3PKBS_29 = FQ3OPKBS11) (FQ3PKBS_30 = FQ3OPKBS13).
EXECUTE.
RENAME VARIABLE (FQ3PKBS_31 = FQ3OPKBS18) (FQ3PKBS_32 = FQ3OPKBS26) (FQ3PKBS_33 = FQ3OPKBS31).
EXECUTE.

*Adding Item 4 from the PKBS manual to the data file even though Pitt and UO do not administer this item.
COMPUTE FQ3OPKBS04 = -33.
EXECUTE.

*Remember to save your data file.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OPKBS_Cleaned.sav'.
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
/FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OPKBS_Cleaned.sav'
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
COMPUTE DATEDIFF = DATEDIFF(FD3ORD,FQ3OPKBSDATE,'days').
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
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OPKBS_Cleaned.sav'
/DROP
FQ3OPKBSDATE
DATEDIFF
DATEDIFF0
f.
EXECUTE.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OPKBS_Cleaned.sav'.
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
**-11 'Participant (parent or child) deceased'                                  * (Participant (parent or child) deceased) */
**-10 'Prefer not to answer'                                                           /* (Participant selected prefer not to answer) */.
RECODE FQ3OPKBS02 to FQ3OPKBS31
     (4=-10).
EXECUTE.

*90077 skipped a question.
DO IF (ID=90077). 
    RECODE
    FQ3OPKBS30
    (SYSMIS=-10).
END IF.
EXECUTE.

*91081 skipped a question.
DO IF (ID=91081). 
    RECODE
    FQ3OPKBS11
    (SYSMIS=-10).
END IF.
EXECUTE.
    
**STEP 7 (DELETE IF NOT NEEDED): CREATING NEW VARIABLES FOR REVERSED SCORED ITEMS.
**Reverse-Scored Items; see scoring document to determine if there are reverse-scored items. If no reverse-scored items, delete this syntax.
**CHECKED AND NOT NEEDED

*STEP 7A: RECODING SYSMIS (PARTICIPANTS THAT MISSED THE ASSESSMENT).
*This will use the STAT variable to recode all SYSMIS data. CHANGE THE STAT VARIABLE TO MATCH THE ASSESSMENT WAVE YOU ARE WORKING IN.
*Include full list of numeric variables (including new reverse-scored items).
DO IF MISSING(FD3OSTAT).
DO REPEAT x = FQ3OPKBS02 TO FQ3OPKBS04.
RECODE FD3OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.

*STEP 8: STANDARDIZING DECIMAL PLACES (CANNOT INCLUDE TEXT/STRING VARIABLES).
*Making all variables have the same number of decimal places. Ensure that variables include all new reverse-scored variables. Change the number AFTER the decimal place as needed.
FORMATS FQ3OPKBS02 to FQ3OPKBS04 (F8.0).
EXECUTE.

*STEP 9: CREATING VARIABLE LABLES.
*Label all variables. Use the original questionnaire to include the exact text that participants saw. Include the questionnaire name and number at the end of the label.
VARIABLE LABELS  ID 'Participant ID'.
EXECUTE.

VARIABLE LABELS 
FQ3OPKBS01 'Works or plays independently [FQ3OPKBS01]'
FQ3OPKBS02 'Is cooperative [FQ3OPKBS02]'
FQ3OPKBS03 'Smiles and laughs with other children [FQ3OPKBS03]'
FQ3OPKBS04 'Plays with several different children [FQ3OPKBS04]'
FQ3OPKBS05 'Tries to understand another childs behavior (e.g. why are you crying?) [FQ3PPKBS05]'
FQ3OPKBS06 'Is accepted and liked by ther children [FQ3OPKBS06]'
FQ3OPKBS07 'Follows instructions from adults [FQ3OPKBS07]'
FQ3OPKBS08 'Attempts new tasks before asking for help [FQ3OPKBS08]'
FQ3OPKBS09 'Makes friends easily [FQ3OPKBS09]'
FQ3OPKBS10 'Shows self-control [FQ3OPKBS10]'
FQ3OPKBS11 'Is invited by other children to play [FQ3OPKBS11]'
FQ3OPKBS12 'Uses free time in an acceptable way [FQ3OPKBS12]'
FQ3OPKBS13 'Is able to separate from parent without extreme distress [FQ3OPKBS13]'
FQ3OPKBS14 'Participates in family or classroom discussions [FQ3OPKBS14]'
FQ3OPKBS15 'Asks for help when needed [FQ3OPKBS15]'
FQ3OPKBS16 'Sits and listens when stories are being read [FQ3OPKBS16]'
FQ3OPKBS17 'Stands up for other childrens rights (e.g. thats his/hers!) [FQ3PPKBS17]'
FQ3OPKBS18 'Adapts well to different environments [FQ3OPKBS18]'
FQ3OPKBS19 'Has skills or abilities that are admired by peers [FQ3OPKBS19]'
FQ3OPKBS20 'Comforts other children who are upset [FQ3OPKBS20]'
FQ3OPKBS21 'Invites other children to play [FQ3OPKBS21]'
FQ3OPKBS22 'Cleans up his/her messes when asked [FQ3OPKBS22]'
FQ3OPKBS23 'Follows rules [FQ3OPKBS23]'
FQ3OPKBS24 'Seeks comfort from an adult when hurt [FQ3OPKBS24]'
FQ3OPKBS25 'Shares toys and other belongings [FQ3OPKBS25]'
FQ3OPKBS26 'Stands up for his/her rights [FQ3OPKBS26]'
FQ3OPKBS27 'Apologizes for accidental behavior that may upset others [FQ3OPKBS27]'
FQ3OPKBS28 'Gives in or compromises with peers when appropriate [FQ3OPKBS28]'
FQ3OPKBS29 'Accepts decisions made by adults [FQ3OPKBS29]'
FQ3OPKBS30 'Takes turns with toys and other objects [FQ3OPKBS30]'
FQ3OPKBS31 'Is confident in social interactions [FQ3OPKBS31]'
FQ3OPKBS32 'Responds appropriately when corrected [FQ3OPKBS32]'
FQ3OPKBS33 'Is sensitive to adult problems (e.g. are you sad?) [FQ3PPKBS33]'
FQ3OPKBS34 'Shows affection for other children [FQ3OPKBS34]'.
EXECUTE. 

*STEP 10: ADD VALUE LABELS.
*Include missing values like 'Prefer not to Answer' (or something similar) if applicable.
*Include ALL missing value labels (SEE ABOVE FOR FULL LIST).
VALUE LABELS
FQ3OPKBS01 FQ3OPKBS02 FQ3OPKBS03 FQ3OPKBS04 FQ3OPKBS05 FQ3OPKBS06 FQ3OPKBS07 
FQ3OPKBS08 FQ3OPKBS09 FQ3OPKBS10 FQ3OPKBS11 FQ3OPKBS12 FQ3OPKBS13  
FQ3OPKBS14 FQ3OPKBS15 FQ3OPKBS16  FQ3OPKBS17 FQ3OPKBS18 FQ3OPKBS19 
FQ3OPKBS20 FQ3OPKBS21 FQ3OPKBS22 FQ3OPKBS23 FQ3OPKBS24  FQ3OPKBS25 
FQ3OPKBS26 FQ3OPKBS27 FQ3OPKBS28 FQ3OPKBS29 FQ3OPKBS30 FQ3OPKBS31 
FQ3OPKBS32 FQ3OPKBS33 FQ3OPKBS34
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
0 'Never (0)'
1 'Rarely (1)'
2 'Sometimes (2)'
3 'Often (3)'.
EXECUTE.

*STEP 11: LABELING MISSING VALUES AS MISSING.
*Recoding all negative numbers as missing.
MISSING VALUES
FQ3OPKBS01 FQ3OPKBS02 FQ3OPKBS03 FQ3OPKBS04 FQ3OPKBS05 FQ3OPKBS06 FQ3OPKBS07 FQ3OPKBS08 FQ3OPKBS09 FQ3OPKBS10 FQ3OPKBS11 FQ3OPKBS12 FQ3OPKBS13  
FQ3OPKBS14 FQ3OPKBS15 FQ3OPKBS16  FQ3OPKBS17 FQ3OPKBS18 FQ3OPKBS19 FQ3OPKBS20 FQ3OPKBS21 FQ3OPKBS22 FQ3OPKBS23 FQ3OPKBS24  FQ3OPKBS25 
FQ3OPKBS26 FQ3OPKBS27 FQ3OPKBS28 FQ3OPKBS29 FQ3OPKBS30 FQ3OPKBS31 FQ3OPKBS32 FQ3OPKBS33 FQ3OPKBS34
    (LO THRU -1).
EXECUTE.

*STEP 12: SAVE CLEANED DATA FILE.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OPKBS_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.

*STEP 13: CHECK FREQUENCIES.
*Checking frequencies of all items before creating constructs.
*Include STAT variable here to be sure all missingness was coded correctly.
FREQUENCIES VARIABLES=FD3OSTAT FQ3OPKBS01 FQ3OPKBS02 FQ3OPKBS03 FQ3OPKBS04 FQ3OPKBS05 FQ3OPKBS06 FQ3OPKBS07 FQ3OPKBS08 FQ3OPKBS09 FQ3OPKBS10 FQ3OPKBS11 FQ3OPKBS12 FQ3OPKBS13  
FQ3OPKBS14 FQ3OPKBS15 FQ3OPKBS16  FQ3OPKBS17 FQ3OPKBS18 FQ3OPKBS19 FQ3OPKBS20 FQ3OPKBS21 FQ3OPKBS22 FQ3OPKBS23 FQ3OPKBS24  FQ3OPKBS25 
FQ3OPKBS26 FQ3OPKBS27 FQ3OPKBS28 FQ3OPKBS29 FQ3OPKBS30 FQ3OPKBS31 FQ3OPKBS32 FQ3OPKBS33 FQ3OPKBS34
  /ORDER=ANALYSIS.

*STEP 14: CHECK DESCRIPTIVES.
*Checking descriptives for all items before creating constructs.
DESCRIPTIVES VARIABLES=FQ3OPKBS01 FQ3OPKBS02 FQ3OPKBS03 FQ3OPKBS04 FQ3OPKBS05 FQ3OPKBS06 FQ3OPKBS07 FQ3OPKBS08 FQ3OPKBS09 FQ3OPKBS10 FQ3OPKBS11 FQ3OPKBS12 FQ3OPKBS13  
FQ3OPKBS14 FQ3OPKBS15 FQ3OPKBS16  FQ3OPKBS17 FQ3OPKBS18 FQ3OPKBS19 FQ3OPKBS20 FQ3OPKBS21 FQ3OPKBS22 FQ3OPKBS23 FQ3OPKBS24  FQ3OPKBS25 
FQ3OPKBS26 FQ3OPKBS27 FQ3OPKBS28 FQ3OPKBS29 FQ3OPKBS30 FQ3OPKBS31 FQ3OPKBS32 FQ3OPKBS33 FQ3OPKBS34
 /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 15: SAVE CLEANED DATA FILE.
*Sorting the data file by ID and resaving the final file.
*To reorder items, use /KEEP {list all variables in order} -- insert in line after file name.
SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OPKBS_Cleaned.sav'
    /KEEP ID FD3OSTAT FD3ORD FQ3OPKBS01 FQ3OPKBS02 FQ3OPKBS03 FQ3OPKBS04 FQ3OPKBS05 FQ3OPKBS06 FQ3OPKBS07 FQ3OPKBS08 FQ3OPKBS09 FQ3OPKBS10 FQ3OPKBS11 FQ3OPKBS12 FQ3OPKBS13  
FQ3OPKBS14 FQ3OPKBS15 FQ3OPKBS16  FQ3OPKBS17 FQ3OPKBS18 FQ3OPKBS19 FQ3OPKBS20 FQ3OPKBS21 FQ3OPKBS22 FQ3OPKBS23 FQ3OPKBS24  FQ3OPKBS25 FQ3OPKBS26 FQ3OPKBS27 
FQ3OPKBS28 FQ3OPKBS29 FQ3OPKBS30 FQ3OPKBS31 
FQ3OPKBS32 FQ3OPKBS33 FQ3OPKBS34
  /COMPRESSED.
  EXECUTE.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OPKBS_Cleaned.sav'.
EXECUTE.

*STEP 16: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE
 OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OPKBS_Cleaned.spv'
 LOCK=NO.


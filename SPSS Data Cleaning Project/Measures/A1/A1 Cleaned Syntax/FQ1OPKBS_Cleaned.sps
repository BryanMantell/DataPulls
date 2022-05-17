* Encoding: UTF-8.
*STEP 0: NOTES
*PRESCHOOL AND KINDERGARTEN BEHAVIOR SCALE (PKBS).
 
*07-23-21(AAC): COMPLETED STEPS 0-16.
*08-10-21(AAC): Small changes (typos, etc)
*08-11-21(AAC): Changed missing value labels in STEP 10
*09-04-21(AAC): Changed STEP 9 to reorder variables in numerical order
*11-15-21 (BM): Adapted syntax to match template.
*11-17-21(AAC): Checked. Added FD1OSTAT to STEP 13. Updated missing code list in STEP 6.
*02-03-22(BM): Added item 4

*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------.
*STEP 1: OPENING RAW DATA.
*Insert the correct file path and file name. Use syntax to open raw data file.
GET
  FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\DBT Moms R01 Study Time 1 Mother Survey_January 28, 2022_13.11.sav'. 

*STEP 2: SAVING QUESTIONNAIRE SPECIFIC RAW DATA. 
*Insert the correct file path and file name. Save this file with only those variables that you need, in the following order; ID, Start Date, Questionnaire Items (i.e., DERS_1 to DERS_36).
SAVE OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ1OPKBS_Cleaned.sav'
  /KEEP 
  FQ1ID 
  STARTDATE
  FQ1PKBS_1 TO FQ1PKBS_33
  /COMPRESSED.
  EXECUTE.

*STEP 3: OPEN NEW DATA FILE.  
*Insert the correct file path and file name. Open the file you just created and saved so that you are able to clean the data.
GET
  FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ1OPKBS_Cleaned.sav'.

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
RENAME VARIABLE (STARTDATE=FQ1OPKBSDATE).
EXECUTE.
RENAME VARIABLE (FQ1PKBS_1 = FQ1OPKBS02) (FQ1PKBS_2 = FQ1OPKBS07) (FQ1PKBS_3 = FQ1OPKBS10) (FQ1PKBS_4 = FQ1OPKBS12) (FQ1PKBS_5 = FQ1OPKBS16) (FQ1PKBS_6 = FQ1OPKBS22).
EXECUTE.
RENAME VARIABLE (FQ1PKBS_7 = FQ1OPKBS23) (FQ1PKBS_8 = FQ1OPKBS25) (FQ1PKBS_9 = FQ1OPKBS28) (FQ1PKBS_10 = FQ1OPKBS29) (FQ1PKBS_11 = FQ1OPKBS30) (FQ1PKBS_12 = FQ1OPKBS32).
EXECUTE.
RENAME VARIABLE (FQ1PKBS_13 = FQ1OPKBS05) (FQ1PKBS_14 = FQ1OPKBS14) (FQ1PKBS_15 = FQ1OPKBS15) (FQ1PKBS_16 = FQ1OPKBS17) (FQ1PKBS_17 = FQ1OPKBS19) (FQ1PKBS_18 = FQ1OPKBS20).
EXECUTE.  
RENAME VARIABLE (FQ1PKBS_19 = FQ1OPKBS21) (FQ1PKBS_20 = FQ1OPKBS24) (FQ1PKBS_21 = FQ1OPKBS27) (FQ1PKBS_22 = FQ1OPKBS33) (FQ1PKBS_23 = FQ1OPKBS34) (FQ1PKBS_24 = FQ1OPKBS01).
EXECUTE. 
RENAME VARIABLE (FQ1PKBS_25 = FQ1OPKBS03) (FQ1PKBS_26 = FQ1OPKBS06) (FQ1PKBS_27 = FQ1OPKBS08) (FQ1PKBS_28 = FQ1OPKBS09) (FQ1PKBS_29 = FQ1OPKBS11) (FQ1PKBS_30 = FQ1OPKBS13).
EXECUTE.
RENAME VARIABLE (FQ1PKBS_31 = FQ1OPKBS18) (FQ1PKBS_32 = FQ1OPKBS26) (FQ1PKBS_33 = FQ1OPKBS31).
EXECUTE.

*Adding Item 4 from the PKBS manual to the data file even though Pitt and UO do not administer this item.
COMPUTE FQ1OPKBS04 = -33.
EXECUTE.

SAVE OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ1OPKBS_Cleaned.sav'.
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
/FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ1OPKBS_Cleaned.sav'
/BY ID
/DROP=
FD1OTD FD1ODIFF FD0OSTAT FD0ORD
FD2OSTAT FD2OTD FD2ORD FD2ODIFF
FD3OSTAT FD3OTD FD3ORD FD3ODIFF
FD4OSTAT FD4OTD FD4ORD FD4ODIFF
FD4AOSTAT FD4AOTD FD4AORD FD4AODIFF.
SELECT IF f=1.
EXECUTE.
*Comparing REDCap and Qualtrics dates of completion. Be sure to update the date variables used to reflect the accurate RD and questionnaire date.
COMPUTE DATEDIFF = DATEDIFF(FD1ORD,FQ1OPKBSDATE,'days').
EXECUTE.
COUNT DATEDIFF0=DATEDIFF(Lowest thru -1) DATEDIFF(1 thru Highest).
EXECUTE.
FREQUENCIES VARIABLES=DATEDIFF0
  /ORDER=ANALYSIS.
SORT CASES BY DATEDIFF0(D).
*CHECK ALL IDS WITH DISCREPANT DATES TO DETERMINE WHAT IS CORRECT. CONSULT BEFORE MAKING ANY CHANGES TO RAW DATA IN REDCAP OR QUALTRICS.
*INCLUDE NOTES HERE FOR EACH ID THAT WAS DISCREPANT.
*THE FOLLOWING IDs (90210, 90331, and 90800) HAVE A A1 QUALTRICS DATE [FQ1OPKBSDATE] THAT DOES NOT MATCH THEIR A1 VISIT DATE [FD1ORD]. 
*THIS WAS INVESTIGATED BY STAFF (BM: 10-29-21) AND VISIT DATE [FD1ORD] WAS CONFIRMED USING MULTIPLE SOURCES.
SORT CASES BY ID(A).
*DROPPING VARIABLES THAT ARE NO LONGER RELEVANT TO FINAL DATA FILE.
SAVE OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ1OPKBS_Cleaned.sav'
/DROP
FQ1OPKBSDATE
DATEDIFF
DATEDIFF0
f.
EXECUTE.
GET
  FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ1OPKBS_Cleaned.sav'.
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
RECODE FQ1OPKBS02 to FQ1OPKBS04
     (4=-10).
EXECUTE.
    
**STEP 7 (DELETE IF NOT NEEDED): CREATING NEW VARIABLES FOR REVERSED SCORED ITEMS.
**Reverse-Scored Items; see scoring document to determine if there are reverse-scored items. If no reverse-scored items, delete this syntax.
**CHECKED AND NOT NEEDED

*STEP 7A: RECODING SYSMIS (PARTICIPANTS THAT MISSED THE ASSESSMENT).
*This will use the STAT variable to recode all SYSMIS data. CHANGE THE STAT VARIABLE TO MATCH THE ASSESSMENT WAVE YOU ARE WORKING IN.
*Include full list of numeric variables (including new reverse-scored items).
DO IF MISSING(FD1OSTAT).
DO REPEAT x = FQ1OPKBS02 TO FQ1OPKBS04.
RECODE FD1OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.


*STEP 8: STANDARDIZING DECIMAL PLACES.
*Making all variables have the same number of decimal places. Ensure that variables include all new reverse-scored variables. Change the number AFTER the decimal place as needed.
FORMATS FQ1OPKBS02 to FQ1OPKBS04 (F8.0).
EXECUTE.

*STEP 9: CREATING VARIABLE LABLES.
*Label all variables. Use the original questionnaire to include the exact text that participants saw. Include the questionnaire name and number at the end of the label.
VARIABLE LABELS  ID 'Participant ID'.
EXECUTE.

VARIABLE LABELS 
FQ1OPKBS01 'Works or plays independently [FQ1OPKBS01]'
FQ1OPKBS02 'Is cooperative [FQ1OPKBS02]'
FQ1OPKBS03 'Smiles and laughs with other children [FQ1OPKBS03]'
FQ1OPKBS04 'Plays with several different children [FQ1OPKBS04]'
FQ1OPKBS05 'Tries to understand another childs behavior (e.g. why are you crying?) FQ1PPKBS05]'
FQ1OPKBS06 'Is accepted and liked by ther children [FQ1OPKBS06]'
FQ1OPKBS07 'Follows instructions from adults [FQ1OPKBS07]'
FQ1OPKBS08 'Attempts new tasks before asking for help [FQ1OPKBS08]'
FQ1OPKBS09 'Makes friends easily [FQ1OPKBS09]'
FQ1OPKBS10 'Shows self-control [FQ1OPKBS10]'
FQ1OPKBS11 'Is invited by other children to play [FQ1OPKBS11]'
FQ1OPKBS12 'Uses free time in an acceptable way [FQ1OPKBS12]'
FQ1OPKBS13 'Is able to separate from parent without extreme distress [FQ1OPKBS13]'
FQ1OPKBS14 'Participates in family or classroom discussions [FQ1OPKBS14]'
FQ1OPKBS15 'Asks for help when needed [FQ1OPKBS15]'
FQ1OPKBS16 'Sits and listens when stories are being read [FQ1OPKBS16]'
FQ1OPKBS17 'Stands up for other childrens rights (e.g. thats his/hers!) [FQ1PPKBS17]'
FQ1OPKBS18 'Adapts well to different environments [FQ1OPKBS18]'
FQ1OPKBS19 'Has skills or abilities that are admired by peers [FQ1OPKBS19]'
FQ1OPKBS20 'Comforts other children who are upset [FQ1OPKBS20]'
FQ1OPKBS21 'Invites other children to play [FQ1OPKBS21]'
FQ1OPKBS22 'Cleans up his/her messes when asked [FQ1OPKBS22]'
FQ1OPKBS23 'Follows rules [FQ1OPKBS23]'
FQ1OPKBS24 'Seeks comfort from an adult when hurt [FQ1OPKBS24]'
FQ1OPKBS25 'Shares toys and other belongings [FQ1OPKBS25]'
FQ1OPKBS26 'Stands up for his/her rights [FQ1OPKBS26]'
FQ1OPKBS27 'Apologizes for accidental behavior that may upset others [FQ1OPKBS27]'
FQ1OPKBS28 'Gives in or compromises with peers when appropriate [FQ1OPKBS28]'
FQ1OPKBS29 'Accepts decisions made by adults [FQ1OPKBS29]'
FQ1OPKBS30 'Takes turns with toys and other objects [FQ1OPKBS30]'
FQ1OPKBS31 'Is confident in social interactions [FQ1OPKBS31]'
FQ1OPKBS32 'Responds appropriately when corrected [FQ1OPKBS32]'
FQ1OPKBS33 'Is sensitive to adult problems (e.g. are you sad?) [FQ1PPKBS33]'
FQ1OPKBS34 'Shows affection for other children [FQ1OPKBS34]'.
EXECUTE. 

*STEP 10: ADD VALUE LABELS.
*Include missing values like 'Prefer not to Answer' (or something similar) if applicable.
*Include ALL missing value labels (SEE ABOVE FOR FULL LIST).
VALUE LABELS
FQ1OPKBS01 FQ1OPKBS02 FQ1OPKBS03 FQ1OPKBS04 FQ1OPKBS05 FQ1OPKBS06 FQ1OPKBS07 
FQ1OPKBS08 FQ1OPKBS09 FQ1OPKBS10 FQ1OPKBS11 FQ1OPKBS12 FQ1OPKBS13  
FQ1OPKBS14 FQ1OPKBS15 FQ1OPKBS16  FQ1OPKBS17 FQ1OPKBS18 FQ1OPKBS19 
FQ1OPKBS20 FQ1OPKBS21 FQ1OPKBS22 FQ1OPKBS23 FQ1OPKBS24  FQ1OPKBS25 
FQ1OPKBS26 FQ1OPKBS27 FQ1OPKBS28 FQ1OPKBS29 FQ1OPKBS30 FQ1OPKBS31 
FQ1OPKBS32 FQ1OPKBS33 FQ1OPKBS34
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
0 'Never (0)'
1 'Rarely (1)'
2 'Sometimes (2)'
3 'Often (3)'.
EXECUTE.

**STEP 11 (DELETE IF NOT NEEDED): LABELING MISSING VALUES AS MISSING.
**Recoding all negative numbers as missing. If no missing values, delete this syntax.
MISSING VALUES
FQ1OPKBS01 FQ1OPKBS02 FQ1OPKBS03 FQ1OPKBS04 FQ1OPKBS05 FQ1OPKBS06 FQ1OPKBS07 FQ1OPKBS08 FQ1OPKBS09 FQ1OPKBS10 FQ1OPKBS11 FQ1OPKBS12 FQ1OPKBS13  
FQ1OPKBS14 FQ1OPKBS15 FQ1OPKBS16  FQ1OPKBS17 FQ1OPKBS18 FQ1OPKBS19 FQ1OPKBS20 FQ1OPKBS21 FQ1OPKBS22 FQ1OPKBS23 FQ1OPKBS24  FQ1OPKBS25 
FQ1OPKBS26 FQ1OPKBS27 FQ1OPKBS28 FQ1OPKBS29 FQ1OPKBS30 FQ1OPKBS31 FQ1OPKBS32 FQ1OPKBS33 FQ1OPKBS34
    (LO THRU -1).
EXECUTE.

*STEP 12: SAVE CLEANED DATA FILE.
SAVE OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ1OPKBS_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.

*STEP 13: CHECK FREQUENCIES.
*Checking frequencies of all items before creating constructs.
*Include STAT variable here to be sure all missingness was coded correctly.
FREQUENCIES VARIABLES=FD1OSTAT FQ1OPKBS01 FQ1OPKBS02 FQ1OPKBS03 FQ1OPKBS04 FQ1OPKBS05 FQ1OPKBS06 FQ1OPKBS07 FQ1OPKBS08 FQ1OPKBS09 FQ1OPKBS10 FQ1OPKBS11 FQ1OPKBS12 FQ1OPKBS13  
FQ1OPKBS14 FQ1OPKBS15 FQ1OPKBS16  FQ1OPKBS17 FQ1OPKBS18 FQ1OPKBS19 FQ1OPKBS20 FQ1OPKBS21 FQ1OPKBS22 FQ1OPKBS23 FQ1OPKBS24  FQ1OPKBS25 
FQ1OPKBS26 FQ1OPKBS27 FQ1OPKBS28 FQ1OPKBS29 FQ1OPKBS30 FQ1OPKBS31 FQ1OPKBS32 FQ1OPKBS33 FQ1OPKBS34
  /ORDER=ANALYSIS.

*STEP 14: CHECK DESCRIPTIVES.
*Checking descriptives for all items before creating constructs.
DESCRIPTIVES VARIABLES=FQ1OPKBS01 FQ1OPKBS02 FQ1OPKBS03 FQ1OPKBS04 FQ1OPKBS05 FQ1OPKBS06 FQ1OPKBS07 FQ1OPKBS08 FQ1OPKBS09 FQ1OPKBS10 FQ1OPKBS11 FQ1OPKBS12 FQ1OPKBS13  
FQ1OPKBS14 FQ1OPKBS15 FQ1OPKBS16  FQ1OPKBS17 FQ1OPKBS18 FQ1OPKBS19 FQ1OPKBS20 FQ1OPKBS21 FQ1OPKBS22 FQ1OPKBS23 FQ1OPKBS24  FQ1OPKBS25 
FQ1OPKBS26 FQ1OPKBS27 FQ1OPKBS28 FQ1OPKBS29 FQ1OPKBS30 FQ1OPKBS31 FQ1OPKBS32 FQ1OPKBS33 FQ1OPKBS34
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 15: SAVE CLEANED DATA FILE.
*Sorting the data file by ID and resaving the final file.
*To reorder items, use /KEEP {list all variables in order} -- insert in line after file name.
SORT CASES BY ID(A).
SAVE OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ1OPKBS_Cleaned.sav'
  /KEEP ID FD1OSTAT FD1ORD FQ1OPKBS01 FQ1OPKBS02 FQ1OPKBS03 FQ1OPKBS04 FQ1OPKBS05 FQ1OPKBS06 FQ1OPKBS07 FQ1OPKBS08 FQ1OPKBS09 FQ1OPKBS10 FQ1OPKBS11 FQ1OPKBS12 FQ1OPKBS13  
FQ1OPKBS14 FQ1OPKBS15 FQ1OPKBS16  FQ1OPKBS17 FQ1OPKBS18 FQ1OPKBS19 FQ1OPKBS20 FQ1OPKBS21 FQ1OPKBS22 FQ1OPKBS23 FQ1OPKBS24  FQ1OPKBS25 FQ1OPKBS26 FQ1OPKBS27 
FQ1OPKBS28 FQ1OPKBS29 FQ1OPKBS30 FQ1OPKBS31 
FQ1OPKBS32 FQ1OPKBS33 FQ1OPKBS34
  /COMPRESSED.
  EXECUTE.

*STEP 16: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE
 OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ1OPKBS_Cleaned.spv'
 LOCK=NO.

* Encoding: UTF-8.
*STEP 0: NOTES
*ACCEPTANCE AND ACTION QUESTIONNAIRE, 2ND VERSION (AAQ-II).  

*09-30-2021 (AZ): Edited syntax to prepare for T4 data
*10-14-2021 (AZ): Edited file paths to run T4 data. 
*04-13-2022 (BM):Adapted Syntax to Match Updated Template + Pass in Updated Data. 
*4-15-22(AAC): Checked.
*04-18-2022(BM): Double Checked and Fixed Missing Codes.
*04-21-22(AAC): Checked.
*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------.
*STEP 1: OPENING RAW DATA.
*Insert the correct file path and file name. Use syntax to open raw data file.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/DBT Moms R01 Study Time 4 Mother Survey_April 18, 2022_16.19.sav'.
  
*STEP 2: SAVING QUESTIONNAIRE SPECIFIC RAW DATA. 
*Insert the correct file path and file name. Save this file with only those variables that you need, in the following order; ID, Start Date, Questionnaire Items (i.e., AAQ_1 to AAQ_36).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OAAQ_Cleaned.sav'
  /KEEP 
  FQ4ID 
  STARTDATE
  FQ4AAQ_1 TO FQ4AAQ_10
  /COMPRESSED.
  EXECUTE.

*STEP 3: OPEN NEW DATA FILE.  
*Insert the correct file path and file name. Open the file you just created and saved so that you are able to clean the data.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OAAQ_Cleaned.sav'.

*STEP 4: TRANSFORM VARIABLES AND SORT IDS ASCENDING ORDER.
*Transforming ID from a string to a numeric variable, change the date format of startdate, and sort IDs in ascending order.
ALTER TYPE FQ4ID (F10.0).
EXECUTE.
FORMATS STARTDATE (adate10).
EXECUTE.
SORT CASES BY FQ4ID(A).
EXECUTE.

*STEP 5: RENAME ‘RAW DATA’ VARIABLES TO ‘CLEANED’ VARIABLES NAMES. 
*Rename all variables so they reflect our naming scheme. ID should always be labeled as 'ID'. Item should be numbers 01-36 or 001-106. 
RENAME VARIABLE (FQ4ID=ID).
EXECUTE.
RENAME VARIABLE (STARTDATE=FQ4OAAQDATE).
EXECUTE.
RENAME VARIABLE (FQ4AAQ_1 = FQ4OAAQ01) (FQ4AAQ_2 = FQ4OAAQ02) (FQ4AAQ_3 = FQ4OAAQ03) (FQ4AAQ_4 = FQ4OAAQ04) (FQ4AAQ_5 = FQ4OAAQ05) (FQ4AAQ_6 = FQ4OAAQ06).
EXECUTE.
RENAME VARIABLE (FQ4AAQ_7 = FQ4OAAQ07) (FQ4AAQ_8 = FQ4OAAQ08) (FQ4AAQ_9 = FQ4OAAQ09) (FQ4AAQ_10 = FQ4OAAQ10).
EXECUTE.
*Remember to save your data file.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OAAQ_Cleaned.sav'.
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
/FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OAAQ_Cleaned.sav'
/BY ID
/DROP=
FD0OSTAT FD0ORD
FD1OSTAT FD1OTD FD1ORD FD1ODIFF
FD2OSTAT FD2OTD FD2ORD FD2ODIFF
FD3OSTAT FD3OTD FD3ORD FD3ODIFF
FD4OTD FD4ODIFF
FD4AOSTAT FD4AOTD FD4AORD FD4AODIFF.
SELECT IF f=1.
EXECUTE.
*Comparing REDCap and Qualtrics dates of completion. Be sure to update the date variables used to reflect the accurate RD and questionnaire date.
COMPUTE DATEDIFF = DATEDIFF(FD4ORD,FQ4OAAQDATE,'days').
EXECUTE.
COUNT DATEDIFF0=DATEDIFF(Lowest thru -1) DATEDIFF(1 thru Highest).
EXECUTE.
FREQUENCIES VARIABLES=DATEDIFF0
  /ORDER=ANALYSIS.
SORT CASES BY DATEDIFF0(D).
*CHECK ALL IDS WITH DISCREPANT DATES TO DETERMINE WHAT IS CORRECT. CONSULT BEFORE MAKING ANY CHANGES TO RAW DATA IN REDCAP OR QUALTRICS.
*INCLUDE NOTES HERE FOR EACH ID THAT WAS DISCREPANT (EXAMPLE BELOW - ADAPT AS NEEDED)
*THE FOLLOWING IDs (90754 and 91123) HAVE A A4 QUALTRICS DATE [FQ4OXXXDATE] THAT DOES NOT MATCH THEIR A4 VISIT DATE [FD4ORD]. 
*THIS WAS INVESTIGATED BY STAFF (BM: 4-11-22) AND VISIT DATE [FQ4OXXXDATE] WAS CONFIRMED TO BE THE CORRECT DATE FOR QUALTRICS DATA USING MULTIPLE SOURCES.
IF(ID=90754)FD4ORD=13768849370.
EXECUTE.
IF(ID=91123)FD4ORD=13768849370.
EXECUTE.

SORT CASES BY ID(A).
*DROPPING VARIABLES THAT ARE NO LONGER RELEVANT TO FINAL DATA FILE.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OAAQ_Cleaned.sav'
/DROP
FQ4OAAQDATE
DATEDIFF
DATEDIFF0
f.
EXECUTE.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OAAQ_Cleaned.sav'.
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

**STEP 7 (DELETE IF NOT NEEDED): CREATING NEW VARIABLES FOR REVERSED SCORED ITEMS.
**Reverse-Scored Items; see scoring document to determine if there are reverse-scored items. If no reverse-scored items, delete this syntax.
RECODE FQ4OAAQ01 (1=7) (2=6) (3=5) (4=4) (5=3) (6=2) (7=1) (-10=-10) INTO FQ4OAAQ01R.
EXECUTE.
RECODE FQ4OAAQ06 (1=7) (2=6) (3=5) (4=4) (5=3) (6=2) (7=1) (-10=-10) INTO FQ4OAAQ06R.
EXECUTE.
RECODE FQ4OAAQ10 (1=7) (2=6) (3=5) (4=4) (5=3) (6=2) (7=1) (-10=-10) INTO FQ4OAAQ10R.
EXECUTE.

*STEP 7A: RECODING SYSMIS (PARTICIPANTS THAT MISSED THE ASSESSMENT).
*This will use the STAT variable to recode all SYSMIS data. CHANGE THE STAT VARIABLE TO MATCH THE ASSESSMENT WAVE YOU ARE WORKING IN.
*Include full list of numeric variables (including new reverse-scored items).
DO IF MISSING(FD4OSTAT).
DO REPEAT x = FQ4OAAQ01 TO FQ4OAAQ10R.
RECODE FD4OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.

*90210 skipped a question.
DO IF (ID=90210). 
    RECODE
    FQ4OAAQ01 FQ4OAAQ01R
    (SYSMIS=-10).
END IF.
EXECUTE.

*91662 skipped a question.
DO IF (ID=91662). 
    RECODE
    FQ4OAAQ06 FQ4OAAQ06R
    (SYSMIS=-10).
END IF.
EXECUTE.

*91747 skipped a question.
DO IF (ID=91747). 
    RECODE
    FQ4OAAQ09 
    (SYSMIS=-10).
END IF.
EXECUTE. 

*STEP 8: STANDARDIZING DECIMAL PLACES (CANNOT INCLUDE TEXT/STRING VARIABLES).
*Making all variables have the same number of decimal places. Ensure that variables include all new reverse-scored variables. Change the number AFTER the decimal place as needed.
FORMATS FQ4OAAQ01 to FQ4OAAQ10R (F8.0).
EXECUTE.

*STEP 9: CREATING VARIABLE LABLES.
*Label all variables. Use the original questionnaire to include the exact text that participants saw. Include the questionnaire name and number at the end of the label.
VARIABLE LABELS  ID 'Participant ID'.
EXECUTE.

VARIABLE LABELS 
FQ4OAAQ01 'Its okay if I remember something unpleasant. [FQ4OAAQ01]'
FQ4OAAQ02 'My painful experiences and memories make it difficult for me to live a life that I would value. [FQ4OAAQ02]'
FQ4OAAQ03 'Im afraid of my feelings. [FQ4OAAQ03]'
FQ4OAAQ04 'I worry about being unable to control my worries and feelings. [FQ4OAAQ04]'
FQ4OAAQ05 'My painful memories prevent me from having a fulfilling life. [FQ4OAAQ05]'
FQ4OAAQ06 'I am in control of my life. [FQ4OAAQ06]'
FQ4OAAQ07 'Emotions cause problems in my life. [FQ4OAAQ07]'
FQ4OAAQ08 'It seems as if most people are handling their lives better than I am. [FQ4OAAQ08]'
FQ4OAAQ09 'Worries get in the way of my success. [FQ4OAAQ09]'
FQ4OAAQ10 'My thoughts and feelings do not get in the way of how I want to live my life. [FQ4OAAQ10]'
FQ4OAAQ01R 'Its okay if I remember something unpleasant. [FQ4OAAQ01R]'
FQ4OAAQ06R 'I am in control of my life. [FQ4OAAQ06R]'
FQ4OAAQ10R 'My thoughts and feelings do not get in the way of how I want to live my life. [FQ4OAAQ10R]'.
EXECUTE. 

*STEP 10: ADD VALUE LABELS.
*Include missing values like 'Prefer not to Answer' (or something similar) if applicable.
*Include ALL missing value labels (SEE ABOVE FOR FULL LIST).
VALUE LABELS
FQ4OAAQ01 FQ4OAAQ02 FQ4OAAQ03 FQ4OAAQ04 FQ4OAAQ05 FQ4OAAQ06 FQ4OAAQ07 
FQ4OAAQ08 FQ4OAAQ09 FQ4OAAQ10 
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
-10 'Prefer not to Answer (-10)'
1 'Never True (1)'
2 'Very Rarely True (2)'
3 'Seldom True (3)' 
4 'Sometimes True (4)'
5 'Often True (5)'
6 'Almost Always True (6)'
7 'Always True (7)'.
EXECUTE.

VALUE LABELS
FQ4OAAQ01R FQ4OAAQ06R FQ4OAAQ10R
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
-10 'Prefer not to Answer (-10)'
1 'Always True (1)'
2 'Almost Always True (2)'
3 'Often True (3)'
4 'Sometimes True (4)'
5 'Seldom True (5)'
6 'Very Rarely True (6)'
7 'Never True (7)'.
EXECUTE.

*STEP 11: LABELING MISSING VALUES AS MISSING.
*Recoding all negative numbers as missing.
MISSING VALUES
    FQ4OAAQ01 FQ4OAAQ02 FQ4OAAQ03 FQ4OAAQ04 FQ4OAAQ05 FQ4OAAQ06 FQ4OAAQ07 FQ4OAAQ08 FQ4OAAQ09 FQ4OAAQ10 
    FQ4OAAQ01R FQ4OAAQ06R FQ4OAAQ10R
    (LO THRU -1).
EXECUTE.

*STEP 12: SAVE CLEANED DATA FILE.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OAAQ_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.

*STEP 13: CHECK FREQUENCIES.
*Checking frequencies of all items before creating constructs.
*Include STAT variable here to be sure all missingness was coded correctly.
FREQUENCIES VARIABLES=FD4OSTAT FQ4OAAQ01 FQ4OAAQ02 FQ4OAAQ03 FQ4OAAQ04 FQ4OAAQ05 FQ4OAAQ06 FQ4OAAQ07 FQ4OAAQ08 
    FQ4OAAQ09 FQ4OAAQ10
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=
    FQ4OAAQ01 FQ4OAAQ01R 
    FQ4OAAQ06 FQ4OAAQ06R
    FQ4OAAQ10 FQ4OAAQ10R
  /ORDER=ANALYSIS.

*STEP 14: CHECK DESCRIPTIVES.
*Checking descriptives for all items before creating constructs.
DESCRIPTIVES VARIABLES=FQ4OAAQ01 FQ4OAAQ02 FQ4OAAQ03 FQ4OAAQ04 FQ4OAAQ05 FQ4OAAQ06 FQ4OAAQ07 FQ4OAAQ08 
    FQ4OAAQ09 FQ4OAAQ10
  /STATISTICS=MEAN STDDEV MIN MAX.

DESCRIPTIVES VARIABLES=
    FQ4OAAQ01 FQ4OAAQ01R  
    FQ4OAAQ06 FQ4OAAQ06R
    FQ4OAAQ10 FQ4OAAQ10R
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 15: SAVE CLEANED DATA FILE.
*Sorting the data file by ID and resaving the final file.
*To reorder items, use /KEEP {list all variales in order} -- insert in line after file name.
SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OAAQ_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OAAQ_Cleaned.sav'.
EXECUTE.

*STEP 16: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE
 OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OAAQ_Cleaned.spv'
 LOCK=NO.


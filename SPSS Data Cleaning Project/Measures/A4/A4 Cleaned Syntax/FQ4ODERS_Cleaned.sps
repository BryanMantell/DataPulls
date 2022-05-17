* Encoding: UTF-8.
*STEP 0: NOTES
*DIFFICULTIES WITH EMOTION REGULATION SCALE (DERS)

*10-01-21 (BM): Adapted STEPS 1-16 from A1 Syntax file.
*04-13-2022 (BM):Adapted Syntax to Match Updated Template + Pass in Updated Data.
*04-15-22(AAC): Checked.
*04-18-2022(BM): Double Checked and Fixed Missing Codes.
*04-21-22(AAC): Checked.
*----------------------------------------------------------------------------------------------------------.
*STEP 1: OPENING RAW DATA.
*Insert the correct file path and file name. Use syntax to open raw data file.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/DBT Moms R01 Study Time 4 Mother Survey_April 18, 2022_16.19.sav'.

*STEP 2: SAVING QUESTIONNAIRE SPECIFIC RAW DATA. 
*Insert the correct file path and file name. Save this file with only those variables that you need, in the following order; ID, Start Date, Questionnaire Items (i.e., DERS_1 to DERS_36).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4ODERS_Cleaned.sav'
  /KEEP
  FQ4ID
  STARTDATE
  FQ4DERS_1 TO FQ4DERS_36
  /COMPRESSED.
  EXECUTE.

*STEP 3: OPEN NEW DATA FILE.  
*Insert the correct file path and file name. Open the file you just created and saved so that you are able to clean the data.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4ODERS_Cleaned.sav'.

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
RENAME VARIABLE (STARTDATE=FQ4ODERSDATE).
EXECUTE.
RENAME VARIABLE (FQ4DERS_1 = FQ4ODERS01) (FQ4DERS_2 = FQ4ODERS02) (FQ4DERS_3 = FQ4ODERS03) (FQ4DERS_4 = FQ4ODERS04) (FQ4DERS_5 = FQ4ODERS05) (FQ4DERS_6 = FQ4ODERS06).
EXECUTE.
RENAME VARIABLE (FQ4DERS_7 = FQ4ODERS07) (FQ4DERS_8 = FQ4ODERS08) (FQ4DERS_9 = FQ4ODERS09) (FQ4DERS_10 = FQ4ODERS10) (FQ4DERS_11 = FQ4ODERS11) (FQ4DERS_12 = FQ4ODERS12).
EXECUTE.
RENAME VARIABLE (FQ4DERS_13 = FQ4ODERS13) (FQ4DERS_14 = FQ4ODERS14) (FQ4DERS_15 = FQ4ODERS15) (FQ4DERS_16 = FQ4ODERS16) (FQ4DERS_17 = FQ4ODERS17) (FQ4DERS_18 = FQ4ODERS18).
EXECUTE.
RENAME VARIABLE (FQ4DERS_19 = FQ4ODERS19) (FQ4DERS_20 = FQ4ODERS20) (FQ4DERS_21 = FQ4ODERS21) (FQ4DERS_22 = FQ4ODERS22) (FQ4DERS_23 = FQ4ODERS23) (FQ4DERS_24 = FQ4ODERS24).
EXECUTE.
RENAME VARIABLE (FQ4DERS_25 = FQ4ODERS25) (FQ4DERS_26 = FQ4ODERS26) (FQ4DERS_27 = FQ4ODERS27) (FQ4DERS_28 = FQ4ODERS28) (FQ4DERS_29 = FQ4ODERS29) (FQ4DERS_30 = FQ4ODERS30).
EXECUTE.
RENAME VARIABLE (FQ4DERS_31 = FQ4ODERS31) (FQ4DERS_32 = FQ4ODERS32) (FQ4DERS_33 = FQ4ODERS33) (FQ4DERS_34 = FQ4ODERS34) (FQ4DERS_35 = FQ4ODERS35) (FQ4DERS_36 = FQ4ODERS36).
EXECUTE.
*Remember to save your data file.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4ODERS_Cleaned.sav'.
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
/FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4ODERS_Cleaned.sav'
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
COMPUTE DATEDIFF = DATEDIFF(FD4ORD,FQ4ODERSDATE,'days').
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
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4ODERS_Cleaned.sav'
/DROP
FQ4ODERSDATE
DATEDIFF
DATEDIFF0
f.
EXECUTE.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4ODERS_Cleaned.sav'.
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
**-11 'Participant (parent or child) deceased'                                  /* (Participant (parent or child) deceased) */
**-10 'Prefer not to answer'                                                           /* (Participant selected prefer not to answer) */.
RECODE FQ4ODERS01 to FQ4ODERS36 
    (6=-10).
EXECUTE.

DO IF (ID=91143). 
    RECODE
    FQ4ODERS15
    (SYSMIS=-10).
END IF.
EXECUTE.

DO IF (ID=91143). 
    RECODE
    FQ4ODERS16
    (SYSMIS=-10).
END IF.
EXECUTE.

DO IF (ID=90102). 
    RECODE
    FQ4ODERS16
    (SYSMIS=-10).
END IF.
EXECUTE.

DO IF (ID=91199). 
    RECODE
    FQ4ODERS25 
    (SYSMIS=-10).
END IF.
EXECUTE.

DO IF (ID=90724). 
    RECODE
    FQ4ODERS30 
    (SYSMIS=-10).
END IF.
EXECUTE.

DO IF (ID=90754). 
    RECODE
    FQ4ODERS35 
    (SYSMIS=-10).
END IF.
EXECUTE.
    
**STEP 7 (DELETE IF NOT NEEDED): CREATING NEW VARIABLES FOR REVERSED SCORED ITEMS.
**Reverse-Scored Items; see scoring document to determine if there are reverse-scored items. If no reverse-scored items, delete this syntax.
RECODE FQ4ODERS01 (1=5) (2=4) (3=3) (4=2) (5=1) (-10=-10) INTO FQ4ODERS01R.
EXECUTE.
RECODE FQ4ODERS02 (1=5) (2=4) (3=3) (4=2) (5=1) (-10=-10) INTO FQ4ODERS02R.
EXECUTE.
RECODE FQ4ODERS06 (1=5) (2=4) (3=3) (4=2) (5=1) (-10=-10) INTO FQ4ODERS06R.
EXECUTE.
RECODE FQ4ODERS07 (1=5) (2=4) (3=3) (4=2) (5=1) (-10=-10) INTO FQ4ODERS07R.
EXECUTE.
RECODE FQ4ODERS08 (1=5) (2=4) (3=3) (4=2) (5=1) (-10=-10) INTO FQ4ODERS08R.
EXECUTE.
RECODE FQ4ODERS10 (1=5) (2=4) (3=3) (4=2) (5=1) (-10=-10) INTO FQ4ODERS10R.
EXECUTE.
RECODE FQ4ODERS17 (1=5) (2=4) (3=3) (4=2) (5=1) (-10=-10) INTO FQ4ODERS17R.
EXECUTE.
RECODE FQ4ODERS20 (1=5) (2=4) (3=3) (4=2) (5=1) (-10=-10) INTO FQ4ODERS20R.
EXECUTE.
RECODE FQ4ODERS22 (1=5) (2=4) (3=3) (4=2) (5=1) (-10=-10) INTO FQ4ODERS22R.
EXECUTE.
RECODE FQ4ODERS24 (1=5) (2=4) (3=3) (4=2) (5=1) (-10=-10) INTO FQ4ODERS24R.
EXECUTE.
RECODE FQ4ODERS34 (1=5) (2=4) (3=3) (4=2) (5=1) (-10=-10) INTO FQ4ODERS34R.
EXECUTE.

*STEP 7A: RECODING SYSMIS (PARTICIPANTS THAT MISSED THE ASSESSMENT).
*This will use the STAT variable to recode all SYSMIS data. CHANGE THE STAT VARIABLE TO MATCH THE ASSESSMENT WAVE YOU ARE WORKING IN.
*Include full list of numeric variables (including new reverse-scored items).
DO IF MISSING(FD4OSTAT).
DO REPEAT x = FQ4ODERS01 TO FQ4ODERS34R.
RECODE FD4OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.


*STEP 8: STANDARDIZING DECIMAL PLACES (CANNOT INCLUDE TEXT/STRING VARIABLES).
*Making all variables have the same number of decimal places. Ensure that variables include all new reverse-scored variables. Change the number AFTER the decimal place as needed.
FORMATS FQ4ODERS01 to FQ4ODERS34R  (F8.0).
EXECUTE.

*STEP 9: CREATING VARIABLE LABLES.
*Label all variables. Use the original questionnaire to include the exact text that participants saw. Include the questionnaire name and number at the end of the label.
VARIABLE LABELS  ID 'Participant ID'.
EXECUTE.

VARIABLE LABELS
FQ4ODERS01 'I am clear about my feelings [FQ4ODERS01]'
FQ4ODERS02 'I pay attention to how I feel [FQ4ODERS02]'
FQ4ODERS03 'I experience my emotions as overwhelming and out of control [FQ4ODERS03]'
FQ4ODERS04 'I have no idea how I am feeling [FQ4ODERS04]'
FQ4ODERS05 'I have difficulty making sense out of my feelings [FQ4ODERS05]'
FQ4ODERS06 'I am attentive to my feelings [FQ4ODERS06]'
FQ4ODERS07 'I know exactly how I am feeling [FQ4ODERS07]'
FQ4ODERS08 'I care about what I am feeling [FQ4ODERS08]'
FQ4ODERS09 'I am confused about how I feel [FQ4ODERS09]'
FQ4ODERS10 'When Im upset, I acknowledge my emotions [FQ4ODERS10]'
FQ4ODERS11 'When Im upset, I become angry with myself for feeling that way [FQ4ODERS11]'
FQ4ODERS12 'When Im upset, I become embarrassed for feeling that way [FQ4ODERS12]'
FQ4ODERS13 'When Im upset, I have difficulty getting work done [FQ4ODERS13]'
FQ4ODERS14 'When Im upset, I become out of control [FQ4ODERS14]'
FQ4ODERS15 'When Im upset, I believe that I will remain that way for a long time [FQ4ODERS15]'
FQ4ODERS16 'When Im upset, I believe that I will end up feeling very depressed [FQ4ODERS16]'
FQ4ODERS17 'When Im upset, I believe that my feelings are valid and important [FQ4ODERS17]'
FQ4ODERS18 'When Im upset, I have difficulty focusing on other things [FQ4ODERS18]'
FQ4ODERS19 'When Im upset, I feel out of control [FQ4ODERS19]'
FQ4ODERS20 'When Im upset, I can still get things done [FQ4ODERS20]'
FQ4ODERS21 'When Im upset, I feel ashamed with myself for feeling that way [FQ4ODERS21]'
FQ4ODERS22 'When Im upset, I know that I can find a way to eventually feel better [FQ4ODERS22]'
FQ4ODERS23 'When Im upset, I feel like I am weak [FQ4ODERS23]'
FQ4ODERS24 'When Im upset, I feel like I can remain in control of my behaviors [FQ4ODERS24]'
FQ4ODERS25 'When Im upset, I feel guilty for feeling that way [FQ4ODERS25]'
FQ4ODERS26 'When Im upset, I have difficulty concentrating [FQ4ODERS26]'
FQ4ODERS27 'When Im upset, I have difficulty controlling my behaviors [FQ4ODERS27]'
FQ4ODERS28 'When Im upset, I believe that there is nothing I can do to make myself feel better [FQ4ODERS28]'
FQ4ODERS29 'When Im upset, I become irritated with myself for feeling that way [FQ4ODERS29]'
FQ4ODERS30 'When Im upset, I start to feel very bad about myself [FQ4ODERS30]'
FQ4ODERS31 'When Im upset, I believe that wallowing in it is all I can do [FQ4ODERS31]'
FQ4ODERS32 'When Im upset, I lose control over my behaviors [FQ4ODERS32]'
FQ4ODERS33 'When Im upset, I have difficulty thinking about anyone else [FQ4ODERS33]'
FQ4ODERS34 'When Im upset, I take time to figure out what Im really feeling [FQ4ODERS34]'
FQ4ODERS35 'When Im upset, it takes me a long time to feel better [FQ4ODERS35]'
FQ4ODERS36 'When Im upset, my emotions feel overwhelming [FQ4ODERS36]'
FQ4ODERS01R 'I am clear about my feelings [FQ4ODERS01R]'
FQ4ODERS02R 'I pay attention to how I feel [FQ4ODERS02R]'
FQ4ODERS06R 'I am attentive to my feelings [FQ4ODERS06R]'
FQ4ODERS07R 'I know exactly how I am feeling [FQ4ODERS07R]'
FQ4ODERS08R 'I care about what I am feeling [FQ4ODERS08R]'
FQ4ODERS10R 'When Im upset, I acknowledge my emotions [FQ4ODERS10R]'
FQ4ODERS17R 'When Im upset, I believe that my feelings are valid and important [FQ4ODERS17R]'
FQ4ODERS20R 'When Im upset, I can still get things done [FQ4ODERS20R]'
FQ4ODERS22R 'When Im upset, I know that I can find a way to eventually feel better [FQ4ODERS22R]'
FQ4ODERS24R 'When Im upset, I feel like I can remain in control of my behaviors [FQ4ODERS24R]'
FQ4ODERS34R 'When Im upset, I take time to figure out what Im really feeling [FQ4ODERS34R]'.
EXECUTE.

*STEP 10: ADD VALUE LABELS.
*Include missing values like 'Prefer not to Answer' (or something similar) if applicable.
*Include ALL missing value labels (SEE ABOVE FOR FULL LIST).
VALUE LABELS
FQ4ODERS01 FQ4ODERS02 FQ4ODERS03 FQ4ODERS04 FQ4ODERS05 FQ4ODERS06 FQ4ODERS07
FQ4ODERS08 FQ4ODERS09 FQ4ODERS10 FQ4ODERS11 FQ4ODERS12 FQ4ODERS13
FQ4ODERS14 FQ4ODERS15 FQ4ODERS16  FQ4ODERS17 FQ4ODERS18 FQ4ODERS19
FQ4ODERS20 FQ4ODERS21 FQ4ODERS22 FQ4ODERS23 FQ4ODERS24  FQ4ODERS25
FQ4ODERS26 FQ4ODERS27 FQ4ODERS28 FQ4ODERS29 FQ4ODERS30 FQ4ODERS31
FQ4ODERS32 FQ4ODERS33 FQ4ODERS34 FQ4ODERS35 FQ4ODERS36
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
1 'Almost Never (0-10%)'
2 'Sometimes (11%-35%)'
3 'About half the time (36%-65%)'
4 'Most of the time (66-90%)'
5 'Almost Always (91-100%)'.
EXECUTE.

VALUE LABELS
FQ4ODERS01R FQ4ODERS02R FQ4ODERS06R FQ4ODERS07R FQ4ODERS08R FQ4ODERS10R FQ4ODERS17R FQ4ODERS20R FQ4ODERS22R FQ4ODERS24R FQ4ODERS34R
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
5 'Almost Never (0-10%)'
4 'Sometimes (11%-35%)'
3 'About half the time (36%-65%)'
2 'Most of the time (66-90%)'
1 'Almost Always (91-100%)'.
EXECUTE.

*STEP 11: LABELING MISSING VALUES AS MISSING.
*Recoding all negative numbers as missing.
MISSING VALUES FQ4ODERS01 FQ4ODERS02 FQ4ODERS03 FQ4ODERS04 FQ4ODERS05 FQ4ODERS06 FQ4ODERS07 FQ4ODERS08 FQ4ODERS09
    FQ4ODERS10 FQ4ODERS11 FQ4ODERS12 FQ4ODERS13 FQ4ODERS14 FQ4ODERS15 FQ4ODERS16 FQ4ODERS17 FQ4ODERS18 FQ4ODERS19
    FQ4ODERS20 FQ4ODERS21 FQ4ODERS22 FQ4ODERS23 FQ4ODERS24 FQ4ODERS25 FQ4ODERS26 FQ4ODERS27 FQ4ODERS28 FQ4ODERS29
    FQ4ODERS30 FQ4ODERS31 FQ4ODERS32 FQ4ODERS33 FQ4ODERS34 FQ4ODERS35 FQ4ODERS36 FQ4ODERS01R FQ4ODERS02R
    FQ4ODERS06R FQ4ODERS07R FQ4ODERS08R FQ4ODERS10R FQ4ODERS17R FQ4ODERS20R FQ4ODERS22R FQ4ODERS24R FQ4ODERS34R
   (LO THRU -1).
EXECUTE.

*STEP 12: SAVE CLEANED DATA FILE.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4ODERS_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.

*STEP 13: CHECK FREQUENCIES.
*Checking frequencies of all items before creating constructs.
*Include STAT variable here to be sure all missingness was coded correctly.
FREQUENCIES VARIABLES=FD4OSTAT FQ4ODERS01 FQ4ODERS02 FQ4ODERS03 FQ4ODERS04 FQ4ODERS05 FQ4ODERS06 FQ4ODERS07 FQ4ODERS08
    FQ4ODERS09 FQ4ODERS10 FQ4ODERS11 FQ4ODERS12 FQ4ODERS13 FQ4ODERS14 FQ4ODERS15 FQ4ODERS16 FQ4ODERS17 FQ4ODERS18 FQ4ODERS19
    FQ4ODERS20 FQ4ODERS21 FQ4ODERS22 FQ4ODERS23 FQ4ODERS24 FQ4ODERS25 FQ4ODERS26 FQ4ODERS27 FQ4ODERS28 FQ4ODERS29 FQ4ODERS30
    FQ4ODERS31 FQ4ODERS32 FQ4ODERS33 FQ4ODERS34 FQ4ODERS35 FQ4ODERS36
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=
    FD4OSTAT
    FQ4ODERS01 FQ4ODERS01R
    FQ4ODERS02 FQ4ODERS02R
    FQ4ODERS06 FQ4ODERS06R
    FQ4ODERS07 FQ4ODERS07R
    FQ4ODERS08 FQ4ODERS08R
    FQ4ODERS10 FQ4ODERS10R
    FQ4ODERS17 FQ4ODERS17R
    FQ4ODERS20 FQ4ODERS20R
    FQ4ODERS22 FQ4ODERS22R
    FQ4ODERS24 FQ4ODERS24R
    FQ4ODERS34 FQ4ODERS34R
  /ORDER=ANALYSIS.

*STEP 14: CHECK DESCRIPTIVES.
*Checking descriptives for all items before creating constructs.
DESCRIPTIVES VARIABLES=FQ4ODERS01 FQ4ODERS02 FQ4ODERS03 FQ4ODERS04 FQ4ODERS05 FQ4ODERS06 FQ4ODERS07 FQ4ODERS08
    FQ4ODERS09 FQ4ODERS10 FQ4ODERS11 FQ4ODERS12 FQ4ODERS13 FQ4ODERS14 FQ4ODERS15 FQ4ODERS16 FQ4ODERS17 FQ4ODERS18 FQ4ODERS19
    FQ4ODERS20 FQ4ODERS21 FQ4ODERS22 FQ4ODERS23 FQ4ODERS24 FQ4ODERS25 FQ4ODERS26 FQ4ODERS27 FQ4ODERS28 FQ4ODERS29 FQ4ODERS30
    FQ4ODERS31 FQ4ODERS32 FQ4ODERS33 FQ4ODERS34 FQ4ODERS35 FQ4ODERS36
  /STATISTICS=MEAN STDDEV MIN MAX.

DESCRIPTIVES VARIABLES=
    FQ4ODERS01 FQ4ODERS01R
    FQ4ODERS02 FQ4ODERS02R
    FQ4ODERS06 FQ4ODERS06R
    FQ4ODERS07 FQ4ODERS07R
    FQ4ODERS08 FQ4ODERS08R
    FQ4ODERS10 FQ4ODERS10R
    FQ4ODERS17 FQ4ODERS17R
    FQ4ODERS20 FQ4ODERS20R
    FQ4ODERS22 FQ4ODERS22R
    FQ4ODERS24 FQ4ODERS24R
    FQ4ODERS34 FQ4ODERS34R
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 15: SAVE CLEANED DATA FILE.
*Sorting the data file by ID and resaving the final file.
*To reorder items, use /KEEP {list all variales in order} -- insert in line after file name.
SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4ODERS_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4ODERS_Cleaned.sav'.
EXECUTE.

*STEP 16: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE
 OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4ODERS_Cleaned.spv'
 LOCK=NO.


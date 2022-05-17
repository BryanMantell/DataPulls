* Encoding: UTF-8.
*STEP 0: NOTES
*DIFFICULTIES WITH EMOTION REGULATION SCALE (DERS)

*10-01-21 (BM): Adapted STEPS 1-16 from A1 Syntax file.
*10-05-21 (BM): Ran syntax on real data checked for problems.
*12-07-21(AZ): Edited T2 syntax for changes (Steps 5, 5A, 7A, 10, 13, 15) and ran syntax.
*12-14-21(AAC): Corrected notes to match template. Fixed reverse coding missing items in STEP 7A. 
*1-13-22(BM): Checked and Edited comment in STEP 5A.
*1-20-22(AAC): CHECKED.

*----------------------------------------------------------------------------------------------------------.
*STEP 1: OPENING RAW DATA.
*Insert the correct file path and file name. Use syntax to open raw data file.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/DBT Moms R01 Study Time 2 Mother Survey_December 3, 2021_13.49.sav'.

*STEP 2: SAVING QUESTIONNAIRE SPECIFIC RAW DATA. 
*Insert the correct file path and file name. Save this file with only those variables that you need, in the following order; ID, Start Date, Questionnaire Items (i.e., DERS_1 to DERS_36).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2ODERS_Cleaned.sav'
  /KEEP
  FQ2ID
  STARTDATE
  FQ2DERS_1 TO FQ2DERS_36
  /COMPRESSED.
  EXECUTE.

*STEP 3: OPEN NEW DATA FILE.  
*Insert the correct file path and file name. Open the file you just created and saved so that you are able to clean the data.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2ODERS_Cleaned.sav'.

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
RENAME VARIABLE (STARTDATE=FQ2ODERSDATE).
EXECUTE.
RENAME VARIABLE (FQ2DERS_1 = FQ2ODERS01) (FQ2DERS_2 = FQ2ODERS02) (FQ2DERS_3 = FQ2ODERS03) (FQ2DERS_4 = FQ2ODERS04) (FQ2DERS_5 = FQ2ODERS05) (FQ2DERS_6 = FQ2ODERS06).
EXECUTE.
RENAME VARIABLE (FQ2DERS_7 = FQ2ODERS07) (FQ2DERS_8 = FQ2ODERS08) (FQ2DERS_9 = FQ2ODERS09) (FQ2DERS_10 = FQ2ODERS10) (FQ2DERS_11 = FQ2ODERS11) (FQ2DERS_12 = FQ2ODERS12).
EXECUTE.
RENAME VARIABLE (FQ2DERS_13 = FQ2ODERS13) (FQ2DERS_14 = FQ2ODERS14) (FQ2DERS_15 = FQ2ODERS15) (FQ2DERS_16 = FQ2ODERS16) (FQ2DERS_17 = FQ2ODERS17) (FQ2DERS_18 = FQ2ODERS18).
EXECUTE.
RENAME VARIABLE (FQ2DERS_19 = FQ2ODERS19) (FQ2DERS_20 = FQ2ODERS20) (FQ2DERS_21 = FQ2ODERS21) (FQ2DERS_22 = FQ2ODERS22) (FQ2DERS_23 = FQ2ODERS23) (FQ2DERS_24 = FQ2ODERS24).
EXECUTE.
RENAME VARIABLE (FQ2DERS_25 = FQ2ODERS25) (FQ2DERS_26 = FQ2ODERS26) (FQ2DERS_27 = FQ2ODERS27) (FQ2DERS_28 = FQ2ODERS28) (FQ2DERS_29 = FQ2ODERS29) (FQ2DERS_30 = FQ2ODERS30).
EXECUTE.
RENAME VARIABLE (FQ2DERS_31 = FQ2ODERS31) (FQ2DERS_32 = FQ2ODERS32) (FQ2DERS_33 = FQ2ODERS33) (FQ2DERS_34 = FQ2ODERS34) (FQ2DERS_35 = FQ2ODERS35) (FQ2DERS_36 = FQ2ODERS36).
EXECUTE.
*Remember to save your data file.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2ODERS_Cleaned.sav'.
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
/FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2ODERS_Cleaned.sav'
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
COMPUTE DATEDIFF = DATEDIFF(FD2ORD,FQ2ODERSDATE,'days').
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
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2ODERS_Cleaned.sav'
/DROP
FQ2ODERSDATE
DATEDIFF
DATEDIFF0
f.
EXECUTE.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2ODERS_Cleaned.sav'.
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
RECODE FQ2ODERS01 to FQ2ODERS36 
    (6=-10).
EXECUTE.
    
**STEP 7 (DELETE IF NOT NEEDED): CREATING NEW VARIABLES FOR REVERSED SCORED ITEMS.
**Reverse-Scored Items; see scoring document to determine if there are reverse-scored items. If no reverse-scored items, delete this syntax.
RECODE FQ2ODERS01 (1=5) (2=4) (3=3) (4=2) (5=1) (-10=-10) INTO FQ2ODERS01R.
EXECUTE.
RECODE FQ2ODERS02 (1=5) (2=4) (3=3) (4=2) (5=1) (-10=-10) INTO FQ2ODERS02R.
EXECUTE.
RECODE FQ2ODERS06 (1=5) (2=4) (3=3) (4=2) (5=1) (-10=-10) INTO FQ2ODERS06R.
EXECUTE.
RECODE FQ2ODERS07 (1=5) (2=4) (3=3) (4=2) (5=1) (-10=-10) INTO FQ2ODERS07R.
EXECUTE.
RECODE FQ2ODERS08 (1=5) (2=4) (3=3) (4=2) (5=1) (-10=-10) INTO FQ2ODERS08R.
EXECUTE.
RECODE FQ2ODERS10 (1=5) (2=4) (3=3) (4=2) (5=1) (-10=-10) INTO FQ2ODERS10R.
EXECUTE.
RECODE FQ2ODERS17 (1=5) (2=4) (3=3) (4=2) (5=1) (-10=-10) INTO FQ2ODERS17R.
EXECUTE.
RECODE FQ2ODERS20 (1=5) (2=4) (3=3) (4=2) (5=1) (-10=-10) INTO FQ2ODERS20R.
EXECUTE.
RECODE FQ2ODERS22 (1=5) (2=4) (3=3) (4=2) (5=1) (-10=-10) INTO FQ2ODERS22R.
EXECUTE.
RECODE FQ2ODERS24 (1=5) (2=4) (3=3) (4=2) (5=1) (-10=-10) INTO FQ2ODERS24R.
EXECUTE.
RECODE FQ2ODERS34 (1=5) (2=4) (3=3) (4=2) (5=1) (-10=-10) INTO FQ2ODERS34R.
EXECUTE.

*STEP 7A: RECODING SYSMIS (PARTICIPANTS THAT MISSED THE ASSESSMENT).
*This will use the STAT variable to recode all SYSMIS data. CHANGE THE STAT VARIABLE TO MATCH THE ASSESSMENT WAVE YOU ARE WORKING IN.
*Include full list of numeric variables (including new reverse-scored items).
DO IF MISSING(FD2OSTAT).
DO REPEAT x = FQ2ODERS01 TO FQ2ODERS34R.
RECODE FD2OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.

*STEP 8: STANDARDIZING DECIMAL PLACES (CANNOT INCLUDE TEXT/STRING VARIABLES).
*Making all variables have the same number of decimal places. Ensure that variables include all new reverse-scored variables. Change the number AFTER the decimal place as needed.
FORMATS FQ2ODERS01 to FQ2ODERS34R  (F8.0).
EXECUTE.

*STEP 9: CREATING VARIABLE LABLES.
*Label all variables. Use the original questionnaire to include the exact text that participants saw. Include the questionnaire name and number at the end of the label.
VARIABLE LABELS  ID 'Participant ID'.
EXECUTE.

VARIABLE LABELS
FQ2ODERS01 'I am clear about my feelings [FQ2ODERS01]'
FQ2ODERS02 'I pay attention to how I feel [FQ2ODERS02]'
FQ2ODERS03 'I experience my emotions as overwhelming and out of control [FQ2ODERS03]'
FQ2ODERS04 'I have no idea how I am feeling [FQ2ODERS04]'
FQ2ODERS05 'I have difficulty making sense out of my feelings [FQ2ODERS05]'
FQ2ODERS06 'I am attentive to my feelings [FQ2ODERS06]'
FQ2ODERS07 'I know exactly how I am feeling [FQ2ODERS07]'
FQ2ODERS08 'I care about what I am feeling [FQ2ODERS08]'
FQ2ODERS09 'I am confused about how I feel [FQ2ODERS09]'
FQ2ODERS10 'When Im upset, I acknowledge my emotions [FQ2ODERS10]'
FQ2ODERS11 'When Im upset, I become angry with myself for feeling that way [FQ2ODERS11]'
FQ2ODERS12 'When Im upset, I become embarrassed for feeling that way [FQ2ODERS12]'
FQ2ODERS13 'When Im upset, I have difficulty getting work done [FQ2ODERS13]'
FQ2ODERS14 'When Im upset, I become out of control [FQ2ODERS14]'
FQ2ODERS15 'When Im upset, I believe that I will remain that way for a long time [FQ2ODERS15]'
FQ2ODERS16 'When Im upset, I believe that I will end up feeling very depressed [FQ2ODERS16]'
FQ2ODERS17 'When Im upset, I believe that my feelings are valid and important [FQ2ODERS17]'
FQ2ODERS18 'When Im upset, I have difficulty focusing on other things [FQ2ODERS18]'
FQ2ODERS19 'When Im upset, I feel out of control [FQ2ODERS19]'
FQ2ODERS20 'When Im upset, I can still get things done [FQ2ODERS20]'
FQ2ODERS21 'When Im upset, I feel ashamed with myself for feeling that way [FQ2ODERS21]'
FQ2ODERS22 'When Im upset, I know that I can find a way to eventually feel better [FQ2ODERS22]'
FQ2ODERS23 'When Im upset, I feel like I am weak [FQ2ODERS23]'
FQ2ODERS24 'When Im upset, I feel like I can remain in control of my behaviors [FQ2ODERS24]'
FQ2ODERS25 'When Im upset, I feel guilty for feeling that way [FQ2ODERS25]'
FQ2ODERS26 'When Im upset, I have difficulty concentrating [FQ2ODERS26]'
FQ2ODERS27 'When Im upset, I have difficulty controlling my behaviors [FQ2ODERS27]'
FQ2ODERS28 'When Im upset, I believe that there is nothing I can do to make myself feel better [FQ2ODERS28]'
FQ2ODERS29 'When Im upset, I become irritated with myself for feeling that way [FQ2ODERS29]'
FQ2ODERS30 'When Im upset, I start to feel very bad about myself [FQ2ODERS30]'
FQ2ODERS31 'When Im upset, I believe that wallowing in it is all I can do [FQ2ODERS31]'
FQ2ODERS32 'When Im upset, I lose control over my behaviors [FQ2ODERS32]'
FQ2ODERS33 'When Im upset, I have difficulty thinking about anyone else [FQ2ODERS33]'
FQ2ODERS34 'When Im upset, I take time to figure out what Im really feeling [FQ2ODERS34]'
FQ2ODERS35 'When Im upset, it takes me a long time to feel better [FQ2ODERS35]'
FQ2ODERS36 'When Im upset, my emotions feel overwhelming [FQ2ODERS36]'
FQ2ODERS01R 'I am clear about my feelings [FQ2ODERS01R]'
FQ2ODERS02R 'I pay attention to how I feel [FQ2ODERS02R]'
FQ2ODERS06R 'I am attentive to my feelings [FQ2ODERS06R]'
FQ2ODERS07R 'I know exactly how I am feeling [FQ2ODERS07R]'
FQ2ODERS08R 'I care about what I am feeling [FQ2ODERS08R]'
FQ2ODERS10R 'When Im upset, I acknowledge my emotions [FQ2ODERS10R]'
FQ2ODERS17R 'When Im upset, I believe that my feelings are valid and important [FQ2ODERS17R]'
FQ2ODERS20R 'When Im upset, I can still get things done [FQ2ODERS20R]'
FQ2ODERS22R 'When Im upset, I know that I can find a way to eventually feel better [FQ2ODERS22R]'
FQ2ODERS24R 'When Im upset, I feel like I can remain in control of my behaviors [FQ2ODERS24R]'
FQ2ODERS34R 'When Im upset, I take time to figure out what Im really feeling [FQ2ODERS34R]'.
EXECUTE.

*STEP 10: ADD VALUE LABELS.
*Include missing values like 'Prefer not to Answer' (or something similar) if applicable.
*Include ALL missing value labels (SEE ABOVE FOR FULL LIST).
VALUE LABELS
FQ2ODERS01 FQ2ODERS02 FQ2ODERS03 FQ2ODERS04 FQ2ODERS05 FQ2ODERS06 FQ2ODERS07
FQ2ODERS08 FQ2ODERS09 FQ2ODERS10 FQ2ODERS11 FQ2ODERS12 FQ2ODERS13
FQ2ODERS14 FQ2ODERS15 FQ2ODERS16  FQ2ODERS17 FQ2ODERS18 FQ2ODERS19
FQ2ODERS20 FQ2ODERS21 FQ2ODERS22 FQ2ODERS23 FQ2ODERS24  FQ2ODERS25
FQ2ODERS26 FQ2ODERS27 FQ2ODERS28 FQ2ODERS29 FQ2ODERS30 FQ2ODERS31
FQ2ODERS32 FQ2ODERS33 FQ2ODERS34 FQ2ODERS35 FQ2ODERS36
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
1 'Almost Never (0-10%)'
2 'Sometimes (11%-35%)'
3 'About half the time (36%-65%)'
4 'Most of the time (66-90%)'
5 'Almost Always (91-100%)'.
EXECUTE.

VALUE LABELS
FQ2ODERS01R FQ2ODERS02R FQ2ODERS06R FQ2ODERS07R FQ2ODERS08R FQ2ODERS10R FQ2ODERS17R FQ2ODERS20R FQ2ODERS22R FQ2ODERS24R FQ2ODERS34R
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
5 'Almost Never (0-10%)'
4 'Sometimes (11%-35%)'
3 'About half the time (36%-65%)'
2 'Most of the time (66-90%)'
1 'Almost Always (91-100%)'.
EXECUTE.

*STEP 11: LABELING MISSING VALUES AS MISSING.
*Recoding all negative numbers as missing.
MISSING VALUES FQ2ODERS01 FQ2ODERS02 FQ2ODERS03 FQ2ODERS04 FQ2ODERS05 FQ2ODERS06 FQ2ODERS07 FQ2ODERS08 FQ2ODERS09
    FQ2ODERS10 FQ2ODERS11 FQ2ODERS12 FQ2ODERS13 FQ2ODERS14 FQ2ODERS15 FQ2ODERS16 FQ2ODERS17 FQ2ODERS18 FQ2ODERS19
    FQ2ODERS20 FQ2ODERS21 FQ2ODERS22 FQ2ODERS23 FQ2ODERS24 FQ2ODERS25 FQ2ODERS26 FQ2ODERS27 FQ2ODERS28 FQ2ODERS29
    FQ2ODERS30 FQ2ODERS31 FQ2ODERS32 FQ2ODERS33 FQ2ODERS34 FQ2ODERS35 FQ2ODERS36 FQ2ODERS01R FQ2ODERS02R
    FQ2ODERS06R FQ2ODERS07R FQ2ODERS08R FQ2ODERS10R FQ2ODERS17R FQ2ODERS20R FQ2ODERS22R FQ2ODERS24R FQ2ODERS34R
   (LO THRU -1).
EXECUTE.

*STEP 12: SAVE CLEANED DATA FILE.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2ODERS_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.

*STEP 13: CHECK FREQUENCIES.
*Checking frequencies of all items before creating constructs.
*Include STAT variable here to be sure all missingness was coded correctly.
FREQUENCIES VARIABLES=FD2OSTAT FQ2ODERS01 FQ2ODERS02 FQ2ODERS03 FQ2ODERS04 FQ2ODERS05 FQ2ODERS06 FQ2ODERS07 FQ2ODERS08
    FQ2ODERS09 FQ2ODERS10 FQ2ODERS11 FQ2ODERS12 FQ2ODERS13 FQ2ODERS14 FQ2ODERS15 FQ2ODERS16 FQ2ODERS17 FQ2ODERS18 FQ2ODERS19
    FQ2ODERS20 FQ2ODERS21 FQ2ODERS22 FQ2ODERS23 FQ2ODERS24 FQ2ODERS25 FQ2ODERS26 FQ2ODERS27 FQ2ODERS28 FQ2ODERS29 FQ2ODERS30
    FQ2ODERS31 FQ2ODERS32 FQ2ODERS33 FQ2ODERS34 FQ2ODERS35 FQ2ODERS36
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=
    FD2OSTAT
    FQ2ODERS01 FQ2ODERS01R
    FQ2ODERS02 FQ2ODERS02R
    FQ2ODERS06 FQ2ODERS06R
    FQ2ODERS07 FQ2ODERS07R
    FQ2ODERS08 FQ2ODERS08R
    FQ2ODERS10 FQ2ODERS10R
    FQ2ODERS17 FQ2ODERS17R
    FQ2ODERS20 FQ2ODERS20R
    FQ2ODERS22 FQ2ODERS22R
    FQ2ODERS24 FQ2ODERS24R
    FQ2ODERS34 FQ2ODERS34R
  /ORDER=ANALYSIS.

*STEP 14: CHECK DESCRIPTIVES.
*Checking descriptives for all items before creating constructs.
DESCRIPTIVES VARIABLES=FQ2ODERS01 FQ2ODERS02 FQ2ODERS03 FQ2ODERS04 FQ2ODERS05 FQ2ODERS06 FQ2ODERS07 FQ2ODERS08
    FQ2ODERS09 FQ2ODERS10 FQ2ODERS11 FQ2ODERS12 FQ2ODERS13 FQ2ODERS14 FQ2ODERS15 FQ2ODERS16 FQ2ODERS17 FQ2ODERS18 FQ2ODERS19
    FQ2ODERS20 FQ2ODERS21 FQ2ODERS22 FQ2ODERS23 FQ2ODERS24 FQ2ODERS25 FQ2ODERS26 FQ2ODERS27 FQ2ODERS28 FQ2ODERS29 FQ2ODERS30
    FQ2ODERS31 FQ2ODERS32 FQ2ODERS33 FQ2ODERS34 FQ2ODERS35 FQ2ODERS36
  /STATISTICS=MEAN STDDEV MIN MAX.

DESCRIPTIVES VARIABLES=
    FQ2ODERS01 FQ2ODERS01R
    FQ2ODERS02 FQ2ODERS02R
    FQ2ODERS06 FQ2ODERS06R
    FQ2ODERS07 FQ2ODERS07R
    FQ2ODERS08 FQ2ODERS08R
    FQ2ODERS10 FQ2ODERS10R
    FQ2ODERS17 FQ2ODERS17R
    FQ2ODERS20 FQ2ODERS20R
    FQ2ODERS22 FQ2ODERS22R
    FQ2ODERS24 FQ2ODERS24R
    FQ2ODERS34 FQ2ODERS34R
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 15: SAVE CLEANED DATA FILE.
*Sorting the data file by ID and resaving the final file.
*To reorder items, use /KEEP {list all variales in order} -- insert in line after file name.
SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2ODERS_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2ODERS_Cleaned.sav'.
EXECUTE.

*STEP 16: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE
 OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2ODERS_Cleaned.spv'
 LOCK=NO.

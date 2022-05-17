* Encoding: UTF-8.
*STEP 0: NOTES
*DIFFICULTIES WITH EMOTION REGULATION SCALE (DERS)

*07-01-21 (BM): Completed STEPS 1-16.
*07-06-21 (AB): Checking STEPS 1-16 - minor edits made (e.g., adding syntax to make variables have the same decimal places (STEP 8), deleting syntax that is not needed for these data(STEP 6)).
*07-09-21(JL): Small edits to text of notes for STEPS 7-16.
*07-12-21(JL): Edited text of notes for STEPS 1-16; added start date variable to STEP 2.
*07-23-21(BM): Edited text of notes and code for steps 2, 4, 6, 10, 11 to match updated template.
*07-30-21(BM): Edited steps 1 and and 10 to load in newest file and to reverse the values for the reversed scored items.
*10/29/21(BM): Added step 5a and step 7a.
*11/01/21(BM): Updated STEP 10, STEP 13 and double checked comments matched template.
*11-8-21 (BM): Adapted syntax to match template.
*11-10-21(BM): Updated STEP 6 comment.
*11-10-21(AAC): Checked and added -10=-10 to Step 7
*03-09-22(AAC): Fixed reverse value labels


*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------.
*STEP 1: OPENING RAW DATA.
*Insert the correct file path and file name. Use syntax to open raw data file.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/DBT Moms R01 Study Time 1 Mother Survey_November 10, 2021_12.48.sav'.

*STEP 2: SAVING QUESTIONNAIRE SPECIFIC RAW DATA. 
*Insert the correct file path and file name. Save this file with only those variables that you need, in the following order; ID, Start Date, Questionnaire Items (i.e., DERS_1 to DERS_36).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1ODERS_Cleaned.sav'
  /KEEP
  FQ1ID
  STARTDATE
  FQ1DERS_1 TO FQ1DERS_36
  /COMPRESSED.
  EXECUTE.

*STEP 3: OPEN NEW DATA FILE.  
*Insert the correct file path and file name. Open the file you just created and saved so that you are able to clean the data.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1ODERS_Cleaned.sav'.

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
RENAME VARIABLE (STARTDATE=FQ1ODERSDATE).
EXECUTE.
RENAME VARIABLE (FQ1DERS_1 = FQ1ODERS01) (FQ1DERS_2 = FQ1ODERS02) (FQ1DERS_3 = FQ1ODERS03) (FQ1DERS_4 = FQ1ODERS04) (FQ1DERS_5 = FQ1ODERS05) (FQ1DERS_6 = FQ1ODERS06).
EXECUTE.
RENAME VARIABLE (FQ1DERS_7 = FQ1ODERS07) (FQ1DERS_8 = FQ1ODERS08) (FQ1DERS_9 = FQ1ODERS09) (FQ1DERS_10 = FQ1ODERS10) (FQ1DERS_11 = FQ1ODERS11) (FQ1DERS_12 = FQ1ODERS12).
EXECUTE.
RENAME VARIABLE (FQ1DERS_13 = FQ1ODERS13) (FQ1DERS_14 = FQ1ODERS14) (FQ1DERS_15 = FQ1ODERS15) (FQ1DERS_16 = FQ1ODERS16) (FQ1DERS_17 = FQ1ODERS17) (FQ1DERS_18 = FQ1ODERS18).
EXECUTE.
RENAME VARIABLE (FQ1DERS_19 = FQ1ODERS19) (FQ1DERS_20 = FQ1ODERS20) (FQ1DERS_21 = FQ1ODERS21) (FQ1DERS_22 = FQ1ODERS22) (FQ1DERS_23 = FQ1ODERS23) (FQ1DERS_24 = FQ1ODERS24).
EXECUTE.
RENAME VARIABLE (FQ1DERS_25 = FQ1ODERS25) (FQ1DERS_26 = FQ1ODERS26) (FQ1DERS_27 = FQ1ODERS27) (FQ1DERS_28 = FQ1ODERS28) (FQ1DERS_29 = FQ1ODERS29) (FQ1DERS_30 = FQ1ODERS30).
EXECUTE.
RENAME VARIABLE (FQ1DERS_31 = FQ1ODERS31) (FQ1DERS_32 = FQ1ODERS32) (FQ1DERS_33 = FQ1ODERS33) (FQ1DERS_34 = FQ1ODERS34) (FQ1DERS_35 = FQ1ODERS35) (FQ1DERS_36 = FQ1ODERS36).
EXECUTE.
*Remember to save your data file.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1ODERS_Cleaned.sav'.
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
/FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1ODERS_Cleaned.sav'
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
COMPUTE DATEDIFF = DATEDIFF(FD1ORD,FQ1ODERSDATE,'days').
EXECUTE.
COUNT DATEDIFF0=DATEDIFF(Lowest thru -1) DATEDIFF(1 thru Highest).
EXECUTE.
FREQUENCIES VARIABLES=DATEDIFF0
  /ORDER=ANALYSIS.
SORT CASES BY DATEDIFF0(D).
*CHECK ALL IDS WITH DISCREPANT DATES TO DETERMINE WHAT IS CORRECT. CONSULT BEFORE MAKING ANY CHANGES TO RAW DATA IN REDCAP OR QUALTRICS.
*INCLUDE NOTES HERE FOR EACH ID THAT WAS DISCREPANT.
*THE FOLLOWING IDs (90210, 90331, and 90800) HAVE A A1 QUALTRICS DATE [FQ1ODERSDATE] THAT DOES NOT MATCH THEIR A1 VISIT DATE [FD1ORD]. 
*THIS WAS INVESTIGATED BY STAFF (BM: 10-29-21) AND VISIT DATE [FD1ORD] WAS CONFIRMED USING MULTIPLE SOURCES.
SORT CASES BY ID(A).
*DROPPING VARIABLES THAT ARE NO LONGER RELEVANT TO FINAL DATA FILE.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1ODERS_Cleaned.sav'
/DROP
FQ1ODERSDATE
DATEDIFF
DATEDIFF0
f.
EXECUTE.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1ODERS_Cleaned.sav'.
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
RECODE FQ1ODERS01 to FQ1ODERS36 
    (6=-10).
EXECUTE.
    
**STEP 7 (DELETE IF NOT NEEDED): CREATING NEW VARIABLES FOR REVERSED SCORED ITEMS.
**Reverse-Scored Items; see scoring document to determine if there are reverse-scored items. If no reverse-scored items, delete this syntax.
RECODE FQ1ODERS01 (1=5) (2=4) (3=3) (4=2) (5=1) (-10=-10) INTO FQ1ODERS01R.
EXECUTE.
RECODE FQ1ODERS02 (1=5) (2=4) (3=3) (4=2) (5=1) (-10=-10) INTO FQ1ODERS02R.
EXECUTE.
RECODE FQ1ODERS06 (1=5) (2=4) (3=3) (4=2) (5=1) (-10=-10) INTO FQ1ODERS06R.
EXECUTE.
RECODE FQ1ODERS07 (1=5) (2=4) (3=3) (4=2) (5=1) (-10=-10) INTO FQ1ODERS07R.
EXECUTE.
RECODE FQ1ODERS08 (1=5) (2=4) (3=3) (4=2) (5=1) (-10=-10) INTO FQ1ODERS08R.
EXECUTE.
RECODE FQ1ODERS10 (1=5) (2=4) (3=3) (4=2) (5=1) (-10=-10) INTO FQ1ODERS10R.
EXECUTE.
RECODE FQ1ODERS17 (1=5) (2=4) (3=3) (4=2) (5=1) (-10=-10) INTO FQ1ODERS17R.
EXECUTE.
RECODE FQ1ODERS20 (1=5) (2=4) (3=3) (4=2) (5=1) (-10=-10) INTO FQ1ODERS20R.
EXECUTE.
RECODE FQ1ODERS22 (1=5) (2=4) (3=3) (4=2) (5=1) (-10=-10) INTO FQ1ODERS22R.
EXECUTE.
RECODE FQ1ODERS24 (1=5) (2=4) (3=3) (4=2) (5=1) (-10=-10) INTO FQ1ODERS24R.
EXECUTE.
RECODE FQ1ODERS34 (1=5) (2=4) (3=3) (4=2) (5=1) (-10=-10) INTO FQ1ODERS34R.
EXECUTE.

**STEP 7A: RECODING SYSMIS (PARTICIPANTS THAT MISSED THE ASSESSMENT).
*This will use the STAT variable to recode all SYSMIS data. CHANGE THE STAT VARIABLE TO MATCH THE ASSESSMENT WAVE YOU ARE WORKING IN.
*Include full list of numeric variables (including new reverse-scored items).
DO IF MISSING(FD1OSTAT).
DO REPEAT x =  FQ1ODERS01 TO FQ1ODERS34R.
RECODE FD1OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.

*STEP 8: STANDARDIZING DECIMAL PLACES (CANNOT INCLUDE TEXT/STRING VARIABLES).
*Making all variables have the same number of decimal places. Ensure that variables include all new reverse-scored variables. Change the number AFTER the decimal place as needed.
FORMATS FQ1ODERS01 to FQ1ODERS34R  (F8.0).
EXECUTE.

*STEP 9: CREATING VARIABLE LABLES.
*Label all variables. Use the original questionnaire to include the exact text that participants saw. Include the questionnaire name and number at the end of the label.
VARIABLE LABELS  ID 'Participant ID'.
EXECUTE.

VARIABLE LABELS
FQ1ODERS01 'I am clear about my feelings [FQ1ODERS01]'
FQ1ODERS02 'I pay attention to how I feel [FQ1ODERS02]'
FQ1ODERS03 'I experience my emotions as overwhelming and out of control [FQ1ODERS03]'
FQ1ODERS04 'I have no idea how I am feeling [FQ1ODERS04]'
FQ1ODERS05 'I have difficulty making sense out of my feelings [FQ1ODERS05]'
FQ1ODERS06 'I am attentive to my feelings [FQ1ODERS06]'
FQ1ODERS07 'I know exactly how I am feeling [FQ1ODERS07]'
FQ1ODERS08 'I care about what I am feeling [FQ1ODERS08]'
FQ1ODERS09 'I am confused about how I feel [FQ1ODERS09]'
FQ1ODERS10 'When Im upset, I acknowledge my emotions [FQ1ODERS10]'
FQ1ODERS11 'When Im upset, I become angry with myself for feeling that way [FQ1ODERS11]'
FQ1ODERS12 'When Im upset, I become embarrassed for feeling that way [FQ1ODERS12]'
FQ1ODERS13 'When Im upset, I have difficulty getting work done FQ1ODERS13]'
FQ1ODERS14 'When Im upset, I become out of control [FQ1ODERS14]'
FQ1ODERS15 'When Im upset, I believe that I will remain that way for a long time [FQ1ODERS15]'
FQ1ODERS16 'When Im upset, I believe that I will end up feeling very depressed [FQ1ODERS16]'
FQ1ODERS17 'When Im upset, I believe that my feelings are valid and important [FQ1ODERS17]'
FQ1ODERS18 'When Im upset, I have difficulty focusing on other things [FQ1ODERS18]'
FQ1ODERS19 'When Im upset, I feel out of control [FQ1ODERS19]'
FQ1ODERS20 'When Im upset, I can still get things done [FQ1ODERS20]'
FQ1ODERS21 'When Im upset, I feel ashamed with myself for feeling that way [FQ1ODERS21]'
FQ1ODERS22 'When Im upset, I know that I can find a way to eventually feel better [FQ1ODERS22]'
FQ1ODERS23 'When Im upset, I feel like I am weak [FQ1ODERS23]'
FQ1ODERS24 'When Im upset, I feel like I can remain in control of my behaviors [FQ1ODERS24]'
FQ1ODERS25 'When Im upset, I feel guilty for feeling that way [FQ1ODERS25]'
FQ1ODERS26 'When Im upset, I have difficulty concentrating [FQ1ODERS26]'
FQ1ODERS27 'When Im upset, I have difficulty controlling my behaviors [FQ1ODERS27]'
FQ1ODERS28 'When Im upset, I believe that there is nothing I can do to make myself feel better [FQ1ODERS28]'
FQ1ODERS29 'When Im upset, I become irritated with myself for feeling that way [FQ1ODERS29]'
FQ1ODERS30 'When Im upset, I start to feel very bad about myself [FQ1ODERS30]'
FQ1ODERS31 'When Im upset, I believe that wallowing in it is all I can do [FQ1ODERS31]'
FQ1ODERS32 'When Im upset, I lose control over my behaviors [FQ1ODERS32]'
FQ1ODERS33 'When Im upset, I have difficulty thinking about anyone else [FQ1ODERS33]'
FQ1ODERS34 'When Im upset, I take time to figure out what Im really feeling [FQ1ODERS34]'
FQ1ODERS35 'When Im upset, it takes me a long time to feel better [FQ1ODERS35]'
FQ1ODERS36 'When Im upset, my emotions feel overwhelming [FQ1ODERS36]'
FQ1ODERS01R 'I am clear about my feelings [FQ1ODERS01R]'
FQ1ODERS02R 'I pay attention to how I feel [FQ1ODERS02R]'
FQ1ODERS06R 'I am attentive to my feelings [FQ1ODERS06R]'
FQ1ODERS07R 'I know exactly how I am feeling [FQ1ODERS07R]'
FQ1ODERS08R 'I care about what I am feeling [FQ1ODERS08R]'
FQ1ODERS10R 'When Im upset, I acknowledge my emotions [FQ1ODERS10R]'
FQ1ODERS17R 'When Im upset, I believe that my feelings are valid and important [FQ1ODERS17R]'
FQ1ODERS20R 'When Im upset, I can still get things done [FQ1ODERS20R]'
FQ1ODERS22R 'When Im upset, I know that I can find a way to eventually feel better [FQ1ODERS22R]'
FQ1ODERS24R 'When Im upset, I feel like I can remain in control of my behaviors [FQ1ODERS24R]'
FQ1ODERS34R 'When Im upset, I take time to figure out what Im really feeling [FQ1ODERS34R]'.
EXECUTE.

*STEP 10: ADD VALUE LABELS.
*Include missing values like 'Prefer not to Answer' (or something similar) if applicable.
*Include ALL missing value labels (SEE ABOVE FOR FULL LIST).
VALUE LABELS
FQ1ODERS01 FQ1ODERS02 FQ1ODERS03 FQ1ODERS04 FQ1ODERS05 FQ1ODERS06 FQ1ODERS07
FQ1ODERS08 FQ1ODERS09 FQ1ODERS10 FQ1ODERS11 FQ1ODERS12 FQ1ODERS13
FQ1ODERS14 FQ1ODERS15 FQ1ODERS16  FQ1ODERS17 FQ1ODERS18 FQ1ODERS19
FQ1ODERS20 FQ1ODERS21 FQ1ODERS22 FQ1ODERS23 FQ1ODERS24  FQ1ODERS25
FQ1ODERS26 FQ1ODERS27 FQ1ODERS28 FQ1ODERS29 FQ1ODERS30 FQ1ODERS31
FQ1ODERS32 FQ1ODERS33 FQ1ODERS34 FQ1ODERS35 FQ1ODERS36
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
1 'Almost Never (0-10%)'
2 'Sometimes (11%-35%)'
3 'About half the time (36%-65%)'
4 'Most of the time (66-90%)'
5 'Almost Always (91-100%)'.
EXECUTE.

VALUE LABELS
FQ1ODERS01R FQ1ODERS02R FQ1ODERS06R FQ1ODERS07R FQ1ODERS08R FQ1ODERS10R FQ1ODERS17R FQ1ODERS20R FQ1ODERS22R FQ1ODERS24R FQ1ODERS34R
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
5 'Almost Never (0-10%)'
4 'Sometimes (11%-35%)'
3 'About half the time (36%-65%)'
2 'Most of the time (66-90%)'
1 'Almost Always (91-100%)'.
EXECUTE.

*STEP 11: LABELING MISSING VALUES AS MISSING.
*Recoding all negative numbers as missing.
MISSING VALUES FQ1ODERS01 FQ1ODERS02 FQ1ODERS03 FQ1ODERS04 FQ1ODERS05 FQ1ODERS06 FQ1ODERS07 FQ1ODERS08 FQ1ODERS09
    FQ1ODERS10 FQ1ODERS11 FQ1ODERS12 FQ1ODERS13 FQ1ODERS14 FQ1ODERS15 FQ1ODERS16 FQ1ODERS17 FQ1ODERS18 FQ1ODERS19
    FQ1ODERS20 FQ1ODERS21 FQ1ODERS22 FQ1ODERS23 FQ1ODERS24 FQ1ODERS25 FQ1ODERS26 FQ1ODERS27 FQ1ODERS28 FQ1ODERS29
    FQ1ODERS30 FQ1ODERS31 FQ1ODERS32 FQ1ODERS33 FQ1ODERS34 FQ1ODERS35 FQ1ODERS36 FQ1ODERS01R FQ1ODERS02R
    FQ1ODERS06R FQ1ODERS07R FQ1ODERS08R FQ1ODERS10R FQ1ODERS17R FQ1ODERS20R FQ1ODERS22R FQ1ODERS24R FQ1ODERS34R
   (LO THRU -1).
EXECUTE.

*STEP 12: SAVE CLEANED DATA FILE.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1ODERS_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.

*STEP 13: CHECK FREQUENCIES.
*Checking frequencies of all items before creating constructs.
*Include STAT variable here to be sure all missingness was coded correctly.
FREQUENCIES VARIABLES=FD1OSTAT FQ1ODERS01 FQ1ODERS02 FQ1ODERS03 FQ1ODERS04 FQ1ODERS05 FQ1ODERS06 FQ1ODERS07 FQ1ODERS08
    FQ1ODERS09 FQ1ODERS10 FQ1ODERS11 FQ1ODERS12 FQ1ODERS13 FQ1ODERS14 FQ1ODERS15 FQ1ODERS16 FQ1ODERS17 FQ1ODERS18 FQ1ODERS19
    FQ1ODERS20 FQ1ODERS21 FQ1ODERS22 FQ1ODERS23 FQ1ODERS24 FQ1ODERS25 FQ1ODERS26 FQ1ODERS27 FQ1ODERS28 FQ1ODERS29 FQ1ODERS30
    FQ1ODERS31 FQ1ODERS32 FQ1ODERS33 FQ1ODERS34 FQ1ODERS35 FQ1ODERS36
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=
    FQ1ODERS01 FQ1ODERS01R
    FQ1ODERS02 FQ1ODERS02R
    FQ1ODERS06 FQ1ODERS06R
    FQ1ODERS07 FQ1ODERS07R
    FQ1ODERS08 FQ1ODERS08R
    FQ1ODERS10 FQ1ODERS10R
    FQ1ODERS17 FQ1ODERS17R
    FQ1ODERS20 FQ1ODERS20R
    FQ1ODERS22 FQ1ODERS22R
    FQ1ODERS24 FQ1ODERS24R
    FQ1ODERS34 FQ1ODERS34R
  /ORDER=ANALYSIS.

*STEP 14: CHECK DESCRIPTIVES.
*Checking descriptives for all items before creating constructs.
DESCRIPTIVES VARIABLES=FQ1ODERS01 FQ1ODERS02 FQ1ODERS03 FQ1ODERS04 FQ1ODERS05 FQ1ODERS06 FQ1ODERS07 FQ1ODERS08
    FQ1ODERS09 FQ1ODERS10 FQ1ODERS11 FQ1ODERS12 FQ1ODERS13 FQ1ODERS14 FQ1ODERS15 FQ1ODERS16 FQ1ODERS17 FQ1ODERS18 FQ1ODERS19
    FQ1ODERS20 FQ1ODERS21 FQ1ODERS22 FQ1ODERS23 FQ1ODERS24 FQ1ODERS25 FQ1ODERS26 FQ1ODERS27 FQ1ODERS28 FQ1ODERS29 FQ1ODERS30
    FQ1ODERS31 FQ1ODERS32 FQ1ODERS33 FQ1ODERS34 FQ1ODERS35 FQ1ODERS36
  /STATISTICS=MEAN STDDEV MIN MAX.

DESCRIPTIVES VARIABLES=
    FQ1ODERS01 FQ1ODERS01R
    FQ1ODERS02 FQ1ODERS02R
    FQ1ODERS06 FQ1ODERS06R
    FQ1ODERS07 FQ1ODERS07R
    FQ1ODERS08 FQ1ODERS08R
    FQ1ODERS10 FQ1ODERS10R
    FQ1ODERS17 FQ1ODERS17R
    FQ1ODERS20 FQ1ODERS20R
    FQ1ODERS22 FQ1ODERS22R
    FQ1ODERS24 FQ1ODERS24R
    FQ1ODERS34 FQ1ODERS34R
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 15: SAVE CLEANED DATA FILE.
*Sorting the data file by ID and resaving the final file.
*To reorder items, use /KEEP {list all variables in order} -- insert in line after file name.
SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1ODERS_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.

*STEP 16: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE
 OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1ODERS_Cleaned.spv'
 LOCK=NO.


* Encoding: UTF-8.
*STEP 0: NOTES
*TYPE QUESTIONNAIRE NAME HERE W/ ACROYNYM. 
*EX: Personality Assessment Inventory (PAI).
 
*INCLUDE DATE(INITIALS): DESCRIPTION OF WHAT YOU DID. EVERY TIME THE SYNTAX IS EDITED, THERE SHOULD BE DETAILED NOTES ABOUT IT.
*05-13-22(BM): Adapted Syntax 
*05-15-22(BM): Double Checked 
*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------.
*STEP 1: OPENING RAW DATA.
*Insert the correct file path and file name. Use syntax to open raw data file.
GET
  FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\Raw\DBT Moms R01 Study Mother Final Interview Survey - With Retrospective_May 14, 2022_12.29.sav'.

*STEP 2: SAVING QUESTIONNAIRE SPECIFIC RAW DATA. 
*Insert the correct file path and file name. Save this file with only those variables that you need, in the following order; ID, Start Date, Questionnaire Items (i.e., DERS_1 to DERS_36).
SAVE OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ4AOPAI2_Cleaned.sav'
  /KEEP 
  ID 
  StartDate
  FQ4AOPAI_1 TO FQ4AOPAI_24
  /COMPRESSED.
  EXECUTE.

*STEP 3: OPEN NEW DATA FILE.  
*Insert the correct file path and file name. Open the file you just created and saved so that you are able to clean the data.
GET
  FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ4AOPAI2_Cleaned.sav'.

*STEP 4: TRANSFORM VARIABLES AND SORT IDS ASCENDING ORDER.
*Transforming ID from a string to a numeric variable, change the date format of startdate, and sort IDs in ascending order.
ALTER TYPE ID (F10.0).
EXECUTE.
FORMATS STARTDATE (adate10).
EXECUTE.
SORT CASES BY ID(A).
EXECUTE.

*STEP 5: RENAME ‘RAW DATA’ VARIABLES TO ‘CLEANED’ VARIABLES NAMES. 
*Rename all variables so they reflect our naming scheme. ID should always be labeled as 'ID'. Item should be numbers 01-36 or 001-106. 
RENAME VARIABLE  (STARTDATE=FQ4AOPAIDATE) (FQ4AOPAI_1 = FQ4AOPAI01) (FQ4AOPAI_2 = FQ4AOPAI02) (FQ4AOPAI_3 = FQ4AOPAI03) (FQ4AOPAI_4 = FQ4AOPAI04) (FQ4AOPAI_5 = FQ4AOPAI05) (FQ4AOPAI_6 = FQ4AOPAI06)
    (FQ4AOPAI_7 = FQ4AOPAI07) (FQ4AOPAI_8 = FQ4AOPAI08) (FQ4AOPAI_9 = FQ4AOPAI09) (FQ4AOPAI_10 = FQ4AOPAI10) (FQ4AOPAI_11 = FQ4AOPAI11) (FQ4AOPAI_12 = FQ4AOPAI12)
    (FQ4AOPAI_13 = FQ4AOPAI13) (FQ4AOPAI_14 = FQ4AOPAI14) (FQ4AOPAI_15 = FQ4AOPAI15) (FQ4AOPAI_16 = FQ4AOPAI16) (FQ4AOPAI_17 = FQ4AOPAI17) (FQ4AOPAI_18 = FQ4AOPAI18)
    (FQ4AOPAI_19 = FQ4AOPAI19) (FQ4AOPAI_20 = FQ4AOPAI20) (FQ4AOPAI_21 = FQ4AOPAI21) (FQ4AOPAI_22 = FQ4AOPAI22) (FQ4AOPAI_23 = FQ4AOPAI23) (FQ4AOPAI_24 = FQ4AOPAI24).
EXECUTE.

*Remember to save your data file.
SAVE OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ4AOPAI2_Cleaned.sav'.
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
/FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FD0OACS_Constructs.sav'
/IN=f
/FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ4AOPAI2_Cleaned.sav'
/BY ID
/DROP=
FD0OSTAT FD0ORD
FD1OSTAT FD1OTD FD1ORD FD1ODIFF
FD2OSTAT FD2OTD FD2ORD FD2ODIFF
FD3OSTAT FD3OTD FD3ORD FD3ODIFF
FD4OSTAT FD4OTD FD4ORD FD4ODIFF
FD4AOTD FD4AODIFF.
SELECT IF f=1.
EXECUTE.
*Comparing REDCap and Qualtrics dates of completion. Be sure to update the date variables used to reflect the accurate RD and questionnaire date.
COMPUTE DATEDIFF = DATEDIFF(FD4AORD,FQ4AOPAIDATE,'days').
EXECUTE.
COUNT DATEDIFF0=DATEDIFF(Lowest thru -1) DATEDIFF(1 thru Highest).
EXECUTE.
FREQUENCIES VARIABLES=DATEDIFF0
  /ORDER=ANALYSIS.
SORT CASES BY DATEDIFF0(D).
*CHECK ALL IDS WITH DISCREPANT DATES TO DETERMINE WHAT IS CORRECT. CONSULT BEFORE MAKING ANY CHANGES TO RAW DATA IN REDCAP OR QUALTRICS.
*INCLUDE NOTES HERE FOR EACH ID THAT WAS DISCREPANT (EXAMPLE BELOW - ADAPT AS NEEDED)
*NOT NEEDED.
SORT CASES BY ID(A).
*DROPPING VARIABLES THAT ARE NO LONGER RELEVANT TO FINAL DATA FILE.
SAVE OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ4AOPAI2_Cleaned.sav'
/DROP
FQ4AOPAIDATE
DATEDIFF
DATEDIFF0
f.
EXECUTE.
GET
  FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ4AOPAI2_Cleaned.sav'.
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
DO IF(
ID = 91069).
   RECODE 
    FQ4AOPAI01 TO FQ4AOPAI24
   (SYSMIS=-33).
END IF.
EXECUTE.

RECODE FQ4AOPAI01 TO FQ4AOPAI24
    (SYSMIS=-44).
    

**STEP 7 (DELETE IF NOT NEEDED): CREATING NEW VARIABLES FOR REVERSED SCORED ITEMS.
**Reverse-Scored Items; see scoring document to determine if there are reverse-scored items. If no reverse-scored items, delete this syntax.


*STEP 7A: RECODING SYSMIS (PARTICIPANTS THAT MISSED THE ASSESSMENT).
*This will use the STAT variable to recode all SYSMIS data. CHANGE THE STAT VARIABLE TO MATCH THE ASSESSMENT WAVE YOU ARE WORKING IN.
*Include full list of numeric variables (including new reverse-scored items).
DO IF MISSING(FD4AOSTAT).
DO REPEAT x = FQ4AOPAI01 TO FQ4AOPAI24.
RECODE FD4AOSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.

*STEP 8: STANDARDIZING DECIMAL PLACES (CANNOT INCLUDE TEXT/STRING VARIABLES).
*Making all variables have the same number of decimal places. Ensure that variables include all new reverse-scored variables. Change the number AFTER the decimal place as needed.
FORMATS FQ4AOPAI01 to FQ4AOPAI24 (F8.0).
EXECUTE.

*STEP 9: CREATING VARIABLE LABLES.
*Label all variables. Use the original questionnaire to include the exact text that participants saw. Include the questionnaire name and number at the end of the label.
VARIABLE LABELS  ID 'Participant ID'.
EXECUTE.

VARIABLE LABELS 
FQ4AOPAI01 'My mood can shift quite suddenly [FQ4AOPAI01]'
FQ4AOPAI02 'My moods get quite intense [FQ4AOPAI02]'
FQ4AOPAI03 'My mood is very steady [FQ4AOPAI03]'
FQ4AOPAI04 'I have little control over my anger [FQ4AOPAI04]'
FQ4AOPAI05 'I have always been a pretty happy person [FQ4AOPAI05]'
FQ4AOPAI06 'I have had times when I was so mad I couldnt do enough to express all my anger [FQ4AOPAI06]'
FQ4AOPAI07 'My attitude about myself changes a lot [FQ4AOPAI07]'
FQ4AOPAI08 'Sometimes I feel terribly empty inside [FQ4AOPAI08]'
FQ4AOPAI09 'I worry a lot about other people leaving me [FQ4AOPAI09]'
FQ4AOPAI10 'I often wonder what I should do with my life [FQ4AOPAI10]'
FQ4AOPAI11 'I cant handle separation from those close to me very well [FQ4AOPAI11]'
FQ4AOPAI12 'I dont get bored very easily [FQ4AOPAI12]'
FQ4AOPAI13 'My relationships have been stormy [FQ4AOPAI13]'
FQ4AOPAI14 'I want to let certain people know how much they have hurt me [FQ4AOPAI14]'
FQ4AOPAI15 'People once close to me have let me down [FQ4AOPAI15]'
FQ4AOPAI16 'I rarely feel very lonely [FQ4AOPAI16]'
FQ4AOPAI17 'I have made some real mistakes in people I have been picking as friends [FQ4AOPAI17]'
FQ4AOPAI18 'Once someone is my friend, we stay friends [FQ4AOPAI18]'
FQ4AOPAI19 'I sometimes do thing so impulsively that I get into trouble [FQ4AOPAI19]'
FQ4AOPAI20 'When Im upset, I typically do something to hurt myself [FQ4AOPAI20]'
FQ4AOPAI21 'Im too impulsive for my own good [FQ4AOPAI21]'
FQ4AOPAI22 'I spend money too easily [FQ4AOPAI22]'
FQ4AOPAI23 'Im a reckless person [FQ4AOPAI23]'
FQ4AOPAI24 'Im careful about how I spend my money [FQ4AOPAI24]'.
EXECUTE. 

*STEP 10: ADD VALUE LABELS.
*Include missing values like 'Prefer not to Answer' (or something similar) if applicable.
*Include ALL missing value labels (SEE ABOVE FOR FULL LIST).
VALUE LABELS
FQ4AOPAI01 FQ4AOPAI02 FQ4AOPAI03 FQ4AOPAI04 FQ4AOPAI05 FQ4AOPAI06 FQ4AOPAI07 FQ4AOPAI08 FQ4AOPAI09 FQ4AOPAI10 FQ4AOPAI11 FQ4AOPAI12
FQ4AOPAI13 FQ4AOPAI14 FQ4AOPAI15 FQ4AOPAI16 FQ4AOPAI17 FQ4AOPAI18 FQ4AOPAI19 FQ4AOPAI20 FQ4AOPAI21 FQ4AOPAI22 FQ4AOPAI23 FQ4AOPAI24
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
0 'False, not at all true (0)'
1 'Slightly true (1)'
2 'Mainly true (2)'
3 'Very true (3)'.
EXECUTE.

*STEP 11: LABELING MISSING VALUES AS MISSING.
*Recoding all negative numbers as missing.
MISSING VALUES
FQ4AOPAI01 FQ4AOPAI02 FQ4AOPAI03 FQ4AOPAI04 FQ4AOPAI05 FQ4AOPAI06 FQ4AOPAI07 FQ4AOPAI08 FQ4AOPAI09 FQ4AOPAI10 FQ4AOPAI11 FQ4AOPAI12
FQ4AOPAI13 FQ4AOPAI14 FQ4AOPAI15 FQ4AOPAI16 FQ4AOPAI17 FQ4AOPAI18 FQ4AOPAI19 FQ4AOPAI20 FQ4AOPAI21 FQ4AOPAI22 FQ4AOPAI23 FQ4AOPAI24
    (LO THRU -1).
EXECUTE.

*STEP 12: SAVE CLEANED DATA FILE.
SAVE OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ4AOPAI2_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.

*STEP 13: CHECK FREQUENCIES.
*Checking frequencies of all items before creating constructs.
*Include STAT variable here to be sure all missingness was coded correctly.
FREQUENCIES VARIABLES=FD4AOSTAT FQ4AOPAI01 FQ4AOPAI02 FQ4AOPAI03 FQ4AOPAI04 FQ4AOPAI05 FQ4AOPAI06 FQ4AOPAI07 FQ4AOPAI08 FQ4AOPAI09 FQ4AOPAI10 FQ4AOPAI11 FQ4AOPAI12
FQ4AOPAI13 FQ4AOPAI14 FQ4AOPAI15 FQ4AOPAI16 FQ4AOPAI17 FQ4AOPAI18 FQ4AOPAI19 FQ4AOPAI20 FQ4AOPAI21 FQ4AOPAI22 FQ4AOPAI23 FQ4AOPAI24
  /ORDER=ANALYSIS.

*STEP 14: CHECK DESCRIPTIVES.
*Checking descriptives for all items before creating constructs.
DESCRIPTIVES VARIABLES= FQ4AOPAI01 FQ4AOPAI02 FQ4AOPAI03 FQ4AOPAI04 FQ4AOPAI05 FQ4AOPAI06 FQ4AOPAI07 FQ4AOPAI08 FQ4AOPAI09 FQ4AOPAI10 FQ4AOPAI11 FQ4AOPAI12
FQ4AOPAI13 FQ4AOPAI14 FQ4AOPAI15 FQ4AOPAI16 FQ4AOPAI17 FQ4AOPAI18 FQ4AOPAI19 FQ4AOPAI20 FQ4AOPAI21 FQ4AOPAI22 FQ4AOPAI23 FQ4AOPAI24 
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 15: SAVE CLEANED DATA FILE.
*Sorting the data file by ID and resaving the final file.
*To reorder items, use /KEEP {list all variables in order} -- insert in line after file name.
SORT CASES BY ID(A).
SAVE OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ4AOPAI2_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.
GET
  FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ4AOPAI2_Cleaned.sav'.

*STEP 16: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE
 OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ4AOPAI2_Cleaned.spv'
 LOCK=NO.

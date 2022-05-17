* Encoding: UTF-8.
*STEP 0: NOTES 
*DIFFICULTIES WITH EMOTION REGULATION SCALE ADDITIONAL CAREGIVER (DERSAC).
 
*INCLUDE DATE(INITIALS): DESCRIPTION OF WHAT YOU DID. EVERY TIME THE SYNTAX IS EDITED, THERE SHOULD BE DETAILED NOTES ABOUT IT.
*06-16-21(AB): Completed STEPS 1-16.
*9-14-21 (BM): Added Addtional caregiver variable.
*9-16-21 (BM): Made additional caregiver variable numeric and recoded NAs to 0.
*9-21-21 (BM): Changed -10s to -44s when there was no AC.
*9-28-21 (AAC): Added missing bracket, removed period from item label to make it uniform
*11-8-21 (BM): Adapted syntax to match template.
*11-10-21(BM): Updated STEP 6 comment.
*11-10-21(AAC): Checked
*12-13-21(AAC): Small changes to comment section in STEP 11
*05-16-22(AAC): Updated missing value labels.

*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------.
*STEP 1: OPENING RAW DATA.
*Insert the correct file path and file name. Use syntax to open raw data file.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/DBT Moms R01 Study Time 1 Mother Survey_November 10, 2021_12.48.sav'.

*STEP 2: SAVING QUESTIONNAIRE SPECIFIC RAW DATA. 
*Insert the correct file path and file name. Save this file with only those variables that you need, in the following order; ID, Start Date, Questionnaire Items (i.e., DERS_1 to DERS_36).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1ODERSAC_Cleaned.sav'
  /KEEP 
  FQ1ID 
  STARTDATE
  FQ1DERSAC0
  FQ1DERSAC_1 TO FQ1DERSAC_36
  /COMPRESSED.
  EXECUTE.

*STEP 3: OPEN NEW DATA FILE.  
*Insert the correct file path and file name. Open the file you just created and saved so that you are able to clean the data.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1ODERSAC_Cleaned.sav'.

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
RENAME VARIABLE (STARTDATE=FQ1ODERSACDATE) (FQ1DERSAC0=FQ1ODERSAC00).
EXECUTE.
RENAME VARIABLE (FQ1DERSAC_1 = FQ1ODERSAC01) (FQ1DERSAC_2 = FQ1ODERSAC02) (FQ1DERSAC_3 = FQ1ODERSAC03) (FQ1DERSAC_4 = FQ1ODERSAC04) (FQ1DERSAC_5 = FQ1ODERSAC05) (FQ1DERSAC_6 = FQ1ODERSAC06).
EXECUTE.
RENAME VARIABLE (FQ1DERSAC_7 = FQ1ODERSAC07) (FQ1DERSAC_8 = FQ1ODERSAC08) (FQ1DERSAC_9 = FQ1ODERSAC09) (FQ1DERSAC_10 = FQ1ODERSAC10) (FQ1DERSAC_11 = FQ1ODERSAC11) (FQ1DERSAC_12 = FQ1ODERSAC12).
EXECUTE.
RENAME VARIABLE (FQ1DERSAC_13 = FQ1ODERSAC13) (FQ1DERSAC_14 = FQ1ODERSAC14) (FQ1DERSAC_15 = FQ1ODERSAC15) (FQ1DERSAC_16 = FQ1ODERSAC16) (FQ1DERSAC_17 = FQ1ODERSAC17) (FQ1DERSAC_18 = FQ1ODERSAC18).
EXECUTE.  
RENAME VARIABLE (FQ1DERSAC_19 = FQ1ODERSAC19) (FQ1DERSAC_20 = FQ1ODERSAC20) (FQ1DERSAC_21 = FQ1ODERSAC21) (FQ1DERSAC_22 = FQ1ODERSAC22) (FQ1DERSAC_23 = FQ1ODERSAC23) (FQ1DERSAC_24 = FQ1ODERSAC24).
EXECUTE. 
RENAME VARIABLE (FQ1DERSAC_25 = FQ1ODERSAC25) (FQ1DERSAC_26 = FQ1ODERSAC26) (FQ1DERSAC_27 = FQ1ODERSAC27) (FQ1DERSAC_28 = FQ1ODERSAC28) (FQ1DERSAC_29 = FQ1ODERSAC29) (FQ1DERSAC_30 = FQ1ODERSAC30).
EXECUTE.
RENAME VARIABLE (FQ1DERSAC_31 = FQ1ODERSAC31) (FQ1DERSAC_32 = FQ1ODERSAC32) (FQ1DERSAC_33 = FQ1ODERSAC33) (FQ1DERSAC_34 = FQ1ODERSAC34) (FQ1DERSAC_35 = FQ1ODERSAC35) (FQ1DERSAC_36 = FQ1ODERSAC36).
EXECUTE.
*Remember to save your data file.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1ODERSAC_Cleaned.sav'.
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
/FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1ODERSAC_Cleaned.sav'
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
COMPUTE DATEDIFF = DATEDIFF(FD1ORD,FQ1ODERSACDATE,'days').
EXECUTE.
COUNT DATEDIFF0=DATEDIFF(Lowest thru -1) DATEDIFF(1 thru Highest).
EXECUTE.
FREQUENCIES VARIABLES=DATEDIFF0
  /ORDER=ANALYSIS.
SORT CASES BY DATEDIFF0(D).
*CHECK ALL IDS WITH DISCREPANT DATES TO DETERMINE WHAT IS CORRECT. CONSULT BEFORE MAKING ANY CHANGES TO RAW DATA IN REDCAP OR QUALTRICS.
*INCLUDE NOTES HERE FOR EACH ID THAT WAS DISCREPANT (EXAMPLE BELOW - ADAPT AS NEEDED)
*THE FOLLOWING IDs (90210, 90331, and 90800) HAVE A A1 QUALTRICS DATE [FQ1ODERSDATE] THAT DOES NOT MATCH THEIR A1 VISIT DATE [FD1ORD]. 
*THIS WAS INVESTIGATED BY STAFF (BM: 10-29-21) AND VISIT DATE [FD1ORD] WAS CONFIRMED USING MULTIPLE SOURCES.
SORT CASES BY ID(A).
*DROPPING VARIABLES THAT ARE NO LONGER RELEVANT TO FINAL DATA FILE.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1ODERSAC_Cleaned.sav'
/DROP
FQ1ODERSACDATE
DATEDIFF
DATEDIFF0
f.
EXECUTE.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1ODERSAC_Cleaned.sav'.
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
**-44 'Question skipped (no alternative caregiver)'                           /* (correct skipped question: e.g. demographics, etc.) */
**-43 'Question skipped (participant refused root question)'            /* (participant refused root question: e.g., prefer not answer)*/
**-41 'Instrument not part of the protocol'                                      /* (instrument added later, not in this version) */
**-33 'Staff Error'                                                                         /* (question incorrectly skipped by staff, PANAS/EMA not administered, etc.) */
**-22 'Not applicable (Staff/Clinician)'                                            /* (KSADS, behavior codes) */
**-21 'Not applicable (Participant)'                                                /* (Questionnaires - participant decided) */
**-17 'Unable to contact teacher'                                                    /* (Staff unable to contact teacher for TRF) */
**-16 'Participant search exhausted'                                              /* (Participant search exhausted - PI decision */    
**-14 'Participant repeated cancellations/delays'                            /* (Participant repeated cancellations/delays */
**-12 'Participant refused follow-up'                                             /* (Participant refused follow-up) */     
**-11 'Participant (parent or child) deceased'                                /* (Participant (parent or child) deceased) */
**-10 'Prefer not to answer'                                                           /* (Participant selected prefer not to answer) */.

RECODE FQ1ODERSAC00 ("Father"="1") ("father"="1") ("FAther"="1") ("dad"="1") ("Husband, Savannah's Father"="1") (" father / calls him pappa"="1") ("step father"="2")  ("Step Father"="2") ('New "Step Dad"'="2") ("step-father"="2") 
     ("Boy Friend"="3") ("boyfriend"="3") ("grandmother"="4") ("Grandmother"="4") ("grandparent"="4") ("grandma"="4") ("headstart teacher" = "5")  ("headstart" = "5") ("Sitter"="5") 
     ("Miss Linda Garcia at Mckenzie Montessori Institute(Audrey was attending M-Th but will be going M-F starting this week)" = "5") ("uncle" = "6") ("brother" = "6") ("Other relative" = "6") ("my best friend"="7") ("Friend of Family"="7") 
     ("N/A" = "0") ("NA" = "0") ("No additional Care provider" = "0") INTO FQ1ODERSAC00.
EXECUTE.

*Syntax to turn DERSAC00 from a string to a numeric variable. 
ALTER TYPE FQ1ODERSAC00 (F8.0).
EXECUTE.

DO IF (value(FQ1ODERSAC00)) = 0.
    RECODE FQ1ODERSAC01 TO FQ1ODERSAC36(-10 = -44).
   END IF.

**STEP 7 (DELETE IF NOT NEEDED): CREATING NEW VARIABLES FOR REVERSED SCORED ITEMS.
**Reverse-Scored Items; see scoring document to determine if there are reverse-scored items. If no reverse-scored items, delete this syntax.
RECODE FQ1ODERSAC01 (1=5) (2=4) (3=3) (4=2) (5=1) (-10=-10) (-44=-44) INTO FQ1ODERSAC01R.
EXECUTE.
RECODE FQ1ODERSAC02 (1=5) (2=4) (3=3) (4=2) (5=1) (-10=-10) (-44=-44) INTO FQ1ODERSAC02R.
EXECUTE.
RECODE FQ1ODERSAC06 (1=5) (2=4) (3=3) (4=2) (5=1) (-10=-10) (-44=-44) INTO FQ1ODERSAC06R.
EXECUTE.
RECODE FQ1ODERSAC07 (1=5) (2=4) (3=3) (4=2) (5=1) (-10=-10) (-44=-44) INTO FQ1ODERSAC07R.
EXECUTE.
RECODE FQ1ODERSAC08 (1=5) (2=4) (3=3) (4=2) (5=1) (-10=-10) (-44=-44) INTO FQ1ODERSAC08R.
EXECUTE.
RECODE FQ1ODERSAC10 (1=5) (2=4) (3=3) (4=2) (5=1) (-10=-10) (-44=-44) INTO FQ1ODERSAC10R.
EXECUTE.
RECODE FQ1ODERSAC17 (1=5) (2=4) (3=3) (4=2) (5=1) (-10=-10) (-44=-44) INTO FQ1ODERSAC17R.
EXECUTE.
RECODE FQ1ODERSAC20 (1=5) (2=4) (3=3) (4=2) (5=1) (-10=-10) (-44=-44) INTO FQ1ODERSAC20R.
EXECUTE.
RECODE FQ1ODERSAC22 (1=5) (2=4) (3=3) (4=2) (5=1) (-10=-10) (-44=-44) INTO FQ1ODERSAC22R.
EXECUTE.
RECODE FQ1ODERSAC24 (1=5) (2=4) (3=3) (4=2) (5=1) (-10=-10) (-44=-44) INTO FQ1ODERSAC24R.
EXECUTE.
RECODE FQ1ODERSAC34 (1=5) (2=4) (3=3) (4=2) (5=1) (-10=-10) (-44=-44) INTO FQ1ODERSAC34R.
EXECUTE.

*STEP 7A: RECODING SYSMIS (PARTICIPANTS THAT MISSED THE ASSESSMENT).
*This will use the STAT variable to recode all SYSMIS data. CHANGE THE STAT VARIABLE TO MATCH THE ASSESSMENT WAVE YOU ARE WORKING IN.
*Include full list of numeric variables (including new reverse-scored items).
DO IF MISSING(FD1OSTAT).
DO REPEAT x =    FQ1ODERSAC01 to FQ1ODERSAC34R.
RECODE FD1OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.

*STEP 8: STANDARDIZING DECIMAL PLACES (CANNOT INCLUDE TEXT/STRING VARIABLES).
*Making all variables have the same number of decimal places. Ensure that variables include all new reverse-scored variables. Change the number AFTER the decimal place as needed.
FORMATS FQ1ODERSAC01 to FQ1ODERSAC34R (F8.0).
EXECUTE.

*STEP 9: CREATING VARIABLE LABLES.
*Label all variables. Use the original questionnaire to include the exact text that participants saw. Include the questionnaire name and number at the end of the label.
VARIABLE LABELS  ID 'Participant ID'.
EXECUTE.

VARIABLE LABELS 
FQ1ODERSAC00 'Who is the AC [FQ1ODERSAC00]'
FQ1ODERSAC01 'AC is clear about his/her feelings [FQ1ODERSAC01]'
FQ1ODERSAC02 'AC pays attention to how they feel [FQ1ODERSAC02]'
FQ1ODERSAC03 'AC experiences his/her emotions as overwhelming and out of control [FQ1ODERSAC03]'
FQ1ODERSAC04 'AC has no idea how s/he is feeling [FQ1ODERSAC04]'
FQ1ODERSAC05 'AC has difficulty making sense out of his/her feelings [FQ1ODERSAC05]'
FQ1ODERSAC06 'AC is attentive to his/her feelings [FQ1ODERSAC06]'
FQ1ODERSAC07 'AC knows exactly how s/he is feeling [FQ1ODERSAC07]'
FQ1ODERSAC08 'AC cares about what s/he is feeling [FQ1ODERSAC08]'
FQ1ODERSAC09 'AC is confused about how s/he feels [FQ1ODERSAC09]'
FQ1ODERSAC10 'When AC is upset, s/he becomes angry with his/herself for feeling that way [FQ1ODERSAC10]'
FQ1ODERSAC11 'When AC is upset, s/he has difficulty getting work done [FQ1ODERSAC11]'
FQ1ODERSAC12 'When AC is upset, s/he becomes embarrassed for feeling that way [FQ1ODERSAC12]'
FQ1ODERSAC13 'When AC is upset, s/he has difficulty getting work done [FQ1ODERSAC13]'
FQ1ODERSAC14 'When AC is upset, s/he becomes out of control [FQ1ODERSAC14]'
FQ1ODERSAC15 'When AC is upset, s/he believes that s/he will remain that way for a long time [FQ1ODERSAC15]'
FQ1ODERSAC16 'When AC is upset, s/he believes that s/he will end up feeling very depressed [FQ1ODERSAC16]'
FQ1ODERSAC17 'When AC is upset, s/he believes that his/her feelings are valid and important [FQ1ODERSAC17]'
FQ1ODERSAC18 'When AC is upset, s/he has difficulty focusing on other things [FQ1ODERSAC18]'
FQ1ODERSAC19 'When AC is upset, s/he feels out of control [FQ1ODERSAC19]'
FQ1ODERSAC20 'When AC is upset, s/he can still get things done [FQ1ODERSAC20]'
FQ1ODERSAC21 'When AC is upset, s/he feels ashamed with his/herself for feeling that way [FQ1ODERSAC21]'
FQ1ODERSAC22 'When AC is upset, s/he knows that he/she can find a way to eventually feel better [FQ1ODERSAC22]'
FQ1ODERSAC23 'When AC is upset, s/he feels like s/he is weak [FQ1ODERSAC23]'
FQ1ODERSAC24 'When AC is upset, s/he feels like s/he can remain in control of his/her behaviors [FQ1ODERSAC24]'
FQ1ODERSAC25 'When AC is upset, s/he feels guilty for feeling that way [FQ1ODERSAC25]'
FQ1ODERSAC26 'When AC is upset, s/he has difficulty concentrating [FQ1ODERSAC26]'
FQ1ODERSAC27 'When AC is upset, s/he has difficulty controlling his/her behaviors [FQ1ODERSAC27]'
FQ1ODERSAC28 'When AC is upset, s/he believes that there is nothing s/he can do to make his/herself feel better [FQ1ODERSAC28]'
FQ1ODERSAC29 'When AC is upset, s/he becomes irritated with his/herself for feeling that way [FQ1ODERSAC29]'
FQ1ODERSAC30 'When AC is upset, s/he starts to feel very bad about his/herself [FQ1ODERSAC30]'
FQ1ODERSAC31 'When AC is upset, s/he believes that wallowing in it is all s/he can do [FQ1ODERSAC31]'
FQ1ODERSAC32 'When AC is upset, s/he loses control over his/her behaviors [FQ1ODERSAC32]'
FQ1ODERSAC33 'When AC is upset, s/he has difficulty thinking about anyone else [FQ1ODERSAC33]'
FQ1ODERSAC34 'When AC is upset, s/he takes time to figure out what s/he is really feeling [FQ1ODERSAC34]'
FQ1ODERSAC35 'When AC is upset, it takes him/her a long time to feel better [FQ1ODERSAC35]'
FQ1ODERSAC36 'When AC is upset, his/her emotions feel overwhelming [FQ1ODERSAC36]'
FQ1ODERSAC01R 'AC is clear about his/her feelings [FQ1ODERSAC01R]'
FQ1ODERSAC02R 'AC pays attention to how they feel [FQ1ODERSAC02R]'
FQ1ODERSAC06R 'AC is attentive to his/her feelings  [FQ1ODERSAC06R]'
FQ1ODERSAC07R 'AC knows exactly how s/he is feeling [FQ1ODERSAC07R]'
FQ1ODERSAC08R 'AC cares about what s/he is feeling [FQ1ODERSAC08R]'
FQ1ODERSAC10R 'When AC is upset, s/he becomes angry with his/herself for feeling that way [FQ1ODERSAC10R]'
FQ1ODERSAC17R 'When AC is upset, s/he believes that his/her feelings are valid and important [FQ1ODERSAC17R]'
FQ1ODERSAC20R 'When AC is upset, s/he can still get things done [FQ1ODERSAC20R]'
FQ1ODERSAC22R 'When AC is upset, s/he knows that he/she can find a way to eventually feel better [FQ1ODERSAC22R]'
FQ1ODERSAC24R 'When AC is upset, s/he feels like s/he can remain in control of his/her behaviors [FQ1ODERSAC24R]'
FQ1ODERSAC34R 'When AC is upset, s/he takes time to figure out what s/he is really feeling [FQ1ODERSAC34R]'.
EXECUTE. 

*STEP 10: ADD VALUE LABELS.
*Include missing values like 'Prefer not to Answer' (or something similar) if applicable.
*Include ALL missing value labels (SEE ABOVE FOR FULL LIST).
VALUE LABELS
FQ1ODERSAC00
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
-44 'Question skipped (no alternative caregiver) (-44)'                                                            
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
0 'No additional caregiver'
1 'Father'
2 'Step-Father'
3 'Boyfriend'
4 'Grandparent'
5 'Teacher or Caretaker'
6 'Other Relative (Uncle, Brother)'
7 'Friend'.
EXECUTE.

VALUE LABELS
FQ1ODERSAC01 FQ1ODERSAC02 FQ1ODERSAC03 FQ1ODERSAC04 FQ1ODERSAC05 FQ1ODERSAC06 FQ1ODERSAC07 
FQ1ODERSAC08 FQ1ODERSAC09 FQ1ODERSAC10 FQ1ODERSAC11 FQ1ODERSAC12 FQ1ODERSAC13  
FQ1ODERSAC14 FQ1ODERSAC15 FQ1ODERSAC16  FQ1ODERSAC17 FQ1ODERSAC18 FQ1ODERSAC19 
FQ1ODERSAC20 FQ1ODERSAC21 FQ1ODERSAC22 FQ1ODERSAC23 FQ1ODERSAC24  FQ1ODERSAC25 
FQ1ODERSAC26 FQ1ODERSAC27 FQ1ODERSAC28 FQ1ODERSAC29 FQ1ODERSAC30 FQ1ODERSAC31 
FQ1ODERSAC32 FQ1ODERSAC33 FQ1ODERSAC34 FQ1ODERSAC35 FQ1ODERSAC36 
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
-44 'Question skipped (no alternative caregiver) (-44)'                                                            
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
FQ1ODERSAC01R FQ1ODERSAC02R FQ1ODERSAC06R FQ1ODERSAC07R FQ1ODERSAC08R FQ1ODERSAC10R FQ1ODERSAC17R FQ1ODERSAC20R FQ1ODERSAC22R FQ1ODERSAC24R FQ1ODERSAC34R
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
-44 'Question skipped (no alternative caregiver) (-44)'                                                            
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

**STEP 11: LABELING MISSING VALUES AS MISSING.
**Recoding all negative numbers as missing.
MISSING VALUES
    FQ1ODERSAC01 FQ1ODERSAC02 FQ1ODERSAC03 FQ1ODERSAC04 FQ1ODERSAC05 FQ1ODERSAC06 FQ1ODERSAC07 FQ1ODERSAC08 FQ1ODERSAC09
    FQ1ODERSAC10 FQ1ODERSAC11 FQ1ODERSAC12 FQ1ODERSAC13 FQ1ODERSAC14 FQ1ODERSAC15 FQ1ODERSAC16 FQ1ODERSAC17 FQ1ODERSAC18 FQ1ODERSAC19
    FQ1ODERSAC20 FQ1ODERSAC21 FQ1ODERSAC22 FQ1ODERSAC23 FQ1ODERSAC24 FQ1ODERSAC25 FQ1ODERSAC26 FQ1ODERSAC27 FQ1ODERSAC28 FQ1ODERSAC29
    FQ1ODERSAC30 FQ1ODERSAC31 FQ1ODERSAC32 FQ1ODERSAC33 FQ1ODERSAC34 FQ1ODERSAC35 FQ1ODERSAC36 FQ1ODERSAC01R FQ1ODERSAC02R
    FQ1ODERSAC06R FQ1ODERSAC07R FQ1ODERSAC08R FQ1ODERSAC10R FQ1ODERSAC17R FQ1ODERSAC20R FQ1ODERSAC22R FQ1ODERSAC24R FQ1ODERSAC34R
    (LO THRU -1).
EXECUTE.

*STEP 12: SAVE CLEANED DATA FILE.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1ODERSAC_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.

*STEP 13: CHECK FREQUENCIES.
*Checking frequencies of all items before creating constructs.
*Include STAT variable here to be sure all missingness was coded correctly.
FREQUENCIES VARIABLES=FD1OSTAT FQ1ODERSAC01 FQ1ODERSAC02 FQ1ODERSAC03 FQ1ODERSAC04 FQ1ODERSAC05 FQ1ODERSAC06 FQ1ODERSAC07 FQ1ODERSAC08 
    FQ1ODERSAC09 FQ1ODERSAC10 FQ1ODERSAC11 FQ1ODERSAC12 FQ1ODERSAC13 FQ1ODERSAC14 FQ1ODERSAC15 FQ1ODERSAC16 FQ1ODERSAC17 FQ1ODERSAC18 FQ1ODERSAC19 
    FQ1ODERSAC20 FQ1ODERSAC21 FQ1ODERSAC22 FQ1ODERSAC23 FQ1ODERSAC24 FQ1ODERSAC25 FQ1ODERSAC26 FQ1ODERSAC27 FQ1ODERSAC28 FQ1ODERSAC29 FQ1ODERSAC30 
    FQ1ODERSAC31 FQ1ODERSAC32 FQ1ODERSAC33 FQ1ODERSAC34 FQ1ODERSAC35 FQ1ODERSAC36 
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=
    FQ1ODERSAC01 FQ1ODERSAC01R 
    FQ1ODERSAC02 FQ1ODERSAC02R 
    FQ1ODERSAC06 FQ1ODERSAC06R
    FQ1ODERSAC07 FQ1ODERSAC07R
    FQ1ODERSAC08 FQ1ODERSAC08R
    FQ1ODERSAC10 FQ1ODERSAC10R
    FQ1ODERSAC17 FQ1ODERSAC17R
    FQ1ODERSAC20 FQ1ODERSAC20R
    FQ1ODERSAC22 FQ1ODERSAC22R 
    FQ1ODERSAC24 FQ1ODERSAC24R
    FQ1ODERSAC34 FQ1ODERSAC34R
  /ORDER=ANALYSIS.

*STEP 14: CHECK DESCRIPTIVES.
*Checking descriptives for all items before creating constructs.
DESCRIPTIVES VARIABLES=FQ1ODERSAC01 FQ1ODERSAC02 FQ1ODERSAC03 FQ1ODERSAC04 FQ1ODERSAC05 FQ1ODERSAC06 FQ1ODERSAC07 FQ1ODERSAC08 
    FQ1ODERSAC09 FQ1ODERSAC10 FQ1ODERSAC11 FQ1ODERSAC12 FQ1ODERSAC13 FQ1ODERSAC14 FQ1ODERSAC15 FQ1ODERSAC16 FQ1ODERSAC17 FQ1ODERSAC18 FQ1ODERSAC19 
    FQ1ODERSAC20 FQ1ODERSAC21 FQ1ODERSAC22 FQ1ODERSAC23 FQ1ODERSAC24 FQ1ODERSAC25 FQ1ODERSAC26 FQ1ODERSAC27 FQ1ODERSAC28 FQ1ODERSAC29 FQ1ODERSAC30 
    FQ1ODERSAC31 FQ1ODERSAC32 FQ1ODERSAC33 FQ1ODERSAC34 FQ1ODERSAC35 FQ1ODERSAC36 
  /STATISTICS=MEAN STDDEV MIN MAX.

DESCRIPTIVES VARIABLES=
    FQ1ODERSAC01 FQ1ODERSAC01R 
    FQ1ODERSAC02 FQ1ODERSAC02R 
    FQ1ODERSAC06 FQ1ODERSAC06R
    FQ1ODERSAC07 FQ1ODERSAC07R
    FQ1ODERSAC08 FQ1ODERSAC08R
    FQ1ODERSAC10 FQ1ODERSAC10R
    FQ1ODERSAC17 FQ1ODERSAC17R
    FQ1ODERSAC20 FQ1ODERSAC20R
    FQ1ODERSAC22 FQ1ODERSAC22R 
    FQ1ODERSAC24 FQ1ODERSAC24R
    FQ1ODERSAC34 FQ1ODERSAC34R
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 15: SAVE CLEANED DATA FILE.
*Sorting the data file by ID and resaving the final file.
*To reorder items, use /KEEP {list all variables in order} -- insert in line after file name.
SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1ODERSAC_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.

*STEP 16: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE
 OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1ODERSAC_Cleaned.spv'
 LOCK=NO.

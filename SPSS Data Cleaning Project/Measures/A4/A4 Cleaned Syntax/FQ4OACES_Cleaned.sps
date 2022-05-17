* Encoding: UTF-8.
*STEP 0: NOTES
*ADVERSE CHILDHOOD EXPERIENCES (ACES).

*07-27-21(BM): Completed STEPS 1-16.
*08-17-21(AAC): Small changes (deleted redundant line in Step 0, changed correct name of date in STEP 5, added checked and not needed in STEP 7, fixed typos in variable labels in STEP 9, added additional instruction in STEP 15)
*08-26-21(AAC): Changed order of variables in STEP 13 and 14  
*04-13-2022 (BM):Adapted Syntax to Match Updated Template + Pass in Updated Data. 
*04-15-22(AAC): Checked.
*04-18-2022(BM): Double Checked and Fixed Missing Codes.
*04-21-22(AAC): Checked.
*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------.
*STEP 1: OPENING RAW DATA.
*Insert the correct file path and file name. Use syntax to open raw data file.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/DBT Moms R01 Study Time 4 Mother Survey_April 18, 2022_16.19.sav'.

*STEP 2: SAVING QUESTIONNAIRE SPECIFIC RAW DATA. 
*Insert the correct file path and file name. Save this file with only those variables that you need, in the following order; ID, Start Date, Questionnaire Items (i.e., DERS_1 to DERS_36).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OACES_Cleaned.sav'
  /KEEP
  FQ4ID 
  STARTDATE
  FQ4ACES_1 TO FQ4ACES_10A
  /COMPRESSED.
  EXECUTE.

*STEP 3: OPEN NEW DATA FILE.  
*Insert the correct file path and file name. Open the file you just created and saved so that you are able to clean the data.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OACES_Cleaned.sav'.

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
RENAME VARIABLE (STARTDATE=FQ4OACESDATE).
EXECUTE.
RENAME VARIABLE (FQ4ACES_1 = FQ4OACES01) (FQ4ACES_1A = FQ4OACES01A) (FQ4ACES_2 = FQ4OACES02) (FQ4ACES_2A = FQ4OACES02A) 
(FQ4ACES_3 = FQ4OACES03) (FQ4ACES_3A = FQ4OACES03A) (FQ4ACES_4 = FQ4OACES04) (FQ4ACES_4A = FQ4OACES04A)
(FQ4ACES_5 = FQ4OACES05) (FQ4ACES_5A = FQ4OACES05A) (FQ4ACES_6 = FQ4OACES06) (FQ4ACES_6A = FQ4OACES06A)
(FQ4ACES_7 = FQ4OACES07) (FQ4ACES_7A = FQ4OACES07A) (FQ4ACES_8 = FQ4OACES08) (FQ4ACES_8A = FQ4OACES08A)
(FQ4ACES_9 = FQ4OACES09) (FQ4ACES_9A = FQ4OACES09A) (FQ4ACES_10 = FQ4OACES10) (FQ4ACES_10A = FQ4OACES10A).     
EXECUTE.

DO IF MISSING(FQ4OACES01). 
    COMPUTE
    FQ4OACES01=-10.
END IF.
EXECUTE.

DO IF MISSING(FQ4OACES01A). 
    COMPUTE
    FQ4OACES01A=-44.
END IF.
EXECUTE.

DO IF MISSING(FQ4OACES02). 
    COMPUTE
    FQ4OACES02=-10.
END IF.
EXECUTE.

DO IF MISSING(FQ4OACES02A). 
    COMPUTE
    FQ4OACES02A=-44.
END IF.
EXECUTE.

DO IF MISSING(FQ4OACES03). 
    COMPUTE
    FQ4OACES03=-10.
END IF.
EXECUTE.

DO IF MISSING(FQ4OACES03A). 
    COMPUTE
    FQ4OACES03A=-44.
END IF.
EXECUTE.

DO IF MISSING(FQ4OACES04). 
    COMPUTE
    FQ4OACES04=-10.
END IF.
EXECUTE.

DO IF MISSING(FQ4OACES04A). 
    COMPUTE
    FQ4OACES04A=-44.
END IF.
EXECUTE.

DO IF MISSING(FQ4OACES05). 
    COMPUTE
    FQ4OACES05=-10.
END IF.
EXECUTE.

DO IF MISSING(FQ4OACES05A). 
    COMPUTE
    FQ4OACES05A=-44.
END IF.
EXECUTE.

DO IF MISSING(FQ4OACES06). 
    COMPUTE
    FQ4OACES06=-10.
END IF.
EXECUTE.

DO IF MISSING(FQ4OACES06A). 
    COMPUTE
    FQ4OACES06A=-44.
END IF.
EXECUTE.

DO IF MISSING(FQ4OACES07). 
    COMPUTE
    FQ4OACES07=-10.
END IF.
EXECUTE.

DO IF MISSING(FQ4OACES07A). 
    COMPUTE
    FQ4OACES07A=-44.
END IF.
EXECUTE.

DO IF MISSING(FQ4OACES08). 
    COMPUTE
    FQ4OACES08=-10.
END IF.
EXECUTE.

DO IF MISSING(FQ4OACES08A). 
    COMPUTE
    FQ4OACES08A=-44.
END IF.
EXECUTE.

DO IF MISSING(FQ4OACES09). 
    COMPUTE
    FQ4OACES09=-10.
END IF.
EXECUTE.

DO IF MISSING(FQ4OACES09A). 
    COMPUTE
    FQ4OACES09A=-44.
END IF.
EXECUTE.

DO IF MISSING(FQ4OACES10). 
    COMPUTE
    FQ4OACES10=-10.
END IF.
EXECUTE.

DO IF MISSING(FQ4OACES10A). 
    COMPUTE
    FQ4OACES10A=-44.
END IF.
EXECUTE.


*Remember to save your data file.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OACES_Cleaned.sav'.
EXECUTE.

*STEP 5A: MERGING FINAL ID FILE WITH CURRENT DATA FILE.
*This will ensure that all files have the correct # of enrolled and eligible IDs (Pitt=90; UO=88). Any missingness should be investigated (should they be missing?) and
labeled in STEP XX using information from the status (STAT) variable. If the status variable does not 'tell the whole story' (i.e., visit occurred but data is missing),
missingness should be labeled by ID using syntax and notes in the syntax should provide information to justify the missing code.
*When using the syntax include which variables you want to DROP from the Assessment Summary file -- THE FULL LIST OF VARIABLES IS BELOW -- 
You should retain the real date (RD) and status (STAT) for the wave you are using (example below is A1; FD4ORD FD4OSTAT are REMOVED so that they are NOT dropped from the file):
FD0OSTAT FD0ORD
FD1OSTAT FD1OTD FD1ORD FD1ODIFF
FD2OSTAT FD2OTD FD2ORD FD2ODIFF
FD3OSTAT FD3OTD FD3ORD FD3ODIFF
FD4OSTAT FD4OTD FD4ORD FD4ODIFF
FD4AOSTAT FD4AOTD FD4AORD FD4AODIFF.
MATCH FILES
/FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FD0OACS_Constructs.sav'
/IN=f
/FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OACES_Cleaned.sav'
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
COMPUTE DATEDIFF = DATEDIFF(FD4ORD,FQ4OACESDATE,'days').
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
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OACES_Cleaned.sav'
/DROP
FQ4OACESDATE
DATEDIFF
DATEDIFF0
f.
EXECUTE.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OACES_Cleaned.sav'.
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
**-11 'Participant (parent or child) deceased'                                  /* (Participant (child) deceased) */
**-10 'Prefer not to answer'                                                           /* (Participant selected prefer not to answer) */.
RECODE FQ4OACES01 to FQ4OACES10A 
    (9=-10).
EXECUTE.
 
*The following DO IFs turn all the skipped qualtrics questions into -43 or -44. 
DO IF FQ4OACES01 = -10. 
    COMPUTE FQ4OACES01A = -43. 
    END IF.

DO IF (value(FQ4OACES01)) = 0. 
    RECODE FQ4OACES01A(SYSMIS = -44). 
    END IF.

DO IF FQ4OACES02 = -10. 
    COMPUTE FQ4OACES02A = -43. 
    END IF.

DO IF (value(FQ4OACES02)) = 0. 
    RECODE FQ4OACES02A(SYSMIS = -44). 
    END IF.

DO IF FQ4OACES03 = -10. 
    COMPUTE FQ4OACES03A = -43. 
    END IF.

DO IF (value(FQ4OACES03)) = 0. 
    RECODE FQ4OACES03A(SYSMIS = -44). 
    END IF.

DO IF FQ4OACES04 = -10. 
    COMPUTE FQ4OACES04A = -43. 
    END IF.

DO IF (value(FQ4OACES04)) = 0.
    RECODE FQ4OACES04A(SYSMIS = -44). 
    END IF.

DO IF FQ4OACES05 = -10. 
    COMPUTE FQ4OACES05A = -43. 
    END IF.

DO IF (value(FQ4OACES05)) = 0. 
    RECODE FQ4OACES05A(SYSMIS = -44). 
    END IF.

DO IF FQ4OACES06 = -10. 
    COMPUTE FQ4OACES06A = -43. 
    END IF.

DO IF (value(FQ4OACES06)) = 0. 
    RECODE FQ4OACES06A(SYSMIS = -44). 
    END IF.

DO IF FQ4OACES07 = -10. 
    COMPUTE FQ4OACES07A = -43. 
    END IF.

DO IF (value(FQ4OACES07)) = 0. 
    RECODE FQ4OACES07A(SYSMIS = -44). 
    END IF.

DO IF FQ4OACES08 = -10. 
    COMPUTE FQ4OACES08A = -43. 
    END IF.

DO IF (value(FQ4OACES08)) = 0.
    RECODE FQ4OACES08A(SYSMIS = -44). 
    END IF.

DO IF FQ4OACES09 = -10. 
    COMPUTE FQ4OACES09A = -43. 
    END IF.

DO IF (value(FQ4OACES09)) = 0.
    RECODE FQ4OACES09A(SYSMIS = -44). 
    END IF.

DO IF FQ4OACES10 = -10. 
    COMPUTE FQ4OACES10A = -43. 
    END IF.

DO IF (value(FQ4OACES10)) = 0.
    RECODE FQ4OACES10A(SYSMIS = -44). 
    END IF.

**STEP 7 (DELETE IF NOT NEEDED): CREATING NEW VARIABLES FOR REVERSED SCORED ITEMS.
**Reverse-Scored Items; see scoring document to determine if there are reverse-scored items. If no reverse-scored items, delete this syntax.
**CHECKED AND NOT NEEDED
    
*STEP 7A: RECODING SYSMIS (PARTICIPANTS THAT MISSED THE ASSESSMENT).
*This will use the STAT variable to recode all SYSMIS data. CHANGE THE STAT VARIABLE TO MATCH THE ASSESSMENT WAVE YOU ARE WORKING IN.
*Include full list of numeric variables (including new reverse-scored items).
DO IF MISSING(FD4OSTAT).
DO REPEAT x =    FQ4OACES01 to FQ4OACES10A.
RECODE FD4OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.

*STEP 8: STANDARDIZING DECIMAL PLACES (CANNOT INCLUDE TEXT/STRING VARIABLES).
*Making all variables have the same number of decimal places. Ensure that variables include all new reverse-scored variables. Change the number AFTER the decimal place as needed.
FORMATS FQ4OACES01 to FQ4OACES10A (F8.0).
EXECUTE.

*STEP 9: CREATING VARIABLE LABLES.
*Label all variables. Use the original questionnaire to include the exact text that participants saw. Include the questionnaire name and number at the end of the label.
VARIABLE LABELS  ID 'Participant ID'.
EXECUTE.

VARIABLE LABELS 
FQ4OACES01 'Prior to your 18th birthday: Did a parent or other adult in the household often or very often swear at you, insult you, put you down, or humiliate you? Or act in a way that made you afraid that you might be physically hurt? [FQ4OACES01]'
FQ4OACES01A 'Emotional Abuse: How distressing were these experiences for you? [FQ4OACES01A]'
FQ4OACES02 'Prior to your 18th birthday: Did a parent or other adult in the household often or very often push, grab, slap, or throw something at you? [FQ4OACES02]'
FQ4OACES02A 'Physical Abuse: How distressing were these experiences for you? [FQ4OACES02A]'
FQ4OACES03 'Prior to your 18th birthday: Did an adult or person at least 5 years older than you ever touch or fondle you or have you touch their body in a sexual way? Or attempt or actually have oral, anal, or vaginal intercourse with you? [FQ4OACES03]'
FQ4OACES03A 'Sexual Abuse: How distressing were these experiences for you? [FQ4OACES03A]'
FQ4OACES04 'Prior to your 18th birthday: Did you often or very often feel that no one in your family loved you or thought you were important or special? Or your family didn’t look out for each other, feel close to each other, or support each other? [FQ4OACES04]'
FQ4OACES04A 'Physical Neglect: How distressing were these experiences for you? [FQ4OACES04A]'
FQ4OACES05 'Prior to your 18th birthday: Did you often or very often feel that you didnt have enough to eat, had to wear dirty clothes, and had no one to protect you? Or your parents were too drunk or high to take care of you or take you to the doctor? [FQ4OACES05]'
FQ4OACES05A 'Emotional Neglect: How distressing were these experiences for you? [FQ4OACES05A]'
FQ4OACES06 'Prior to your 18th birthday: Were your parents ever separated or divorced? [FQ4OACES06]'
FQ4OACES06A 'Parental Separation or Divorce: How distressing were these experiences for you? [FQ4OACES06A]'
FQ4OACES07 'Prior to your 18th birthday: Was your mother or stepmother pushed, grabbed, slapped, or had something thrown at her? Or kicked, bitten, hit with a fist, or hit with something hard? Or threatened with a gun or knife? [FQ4OACES07]'
FQ4OACES07A 'Childhood Exposure to Domestic Violence: How distressing were these experiences for you? [FQ4OACES07A]'
FQ4OACES08 'Prior to your 18th birthday: Did you live with anyone who was a problem drinker or alcoholic, or who used street drugs? [FQ4OACES08]'
FQ4OACES08A 'Childhood Exposure to Substance Abuse: How distressing were these experiences for you? [FQ4OACES08A]'
FQ4OACES09 'Prior to your 18th birthday: Was a household member depressed or mentally ill, or did a household member attempt suicide? [FQ4OACES09]'
FQ4OACES09A 'Mental illness in the Household: How distressing were these experiences for you? [FQ4OACES09A]'
FQ4OACES10 'Prior to your 18th birthday: Did a household member go to prison? [FQ4OACES10]'
FQ4OACES10A 'Incarcerated Family Member: How distressing were these experiences for you? [FQ4OACES10A]'.
EXECUTE. 

*STEP 10: ADD VALUE LABELS.
*Include missing values like 'Prefer not to Answer' (or something similar) if applicable.
*Include ALL missing value labels (SEE ABOVE FOR FULL LIST).
VALUE LABELS
FQ4OACES01 FQ4OACES02 FQ4OACES03 FQ4OACES04 FQ4OACES05 FQ4OACES06 FQ4OACES07 FQ4OACES08 FQ4OACES09 FQ4OACES10 
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
0 'No (0)'
1 'Yes (1)'.  
EXECUTE.

VALUE LABELS
FQ4OACES01A FQ4OACES02A FQ4OACES03A FQ4OACES04A FQ4OACES05A FQ4OACES06A FQ4OACES07A FQ4OACES08A FQ4OACES09A FQ4OACES10A 
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
1 'Not at all (1)'
2 'Minimally (2)'
3 'Neither distressing or not distressing (3)'
4 'Somewhat (4)'
5 'Extremely (5)'.  
EXECUTE.

**STEP 11: LABELING MISSING VALUES AS MISSING.
**Recoding all negative numbers as missing.
MISSING VALUES
  FQ4OACES01 FQ4OACES01A FQ4OACES02 FQ4OACES02A FQ4OACES03 FQ4OACES03A FQ4OACES04 FQ4OACES04A FQ4OACES05 FQ4OACES05A
  FQ4OACES06 FQ4OACES06A FQ4OACES07 FQ4OACES07A FQ4OACES08 FQ4OACES08A FQ4OACES09 FQ4OACES09A FQ4OACES10 FQ4OACES10A
    (LO THRU -1).
EXECUTE.

*STEP 12: SAVE CLEANED DATA FILE.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OACES_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.

*STEP 13: CHECK FREQUENCIES.
*Checking frequencies of all items before creating constructs.
*Include STAT variable here to be sure all missingness was coded correctly.
FREQUENCIES VARIABLES=FD4OSTAT FQ4OACES01 FQ4OACES01A FQ4OACES02 FQ4OACES02A FQ4OACES03 FQ4OACES03A FQ4OACES04 FQ4OACES04A FQ4OACES05 FQ4OACES05A
  FQ4OACES06 FQ4OACES06A FQ4OACES07 FQ4OACES07A FQ4OACES08 FQ4OACES08A FQ4OACES09 FQ4OACES09A FQ4OACES10 FQ4OACES10A  
  /ORDER=ANALYSIS.

*STEP 14: CHECK DESCRIPTIVES.
*Checking descriptives for all items before creating constructs.
DESCRIPTIVES VARIABLES=FQ4OACES01 FQ4OACES01A FQ4OACES02 FQ4OACES02A FQ4OACES03 FQ4OACES03A FQ4OACES04 FQ4OACES04A FQ4OACES05 FQ4OACES05A
  FQ4OACES06 FQ4OACES06A FQ4OACES07 FQ4OACES07A FQ4OACES08 FQ4OACES08A FQ4OACES09 FQ4OACES09A FQ4OACES10 FQ4OACES10A
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 15: SAVE CLEANED DATA FILE.
*Sorting the data file by ID and resaving the final file.
*To reorder items, use /KEEP {list all variales in order} -- insert in line after file name.
SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OACES_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.

*STEP 16: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE
 OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OACES_Cleaned.spv'
 LOCK=NO.

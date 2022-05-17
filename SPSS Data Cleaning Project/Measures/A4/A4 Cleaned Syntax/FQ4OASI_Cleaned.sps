* Encoding: UTF-8.
*STEP 0: NOTES
*Addiction Severity Index (ASI).

*INCLUDE DATE(INITIALS): DESCRIPTION OF WHAT YOU DID. EVERY TIME THE SYNTAX IS EDITED, THERE SHOULD BE DETAILED NOTES ABOUT IT.
*10-01-21(BM): Adapted STEPS 1-16 from A1 Syntax.
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
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OASI_Cleaned.sav'
  /KEEP
  FQ4ID 
  STARTDATE
  FQ4ASI_1 TO FQ4ASI_13A
  /COMPRESSED.
  EXECUTE.

*STEP 3: OPEN NEW DATA FILE.  
*Insert the correct file path and file name. Open the file you just created and saved so that you are able to clean the data.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OASI_Cleaned.sav'.

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
RENAME VARIABLE (STARTDATE=FQ4OASIDATE).
EXECUTE.

RENAME VARIABLE (FQ4ASI_1 = FQ4OASI01) (FQ4ASI_1A = FQ4OASI01A) (FQ4ASI_2 = FQ4OASI02)(FQ4ASI_2A = FQ4OASI02A)
	(FQ4ASI_3 = FQ4OASI03) (FQ4ASI_3A = FQ4OASI03A) (FQ4ASI_4 = FQ4OASI04) (FQ4ASI_4A = FQ4OASI04A) (FQ4ASI_5 = FQ4OASI05) (FQ4ASI_5A = FQ4OASI05A)
	(FQ4ASI_6 = FQ4OASI06) (FQ4ASI_6A = FQ4OASI06A) (FQ4ASI_7 = FQ4OASI07) (FQ4ASI_7A = FQ4OASI07A) (FQ4ASI_8 = FQ4OASI08)
	(FQ4ASI_8A = FQ4OASI08A) (FQ4ASI_9 = FQ4OASI09) (FQ4ASI_9A = FQ4OASI09A) (FQ4ASI_10 = FQ4OASI10) (FQ4ASI_10A = FQ4OASI10A)
	(FQ4ASI_11 = FQ4OASI11) (FQ4ASI_11A = FQ4OASI11A) (FQ4ASI_12 = FQ4OASI12) (FQ4ASI_12A = FQ4OASI12A) (FQ4ASI_13 = FQ4OASI13)
	(FQ4ASI_13A = FQ4OASI13A).
EXECUTE.

*Remember to save your data file.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OASI_Cleaned.sav'.
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
/FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OASI_Cleaned.sav'
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
COMPUTE DATEDIFF = DATEDIFF(FD4ORD,FQ4OASIDATE,'days').
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
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OASI_Cleaned.sav'
/DROP
FQ4OASIDATE
DATEDIFF
DATEDIFF0
f.
EXECUTE.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OASI_Cleaned.sav'.
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

** Coding Missingness for FQ4OASI01 and FQ4OASI13A. 
DO IF (value(FQ4OASI01)) = 0. 
    RECODE FQ4OASI01A FQ4OASI02 FQ4OASI02A(SYSMIS = -43). 
    END IF.

DO IF (value(FQ4OASI02)) = 0. 
    RECODE FQ4OASI02A(SYSMIS = -43). 
    END IF.

DO IF (value(FQ4OASI03)) = 0. 
    RECODE FQ4OASI03A(SYSMIS = -43). 
    END IF.

DO IF (value(FQ4OASI04)) = 0. 
    RECODE FQ4OASI04A(SYSMIS = -43). 
    END IF.

DO IF (value(FQ4OASI05)) = 0. 
    RECODE FQ4OASI05A(SYSMIS = -43). 
    END IF.

DO IF (value(FQ4OASI06)) = 0. 
    RECODE FQ4OASI06A(SYSMIS = -43). 
    END IF.

DO IF (value(FQ4OASI07)) = 0. 
    RECODE FQ4OASI07A(SYSMIS = -43). 
    END IF.

DO IF (value(FQ4OASI08)) = 0. 
    RECODE FQ4OASI08A(SYSMIS = -43). 
    END IF.

DO IF (value(FQ4OASI09)) = 0. 
    RECODE FQ4OASI09A(SYSMIS = -43). 
    END IF.

DO IF (value(FQ4OASI10)) = 0. 
    RECODE FQ4OASI10A(SYSMIS = -43). 
    END IF.

DO IF (value(FQ4OASI11)) = 0. 
    RECODE FQ4OASI11A(SYSMIS = -43). 
    END IF.

DO IF (value(FQ4OASI12)) = 0. 
    RECODE FQ4OASI12A(SYSMIS = -43). 
    END IF.

DO IF (value(FQ4OASI13)) = 0. 
    RECODE FQ4OASI13A(SYSMIS = -43). 
    END IF.

IF(ID=90253) FQ4OASI01 = -10.
IF(ID=90253) FQ4OASI02 = -10.
IF(ID=90253) FQ4OASI03 = -10.
IF(ID=90253) FQ4OASI04 = -10.
IF(ID=90253) FQ4OASI05 = -10.
IF(ID=90253) FQ4OASI06 = -10.
IF(ID=90253) FQ4OASI07 = -10.
IF(ID=90253) FQ4OASI08 = -10.
IF(ID=90253) FQ4OASI09 = -10.
IF(ID=90253) FQ4OASI10 = -10.
IF(ID=90253) FQ4OASI11 = -10.
IF(ID=90253) FQ4OASI12 = -10.
IF(ID=90253) FQ4OASI13 = -10.
IF(ID=90991) FQ4OASI03 = -10.
EXECUTE.

DO IF (value(FQ4OASI01)) = -10. 
    RECODE FQ4OASI01A FQ4OASI02 FQ4OASI02A(SYSMIS = -43). 
    END IF.

DO IF (value(FQ4OASI02)) = -10. 
    RECODE FQ4OASI02A(SYSMIS = -43). 
    END IF.

DO IF (value(FQ4OASI03)) = -10. 
    RECODE FQ4OASI03A(SYSMIS = -43). 
    END IF.

DO IF (value(FQ4OASI04)) = -10. 
    RECODE FQ4OASI04A(SYSMIS = -43). 
    END IF.

DO IF (value(FQ4OASI05)) = -10. 
    RECODE FQ4OASI05A(SYSMIS = -43). 
    END IF.

DO IF (value(FQ4OASI06)) = -10. 
    RECODE FQ4OASI06A(SYSMIS = -43). 
    END IF.

DO IF (value(FQ4OASI07)) = -10. 
    RECODE FQ4OASI07A(SYSMIS = -43). 
    END IF.

DO IF (value(FQ4OASI08)) = -10. 
    RECODE FQ4OASI08A(SYSMIS = -43). 
    END IF.

DO IF (value(FQ4OASI09)) = -10. 
    RECODE FQ4OASI09A(SYSMIS = -43). 
    END IF.

DO IF (value(FQ4OASI10)) = -10. 
    RECODE FQ4OASI10A(SYSMIS = -43). 
    END IF.

DO IF (value(FQ4OASI11)) = -10. 
    RECODE FQ4OASI11A(SYSMIS = -43). 
    END IF.

DO IF (value(FQ4OASI12)) = -10. 
    RECODE FQ4OASI12A(SYSMIS = -43). 
    END IF.

DO IF (value(FQ4OASI13)) = -10. 
    RECODE FQ4OASI13A(SYSMIS = -43). 
    END IF.

**STEP 7 (DELETE IF NOT NEEDED): CREATING NEW VARIABLES FOR REVERSED SCORED ITEMS.
**Reverse-Scored Items; see scoring document to determine if there are reverse-scored items. If no reverse-scored items, delete this syntax.
**CHECKED AND NOT NEEDED
    
*STEP 7A: RECODING SYSMIS (PARTICIPANTS THAT MISSED THE ASSESSMENT).
*This will use the STAT variable to recode all SYSMIS data. CHANGE THE STAT VARIABLE TO MATCH THE ASSESSMENT WAVE YOU ARE WORKING IN.
*Include full list of numeric variables (including new reverse-scored items).
DO IF MISSING(FD4OSTAT).
DO REPEAT x = FQ4OASI01 to FQ4OASI13A.
RECODE FD4OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.

*STEP 8: STANDARDIZING DECIMAL PLACES (CANNOT INCLUDE TEXT/STRING VARIABLES).
*Making all variables have the same number of decimal places. Ensure that variables include all new reverse-scored variables. Change the number AFTER the decimal place as needed.
FORMATS FQ4OASI01 to FQ4OASI13A (F8.0).
EXECUTE.

*STEP 9: CREATING VARIABLE LABLES.
*Label all variables. Use the original questionnaire to include the exact text that participants saw. Include the questionnaire name and number at the end of the label.
VARIABLE LABELS  ID 'Participant ID'.
EXECUTE.

VARIABLE LABELS 
FQ4OASI01 'Have you ever used alcohol (e.g. Beer, Wine, Liquor)? [FQ4OASI01]'
FQ4OASI01A 'Have you used alcohol in the past 30 days? [FQ4OASI01A]'
FQ4OASI02 'Have you ever used alcohol to intoxication (3 or more drinks in one sitting, or 5 or more drinks in one day)? [FQ4OASI02]'
FQ4OASI02A 'Have you used alcohol to intoxication (3 or more drinks in one sitting, or 5 or more drinks in one day) in the past 30 days? [FQ4OASI02A]'
FQ4OASI03 'Have you ever used Heroin? [FQ4OASI03]'
FQ4OASI03A 'Have you used Heroin in the past 30 days? [FQ4OASI03A]'
FQ4OASI04 'Have you ever used Methadone?  [FQ4OASI04]'
FQ4OASI04A 'Have you used Methadone in the past 30 days? [FQ4OASI04A]'
FQ4OASI05 'Have you ever used other Opiates/Analgesics? [FQ4OASI05]'
FQ4OASI05A 'Have you used other Opiates/Analgesics in the past 30 days? [FQ4OASI05A]'
FQ4OASI06 'Have you ever used Barbiturates? [FQ4OASI06]'
FQ4OASI06A 'Have you used Barbiturates in the past 30 days? [FQ4OASI06A]'
FQ4OASI07 'Have you ever used Sedatives/Hypnotics/Tranquilizers? [FQ4OASI07]'
FQ4OASI07A 'Have you used Sedatives/Hypnotics/Tranquilizers in the past 30 days? [FQ4OASI07A]'
FQ4OASI08 'Have you ever used Cocaine (e.g. Cocaine Crystal, Free-Base Cocaine or Crack, "Rock Cocaine"? [FQ4OASI08]'
FQ4OASI08A 'Have you used Cocaine in the past 30 days? [FQ4OASI08A]'
FQ4OASI09 'Have you ever used Amphetamines? [FQ4OASI09]'
FQ4OASI09A 'Have you used Amphetamines in the past 30 days? [FQ4OASI09A]'
FQ4OASI10 'Have you ever used Cannabis (e.g. Marijuana, Hashish)? [FQ4OASI10]'
FQ4OASI10A 'Have you used Cannabis in the past 30 days? [FQ4OASI10A]'
FQ4OASI11 'Have you ever used Hallucinogens? [FQ4OASI11]'
FQ4OASI11A 'Have you used Hallucinogens in the past 30 days? [FQ4OASI11A]'
FQ4OASI12 'Have you ever used Inhalants? [FQ4OASI12]'
FQ4OASI12A 'Have you used Inhalants in the past 30 days? [FQ4OASI12A]'
FQ4OASI13 'Have you ever used more than one substance at a time? [FQ4OASI13]'
FQ4OASI13A 'Have you used more than one substance at a time in the past 30 days? [FQ4OASI13A]'.
EXECUTE. 

*STEP 10: ADD VALUE LABELS.
*Include missing values like 'Prefer not to Answer' (or something similar) if applicable.
*Include ALL missing value labels (SEE ABOVE FOR FULL LIST).
VALUE LABELS
FQ4OASI01 FQ4OASI01A FQ4OASI02 FQ4OASI02A FQ4OASI03 FQ4OASI03A FQ4OASI04 FQ4OASI04A FQ4OASI05 FQ4OASI05A FQ4OASI06 FQ4OASI06A FQ4OASI07 FQ4OASI07A FQ4OASI08 FQ4OASI08A FQ4OASI09 FQ4OASI09A FQ4OASI10 FQ4OASI10A
FQ4OASI11 FQ4OASI11A FQ4OASI12 FQ4OASI12A FQ4OASI13 FQ4OASI13A
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
1 'Yes (1)'
0 'No (0)'.  
EXECUTE.

**STEP 11: LABELING MISSING VALUES AS MISSING.
**Recoding all negative numbers as missing.
MISSING VALUES
    FQ4OASI01 FQ4OASI01A FQ4OASI02 FQ4OASI02A FQ4OASI03 FQ4OASI03A FQ4OASI04 FQ4OASI04A FQ4OASI05 FQ4OASI05A FQ4OASI06 FQ4OASI06A FQ4OASI07 FQ4OASI07A FQ4OASI08 FQ4OASI08A FQ4OASI09 FQ4OASI09A FQ4OASI10 FQ4OASI10A
FQ4OASI11 FQ4OASI11A FQ4OASI12 FQ4OASI12A FQ4OASI13 FQ4OASI13A
    (LO THRU -1).
EXECUTE.

*STEP 12: SAVE CLEANED DATA FILE.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OASI_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.

*STEP 13: CHECK FREQUENCIES.
*Checking frequencies of all items before creating constructs.
*Include STAT variable here to be sure all missingness was coded correctly.
FREQUENCIES VARIABLES=FD4OSTAT FQ4OASI01 FQ4OASI01A FQ4OASI02 FQ4OASI02A FQ4OASI03 FQ4OASI03A FQ4OASI04 FQ4OASI04A FQ4OASI05 FQ4OASI05A FQ4OASI06 FQ4OASI06A FQ4OASI07 FQ4OASI07A FQ4OASI08 FQ4OASI08A FQ4OASI09 FQ4OASI09A FQ4OASI10 FQ4OASI10A
FQ4OASI11 FQ4OASI11A FQ4OASI12 FQ4OASI12A FQ4OASI13 FQ4OASI13A
  /ORDER=ANALYSIS.

*STEP 14: CHECK DESCRIPTIVES.
*Checking descriptives for all items before creating constructs.
DESCRIPTIVES VARIABLES=FQ4OASI01 FQ4OASI01A FQ4OASI02 FQ4OASI02A FQ4OASI03 FQ4OASI03A FQ4OASI04 FQ4OASI04A FQ4OASI05 FQ4OASI05A FQ4OASI06 FQ4OASI06A FQ4OASI07 FQ4OASI07A FQ4OASI08 FQ4OASI08A FQ4OASI09 FQ4OASI09A FQ4OASI10 FQ4OASI10A
FQ4OASI11 FQ4OASI11A FQ4OASI12 FQ4OASI12A FQ4OASI13 FQ4OASI13A
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 15: SAVE CLEANED DATA FILE.
*Sorting the data file by ID and resaving the final file.
*To reorder items, use /KEEP {list all variales in order} -- insert in line after file name.
SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OASI_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.

*STEP 16: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE
 OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OASI_Cleaned.spv'
 LOCK=NO.




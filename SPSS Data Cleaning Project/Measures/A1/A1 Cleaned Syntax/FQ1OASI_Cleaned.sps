* Encoding: UTF-8.
*STEP 0: NOTES
*Addiction Severity Index (ASI).

*INCLUDE DATE(INITIALS): DESCRIPTION OF WHAT YOU DID. EVERY TIME THE SYNTAX IS EDITED, THERE SHOULD BE DETAILED NOTES ABOUT IT.
*09-14-21(BM): Completed STEPS 1-16.
*09-28-21(AAC): Small labeling edit
*11-8-21 (BM): Adapted syntax to match template.
*11-10-21(BM): Updated STEP 6 comment.
*11-10-21(AAC): Checked. Small changes in comments to reflect latest version of template. 
*12-13-21(AAC): Minor change in comment section in step 11.
*05-10-22(AAC): Renamed variables.

*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------.
*STEP 1: OPENING RAW DATA.
*Insert the correct file path and file name. Use syntax to open raw data file.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/DBT Moms R01 Study Time 1 Mother Survey_November 10, 2021_12.48.sav'.

*STEP 2: SAVING QUESTIONNAIRE SPECIFIC RAW DATA. 
*Insert the correct file path and file name. Save this file with only those variables that you need, in the following order; ID, Start Date, Questionnaire Items (i.e., DERS_1 to DERS_36).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OASI_Cleaned.sav'
  /KEEP
  FQ1ID 
  STARTDATE
  FQ1ASI_1 TO FQ1ASI_13A
  /COMPRESSED.
  EXECUTE.

*STEP 3: OPEN NEW DATA FILE.  
*Insert the correct file path and file name. Open the file you just created and saved so that you are able to clean the data.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OASI_Cleaned.sav'.

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
RENAME VARIABLE (STARTDATE=FQ1OASIDATE).
EXECUTE.

RENAME VARIABLE (FQ1ASI_1 = FQ1OASI01A) (FQ1ASI_1A = FQ1OASI01C) (FQ1ASI_2 = FQ1OASI02A)(FQ1ASI_2A = FQ1OASI02C)
	(FQ1ASI_3 = FQ1OASI03A) (FQ1ASI_3A = FQ1OASI03C) (FQ1ASI_4 = FQ1OASI04A) (FQ1ASI_4A = FQ1OASI04C) (FQ1ASI_5 = FQ1OASI05A) (FQ1ASI_5A = FQ1OASI05C)
	(FQ1ASI_6 = FQ1OASI06A) (FQ1ASI_6A = FQ1OASI06C) (FQ1ASI_7 = FQ1OASI07A) (FQ1ASI_7A = FQ1OASI07C) (FQ1ASI_8 = FQ1OASI08A)
	(FQ1ASI_8A = FQ1OASI08C) (FQ1ASI_9 = FQ1OASI09A) (FQ1ASI_9A = FQ1OASI09C) (FQ1ASI_10 = FQ1OASI10A) (FQ1ASI_10A = FQ1OASI10C)
	(FQ1ASI_11 = FQ1OASI11A) (FQ1ASI_11A = FQ1OASI11C) (FQ1ASI_12 = FQ1OASI12A) (FQ1ASI_12A = FQ1OASI12C) (FQ1ASI_13 = FQ1OASI13A)
	(FQ1ASI_13A = FQ1OASI13C).
EXECUTE.

*Remember to save your data file.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OASI_Cleaned.sav'.
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
/FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OASI_Cleaned.sav'
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
COMPUTE DATEDIFF = DATEDIFF(FD1ORD,FQ1OASIDATE,'days').
EXECUTE.
COUNT DATEDIFF0=DATEDIFF(Lowest thru -1) DATEDIFF(1 thru Highest).
EXECUTE.
FREQUENCIES VARIABLES=DATEDIFF0
  /ORDER=ANALYSIS.
SORT CASES BY DATEDIFF0(D).
*CHECK ALL IDS WITH DISCREPANT DATES TO DETERMINE WHAT IS CORRECT. CONSULT BEFORE MAKING ANY CHANGES TO RAW DATA IN REDCAP OR QUALTRICS.
*INCLUDE NOTES HERE FOR EACH ID THAT WAS DISCREPANT (EXAMPLE BELOW - ADAPT AS NEEDED)
*THE FOLLOWING IDs (90210, 90331, and 90800) HAVE A A1 QUALTRICS DATE [FQ1OASIDATE] THAT DOES NOT MATCH THEIR A1 VISIT DATE [FD1ORD]. 
*THIS WAS INVESTIGATED BY STAFF (BM: 10-29-21) AND VISIT DATE [FD1ORD] WAS CONFIRMED USING MULTIPLE SOURCES.
SORT CASES BY ID(A).
*DROPPING VARIABLES THAT ARE NO LONGER RELEVANT TO FINAL DATA FILE.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OASI_Cleaned.sav'
/DROP
FQ1OASIDATE
DATEDIFF
DATEDIFF0
f.
EXECUTE.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OASI_Cleaned.sav'.
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

** Coding Missingness for FQ1OASI01 and FQ1OASI13C. 
DO IF (value(FQ1OASI01A)) = 0. 
    RECODE FQ1OASI01C FQ1OASI02A FQ1OASI02C(SYSMIS = -44). 
    END IF.
DO IF (value(FQ1OASI01A)) = -10. 
    RECODE FQ1OASI01C FQ1OASI02A FQ1OASI02C(SYSMIS = -43). 
    END IF.

DO IF (value(FQ1OASI02A)) = 0. 
    RECODE FQ1OASI02C(SYSMIS = -44). 
    END IF.
DO IF (value(FQ1OASI02A)) = -10. 
    RECODE FQ1OASI02C(SYSMIS = -43). 
    END IF.

DO IF (value(FQ1OASI03A)) = 0. 
    RECODE FQ1OASI03C(SYSMIS = -44). 
    END IF.
DO IF (value(FQ1OASI03A)) = -10. 
    RECODE FQ1OASI03C(SYSMIS = -43). 
    END IF.

DO IF (value(FQ1OASI04A)) = 0. 
    RECODE FQ1OASI04C(SYSMIS = -44). 
    END IF.
DO IF (value(FQ1OASI04A)) = -10. 
    RECODE FQ1OASI04C(SYSMIS = -43). 
    END IF.

DO IF (value(FQ1OASI05A)) = 0. 
    RECODE FQ1OASI05C(SYSMIS = -44). 
    END IF.
DO IF (value(FQ1OASI05A)) = -10. 
    RECODE FQ1OASI05C(SYSMIS = -43). 
    END IF.

DO IF (value(FQ1OASI06A)) = 0. 
    RECODE FQ1OASI06C(SYSMIS = -44). 
    END IF.
DO IF (value(FQ1OASI06A)) = -10. 
    RECODE FQ1OASI06C(SYSMIS = -43). 
    END IF.

DO IF (value(FQ1OASI07A)) = 0. 
    RECODE FQ1OASI07C(SYSMIS = -44). 
    END IF.
DO IF (value(FQ1OASI07A)) = -10. 
    RECODE FQ1OASI07C(SYSMIS = -43). 
    END IF.

DO IF (value(FQ1OASI08A)) = 0. 
    RECODE FQ1OASI08C(SYSMIS = -44). 
    END IF.
DO IF (value(FQ1OASI08A)) = -10. 
    RECODE FQ1OASI08C(SYSMIS = -43). 
    END IF.

DO IF (value(FQ1OASI09A)) = 0. 
    RECODE FQ1OASI09C(SYSMIS = -44). 
    END IF.
DO IF (value(FQ1OASI09A)) = -10. 
    RECODE FQ1OASI09C(SYSMIS = -43). 
    END IF.

DO IF (value(FQ1OASI10A)) = 0. 
    RECODE FQ1OASI10C(SYSMIS = -44). 
    END IF.
DO IF (value(FQ1OASI10A)) = -10. 
    RECODE FQ1OASI10C(SYSMIS = -43). 
    END IF.

DO IF (value(FQ1OASI11A)) = 0. 
    RECODE FQ1OASI11C(SYSMIS = -44). 
    END IF.
DO IF (value(FQ1OASI11A)) = -10. 
    RECODE FQ1OASI11C(SYSMIS = -43). 
    END IF.

DO IF (value(FQ1OASI12A)) = 0. 
    RECODE FQ1OASI12C(SYSMIS = -44). 
    END IF.
DO IF (value(FQ1OASI12A)) = -10. 
    RECODE FQ1OASI12C(SYSMIS = -43). 
    END IF.

DO IF (value(FQ1OASI13A)) = 0. 
    RECODE FQ1OASI13C(SYSMIS = -44). 
    END IF.
DO IF (value(FQ1OASI13A)) = -10. 
    RECODE FQ1OASI13C(SYSMIS = -43). 
    END IF.

**STEP 7 (DELETE IF NOT NEEDED): CREATING NEW VARIABLES FOR REVERSED SCORED ITEMS.
**Reverse-Scored Items; see scoring document to determine if there are reverse-scored items. If no reverse-scored items, delete this syntax.
**CHECKED AND NOT NEEDED
    
*STEP 7A: RECODING SYSMIS (PARTICIPANTS THAT MISSED THE ASSESSMENT).
*This will use the STAT variable to recode all SYSMIS data. CHANGE THE STAT VARIABLE TO MATCH THE ASSESSMENT WAVE YOU ARE WORKING IN.
*Include full list of numeric variables (including new reverse-scored items).
DO IF MISSING(FD1OSTAT).
DO REPEAT x = FQ1OASI01A to FQ1OASI13C.
RECODE FD1OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.

*STEP 8: STANDARDIZING DECIMAL PLACES (CANNOT INCLUDE TEXT/STRING VARIABLES).
*Making all variables have the same number of decimal places. Ensure that variables include all new reverse-scored variables. Change the number AFTER the decimal place as needed.
FORMATS FQ1OASI01A to FQ1OASI13C (F8.0).
EXECUTE.

*STEP 9: CREATING VARIABLE LABLES.
*Label all variables. Use the original questionnaire to include the exact text that participants saw. Include the questionnaire name and number at the end of the label.
VARIABLE LABELS  ID 'Participant ID'.
EXECUTE.

VARIABLE LABELS 
FQ1OASI01A 'Have you ever used alcohol (e.g. Beer, Wine, Liquor)? [FQ1OASI01A]'
FQ1OASI01C 'Have you used alcohol in the past 30 days? [FQ1OASI01C]'
FQ1OASI02A 'Have you ever used alcohol to intoxication (3 or more drinks in one sitting, or 5 or more drinks in one day)? [FQ1OASI02A]'
FQ1OASI02C 'Have you used alcohol to intoxication (3 or more drinks in one sitting, or 5 or more drinks in one day) in the past 30 days? [FQ1OASI02C]'
FQ1OASI03A 'Have you ever used Heroin? [FQ1OASI03A]'
FQ1OASI03C 'Have you used Heroin in the past 30 days? [FQ1OASI03C]'
FQ1OASI04A 'Have you ever used Methadone?  [FQ1OASI04A]'
FQ1OASI04C 'Have you used Methadone in the past 30 days? [FQ1OASI04C]'
FQ1OASI05A 'Have you ever used other Opiates/Analgesics? [FQ1OASI05A]'
FQ1OASI05C 'Have you used other Opiates/Analgesics in the past 30 days? [FQ1OASI05C]'
FQ1OASI06A 'Have you ever used Barbiturates? [FQ1OASI06A]'
FQ1OASI06C 'Have you used Barbiturates in the past 30 days? [FQ1OASI06C]'
FQ1OASI07A 'Have you ever used Sedatives/Hypnotics/Tranquilizers? [FQ1OASI07A]'
FQ1OASI07C 'Have you used Sedatives/Hypnotics/Tranquilizers in the past 30 days? [FQ1OASI07C]'
FQ1OASI08A 'Have you ever used Cocaine (e.g. Cocaine Crystal, Free-Base Cocaine or Crack, "Rock Cocaine"? [FQ1OASI08A]'
FQ1OASI08C 'Have you used Cocaine in the past 30 days? [FQ1OASI08C]'
FQ1OASI09A 'Have you ever used Amphetamines? [FQ1OASI09A]'
FQ1OASI09C 'Have you used Amphetamines in the past 30 days? [FQ1OASI09C]'
FQ1OASI10A 'Have you ever used Cannabis (e.g. Marijuana, Hashish)? [FQ1OASI10A]'
FQ1OASI10C 'Have you used Cannabis in the past 30 days? [FQ1OASI10C]'
FQ1OASI11A 'Have you ever used Hallucinogens? [FQ1OASI11A]'
FQ1OASI11C 'Have you used Hallucinogens in the past 30 days? [FQ1OASI11C]'
FQ1OASI12A 'Have you ever used Inhalants? [FQ1OASI12A]'
FQ1OASI12C 'Have you used Inhalants in the past 30 days? [FQ1OASI12C]'
FQ1OASI13A 'Have you ever used more than one substance at a time? [FQ1OASI13A]'
FQ1OASI13C 'Have you used more than one substance at a time in the past 30 days? [FQ1OASI13C]'.
EXECUTE. 

*STEP 10: ADD VALUE LABELS.
*Include missing values like 'Prefer not to Answer' (or something similar) if applicable.
*Include ALL missing value labels (SEE ABOVE FOR FULL LIST).
VALUE LABELS
FQ1OASI01A FQ1OASI01C FQ1OASI02A FQ1OASI02C FQ1OASI03A FQ1OASI03C FQ1OASI04A FQ1OASI04C FQ1OASI05A FQ1OASI05C FQ1OASI06A FQ1OASI06C FQ1OASI07A FQ1OASI07C FQ1OASI08A FQ1OASI08C FQ1OASI09A FQ1OASI09C FQ1OASI10A FQ1OASI10C
FQ1OASI11A FQ1OASI11C FQ1OASI12A FQ1OASI12C FQ1OASI13A FQ1OASI13C
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
    FQ1OASI01A FQ1OASI01C FQ1OASI02A FQ1OASI02C FQ1OASI03A FQ1OASI03C FQ1OASI04A FQ1OASI04C FQ1OASI05A FQ1OASI05C FQ1OASI06A FQ1OASI06C FQ1OASI07A FQ1OASI07C FQ1OASI08A FQ1OASI08C FQ1OASI09A FQ1OASI09C FQ1OASI10A FQ1OASI10C
FQ1OASI11A FQ1OASI11C FQ1OASI12A FQ1OASI12C FQ1OASI13A FQ1OASI13C
    (LO THRU -1).
EXECUTE.

*STEP 12: SAVE CLEANED DATA FILE.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OASI_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.

*STEP 13: CHECK FREQUENCIES.
*Checking frequencies of all items before creating constructs.
*Include STAT variable here to be sure all missingness was coded correctly.
FREQUENCIES VARIABLES=FD1OSTAT FQ1OASI01A FQ1OASI01C FQ1OASI02A FQ1OASI02C FQ1OASI03A FQ1OASI03C FQ1OASI04A FQ1OASI04C FQ1OASI05A FQ1OASI05C FQ1OASI06A FQ1OASI06C FQ1OASI07A FQ1OASI07C FQ1OASI08A FQ1OASI08C FQ1OASI09A FQ1OASI09C FQ1OASI10A FQ1OASI10C
FQ1OASI11A FQ1OASI11C FQ1OASI12A FQ1OASI12C FQ1OASI13A FQ1OASI13C
  /ORDER=ANALYSIS.

*STEP 14: CHECK DESCRIPTIVES.
*Checking descriptives for all items before creating constructs.
DESCRIPTIVES VARIABLES=FQ1OASI01A FQ1OASI01C FQ1OASI02A FQ1OASI02C FQ1OASI03A FQ1OASI03C FQ1OASI04A FQ1OASI04C FQ1OASI05A FQ1OASI05C FQ1OASI06A FQ1OASI06C FQ1OASI07A FQ1OASI07C FQ1OASI08A FQ1OASI08C FQ1OASI09A FQ1OASI09C FQ1OASI10A FQ1OASI10C
FQ1OASI11A FQ1OASI11C FQ1OASI12A FQ1OASI12C FQ1OASI13A FQ1OASI13C
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 15: SAVE CLEANED DATA FILE.
*Sorting the data file by ID and resaving the final file.
*To reorder items, use /KEEP {list all variales in order} -- insert in line after file name.
SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OASI_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.

*STEP 16: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE
 OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OASI_Cleaned.spv'
 LOCK=NO.


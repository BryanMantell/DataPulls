* Encoding: UTF-8.
*STEP 0: NOTES
*TYPE QUESTIONNAIRE NAME HERE W/ ACROYNYM. 
*ASSESSMENT COMPLETION SUMMARIES (ACS).
 
*INCLUDE DATE(INITIALS): DESCRIPTION OF WHAT YOU DID. EVERY TIME THE SYNTAX IS EDITED, THERE SHOULD BE DETAILED NOTES ABOUT IT.
*10-11-21(BM): Completed STEPS 1 and 16. 
*12-02-21(BM): Edited STEPS 13 and 14 .
*1-19-22(BM): Updated the value label for -11 "Death" 
*1-25-22(BM): Added label for -41" 
*03-30-22(BM): Reran with updated data
*04-12-22(BM): Reran with updated data
*05-14-22(BM): Reran with updated data

*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------.
*STEP 1: OPENING RAW DATA.
*Insert the correct file path and file name. Use syntax to open raw data file.
GET
  FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\Raw\Assessment Completion Summary.sav'.

*STEP 2: SAVING QUESTIONNAIRE SPECIFIC RAW DATA. 
*Insert the correct file path and file name. Save this file with only those variables that you need, in the following order; ID, Start Date, Questionnaire Items (i.e., DERS_1 to DERS_36).
SAVE OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FD0OACS_Constructs.sav'
  /KEEP 
  fam_id 
  fv0otype to fv4aodate
  /COMPRESSED.
  EXECUTE.

*STEP 3: OPEN NEW DATA FILE.  
*Insert the correct file path and file name. Open the file you just created and saved so that you are able to clean the data.
GET
  FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FD0OACS_Constructs.sav'.

*STEP 4: TRANSFORM VARIABLES AND SORT IDS ASCENDING ORDER.
*Transforming ID from a string to a numeric variable, change the date format of startdate, and sort IDs in ascending order.
ALTER TYPE fam_id (F10.0).
EXECUTE.
FORMATS fv0orealdate (adate10) fv1otar (adate10) fv1orealdate (adate10) fv2otar (adate10) fv2orealdate (adate10) fv3otar (adate10) fv3orealdate (adate10) fv4otar (adate10) fv4orealdate (adate10) fv4aotar (adate10) fv4aorealdate (adate10).
EXECUTE.
SORT CASES BY fam_id(A).
EXECUTE.

*STEP 5: RENAME ‘RAW DATA’ VARIABLES TO ‘CLEANED’ VARIABLES NAMES. 
*Rename all variables so they reflect our naming scheme. ID should always be labeled as 'ID'. Item should be numbers 01-36 or 001-106. 
RENAME VARIABLE (fam_id=ID) (fv0otype=FD0OSTAT) (fv0orealdate=FD0ORD).
EXECUTE.
RENAME VARIABLE (fv1otype=FD1OSTAT) (fv1otar=FD1OTD) (fv1orealdate=FD1ORD) (fv1odiff=FD1ODIFF).
EXECUTE.
RENAME VARIABLE (fv2otype=FD2OSTAT) (fv2otar=FD2OTD) (fv2orealdate=FD2ORD) (fv2odiff=FD2ODIFF).
EXECUTE.
RENAME VARIABLE (fv3otype=FD3OSTAT) (fv3otar=FD3OTD) (fv3orealdate=FD3ORD) (fv3odiff=FD3ODIFF).
EXECUTE.
RENAME VARIABLE (fv4otype=FD4OSTAT) (fv4otar=FD4OTD) (fv4orealdate=FD4ORD) (fv4odiff=FD4ODIFF).
EXECUTE.
RENAME VARIABLE (fv4aotype=FD4AOSTAT) (fv4aotar=FD4AOTD) (fv4aorealdate=FD4AORD) (fv4aodiff=FD4AODIFF).
EXECUTE.


**STEP 6 (DELETE IF NOT NEEDED): RECODING VALUES (INCLUDING MISSING VALUES). 
**Check to be sure the variables are coded correctly (should appear as numbers). If they are not, recode all variables. If all is properly coded, delete this syntax.
**-99 'Missing'                                                                            /* (Unknown) */
**-97 'Missing due to COVID Shutdown'                                         /* (missed due to no in-person visits) */
**-88 'Not scorable'                                                                     /* (noisy data: movement, etc.) */
**-87 'Suspect data'                                                                     /* (out of range values: medical condition, medication use, invalid self-report packet, etc.) */
**-77 'Technical problem'                                                             /* (mindware crash, poor audio/visual quality, etc.) */
**-66 'Participant refusal'                                                              /* (no consent to videotape, left in middle of interaction/interview) */
**-65 'Participant failed to demonstrate comprehension'                  /* (participant did not comprehend task)
**-55 'Not able to complete'                                                          /* (PI decision) */
**-44 'Question skipped  '                                                             /* (correct skipped question: e.g. demographics, etc.) */
**-43 'Question skipped (participant refused root question)'            /* (participant refused root question: e.g., prefer not answer)*/
**-41 'Instrument not part of the protocol'                                      /* (instrument added later, not in this version) */
**-33 'Staff Error'                                                                         /* (question incorrectly skipped by staff, PANAS/EMA not administered, etc.) */
**-22 'Not applicable (Staff/Clinician)'                                            /* (KSADS, behavior codes) */
**-21 'Not applicable (Participant)'                                                /* (Questionnaires - participant decided) */
**-16 'Participant search exhausted'                                              /* (Participant search exhausted - PI decision */     
**-12 'Pariticipant refused follow-up'                                             /* (Participant refused follow-up) */     
**-11 'Participant (child) deceased'                                                /* (Participant (child) deceased) */
**-10 'Prefer not to answer'                                                           /* (Participant selected prefer not to answer) */.

* Recoding A1.
DO IF (value(FD1OSTAT)) = 0 AND value(fv1odate) =-99. 
    RECODE FD1OSTAT(0 = -99). 
    END IF.

DO IF (value(FD1OSTAT)) = 0 AND (value(fv1odate)) =-97. 
    RECODE FD1OSTAT (0 = -97). 
    END IF.

DO IF (value(FD1OSTAT)) = 0 AND value(fv1odate) =-96. 
    RECODE FD1OSTAT(0 = -96). 
    END IF.

DO IF (value(FD1OSTAT)) = 0 AND value(fv1odate) =-95. 
    RECODE FD1OSTAT(0 = -95). 
    END IF.

DO IF (value(FD1OSTAT)) = 0 AND value(fv1odate) =-56. 
    RECODE FD1OSTAT(0 = -56). 
    END IF.

DO IF (value(FD1OSTAT)) = 0 AND value(fv1odate) =-55. 
    RECODE FD1OSTAT(0 = -55). 
    END IF.

DO IF (value(FD1OSTAT)) = 0 AND value(fv1odate) =-16. 
    RECODE FD1OSTAT(0 = -16). 
    END IF.

DO IF (value(FD1OSTAT)) = 0 AND value(fv1odate) =-14. 
    RECODE FD1OSTAT(0 = -14). 
    END IF.

DO IF (value(FD1OSTAT)) = 0 AND value(fv1odate) =-12. 
    RECODE FD1OSTAT(0 = -12). 
    END IF.

DO IF (value(FD1OSTAT)) = 0 AND value(fv1odate) =-11. 
    RECODE FD1OSTAT(0 = -11). 
    END IF.

* Recoding A2.
DO IF (value(FD2OSTAT)) = 0 AND value(fv2odate) =-99. 
    RECODE FD2OSTAT(0 = -99). 
    END IF.

DO IF (value(FD2OSTAT)) = 0 AND (value(fv2odate)) =-97. 
    RECODE FD2OSTAT (0 = -97). 
    END IF.

DO IF (value(FD2OSTAT)) = 0 AND value(fv2odate) =-96. 
    RECODE FD2OSTAT(0 = -96). 
    END IF.

DO IF (value(FD2OSTAT)) = 0 AND value(fv2odate) =-95. 
    RECODE FD2OSTAT(0 = -95). 
    END IF.

DO IF (value(FD2OSTAT)) = 0 AND value(fv2odate) =-56. 
    RECODE FD2OSTAT(0 = -56). 
    END IF.

DO IF (value(FD2OSTAT)) = 0 AND value(fv2odate) =-55. 
    RECODE FD2OSTAT(0 = -55). 
    END IF.

DO IF (value(FD2OSTAT)) = 0 AND value(fv2odate) =-16. 
    RECODE FD2OSTAT(0 = -16). 
    END IF.

DO IF (value(FD2OSTAT)) = 0 AND value(fv2odate) =-14. 
    RECODE FD2OSTAT(0 = -14). 
    END IF.

DO IF (value(FD2OSTAT)) = 0 AND value(fv2odate) =-12. 
    RECODE FD2OSTAT(0 = -12). 
    END IF.

DO IF (value(FD2OSTAT)) = 0 AND value(fv2odate) =-11. 
    RECODE FD2OSTAT(0 = -11). 
    END IF.

* Recoding A3.
DO IF (value(FD3OSTAT)) = 0 AND value(fv3odate) =-99. 
    RECODE FD3OSTAT(0 = -99). 
    END IF.

DO IF (value(FD3OSTAT)) = 0 AND (value(fv3odate)) =-97. 
    RECODE FD3OSTAT (0 = -97). 
    END IF.

DO IF (value(FD3OSTAT)) = 0 AND value(fv3odate) =-96. 
    RECODE FD3OSTAT(0 = -96). 
    END IF.

DO IF (value(FD3OSTAT)) = 0 AND value(fv3odate) =-95. 
    RECODE FD3OSTAT(0 = -95). 
    END IF.

DO IF (value(FD3OSTAT)) = 0 AND value(fv3odate) =-56. 
    RECODE FD3OSTAT(0 = -56). 
    END IF.

DO IF (value(FD3OSTAT)) = 0 AND value(fv3odate) =-55. 
    RECODE FD3OSTAT(0 = -55). 
    END IF.

DO IF (value(FD3OSTAT)) = 0 AND value(fv3odate) =-16. 
    RECODE FD3OSTAT(0 = -16). 
    END IF.

DO IF (value(FD3OSTAT)) = 0 AND value(fv3odate) =-14. 
    RECODE FD3OSTAT(0 = -14). 
    END IF.

DO IF (value(FD3OSTAT)) = 0 AND value(fv3odate) =-12. 
    RECODE FD3OSTAT(0 = -12). 
    END IF.

DO IF (value(FD3OSTAT)) = 0 AND value(fv3odate) =-11. 
    RECODE FD3OSTAT(0 = -11). 
    END IF.

* Recoding A4.
DO IF (value(FD4OSTAT)) = 0 AND value(fv4odate) =-99. 
    RECODE FD4OSTAT(0 = -99). 
    END IF.

DO IF (value(FD4OSTAT)) = 0 AND (value(fv4odate)) =-97. 
    RECODE FD4OSTAT (0 = -97). 
    END IF.

DO IF (value(FD4OSTAT)) = 0 AND value(fv4odate) =-96. 
    RECODE FD4OSTAT(0 = -96). 
    END IF.

DO IF (value(FD4OSTAT)) = 0 AND value(fv4odate) =-95. 
    RECODE FD4OSTAT(0 = -95). 
    END IF.

DO IF (value(FD4OSTAT)) = 0 AND value(fv4odate) =-56. 
    RECODE FD4OSTAT(0 = -56). 
    END IF.

DO IF (value(FD4OSTAT)) = 0 AND value(fv4odate) =-55. 
    RECODE FD4OSTAT(0 = -55). 
    END IF.

DO IF (value(FD4OSTAT)) = 0 AND value(fv4odate) =-16. 
    RECODE FD4OSTAT(0 = -16). 
    END IF.

DO IF (value(FD4OSTAT)) = 0 AND value(fv4odate) =-14. 
    RECODE FD4OSTAT(0 = -14). 
    END IF.

DO IF (value(FD4OSTAT)) = 0 AND value(fv4odate) =-12. 
    RECODE FD4OSTAT(0 = -12). 
    END IF.

DO IF (value(FD4OSTAT)) = 0 AND value(fv4odate) =-11. 
    RECODE FD4OSTAT(0 = -11). 
    END IF.

* Recoding A4a.
DO IF (value(FD4AOSTAT)) = 0 AND value(fv4aodate) =-99. 
    RECODE FD4AOSTAT(0 = -99). 
    END IF.

DO IF (value(FD4AOSTAT)) = 0 AND (value(fv4aodate)) =-97. 
    RECODE FD4AOSTAT (0 = -97). 
    END IF.

DO IF (value(FD4AOSTAT)) = 0 AND value(fv4aodate) =-96. 
    RECODE FD4AOSTAT(0 = -96). 
    END IF.

DO IF (value(FD4AOSTAT)) = 0 AND value(fv4aodate) =-95. 
    RECODE FD4AOSTAT(0 = -95). 
    END IF.

DO IF (value(FD4AOSTAT)) = 0 AND value(fv4aodate) =-56. 
    RECODE FD4AOSTAT(0 = -56). 
    END IF.

DO IF (value(FD4AOSTAT)) = 0 AND value(fv4aodate) =-55. 
    RECODE FD4AOSTAT(0 = -55). 
    END IF.

DO IF (value(FD4AOSTAT)) = 0 AND value(fv4aodate) =-16. 
    RECODE FD4AOSTAT(0 = -16). 
    END IF.

DO IF (value(FD4AOSTAT)) = 0 AND value(fv4aodate) =-14. 
    RECODE FD4AOSTAT(0 = -14). 
    END IF.

DO IF (value(FD4AOSTAT)) = 0 AND value(fv4aodate) =-12. 
    RECODE FD4AOSTAT(0 = -12). 
    END IF.

DO IF (value(FD4AOSTAT)) = 0 AND value(fv4aodate) =-11. 
    RECODE FD4AOSTAT(0 = -11). 
    END IF.

**STEP 7 (DELETE IF NOT NEEDED): CREATING NEW VARIABLES FOR REVERSED SCORED ITEMS.
**Reverse-Scored Items; see scoring document to determine if there are reverse-scored items. If no reverse-scored items, delete this syntax.


*STEP 8: STANDARDIZING DECIMAL PLACES (CANNOT INCLUDE TEXT/STRING VARIABLES).
*Making all variables have the same number of decimal places. Ensure that variables include all new reverse-scored variables. Change the number AFTER the decimal place as needed.
FORMATS 
FD0OSTAT (F8.0)
FD1OSTAT (F8.0)
FD2OSTAT (F8.0)
FD3OSTAT (F8.0)
FD4OSTAT (F8.0)
FD4AOSTAT (F8.0)
FD1ODIFF (F8.0)
FD2ODIFF (F8.0)
FD3ODIFF (F8.0)
FD4ODIFF (F8.0)
FD4AODIFF (F8.0).
EXECUTE.

*STEP 9: CREATING VARIABLE LABLES.
*Label all variables. Use the original questionnaire to include the exact text that participants saw. Include the questionnaire name and number at the end of the label.
VARIABLE LABELS  
ID 'Participant ID'
FD0OSTAT 'Clinical Intake Status [FD0OSTAT]'
FD0ORD 'Clinical Intake Date [FD0ORD]'
FD1OSTAT 'A1 Status [FD1OSTAT]'
FD1OTD 'A1 Target Date [FD1OTD]'
FD1ORD 'A1 Date [FD1ORD]'
FD1ODIFF 'Target Date - A1 Date (Target Window -/+ 14 days) [FD1ODIFF]'
FD2OSTAT 'A2 Status [FD2OSTAT]'
FD2OTD 'A2 Target Date [FD2OTD]'
FD2ORD 'A2 Date [FD2ORD]'
FD2ODIFF 'Target Date - A2 Date (Target Window -/+ 14 days) [FD2ODIFF]'
FD3OSTAT 'A3 Status [FD3OSTAT]'
FD3OTD 'A3 Target Date [FD3OTD]'
FD3ORD 'A3 Date [FD3ORD]'
FD3ODIFF ' Target Date - A3 Date(Target Window -/+ 14 days) [FD3ODIFF]'
FD4OSTAT 'A4 Status [FD4OSTAT]'
FD4OTD 'A4 Target Date [FD4OTD]'
FD4ORD 'A4 Date [FD4ORD]'
FD4ODIFF 'Target Date - A4 Date(Target Window -/+ 14 days) [FD4ODIFF]'
FD4AOSTAT 'A4 Interview Status [FD4AOSTAT]'
FD4AOTD 'A4 INT Target Date [FD4AOTD]'
FD4AORD 'A4 INT Date [FD4AORD]'
FD4AODIFF 'Target Date - Assessment 4 INT Date(Target Window -/+ 14 days) [FD4AODIFF]'.
EXECUTE. 

*STEP 10: ADD VALUE LABELS.
*Include missing values like 'Prefer not to Answer' (or something similar) if applicable.
VALUE LABELS
FD1OSTAT FD2OSTAT FD3OSTAT FD4OSTAT FD4AOSTAT
1 'Completed (full assessment)'
2 'Completed (partial assessment due to COVID)'
0 'Not Completed'
-99 'Unknown (-99)'
-97 'Missing due to COVID shutdown (-97)'
-96 'Child Abuse (perpetrator) (-96)'
-95 'Higher Level of Care Required (-95)'
-56 'Consent Withdrawn (-56)'
-55 'PI Withdrawal (-55)'
-54 'Deemed ineligible (-54)'
-16 'Participant search exhausted (-16)'
-14 'Participant repeated cancellations/delays (-14)'
-12 'Participant refused follow-up (-12)'
-11 'Participant (parent or child) deceased (-11)'  
-41 'Instrument not part of the protocol (-41)'.
EXECUTE.

**STEP 11 (DELETE IF NOT NEEDED): LABELING MISSING VALUES AS MISSING.
**Recoding all negative numbers as missing. If no missing values, delete this syntax.
MISSING VALUES
    FD1OSTAT FD2OSTAT FD3OSTAT FD4OSTAT FD4AOSTAT
    (LO THRU -1).
EXECUTE.

*STEP 12: SAVE CLEANED DATA FILE.
SAVE OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FD0OACS_Constructs.sav'
  /COMPRESSED.
  EXECUTE.

*STEP 13: CHECK FREQUENCIES.
*Checking frequencies of all items before creating constructs.
FREQUENCIES VARIABLES= FD0OSTAT FD1OSTAT FD2OSTAT FD3OSTAT FD4OSTAT FD4AOSTAT 
  /ORDER=ANALYSIS.


*STEP 14: CHECK DESCRIPTIVES.
*Checking descriptives for all items before creating constructs.
DESCRIPTIVES VARIABLES= FD0OSTAT FD1OSTAT FD2OSTAT FD3OSTAT FD4OSTAT FD4AOSTAT
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 15: SAVE CLEANED DATA FILE.
*Sorting the data file by ID and resaving the final file.
*To reorder items, use /KEEP {list all variales in order} -- insert in line after file name.
*Remove fv1odate fv2odate fv3odate fv4odate fv4aodate.
SORT CASES BY ID(A).
SAVE OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FD0OACS_Constructs.sav'
  /KEEP 
  ID to FD1ODIFF 
  FD2OSTAT to FD2ODIFF
  FD3OSTAT to FD3ODIFF
  FD4OSTAT to FD4ODIFF
  FD4AOSTAT to FD4AODIFF
  /COMPRESSED.
  EXECUTE.

*STEP 16: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE
 OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FD0OACS_Constructs.spv'
 LOCK=NO.

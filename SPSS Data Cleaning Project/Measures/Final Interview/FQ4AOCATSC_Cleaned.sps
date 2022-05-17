* Encoding: UTF-8.
*STEP 0: NOTES
*DEMOGRAPHICS.
 
*05-15-22(BM): Adapted syntax.
*05-16-22(BM) Fixed recoding
*------------------------------------------------------------------------------.
*STEP 1: OPENING CLEANED DATA FILES AND RENAMING ALL VARIABLES FROM 'P' OR 'O' TO 'B'.
*Insert the correct file paths and file names. Use syntax to open cleaned data files.

GET
  FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ4AOCATS_Cleaned.sav'.
SELECT IF NOT(ID = 90238 OR ID = 90449 OR ID = 90671 OR ID = 90687 OR ID = 90724 OR
ID = 90754 OR ID = 90975 OR ID = 91040 OR ID = 91292 OR ID = 91759 OR ID = 90234 OR
ID = 90443 OR ID = 90800 OR ID = 90830 OR ID = 90841 OR ID = 90933 OR ID = 90945 OR
ID = 90996 OR ID = 90999 OR ID = 91123 OR ID = 91469 OR ID = 91637 OR ID = 91768 OR
ID = 90104 OR ID = 90861 OR ID = 90102 OR ID = 90210 OR ID = 90230 OR ID = 90417 OR
ID = 90564 OR ID = 90739 OR ID = 91165).
EXECUTE.
SAVE OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ4AOCATS_Cleaned.sav'
   /KEEP ID TO FQ4AOCATS18E
  /COMPRESSED.
  EXECUTE.

GET
  FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ4AOCATS2_Cleaned.sav'.
SELECT IF(ID = 90238 OR ID = 90449 OR ID = 90671 OR ID = 90687 OR ID = 90724 OR
ID = 90754 OR ID = 90975 OR ID = 91040 OR ID = 91292 OR ID = 91759 OR ID = 90234 OR
ID = 90443 OR ID = 90800 OR ID = 90830 OR ID = 90841 OR ID = 90933 OR ID = 90945 OR
ID = 90996 OR ID = 90999 OR ID = 91123 OR ID = 91469 OR ID = 91637 OR ID = 91768 OR
ID = 90104 OR ID = 90861 OR ID = 90102 OR ID = 90210 OR ID = 90230 OR ID = 90417 OR
ID = 90564 OR ID = 90739 OR ID = 91165).
EXECUTE.
SAVE OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ4AOCATS2_Cleaned.sav'
   /KEEP ID TO FQ4AOCATS18E 
  /COMPRESSED.
EXECUTE.

MATCH FILES
/FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ4AOCATS_Cleaned.sav'
/FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ4AOCATS2_Cleaned.sav'
/BY ID.
EXECUTE.

*STEP 2: SAVING CLEANED DATA AS A CLEANED FILE AND OPENING IT. 
*Insert the correct file path and file name. Include ID, FD1PSTAT, FD1OSTAT, and questionnaire 'B' items in order.
SAVE OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ4AOCATSC_Cleaned.sav'
  /KEEP ID TO FQ4AOCATS18E 
  /COMPRESSED.
EXECUTE.

GET FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ4AOCATSC_Cleaned.sav'.
EXECUTE.

*STEP 3: DESCRIPTIVE STATISTICS (1. FREQ AND 2. CORR) FOR RAW VARIABLES (TOTAL SCORE 1ST, THEN SUBSCALES).
*When running this step note any additional missingness (any other codes) that are not accounted for in the STAT variable. These missing codes (and corresponding IDs) will need to be 
incorporated in STEP 8 below.
FREQ VARS=FD4AOSTAT TO FQ4AOCATS18E.

*STEP 4: RECODING MISSING VALUES.
**CHECKED AND NOT NEEDED

*STEP 5: RELIABILITY STATISTICS (TOTAL SCORE 1st, FOLLOWED BY SUBSCALES).
**CHECKED AND NOT NEEDED

*STEP 6: COUNTING MISSING DATA (TOTAL SCORE 1st, FOLLOWED BY SUBSCALES), THEN RECODING TO 0 TO AVOID NEGATIVE EFFECTS ON CONSTRUCTS.
**CHECKED AND NOT NEEDED.

*STEP 7: CREATE TOTAL AND SUBSCALES SCORES  (CHECK THAT REVERSE-SCORED ITEMS INCLUDED).
*Note each subscale name and calculate missingness allowed.
**CHECKED AND NOT NEEDED.

*STEP 8: RECODING -9999 VALUES TO MISSING VALUES USING THE STAT VARIABLE & LABELING VALUES AS MISSING.
**All missingness should be checked and labeled correctly here. 
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
**-43 'Question skipped (participant refused question(s))'             /* (participant refused question(s): e.g., prefer not answer)*/
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
**CHECKED AND NOT NEEDED.

COMPUTE CATS = 1.
EXECUTE.
IF (ID = 90238 OR ID = 90449 OR ID = 90671 OR ID = 90687 OR ID = 90724 OR
ID = 90754 OR ID = 90975 OR ID = 91040 OR ID = 91292 OR ID = 91759 OR ID = 90234 OR
ID = 90443 OR ID = 90800 OR ID = 90830 OR ID = 90841 OR ID = 90933 OR ID = 90945 OR
ID = 90996 OR ID = 90999 OR ID = 91123 OR ID = 91469 OR ID = 91637 OR ID = 91768 OR
ID = 90104 OR ID = 90861 OR ID = 90102 OR ID = 90210 OR ID = 90230 OR ID = 90417 OR
ID = 90564 OR ID = 90739 OR ID = 91165) CATS = 2.
EXECUTE.

*STEP 9: LABELING CONSTRUCTS.
VARIABLE LABELS
CATS 'Version of CATS Given (1 or 2)'.
EXECUTE.

*STEP 9A: ADD VALUE LABELS.
*Include ALL missing value labels (SEE STEP 8 FOR FULL LIST). 
*Be sure to also include value labels for any constructs that need labels (e.g., 0 'No', 1 'Yes'). Summed or averaged scores do NOT need value labels.
VALUE LABELS
CATS
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
-43 'Question skipped (participant refused question(s)) (-43)'     
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
1 'CATS Version 1'
2 'CATS Version 2'.
EXECUTE.  

*STEP 10: CHECK FREQUENCIES.
*Checking frequencies of all constructs.
FREQUENCIES VARIABLES=FD4AOSTAT FQ4AOCATS01 TO FQ4AOCATS18E
  /ORDER=ANALYSIS.

*STEP 11: CHECK DESCRIPTIVES.
*Checking descriptives for all constructs.
DESCRIPTIVES VARIABLES= FD4AOSTAT FQ4AOCATS01 TO FQ4AOCATS18E
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 12: SAVE CLEANED DATA FILE.
*First, sorting the data file by ID and resaving the final file.
*Using /KEEP command to keep ONLY ID + RD + the constructs that were created.
SORT CASES BY ID(A).
SAVE OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ4AOCATSC_Cleaned.sav'
  /KEEP ID TO CATS
   /COMPRESSED.

GET
  FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ4AOCATSC_Cleaned.sav'.
EXECUTE.

*STEP 13: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE 
 OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ4AOCATSC_Cleaned.spv'
LOCK=NO.

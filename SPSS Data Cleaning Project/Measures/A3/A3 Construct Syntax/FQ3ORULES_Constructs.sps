﻿* Encoding: UTF-8.
*STEP 0: NOTES.
*RESPONSES TO UNCERTAINTY AND LOW ENVIORMENTAL STRUCTURE (RULES).
*CREATED THE FOLLOWING SUBSCALES & RAN APLHAS; LIST SUBSCALES BELOW (EXAMPLE BELOW).
*Total score (TOT).

*4-19-22(BM): Adapted syntax for A3.
*04-21-22(AAC): Checked.
*04-25-22(BM): Fixed -9999s.
*04-27-22(BM): Fixed last -9999s.
*------------------------------------------------------------------------------.
*STEP 1: OPENING CLEANED DATA.
*Insert the correct file path and file name. Use syntax to open cleaned data file.
GET
  FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ3ORULES_Cleaned.sav'.

*STEP 2: SAVING CLEANED DATA AS A CONSTRUCT FILE. 
*Insert the correct file path and file name.
SAVE OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ3ORULES_Constructs.sav'
  /COMPRESSED.

*STEP 3: DESCRIPTIVE STATISTICS (1. FREQ AND 2. CORR) FOR RAW VARIABLES (TOTAL SCORE 1ST, THEN SUBSCALES).
*When running this step note any additional missingness (any other codes) that are not accounted for in the STAT variable. These missing codes (and corresponding IDs) will need to be 
incorporated in STEP 8 below.
FREQ VARS=FQ3ORULES01, FQ3ORULES02, FQ3ORULES03, FQ3ORULES04, FQ3ORULES05, FQ3ORULES06, FQ3ORULES07, FQ3ORULES08, FQ3ORULES09, 
    FQ3ORULES10, FQ3ORULES11, FQ3ORULES12, FQ3ORULES13, FQ3ORULES14, FQ3ORULES15, FQ3ORULES16, FQ3ORULES17.
*RULES Total Score.
CORR VARS=FQ3ORULES01, FQ3ORULES02, FQ3ORULES03, FQ3ORULES05, FQ3ORULES06, FQ3ORULES07, FQ3ORULES08, FQ3ORULES09, 
    FQ3ORULES10, FQ3ORULES11, FQ3ORULES12, FQ3ORULES13, FQ3ORULES14, FQ3ORULES15, FQ3ORULES16, FQ3ORULES17.

*STEP 4: RECODING MISSING VALUES.
RECODE FQ3ORULES01 TO FQ3ORULES17 (MISSING=-9999).
EXECUTE.
    
*STEP 5: RELIABILITY STATISTICS (TOTAL SCORE 1st, FOLLOWED BY SUBSCALES).
*RULES Total Score (16 items; n=35; alpha=.871).
REL VARS=FQ3ORULES01 FQ3ORULES02 FQ3ORULES03 FQ3ORULES04 FQ3ORULES05 FQ3ORULES06 FQ3ORULES07 FQ3ORULES08 FQ3ORULES09 
    FQ3ORULES10 FQ3ORULES11 FQ3ORULES12 FQ3ORULES14 FQ3ORULES15 FQ3ORULES16 FQ3ORULES17
/SCALE(All)= ALL.

*STEP 6: COUNTING MISSING DATA (JUST SUBSCALES), THEN RECODING TO 0 TO AVOID NEGATIVE EFFECTS ON CONSTRUCTS.
*RULES TOTAL (TOT).
COUNT MISSTOT=FQ3ORULES01 FQ3ORULES02 FQ3ORULES03 FQ3ORULES05 FQ3ORULES06 FQ3ORULES07 FQ3ORULES08 FQ3ORULES09 
    FQ3ORULES10 FQ3ORULES11 FQ3ORULES12 FQ3ORULES13 FQ3ORULES14 FQ3ORULES15 FQ3ORULES16 FQ3ORULES17 (-9999).

RECODE FQ3ORULES01 TO FQ3ORULES17 (-9999=0).
EXECUTE.

*STEP 7: CREATE TOTAL AND SUBSCALES SCORES  (CHECK THAT REVERSE-SCORED ITEMS INCLUDED).
*Note each subscale name and calculate missingness allowed.
*CREATING TOTAL SCORE.
*Total Score (17 items) -- USE MISSINGNESS FOR EACH SUBSCALE as a cut-off point.
COMPUTE FQ3ORULESTOT=-9999.
EXECUTE.
IF (MISSTOT < 5.71) FQ3ORULESTOT=RND(((FQ3ORULES01 + FQ3ORULES02 + FQ3ORULES03 + FQ3ORULES04 + FQ3ORULES05 + FQ3ORULES06 + FQ3ORULES07 + FQ3ORULES08 + FQ3ORULES09 + 
    FQ3ORULES10 + FQ3ORULES11 + FQ3ORULES12 + FQ3ORULES13 + FQ3ORULES14 + FQ3ORULES15 + FQ3ORULES16 + FQ3ORULES17)/(17-MISSTOT))*17).
EXECUTE.

*STEP 8: RECODING -9999 VALUES TO MISSING VALUES USING THE STAT VARIABLE & LABELING VALUES AS MISSING.
**All missingness should be checked and labeled correctly here (EXAMPLE BELOW). 
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
DO IF MISSING(FD3OSTAT).
DO REPEAT x = FQ3ORULESTOT.
RECODE FD3OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.
*Checking frequenices for constructs to look at missingness. 
FREQUENCIES VARIABLES=FD3OSTAT FQ3ORULESTOT
  /ORDER=ANALYSIS.
*If there IS missingness that was not accounted for in the STAT variable (for example in DERSAC, participants who indicated they did not have an additional caregiver should be coded as -44
Each construct needs to be coded by ID here. If there IS NO additional missingess not accounted for, delete only this section of syntax and write **CHECKED AND NOT NEEDED.

*At this point, the only remaining missingness should represent when participant did not answer a sufficient number of questions, assuming STAT variable was correctly coded for this measure -- CHECK THIS! 
*The following syntax will recode this remaining missingness for each new construct.
IF(ID=90687 OR ID=91637 OR ID=90999 OR ID=91123 OR ID=90754 OR ID=90975 OR
ID=91759 OR ID=90443 OR ID=90449 OR ID=90230 OR ID=90238 OR ID=90830 OR
ID=90210 OR ID=90102 OR ID=90234 OR ID=90841 OR ID=90564 OR ID=90861 OR
ID=90739 OR ID=91768 OR ID=90996 OR ID=90945 OR ID=91469 OR ID=91165 OR
ID=90671 OR ID=90800 OR ID=90724 OR ID=90169 OR ID=90104 OR ID = 91069) FQ3ORULESTOT=-41.
EXECUTE.

MISSING VALUES
   FQ3ORULESTOT
    (LO THRU -1).
EXECUTE.

*STEP 9: LABELING CONSTRUCTS.
VARIABLE LABELS
FQ3ORULESTOT 'RULES Total Score [FQ3ORULESTOT]'.
EXECUTE.

*STEP 9A: ADD VALUE LABELS.
*Include ALL missing value labels (SEE STEP 8 FOR FULL LIST). 
*Be sure to also include value labels for any constructs that need labels (e.g., 0 'No', 1 'Yes'). Summed or averaged scores do NOT need value labels.
VALUE LABELS
 FQ3ORULESTOT
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
-10 'Prefer not to Answer (-10)'.
EXECUTE. 

*STEP 10: CHECK FREQUENCIES.
*Checking frequencies of all constructs.
FREQUENCIES VARIABLES=FD3OSTAT FQ3ORULESTOT 
      /ORDER=ANALYSIS.

*STEP 11: CHECK DESCRIPTIVES.
*Checking descriptives for all constructs.
DESCRIPTIVES VARIABLES=FQ3ORULESTOT
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 12: SAVE CLEANED DATA FILE.
*First, sorting the data file by ID and resaving the final file.
*Using /KEEP command to keep ONLY ID + RD + the constructs that were created. 
SORT CASES BY ID(A).
SAVE OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ3ORULES_Constructs.sav'
  /KEEP ID FD3ORD FQ3ORULESTOT 
  /COMPRESSED.
GET
  FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ3ORULES_Constructs.sav'.
EXECUTE.

*STEP 13: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE 
 OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ3ORULES_Constructs.spv'
LOCK=NO.


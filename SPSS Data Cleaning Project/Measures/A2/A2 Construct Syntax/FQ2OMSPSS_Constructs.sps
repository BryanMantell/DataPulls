﻿* Encoding: UTF-8.
*STEP 0: NOTES.
*MULTIDIMENSIONAL SCALE OF PERCEIVED SOCIAL SUPPORT (MSPSS).
*CREATED THE FOLLOWING SUBSCALES & RAN APLHAS; LIST SUBSCALES BELOW.
*Total score (TOT).
*Significant other (SO).
*Family (FAM).
*Friends (FRI).
 
*03-08-22(BM): Adapted syntax for A2.
*03-09-22(AAC): Checked. Added alphas to syntax. 

*--------------------------------------------------------------------------------------------------------------------------------.
*STEP 1: OPENING CLEANED DATA.
*Insert the correct file path and file name. Use syntax to open cleaned data file.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OMSPSS_Cleaned.sav'.

*STEP 2: SAVING CLEANED DATA AS A CONSTRUCT FILE. 
*Insert the correct file path and file name.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OMSPSS_Constructs.sav'
  /COMPRESSED.

*STEP 3: DESCRIPTIVE STATISTICS (1. FREQ AND 2. CORR) FOR RAW VARIABLES (TOTAL SCORE 1ST, THEN SUBSCALES).
*When running this step note any additional missingness (any other codes) that are not accounted for in the STAT variable. These missing codes (and corresponding IDs) will need to be 
incorporated in STEP 8 below.
FREQ VARS=FQ2OMSPSS01, FQ2OMSPSS02, FQ2OMSPSS03, FQ2OMSPSS04, FQ2OMSPSS05, FQ2OMSPSS06, FQ2OMSPSS07, FQ2OMSPSS08, FQ2OMSPSS09, 
    FQ2OMSPSS10, FQ2OMSPSS11, FQ2OMSPSS12.
*MSPSS Total Score (TOT).
CORR VARS=FQ2OMSPSS01, FQ2OMSPSS02, FQ2OMSPSS03, FQ2OMSPSS04, FQ2OMSPSS05, FQ2OMSPSS06, FQ2OMSPSS07, FQ2OMSPSS08, FQ2OMSPSS09, 
    FQ2OMSPSS10, FQ2OMSPSS11, FQ2OMSPSS12.
*Significant other (SO).
CORR VARS=FQ2OMSPSS01, FQ2OMSPSS02, FQ2OMSPSS05, FQ2OMSPSS10.
*Family (FAM).
CORR VARS=FQ2OMSPSS03, FQ2OMSPSS04, FQ2OMSPSS08, FQ2OMSPSS11.
*Friends (FRI).
CORR VARS=FQ2OMSPSS06, FQ2OMSPSS07, FQ2OMSPSS09, FQ2OMSPSS12.
 
*STEP 4: RECODING MISSING VALUES.
RECODE FQ2OMSPSS01 TO FQ2OMSPSS12 (MISSING=-9999).
EXECUTE.

*STEP 5: RELIABILITY STATISTICS (TOTAL SCORE 1st, FOLLOWED BY SUBSCALES).
*MSPSS Total Score (TOT) (12 items; n=63; alpha=.958).
REL VARS=FQ2OMSPSS01, FQ2OMSPSS02, FQ2OMSPSS03, FQ2OMSPSS04, FQ2OMSPSS05, FQ2OMSPSS06, FQ2OMSPSS07, FQ2OMSPSS08, FQ2OMSPSS09, 
    FQ2OMSPSS10, FQ2OMSPSS11, FQ2OMSPSS12
/SCALE(All)= ALL.
*Significant other (SO) (4 items; n=63; alpha=.955).
REL VARS=FQ2OMSPSS01, FQ2OMSPSS02, FQ2OMSPSS05, FQ2OMSPSS10
/SCALE(All)= ALL.
*Family (FAM) (4 items; n=63; alpha=.969).
REL VARS=FQ2OMSPSS03, FQ2OMSPSS04, FQ2OMSPSS08, FQ2OMSPSS11
/SCALE(All)= ALL.
*Friends (FRI) (4 items; n=63; alpha=.953).
REL VARS=FQ2OMSPSS06, FQ2OMSPSS07, FQ2OMSPSS09, FQ2OMSPSS12
/SCALE(All)= ALL.

*STEP 6: COUNTING MISSING DATA (JUST SUBSCALES), THEN RECODING TO 0 TO AVOID NEGATIVE EFFECTS ON CONSTRUCTS.
*Significant other (SO).
COUNT MISSSO=FQ2OMSPSS01, FQ2OMSPSS02, FQ2OMSPSS05, FQ2OMSPSS10 (-9999).
*Family (FAM).
COUNT MISSFAM=FQ2OMSPSS03, FQ2OMSPSS04, FQ2OMSPSS08, FQ2OMSPSS11 (-9999).
*Friends (FRI).
COUNT MISSFRI=FQ2OMSPSS06, FQ2OMSPSS07, FQ2OMSPSS09, FQ2OMSPSS12 (-9999).

RECODE FQ2OMSPSS01 TO FQ2OMSPSS12 (-9999=0).
EXECUTE.

*STEP 7: CREATE TOTAL AND SUBSCALES SCORES  (CHECK THAT REVERSE-SCORED ITEMS INCLUDED).
*Note each subscale name and calculate missingness allowed.
*CREATING TOTAL SCORE.
*Total Score (12 items) -- USE MISSINGNESS FOR EACH SUBSCALE as a cut-off point.
COMPUTE FQ2OMSPSSTOT=-9999.
EXECUTE.
IF (MISSSO < 1.32  AND MISSFAM < 1.32 AND MISSFRI < 1.32) FQ2OMSPSSTOT=((FQ2OMSPSS01 + FQ2OMSPSS02 + FQ2OMSPSS03 + FQ2OMSPSS04 + FQ2OMSPSS05 + FQ2OMSPSS06 + 
    FQ2OMSPSS07 + FQ2OMSPSS08 + FQ2OMSPSS09 + FQ2OMSPSS10 + FQ2OMSPSS11 + FQ2OMSPSS12)/(12-MISSSO-MISSFAM-MISSFRI)).
EXECUTE.
*CREATING ALL SUBSCALES (CHECK THAT REVERSE-SCORED ITEMS INCLUDED).
*Significant other (SO) (4 items) -- 66.7% (i.e., if MISS is less than or equal to 1.32) as a cut-off point.
COMPUTE FQ2OMSPSSSO=-9999.
EXECUTE.
IF (MISSSO < 1.32) FQ2OMSPSSSO=((FQ2OMSPSS01+ FQ2OMSPSS02 + FQ2OMSPSS05 + FQ2OMSPSS10)/(4-MISSSO)).
EXECUTE.
*Family (FAM) (4 items) --  66.7% (i.e., if MISS is less than or equal to 1.32) as a cut-off point.
COMPUTE FQ2OMSPSSFAM=-9999.
EXECUTE.
IF (MISSFAM < 1.32) FQ2OMSPSSFAM=((FQ2OMSPSS03+ FQ2OMSPSS04 + FQ2OMSPSS08 + FQ2OMSPSS11)/(4-MISSFAM)).
EXECUTE.   
*Friends (FRI) (4 items) -- 66.7% (i.e., if MISS is less than or equal to 1.32) as a cut-off point.
COMPUTE FQ2OMSPSSFRI=-9999.
IF (MISSFRI < 1.32) FQ2OMSPSSFRI=((FQ2OMSPSS06 + FQ2OMSPSS07 + FQ2OMSPSS09)/(4-MISSFRI)).
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
**-12 'Pariticipant refused follow-up'                                             /* (Participant refused follow-up) */     
**-11 'Participant (parent or child) deceased'                                                /* (Participant (child) deceased) */
**-10 'Prefer not to answer'                                                           /* (Participant selected prefer not to answer) */.
DO IF MISSING(FD2OSTAT).
DO REPEAT x = FQ2OMSPSSTOT TO FQ2OMSPSSFRI.
RECODE FD2OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.
*Checking frequenices for constructs to look at missingness. 
FREQUENCIES VARIABLES=FD2OSTAT FQ2OMSPSSTOT FQ2OMSPSSSO FQ2OMSPSSFAM FQ2OMSPSSFRI
  /ORDER=ANALYSIS.
*At this point, the only remaining missingness should represent when participant did not answer a sufficient number of questions, assuming STAT variable was correctly coded for this measure -- CHECK THIS! 
*If there IS missingness that was not accounted for in the STAT variable (for example in DERSAC, participants who indicated they did not have an additional caregiver should be coded as -44
Each construct needs to be coded by ID here.**CHECKED AND NOT NEEDED.

*At this point, the only remaining missingness should represent when participant did not answer a sufficient number of questions, assuming STAT variable was correctly coded for this measure -- CHECK THIS! 
*The following syntax will recode this remaining missingness for each new construct.
IF (FQ2OMSPSSTOT=-9999) FQ2OMSPSSTOT=-43.
EXECUTE.  
IF (FQ2OMSPSSSO=-9999) FQ2OMSPSSSO=-43.
EXECUTE.  
IF (FQ2OMSPSSFAM=-9999) FQ2OMSPSSFAM=-43.
EXECUTE.  
IF (FQ2OMSPSSFRI=-9999) FQ2OMSPSSFRI=-43.
EXECUTE.   
MISSING VALUES
   FQ2OMSPSSTOT FQ2OMSPSSSO FQ2OMSPSSFAM FQ2OMSPSSFRI
    (LO THRU -1).
EXECUTE.

*STEP 9: LABELING CONSTRUCTS.
VARIABLE LABELS
FQ2OMSPSSTOT 'MSPSS Total Score [FQ2OMSPSSTOT]'
FQ2OMSPSSSO 'MSPSS Significant Other [FQ2OMSPSSSO]'
FQ2OMSPSSFAM 'MSPSS Family [FQ2OMSPSSFAM]'
FQ2OMSPSSFRI 'MSPSS Friends [FQ2OMSPSSFRI]'.
EXECUTE.

*STEP 9A: ADD VALUE LABELS.
*Include ALL missing value labels (SEE STEP 8 FOR FULL LIST). 
*Be sure to also include value labels for any constructs that need labels (e.g., 0 'No', 1 'Yes'). Summed or averaged scores do NOT need value labels.
VALUE LABELS
FQ2OMSPSSTOT TO FQ2OMSPSSFRI
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
-10 'Prefer not to Answer (-10)'.
EXECUTE.

*STEP 10: CHECK FREQUENCIES.
*Checking frequencies of all constructs.
FREQUENCIES VARIABLES=FD2OSTAT FQ2OMSPSSTOT FQ2OMSPSSSO FQ2OMSPSSFAM FQ2OMSPSSFRI
  /ORDER=ANALYSIS.

*STEP 11: CHECK DESCRIPTIVES.
*Checking descriptives for all constructs.
DESCRIPTIVES VARIABLES=FQ2OMSPSSTOT FQ2OMSPSSSO FQ2OMSPSSFAM FQ2OMSPSSFRI
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 12: SAVE CLEANED DATA FILE.
*First, sorting the data file by ID and resaving the final file.
*Using /KEEP command to keep ONLY ID + RD + the constructs that were created. 
SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OMSPSS_Constructs.sav'
  /KEEP ID FD2ORD FQ2OMSPSSTOT FQ2OMSPSSSO FQ2OMSPSSFAM FQ2OMSPSSFRI  
  /COMPRESSED.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OMSPSS_Constructs.sav'.
EXECUTE.

*STEP 13: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE 
 OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OMSPSS_Constructs.spv'
LOCK=NO.


* Encoding: UTF-8.
*STEP 0: NOTES.
*HAMILTON ANXIETY RATING SCALE (HAM-A).
*CREATED THE FOLLOWING SUBSCALES & RAN APLHAS; LIST SUBSCALES BELOW.
*Total score (TOT).
 
*1-12-22(BM): Adapted syntax for UO DERS. Completed STEPS 1-13.
*1-13-22(BM): Fixed Error in comments in STEP 0 and STEP 7.
*1-14-22(AAC): CHECKED. Updated alpha and n in STEP 5 notes. 
*1-26-22(AAC): Added ATEP 9A.
*------------------------------------------------------------------------------.
*STEP 1: OPENING CLEANED DATA.
*Insert the correct file path and file name. Use syntax to open cleaned data file.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OHAMA_Cleaned.sav'.

*STEP 2: SAVING CLEANED DATA AS A CONSTRUCT FILE. 
*Insert the correct file path and file name.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OHAMA_Constructs.sav'
  /COMPRESSED.

*STEP 3: DESCRIPTIVE STATISTICS (1. FREQ AND 2. CORR) FOR RAW VARIABLES (TOTAL SCORE 1ST, THEN SUBSCALES).
*When running this step note any additional missingness (any other codes) that are not accounted for in the STAT variable. These missing codes (and corresponding IDs) will need to be 
incorporated in STEP 8 below.
FREQ VARS=FQ1OHAMA01, FQ1OHAMA02, FQ1OHAMA03, FQ1OHAMA04, FQ1OHAMA05, FQ1OHAMA06, FQ1OHAMA07, FQ1OHAMA08, FQ1OHAMA09, FQ1OHAMA10,
    FQ1OHAMA11, FQ1OHAMA12, FQ1OHAMA13.
*HAMA Total Score (TOT).
CORR VARS=FQ1OHAMA01, FQ1OHAMA02, FQ1OHAMA03, FQ1OHAMA04, FQ1OHAMA05, FQ1OHAMA06, FQ1OHAMA07, FQ1OHAMA08, FQ1OHAMA09, FQ1OHAMA10,
    FQ1OHAMA11, FQ1OHAMA12, FQ1OHAMA13.

*STEP 4: RECODING MISSING VALUES.
RECODE FQ1OHAMA01 TO FQ1OHAMA13 (MISSING=-9999).
EXECUTE.
    
*STEP 5: RELIABILITY STATISTICS (TOTAL SCORE 1st, FOLLOWED BY SUBSCALES).
*HAMA Total Score (TOT) (13 items; n=79; alpha=.932).
REL VARS=FQ1OHAMA01, FQ1OHAMA02, FQ1OHAMA03, FQ1OHAMA04, FQ1OHAMA05, FQ1OHAMA06, FQ1OHAMA07, FQ1OHAMA08, FQ1OHAMA09, FQ1OHAMA10,
    FQ1OHAMA11, FQ1OHAMA12, FQ1OHAMA13
/SCALE(All)= ALL.

*STEP 6: COUNTING MISSING DATA (JUST SUBSCALES), THEN RECODING TO 0 TO AVOID NEGATIVE EFFECTS ON CONSTRUCTS.
*HAMA TOTAL (TOT). 
COUNT MISSTOT=FQ1OHAMA01, FQ1OHAMA02, FQ1OHAMA03, FQ1OHAMA04, FQ1OHAMA05, FQ1OHAMA06, FQ1OHAMA07, FQ1OHAMA08, FQ1OHAMA09, FQ1OHAMA10,
    FQ1OHAMA11, FQ1OHAMA12, FQ1OHAMA13 (-9999).

RECODE FQ1OHAMA01 TO FQ1OHAMA13 (-9999=0).
EXECUTE.

*STEP 7: CREATE TOTAL AND SUBSCALES SCORES  (CHECK THAT REVERSE-SCORED ITEMS INCLUDED).
*Note each subscale name and calculate missingness allowed.
*CREATING TOTAL SCORE.
*Total Score (13 items) -- USE MISSINGNESS FOR EACH SUBSCALE as a cut-off point.
COMPUTE FQ1OHAMATOT=-9999.
EXECUTE.
IF (MISSTOT < 4.29) FQ1OHAMATOT=RND(((FQ1OHAMA01 + FQ1OHAMA02 + FQ1OHAMA03 + FQ1OHAMA04 + FQ1OHAMA05 + FQ1OHAMA06 + FQ1OHAMA07 + FQ1OHAMA08 + FQ1OHAMA09 + FQ1OHAMA10 +
    FQ1OHAMA11 + FQ1OHAMA12 + FQ1OHAMA13)/(13-MISSTOT))*13).
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
**-11 'Participant (child) deceased'                                                /* (Participant (child) deceased) */
**-10 'Prefer not to answer'                                                           /* (Participant selected prefer not to answer) */.
DO IF MISSING(FD1OSTAT).
DO REPEAT x = FQ1OHAMATOT.
RECODE FD1OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.
*Checking frequenices for constructs to look at missingness. 
FREQUENCIES VARIABLES=FD1OSTAT FQ1OHAMATOT
  /ORDER=ANALYSIS.
*If there IS missingness that was not accounted for in the STAT variable (for example in DERSAC, participants who indicated they did not have an additional caregiver should be coded as -44
Each construct needs to be coded by ID here.**CHECKED AND NOT NEEDED.
*At this point, the only remaining missingness should represent when participant did not answer a sufficient number of questions, assuming STAT variable was correctly coded for this measure -- CHECK THIS! 
*The following syntax will recode this remaining missingness for each new construct.
IF (FQ1OHAMATOT=-9999) FQ1OHAMATOT=-43.
EXECUTE.  
MISSING VALUES
   FQ1OHAMATOT
    (LO THRU -1).
EXECUTE.

*STEP 9: LABELING CONSTRUCTS.
VARIABLE LABELS
FQ1OHAMATOT 'HAMA Total Score [FQ1OHAMATOT]'.
EXECUTE.


*STEP 9A: ADD VALUE LABELS.
*Include ALL missing value labels (SEE STEP 8 FOR FULL LIST). 
*Be sure to also include value labels for any constructs that need labels (e.g., 0 'No', 1 'Yes'). Summed or averaged scores do NOT need value labels.
VALUE LABELS
FQ1OHAMATOT
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
-10 'Prefer not to Answer (-10)'.
EXECUTE.

*STEP 10: CHECK FREQUENCIES.
*Checking frequencies of all constructs.
FREQUENCIES VARIABLES=FD1OSTAT FQ1OHAMATOT  
  /ORDER=ANALYSIS.

*STEP 11: CHECK DESCRIPTIVES.
*Checking descriptives for all constructs.
DESCRIPTIVES VARIABLES=FQ1OHAMATOT
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 12: SAVE CLEANED DATA FILE.
*First, sorting the data file by ID and resaving the final file.
*Using /KEEP command to keep ONLY ID + RD + the constructs that were created. 
SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OHAMA_Constructs.sav'
  /KEEP ID FD1ORD FQ1OHAMATOT
  /COMPRESSED.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OHAMA_Constructs.sav'.
EXECUTE.

*STEP 13: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE 
 OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OHAMA_Constructs.spv'
LOCK=NO.


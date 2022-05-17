* Encoding: UTF-8.
*STEP 0: NOTES.
*DIFFICULTIES WITH EMOTION REGULATION SCALE FOR ADDITIONAL CAREGIVER (DERSAC).
*CREATED THE FOLLOWING SUBSCALES & RAN APLHAS; LIST SUBSCALES BELOW.
*Total score (TOT).
*Nonacceptance of emotional responses (NA).
*Difficulty engaging in goal-directed behavior (GB).
*Impulse control difficulties (IC).
*Lack of emotional awareness (EA).
*Limited access to emotion regulation strategies (LA).
*Lack of emotional clarity (EC).
 
*12-21-21(BM): Adapted syntax for UO DERSAC. Completed STEPS 1-13.
*1-4-22(BM): Double checked and updated STEPS 1-13.
*1-5-22(BM): Fixed problem in STEP 7
*1-6-22(BM): Updated STEPS 7
*1-12-22(BM): Updated STEPS 3, 4 and 8.
*1-13-22(BM): Added IDs to STEP 8.
*1-22-22(AAC): CHECKED. 
*1-26-22(AAC): Added STEP 9A.
*03-10-22(AAC): Fixed subscale labels.
*05-16-22(AAC): Updated missing value labels.
*------------------------------------------------------------------------------.
*STEP 1: OPENING CLEANED DATA.
*Insert the correct file path and file name. Use syntax to open cleaned data file.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1ODERSAC_Cleaned.sav'.

*STEP 2: SAVING CLEANED DATA AS A CONSTRUCT FILE. 
*Insert the correct file path and file name.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1ODERSAC_Constructs.sav'
  /COMPRESSED.

*STEP 3: DESCRIPTIVE STATISTICS (1. FREQ AND 2. CORR) FOR RAW VARIABLES (TOTAL SCORE 1ST, THEN SUBSCALES).
*When running this step note any additional missingness (any other codes) that are not accounted for in the STAT variable. These missing codes (and corresponding IDs) will need to be 
incorporated in STEP 8 below.
FREQ VARS=FQ1ODERSAC01R, FQ1ODERSAC02R, FQ1ODERSAC03, FQ1ODERSAC04, FQ1ODERSAC05, FQ1ODERSAC06R, FQ1ODERSAC07R, FQ1ODERSAC08R, FQ1ODERSAC09, 
    FQ1ODERSAC10R, FQ1ODERSAC11, FQ1ODERSAC12, FQ1ODERSAC13, FQ1ODERSAC14, FQ1ODERSAC15, FQ1ODERSAC16, FQ1ODERSAC17R, FQ1ODERSAC18, FQ1ODERSAC19,
    FQ1ODERSAC20R, FQ1ODERSAC21, FQ1ODERSAC22R, FQ1ODERSAC23, FQ1ODERSAC24R, FQ1ODERSAC25, FQ1ODERSAC26, FQ1ODERSAC27, FQ1ODERSAC28,
    FQ1ODERSAC29, FQ1ODERSAC30, FQ1ODERSAC31, FQ1ODERSAC32, FQ1ODERSAC33, FQ1ODERSAC34R, FQ1ODERSAC35, FQ1ODERSAC36.
*DERS Total Score (TOT).
CORR VARS=FQ1ODERSAC01R, FQ1ODERSAC02R, FQ1ODERSAC03, FQ1ODERSAC04, FQ1ODERSAC05, FQ1ODERSAC06R, FQ1ODERSAC07R, FQ1ODERSAC08R, FQ1ODERSAC09, 
    FQ1ODERSAC10R, FQ1ODERSAC11, FQ1ODERSAC12, FQ1ODERSAC13, FQ1ODERSAC14, FQ1ODERSAC15, FQ1ODERSAC16, FQ1ODERSAC17R, FQ1ODERSAC18, FQ1ODERSAC19,
    FQ1ODERSAC20R, FQ1ODERSAC21, FQ1ODERSAC22R, FQ1ODERSAC23, FQ1ODERSAC24R, FQ1ODERSAC25, FQ1ODERSAC26, FQ1ODERSAC27, FQ1ODERSAC28,
    FQ1ODERSAC29, FQ1ODERSAC30, FQ1ODERSAC31, FQ1ODERSAC32, FQ1ODERSAC33, FQ1ODERSAC34R, FQ1ODERSAC35, FQ1ODERSAC36.
*Non-Acceptance of emotional responses (NA).
CORR VARS=FQ1ODERSAC11, FQ1ODERSAC12, FQ1ODERSAC21, FQ1ODERSAC23, FQ1ODERSAC25, FQ1ODERSAC29.
*Difficulty engaging in goal-directed behavior (GB).
CORR VARS=FQ1ODERSAC13, FQ1ODERSAC18, FQ1ODERSAC20R, FQ1ODERSAC26, FQ1ODERSAC33.
*Impulse control difficulties (IC).
CORR VARS=FQ1ODERSAC03, FQ1ODERSAC14, FQ1ODERSAC19, FQ1ODERSAC24R, FQ1ODERSAC27, FQ1ODERSAC32.
*Lack of emotional awareness (EA).
CORR VARS=FQ1ODERSAC02R, FQ1ODERSAC06R, FQ1ODERSAC08R, FQ1ODERSAC10R, FQ1ODERSAC17R, FQ1ODERSAC34R.
*Limited access to emotion regulation strategies (LA).
CORR VARS=FQ1ODERSAC15, FQ1ODERSAC16, FQ1ODERSAC22R, FQ1ODERSAC28, FQ1ODERSAC30, FQ1ODERSAC31, FQ1ODERSAC35, FQ1ODERSAC36.
*Lack of emotional clarity (EC).
CORR VARS=FQ1ODERSAC01R, FQ1ODERSAC04, FQ1ODERSAC05, FQ1ODERSAC07R, FQ1ODERSAC09.
 
*STEP 4: RECODING MISSING VALUES.
RECODE FQ1ODERSAC01 TO FQ1ODERSAC34R (MISSING=-9999).
EXECUTE.

*STEP 5: RELIABILITY STATISTICS (TOTAL SCORE 1st, FOLLOWED BY SUBSCALES).
*DERS Total Score (TOT) (36 items; n=67; alpha=.958).
REL VARS=FQ1ODERSAC01R, FQ1ODERSAC02R, FQ1ODERSAC03, FQ1ODERSAC04, FQ1ODERSAC05, FQ1ODERSAC06R, FQ1ODERSAC07R, FQ1ODERSAC08R, FQ1ODERSAC09, 
    FQ1ODERSAC10R, FQ1ODERSAC11, FQ1ODERSAC12, FQ1ODERSAC13, FQ1ODERSAC14, FQ1ODERSAC15, FQ1ODERSAC16, FQ1ODERSAC17R, FQ1ODERSAC18, FQ1ODERSAC19,
    FQ1ODERSAC20R, FQ1ODERSAC21, FQ1ODERSAC22R, FQ1ODERSAC23, FQ1ODERSAC24R, FQ1ODERSAC25, FQ1ODERSAC26, FQ1ODERSAC27, FQ1ODERSAC28,
    FQ1ODERSAC29, FQ1ODERSAC30, FQ1ODERSAC31, FQ1ODERSAC32, FQ1ODERSAC33, FQ1ODERSAC34R, FQ1ODERSAC35, FQ1ODERSAC36
/SCALE(All)= ALL.
*Non-Acceptance of emotional responses (NA) (6 items; n=70; alpha=.925).
REL VARS=FQ1ODERSAC11, FQ1ODERSAC12, FQ1ODERSAC21, FQ1ODERSAC23, FQ1ODERSAC25, FQ1ODERSAC29
/SCALE(All)= ALL.
*Difficulty engaging in goal-directed behavior (GB) (5 items; n=75; alpha=.892).
REL VARS=FQ1ODERSAC13, FQ1ODERSAC18, FQ1ODERSAC20R, FQ1ODERSAC26, FQ1ODERSAC33
/SCALE(All)= ALL.
*Impulse control difficulties (IC) (6 items; n=72; alpha=.856).
REL VARS=FQ1ODERSAC03, FQ1ODERSAC14, FQ1ODERSAC19, FQ1ODERSAC24R, FQ1ODERSAC27, FQ1ODERSAC32
/SCALE(All)= ALL.
*Lack of emotional awareness (EA) (6 items; n=73; alpha=.867).
REL VARS=FQ1ODERSAC02R, FQ1ODERSAC06R, FQ1ODERSAC08R, FQ1ODERSAC10R, FQ1ODERSAC17R, FQ1ODERSAC34R
/SCALE(All)= ALL.
*Limited access to emotion regulation strategies (LA) (8 items; n=72; alpha=.923).
REL VARS=FQ1ODERSAC15, FQ1ODERSAC16, FQ1ODERSAC22R, FQ1ODERSAC28, FQ1ODERSAC30, FQ1ODERSAC31, FQ1ODERSAC35, FQ1ODERSAC36
/SCALE(All)= ALL.
*Lack of emotional clarity (EC) (5 items; n=73; alpha=.858).
REL VARS=FQ1ODERSAC01R, FQ1ODERSAC04, FQ1ODERSAC05, FQ1ODERSAC07R, FQ1ODERSAC09
/SCALE(All)= ALL.

*STEP 6: COUNTING MISSING DATA (TOTAL SCORE 1st, FOLLOWED BY SUBSCALES), THEN RECODING TO 0 TO AVOID NEGATIVE EFFECTS ON CONSTRUCTS.
*Non-Acceptance of emotional responses (NA). 
COUNT MISSNA=FQ1ODERSAC11, FQ1ODERSAC12, FQ1ODERSAC21, FQ1ODERSAC23, FQ1ODERSAC25, FQ1ODERSAC29 (-9999).
*Difficulty engaging in goal-directed behavior (GB).
COUNT MISSGB=FQ1ODERSAC13, FQ1ODERSAC18, FQ1ODERSAC20R, FQ1ODERSAC26, FQ1ODERSAC33 (-9999).
*Impulse control difficulties (IC).
COUNT MISSIC=FQ1ODERSAC03, FQ1ODERSAC14, FQ1ODERSAC19, FQ1ODERSAC24R, FQ1ODERSAC27, FQ1ODERSAC32 (-9999).
*Lack of emotional awareness (EA).
COUNT MISSEA=FQ1ODERSAC02R, FQ1ODERSAC06R, FQ1ODERSAC08R, FQ1ODERSAC10R, FQ1ODERSAC17R, FQ1ODERSAC34R (-9999).
*Limited access to emotion regulation strategies (LA).
COUNT MISSLA=FQ1ODERSAC15, FQ1ODERSAC16, FQ1ODERSAC22R, FQ1ODERSAC28, FQ1ODERSAC30, FQ1ODERSAC31, FQ1ODERSAC35, FQ1ODERSAC36 (-9999).
*Lack of emotional clarity (EC).
COUNT MISSEC=FQ1ODERSAC01R, FQ1ODERSAC04, FQ1ODERSAC05, FQ1ODERSAC07R, FQ1ODERSAC09 (-9999).

RECODE FQ1ODERSAC01 TO FQ1ODERSAC34R (-9999=0).
EXECUTE.

*STEP 7: CREATE TOTAL AND SUBSCALES SCORES  (CHECK THAT REVERSE-SCORED ITEMS INCLUDED).
*Note each subscale name and calculate missingness allowed.
*CREATING TOTAL SCORE.
*Total Score (36 items) -- USE MISSINGNESS FOR EACH SUBSCALE as a cut-off point.
COMPUTE FQ1ODERSACTOT=-9999.
EXECUTE.
IF (MISSNA < 1.98  AND MISSGB < 1.65 AND MISSIC < 1.98 AND MISSEA < 1.98 AND MISSLA < 2.64 AND MISSEC < 1.65) FQ1ODERSACTOT=RND(((FQ1ODERSAC01R + FQ1ODERSAC02R + FQ1ODERSAC03 + FQ1ODERSAC04 + FQ1ODERSAC05 
    + FQ1ODERSAC06R + FQ1ODERSAC07R + FQ1ODERSAC08R + FQ1ODERSAC09 + 
    FQ1ODERSAC10R + FQ1ODERSAC11 + FQ1ODERSAC12 + FQ1ODERSAC13 + FQ1ODERSAC14 + FQ1ODERSAC15 + FQ1ODERSAC16 + FQ1ODERSAC17R + FQ1ODERSAC18 + FQ1ODERSAC19 +
    FQ1ODERSAC20R + FQ1ODERSAC21 + FQ1ODERSAC22R + FQ1ODERSAC23 + FQ1ODERSAC24R + FQ1ODERSAC25 + FQ1ODERSAC26 + FQ1ODERSAC27 + FQ1ODERSAC28 +
    FQ1ODERSAC29 + FQ1ODERSAC30 + FQ1ODERSAC31 + FQ1ODERSAC32 + FQ1ODERSAC33 + FQ1ODERSAC34R + FQ1ODERSAC35 + FQ1ODERSAC36)/(36-MISSNA-MISSGB-MISSIC-MISSEA-MISSLA-MISSEC))*36).
EXECUTE.
*CREATING ALL SUBSCALES (CHECK THAT REVERSE-SCORED ITEMS INCLUDED).
*Nonacceptance of emotional responses (NA) (6 items) -- 66.7% (i.e., if MISS is less than or equal to 1.98) as a cut-off point.
COMPUTE FQ1ODERSACNA=-9999.
EXECUTE.
IF (MISSNA < 1.98) FQ1ODERSACNA=RND(((FQ1ODERSAC11+ FQ1ODERSAC12 + FQ1ODERSAC21 + FQ1ODERSAC23 + FQ1ODERSAC25 + FQ1ODERSAC29)/(6-MISSNA))*6).
EXECUTE.
*Difficulty engaging in goal-directed behavior (GB) (5 items) --  66.7% (i.e., if MISS is less than or equal to 1.65) as a cut-off point.
COMPUTE FQ1ODERSACGB=-9999.
EXECUTE.
IF (MISSGB < 1.65) FQ1ODERSACGB=RND(((FQ1ODERSAC13+ FQ1ODERSAC18 + FQ1ODERSAC20R + FQ1ODERSAC26 + FQ1ODERSAC33)/(5-MISSGB))*5).
EXECUTE.   
*Impulse control difficulties (IC) (6 items) -- 66.7% (i.e., if MISS is less than or equal to 1.98) as a cut-off point.
COMPUTE FQ1ODERSACIC=-9999.
IF (MISSIC < 1.98) FQ1ODERSACIC=RND(((FQ1ODERSAC03 + FQ1ODERSAC14 + FQ1ODERSAC19 + FQ1ODERSAC24R + FQ1ODERSAC27 + FQ1ODERSAC32)/(6-MISSIC))*6).
EXECUTE.    
*Lack of emotional awareness (EA) (6 items) -- 66.7% (i.e., if MISS is less than or equal to 1.98) as a cut-off point.
COMPUTE FQ1ODERSACEA=-9999.
IF (MISSEA < 1.98) FQ1ODERSACEA=RND(((FQ1ODERSAC02R+ FQ1ODERSAC06R + FQ1ODERSAC08R + FQ1ODERSAC10R + FQ1ODERSAC17R + FQ1ODERSAC34R)/(6-MISSEA))*6).
EXECUTE.    
*Limited access to emotion regulation strategies (LA) (8 items) -- 66.7% (i.e., if MISS is less than or equal to 2.64) as a cut-off point..
COMPUTE FQ1ODERSACLA=-9999.
IF (MISSLA < 2.64) FQ1ODERSACLA=RND(((FQ1ODERSAC15+ FQ1ODERSAC16 + FQ1ODERSAC22R + FQ1ODERSAC28 + FQ1ODERSAC30 + FQ1ODERSAC31 + FQ1ODERSAC35 + FQ1ODERSAC36)/(8-MISSLA))*8).
EXECUTE.  
*Lack of emotional clarity (EC) (5 items) --  66.7% (i.e., if MISS is less than or equal to 1.65) as a cut-off point. .
COMPUTE FQ1ODERSACEC=-9999.
IF (MISSEC < 1.65) FQ1ODERSACEC=RND(((FQ1ODERSAC01R+ FQ1ODERSAC04 + FQ1ODERSAC05 + FQ1ODERSAC07R + FQ1ODERSAC09)/(5-MISSEC))*5).
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
**-44 'Question skipped (no alternative caregiver)'                          /* (correct skipped question: e.g. demographics, etc.) */
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
DO IF MISSING(FD1OSTAT).
DO REPEAT x = FQ1ODERSACTOT TO FQ1ODERSACEC.
RECODE FD1OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.
*Checking frequenices for constructs to look at missingness. 
FREQUENCIES VARIABLES=FD1OSTAT FQ1ODERSACTOT FQ1ODERSACNA FQ1ODERSACGB FQ1ODERSACIC FQ1ODERSACEA FQ1ODERSACLA FQ1ODERSACEC 
  /ORDER=ANALYSIS.
*If there IS missingness that was not accounted for in the STAT variable (for example in DERSAC, participants who indicated they did not have an additional caregiver should be coded as -44
Each construct needs to be coded by ID here. If there IS NO additional missingess not accounted for, delete only this section of syntax and write.
IF (ID=90088 OR ID=90210 OR ID=91072) FQ1ODERSACTOT=-44.
EXECUTE.  
IF (ID=90088 OR ID=90210 OR ID=91072) FQ1ODERSACNA=-44.
EXECUTE.  
IF (ID=90088 OR ID=90210 OR ID=91072) FQ1ODERSACGB=-44.
EXECUTE.  
IF (ID=90088 OR ID=90210 OR ID=91072) FQ1ODERSACIC=-44.
EXECUTE.  
IF (ID=90088 OR ID=90210 OR ID=91072) FQ1ODERSACEA=-44.
EXECUTE.  
IF (ID=90088 OR ID=90210 OR ID=91072) FQ1ODERSACLA=-44.
EXECUTE.  
IF (ID=90088 OR ID=90210 OR ID=91072) FQ1ODERSACEC=-44.
EXECUTE.  
*At this point, the only remaining missingness should represent when participant did not answer a sufficient number of questions, assuming STAT variable was correctly coded for this measure -- CHECK THIS! 
*The following syntax will recode this remaining missingness for each new construct.
IF (FQ1ODERSACTOT=-9999) FQ1ODERSACTOT=-43.
EXECUTE.  
IF (FQ1ODERSACNA=-9999) FQ1ODERSACNA=-43.
EXECUTE.  
IF (FQ1ODERSACGB=-9999) FQ1ODERSACGB=-43.
EXECUTE.  
IF (FQ1ODERSACIC=-9999) FQ1ODERSACIC=-43.
EXECUTE.  
IF (FQ1ODERSACEA=-9999) FQ1ODERSACEA=-43.
EXECUTE.  
IF (FQ1ODERSACLA=-9999) FQ1ODERSACLA=-43.
EXECUTE.  
IF (FQ1ODERSACEC=-9999) FQ1ODERSACEC=-43.
EXECUTE.  
MISSING VALUES
   FQ1ODERSACTOT FQ1ODERSACNA FQ1ODERSACGB FQ1ODERSACIC FQ1ODERSACEA FQ1ODERSACLA FQ1ODERSACEC 
    (LO THRU -1).
EXECUTE.

*STEP 9: LABELING CONSTRUCTS.
VARIABLE LABELS
FQ1ODERSACTOT 'DERSAC Total Score [FQ1ODERSACTOT]'
FQ1ODERSACNA 'DERSAC Nonacceptance of emotional responses [FQ1ODERSACNA]'
FQ1ODERSACGB 'DERSAC Difficulty engaging in goal-directed behavior [FQ1ODERSACGB]'
FQ1ODERSACIC 'DERSAC Impulse control difficulties [FQ1ODERSACIC]'
FQ1ODERSACEA 'DERSAC Lack of emotional awareness [FQ1ODERSACEA]'
FQ1ODERSACLA 'DERSAC Limited access to emotion regulation strategies [FQ1ODERSACLA]'
FQ1ODERSACEC 'DERSAC Lack of emotional clarity [FQ1ODERSACEC]'.
EXECUTE.

*STEP 9A: ADD VALUE LABELS.
*Include ALL missing value labels (SEE STEP 8 FOR FULL LIST). 
*Be sure to also include value labels for any constructs that need labels (e.g., 0 'No', 1 'Yes'). Summed or averaged scores do NOT need value labels.
VALUE LABELS
FQ1ODERSACTOT TO FQ1ODERSACEC
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
-10 'Prefer not to answer (-10)'.
EXECUTE.

*STEP 10: CHECK FREQUENCIES.
*Checking frequencies of all constructs.
FREQUENCIES VARIABLES=FD1OSTAT FQ1ODERSACTOT FQ1ODERSACNA FQ1ODERSACGB FQ1ODERSACIC FQ1ODERSACEA FQ1ODERSACLA FQ1ODERSACEC 
  /ORDER=ANALYSIS.

*STEP 11: CHECK DESCRIPTIVES.
*Checking descriptives for all constructs.
DESCRIPTIVES VARIABLES=FQ1ODERSACTOT FQ1ODERSACNA FQ1ODERSACGB FQ1ODERSACIC FQ1ODERSACEA FQ1ODERSACLA FQ1ODERSACEC 
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 12: SAVE CLEANED DATA FILE.
*First, sorting the data file by ID and resaving the final file.
*Using /KEEP command to keep ONLY ID + RD + the constructs that were created. 
SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1ODERSAC_Constructs.sav'
  /KEEP ID FD1ORD FQ1ODERSACTOT FQ1ODERSACNA FQ1ODERSACGB FQ1ODERSACIC FQ1ODERSACEA FQ1ODERSACLA FQ1ODERSACEC   
  /COMPRESSED.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1ODERSAC_Constructs.sav'.
EXECUTE.

*STEP 13: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE 
 OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1ODERSAC_Constructs.spv'
LOCK=NO.


* Encoding: UTF-8.
*STEP 0: NOTES.
*DIFFICULTIES WITH EMOTION REGULATION SCALE (DERS).
*CREATED THE FOLLOWING SUBSCALES & RAN APLHAS.
*Total score (TOT).
*Nonacceptance of emotional responses (NA).
*Difficulty engaging in goal-directed behavior (GB).
*Impulse control difficulties (IC).
*Lack of emotional awareness (EA).
*Limited access to emotion regulation strategies (LA).
*Lack of emotional clarity (EC).
 
*4-20-22(BM): Adapted syntax for A4.
*04-21-22(AAC): Checked.
*------------------------------------------------------------------------------.
*STEP 1: OPENING CLEANED DATA.
*Insert the correct file path and file name. Use syntax to open cleaned data file.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4ODERS_Cleaned.sav'.

*STEP 2: SAVING CLEANED DATA AS A CONSTRUCT FILE. 
*Insert the correct file path and file name.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4ODERS_Constructs.sav'
  /COMPRESSED.

*STEP 3: DESCRIPTIVE STATISTICS (1. FREQ AND 2. CORR) FOR RAW VARIABLES (TOTAL SCORE 1ST, THEN SUBSCALES).
*When running this step note any additional missingness (any other codes) that are not accounted for in the STAT variable. These missing codes (and corresponding IDs) will need to be 
incorporated in STEP 8 below.
FREQ VARS=FQ4ODERS01R, FQ4ODERS02R, FQ4ODERS03, FQ4ODERS04, FQ4ODERS05, FQ4ODERS06R, FQ4ODERS07R, FQ4ODERS08R, FQ4ODERS09, 
    FQ4ODERS10R, FQ4ODERS11, FQ4ODERS12, FQ4ODERS13, FQ4ODERS14, FQ4ODERS15, FQ4ODERS16, FQ4ODERS17R, FQ4ODERS18, FQ4ODERS19,
    FQ4ODERS20R, FQ4ODERS21, FQ4ODERS22R, FQ4ODERS23, FQ4ODERS24R, FQ4ODERS25, FQ4ODERS26, FQ4ODERS27, FQ4ODERS28,
    FQ4ODERS29, FQ4ODERS30, FQ4ODERS31, FQ4ODERS32, FQ4ODERS33, FQ4ODERS34R, FQ4ODERS35, FQ4ODERS36.
*DERS Total Score.
CORR VARS=FQ4ODERS01R, FQ4ODERS02R, FQ4ODERS03, FQ4ODERS04, FQ4ODERS05, FQ4ODERS06R, FQ4ODERS07R, FQ4ODERS08R, FQ4ODERS09, 
    FQ4ODERS10R, FQ4ODERS11, FQ4ODERS12, FQ4ODERS13, FQ4ODERS14, FQ4ODERS15, FQ4ODERS16, FQ4ODERS17R, FQ4ODERS18, FQ4ODERS19,
    FQ4ODERS20R, FQ4ODERS21, FQ4ODERS22R, FQ4ODERS23, FQ4ODERS24R, FQ4ODERS25, FQ4ODERS26, FQ4ODERS27, FQ4ODERS28,
    FQ4ODERS29, FQ4ODERS30, FQ4ODERS31, FQ4ODERS32, FQ4ODERS33, FQ4ODERS34R, FQ4ODERS35, FQ4ODERS36.
*Non-Acceptance of emotional responses (NA).
CORR VARS=FQ4ODERS11, FQ4ODERS12, FQ4ODERS21, FQ4ODERS23, FQ4ODERS25, FQ4ODERS29.
*Difficulty engaging in goal-directed behavior (GB).
CORR VARS=FQ4ODERS13, FQ4ODERS18, FQ4ODERS20R, FQ4ODERS26, FQ4ODERS33.
*Impulse control difficulties (IC).
CORR VARS=FQ4ODERS03, FQ4ODERS14, FQ4ODERS19, FQ4ODERS24R, FQ4ODERS27, FQ4ODERS32.
*Lack of emotional awareness (EA).
CORR VARS=FQ4ODERS02R, FQ4ODERS06R, FQ4ODERS08R, FQ4ODERS10R, FQ4ODERS17R, FQ4ODERS34R.
*Limited access to emotion regulation strategies (LA).
CORR VARS=FQ4ODERS15, FQ4ODERS16, FQ4ODERS22R, FQ4ODERS28, FQ4ODERS30, FQ4ODERS31, FQ4ODERS35, FQ4ODERS36.
*Lack of emotional clarity (EC).
CORR VARS=FQ4ODERS01R, FQ4ODERS04, FQ4ODERS05, FQ4ODERS07R, FQ4ODERS09.

*STEP 4: RECODING MISSING VALUES.
RECODE FQ4ODERS01 TO FQ4ODERS34R (MISSING=-9999).
EXECUTE.
    
*STEP 5: RELIABILITY STATISTICS (TOTAL SCORE 1st, FOLLOWED BY SUBSCALES).
*DERS Total Score (36 items; n=67; alpha=.960).
REL VARS=FQ4ODERS01R, FQ4ODERS02R, FQ4ODERS03, FQ4ODERS04, FQ4ODERS05, FQ4ODERS06R, FQ4ODERS07R, FQ4ODERS08R, FQ4ODERS09, 
    FQ4ODERS10R, FQ4ODERS11, FQ4ODERS12, FQ4ODERS13, FQ4ODERS14, FQ4ODERS15, FQ4ODERS16, FQ4ODERS17R, FQ4ODERS18, FQ4ODERS19,
    FQ4ODERS20R, FQ4ODERS21, FQ4ODERS22R, FQ4ODERS23, FQ4ODERS24R, FQ4ODERS25, FQ4ODERS26, FQ4ODERS27, FQ4ODERS28,
    FQ4ODERS29, FQ4ODERS30, FQ4ODERS31, FQ4ODERS32, FQ4ODERS33, FQ4ODERS34R, FQ4ODERS35, FQ4ODERS36
/SCALE(All)= ALL.
*Non-Acceptance of emotional responses (NA) (6 items; n=71; alpha=.893).
REL VARS=FQ4ODERS11, FQ4ODERS12, FQ4ODERS21, FQ4ODERS23, FQ4ODERS25, FQ4ODERS29
/SCALE(All)= ALL.
*Difficulty engaging in goal-directed behavior (GB) (5 items; n=72; alpha=.893).
REL VARS=FQ4ODERS13, FQ4ODERS18, FQ4ODERS20R, FQ4ODERS26, FQ4ODERS33
/SCALE(All)= ALL.
*Impulse control difficulties (IC) (6 items; n=72; alpha=.861).
REL VARS=FQ4ODERS03, FQ4ODERS14, FQ4ODERS19, FQ4ODERS24R, FQ4ODERS27, FQ4ODERS32
/SCALE(All)= ALL.
*Lack of emotional awareness (EA) (6 items; n=72; alpha=.859).
REL VARS=FQ4ODERS02R, FQ4ODERS06R, FQ4ODERS08R, FQ4ODERS10R, FQ4ODERS17R, FQ4ODERS34R
/SCALE(All)= ALL.
*Limited access to emotion regulation strategies (LA) (8 items; n=68; alpha=.919).
REL VARS=FQ4ODERS15, FQ4ODERS16, FQ4ODERS22R, FQ4ODERS28, FQ4ODERS30, FQ4ODERS31, FQ4ODERS35, FQ4ODERS36
/SCALE(All)= ALL.
*Lack of emotional clarity (EC) (5 items; n=72; alpha=.903).
REL VARS=FQ4ODERS01R, FQ4ODERS04, FQ4ODERS05, FQ4ODERS07R, FQ4ODERS09
/SCALE(All)= ALL.

*STEP 6: COUNTING MISSING DATA (TOTAL SCORE 1st, FOLLOWED BY SUBSCALES), THEN RECODING TO 0 TO AVOID NEGATIVE EFFECTS ON CONSTRUCTS.
*Non-Acceptance of emotional responses (NA). 
COUNT MISSNA=FQ4ODERS11, FQ4ODERS12, FQ4ODERS21, FQ4ODERS23, FQ4ODERS25, FQ4ODERS29 (-9999).
*Difficulty engaging in goal-directed behavior (GB).
COUNT MISSGB=FQ4ODERS13, FQ4ODERS18, FQ4ODERS20R, FQ4ODERS26, FQ4ODERS33 (-9999).
*Impulse control difficulties (IC).
COUNT MISSIC=FQ4ODERS03, FQ4ODERS14, FQ4ODERS19, FQ4ODERS24R, FQ4ODERS27, FQ4ODERS32 (-9999).
*Lack of emotional awareness (EA).
COUNT MISSEA=FQ4ODERS02R, FQ4ODERS06R, FQ4ODERS08R, FQ4ODERS10R, FQ4ODERS17R, FQ4ODERS34R (-9999).
*Limited access to emotion regulation strategies (LA).
COUNT MISSLA=FQ4ODERS15, FQ4ODERS16, FQ4ODERS22R, FQ4ODERS28, FQ4ODERS30, FQ4ODERS31, FQ4ODERS35, FQ4ODERS36 (-9999).
*Lack of emotional clarity (EC).
COUNT MISSEC=FQ4ODERS01R, FQ4ODERS04, FQ4ODERS05, FQ4ODERS07R, FQ4ODERS09 (-9999).

RECODE FQ4ODERS01 TO FQ4ODERS34R (-9999=0).
EXECUTE.

*STEP 7: CREATE TOTAL AND SUBSCALES SCORES  (CHECK THAT REVERSE-SCORED ITEMS INCLUDED).
*Note each subscale name and calculate missingness allowed (EXAMPLE BELOW).
*CREATING TOTAL SCORE.
*Total Score (36 items) -- USE MISSINGNESS FOR EACH SUBSCALE as a cut-off point.
COMPUTE FQ4ODERSTOT=-9999.
EXECUTE.
IF (MISSNA <  1.98  AND MISSGB < 1.65 AND MISSIC < 1.98 AND MISSEA < 1.98 AND MISSLA < 2.64 AND MISSEC < 1.65) FQ4ODERSTOT=RND(((FQ4ODERS01R + FQ4ODERS02R + FQ4ODERS03 + FQ4ODERS04 + FQ4ODERS05 + FQ4ODERS06R + FQ4ODERS07R + FQ4ODERS08R + FQ4ODERS09 + 
    FQ4ODERS10R + FQ4ODERS11 + FQ4ODERS12 + FQ4ODERS13 + FQ4ODERS14 + FQ4ODERS15 + FQ4ODERS16 + FQ4ODERS17R + FQ4ODERS18 + FQ4ODERS19 +
    FQ4ODERS20R + FQ4ODERS21 + FQ4ODERS22R + FQ4ODERS23 + FQ4ODERS24R + FQ4ODERS25 + FQ4ODERS26 + FQ4ODERS27 + FQ4ODERS28 +
    FQ4ODERS29 + FQ4ODERS30 + FQ4ODERS31 + FQ4ODERS32 + FQ4ODERS33 + FQ4ODERS34R + FQ4ODERS35 + FQ4ODERS36)/(36-MISSNA-MISSGB-MISSIC-MISSEA-MISSLA-MISSEC))*36).
EXECUTE.
*CREATING ALL SUBSCALES (CHECK THAT REVERSE-SCORED ITEMS INCLUDED).
*Nonacceptance of emotional responses (NA) (6 items) -- 66.7% (i.e., if MISS is less than or equal to 1.98) as a cut-off point.
COMPUTE FQ4ODERSNA=-9999.
EXECUTE.
IF (MISSNA < 1.98) FQ4ODERSNA=RND(((FQ4ODERS11+ FQ4ODERS12 + FQ4ODERS21 + FQ4ODERS23 + FQ4ODERS25 + FQ4ODERS29)/(6-MISSNA))*6).
EXECUTE.
*Difficulty engaging in goal-directed behavior (GB) (5 items) --  66.7% (i.e., if MISS is less than or equal to 1.65) as a cut-off point.
COMPUTE FQ4ODERSGB=-9999.
EXECUTE.
IF (MISSGB < 1.65) FQ4ODERSGB=RND(((FQ4ODERS13+ FQ4ODERS18 + FQ4ODERS20R + FQ4ODERS26 + FQ4ODERS33)/(5-MISSGB))*5).
EXECUTE.   
*Impulse control difficulties (IC) (6 items) -- 66.7% (i.e., if MISS is less than or equal to 1.98) as a cut-off point.
COMPUTE FQ4ODERSIC=-9999.
IF (MISSIC < 1.98) FQ4ODERSIC=RND(((FQ4ODERS03 + FQ4ODERS14 + FQ4ODERS19 + FQ4ODERS24R + FQ4ODERS27 + FQ4ODERS32)/(6-MISSIC))*6).
EXECUTE.    
*Lack of emotional awareness (EA) (6 items) -- 66.7% (i.e., if MISS is less than or equal to 1.98) as a cut-off point.
COMPUTE FQ4ODERSEA=-9999.
IF (MISSEA < 1.98) FQ4ODERSEA=RND(((FQ4ODERS02R+ FQ4ODERS06R + FQ4ODERS08R + FQ4ODERS10R + FQ4ODERS17R + FQ4ODERS34R)/(6-MISSEA))*6).
EXECUTE.    
*Limited access to emotion regulation strategies (LA) (8 items) -- 66.7% (i.e., if MISS is less than or equal to 2.64) as a cut-off point..
COMPUTE FQ4ODERSLA=-9999.
IF (MISSLA < 2.64) FQ4ODERSLA=RND(((FQ4ODERS15+ FQ4ODERS16 + FQ4ODERS22R + FQ4ODERS28 + FQ4ODERS30 + FQ4ODERS31 + FQ4ODERS35 + FQ4ODERS36)/(8-MISSLA))*8).
EXECUTE.  
*Lack of emotional clarity (EC) (5 items) --  66.7% (i.e., if MISS is less than or equal to 1.65) as a cut-off point. .
COMPUTE FQ4ODERSEC=-9999.
IF (MISSEC < 1.65) FQ4ODERSEC=RND(((FQ4ODERS01R+ FQ4ODERS04 + FQ4ODERS05 + FQ4ODERS07R + FQ4ODERS09)/(5-MISSEC))*5).
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
DO IF MISSING(FD4OSTAT).
DO REPEAT x = FQ4ODERSTOT TO FQ4ODERSEC.
RECODE FD4OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.
*Checking frequenices for constructs to look at missingness. 
FREQUENCIES VARIABLES=FD4OSTAT FQ4ODERSTOT FQ4ODERSNA FQ4ODERSGB FQ4ODERSIC FQ4ODERSEA FQ4ODERSLA FQ4ODERSEC 
  /ORDER=ANALYSIS.
*If there IS missingness that was not accounted for in the STAT variable (for example in DERSAC, participants who indicated they did not have an additional caregiver should be coded as -44
Each construct needs to be coded by ID here. **CHECKED AND NOT NEEDED.
*At this point, the only remaining missingness should represent when participant did not answer a sufficient number of questions, assuming STAT variable was correctly coded for this measure -- CHECK THIS! 
*The following syntax will recode this remaining missingness for each new construct.
IF (FQ4ODERSTOT=-9999) FQ4ODERSTOT=-43.
EXECUTE.  
IF (FQ4ODERSNA=-9999) FQ4ODERSNA=-43.
EXECUTE.  
IF (FQ4ODERSGB=-9999) FQ4ODERSGB=-43.
EXECUTE.  
IF (FQ4ODERSIC=-9999) FQ4ODERSIC=-43.
EXECUTE.  
IF (FQ4ODERSEA=-9999) FQ4ODERSEA=-43.
EXECUTE.  
IF (FQ4ODERSLA=-9999) FQ4ODERSLA=-43.
EXECUTE.  
IF (FQ4ODERSEC=-9999) FQ4ODERSEC=-43.
EXECUTE.  
MISSING VALUES
   FQ4ODERSTOT FQ4ODERSNA FQ4ODERSGB FQ4ODERSIC FQ4ODERSEA FQ4ODERSLA FQ4ODERSEC 
    (LO THRU -1).
EXECUTE.

*STEP 9: LABELING CONSTRUCTS.
VARIABLE LABELS
FQ4ODERSTOT 'DERS Total Score [FQ4ODERSTOT]'
FQ4ODERSNA 'DERS Nonacceptance of emotional responses [FQ4ODERSNA]'
FQ4ODERSGB 'DERS Difficulty engaging in goal-directed behavior [FQ4ODERSGB]'
FQ4ODERSIC 'DERS Impulse control difficulties [FQ4ODERSIC]'
FQ4ODERSEA 'DERS Lack of emotional awareness [FQ4ODERSEA]'
FQ4ODERSLA 'DERS Limited access to emotion regulation strategies [FQ4ODERSLA]'
FQ4ODERSEC 'DERS Lack of emotional clarity [FQ4ODERSEC]'.
EXECUTE.

*STEP 9A: ADD VALUE LABELS.
*Include ALL missing value labels (SEE STEP 8 FOR FULL LIST). 
*Be sure to also include value labels for any constructs that need labels (e.g., 0 'No', 1 'Yes'). Summed or averaged scores do NOT need value labels.
VALUE LABELS
FQ4ODERSTOT TO FQ4ODERSEC
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
FREQUENCIES VARIABLES=FD4OSTAT FQ4ODERSTOT FQ4ODERSNA FQ4ODERSGB FQ4ODERSIC FQ4ODERSEA FQ4ODERSLA FQ4ODERSEC 
  /ORDER=ANALYSIS.

*STEP 11: CHECK DESCRIPTIVES.
*Checking descriptives for all constructs.
DESCRIPTIVES VARIABLES=FQ4ODERSTOT FQ4ODERSNA FQ4ODERSGB FQ4ODERSIC FQ4ODERSEA FQ4ODERSLA FQ4ODERSEC 
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 12: SAVE CLEANED DATA FILE.
*First, sorting the data file by ID and resaving the final file.
*Using /KEEP command to keep ONLY ID + RD + the constructs that were created.
SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4ODERS_Constructs.sav'
  /KEEP ID FD4ORD FQ4ODERSTOT FQ4ODERSNA FQ4ODERSGB FQ4ODERSIC FQ4ODERSEA FQ4ODERSLA FQ4ODERSEC   
  /COMPRESSED.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4ODERS_Constructs.sav'.
EXECUTE.

*STEP 13: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE 
 OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4ODERS_Constructs.spv'
LOCK=NO.


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
 
*4-19-22(BM): Adapted syntax for A3.
*04-21-22(AAC): Checked.
*------------------------------------------------------------------------------.
*STEP 1: OPENING CLEANED DATA.
*Insert the correct file path and file name. Use syntax to open cleaned data file.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3ODERS_Cleaned.sav'.

*STEP 2: SAVING CLEANED DATA AS A CONSTRUCT FILE. 
*Insert the correct file path and file name.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3ODERS_Constructs.sav'
  /COMPRESSED.

*STEP 3: DESCRIPTIVE STATISTICS (1. FREQ AND 2. CORR) FOR RAW VARIABLES (TOTAL SCORE 1ST, THEN SUBSCALES).
*When running this step note any additional missingness (any other codes) that are not accounted for in the STAT variable. These missing codes (and corresponding IDs) will need to be 
incorporated in STEP 8 below.
FREQ VARS=FQ3ODERS01R, FQ3ODERS02R, FQ3ODERS03, FQ3ODERS04, FQ3ODERS05, FQ3ODERS06R, FQ3ODERS07R, FQ3ODERS08R, FQ3ODERS09, 
    FQ3ODERS10R, FQ3ODERS11, FQ3ODERS12, FQ3ODERS13, FQ3ODERS14, FQ3ODERS15, FQ3ODERS16, FQ3ODERS17R, FQ3ODERS18, FQ3ODERS19,
    FQ3ODERS20R, FQ3ODERS21, FQ3ODERS22R, FQ3ODERS23, FQ3ODERS24R, FQ3ODERS25, FQ3ODERS26, FQ3ODERS27, FQ3ODERS28,
    FQ3ODERS29, FQ3ODERS30, FQ3ODERS31, FQ3ODERS32, FQ3ODERS33, FQ3ODERS34R, FQ3ODERS35, FQ3ODERS36.
*DERS Total Score.
CORR VARS=FQ3ODERS01R, FQ3ODERS02R, FQ3ODERS03, FQ3ODERS04, FQ3ODERS05, FQ3ODERS06R, FQ3ODERS07R, FQ3ODERS08R, FQ3ODERS09, 
    FQ3ODERS10R, FQ3ODERS11, FQ3ODERS12, FQ3ODERS13, FQ3ODERS14, FQ3ODERS15, FQ3ODERS16, FQ3ODERS17R, FQ3ODERS18, FQ3ODERS19,
    FQ3ODERS20R, FQ3ODERS21, FQ3ODERS22R, FQ3ODERS23, FQ3ODERS24R, FQ3ODERS25, FQ3ODERS26, FQ3ODERS27, FQ3ODERS28,
    FQ3ODERS29, FQ3ODERS30, FQ3ODERS31, FQ3ODERS32, FQ3ODERS33, FQ3ODERS34R, FQ3ODERS35, FQ3ODERS36.
*Non-Acceptance of emotional responses (NA).
CORR VARS=FQ3ODERS11, FQ3ODERS12, FQ3ODERS21, FQ3ODERS23, FQ3ODERS25, FQ3ODERS29.
*Difficulty engaging in goal-directed behavior (GB).
CORR VARS=FQ3ODERS13, FQ3ODERS18, FQ3ODERS20R, FQ3ODERS26, FQ3ODERS33.
*Impulse control difficulties (IC).
CORR VARS=FQ3ODERS03, FQ3ODERS14, FQ3ODERS19, FQ3ODERS24R, FQ3ODERS27, FQ3ODERS32.
*Lack of emotional awareness (EA).
CORR VARS=FQ3ODERS02R, FQ3ODERS06R, FQ3ODERS08R, FQ3ODERS10R, FQ3ODERS17R, FQ3ODERS34R.
*Limited access to emotion regulation strategies (LA).
CORR VARS=FQ3ODERS15, FQ3ODERS16, FQ3ODERS22R, FQ3ODERS28, FQ3ODERS30, FQ3ODERS31, FQ3ODERS35, FQ3ODERS36.
*Lack of emotional clarity (EC).
CORR VARS=FQ3ODERS01R, FQ3ODERS04, FQ3ODERS05, FQ3ODERS07R, FQ3ODERS09.

*STEP 4: RECODING MISSING VALUES.
RECODE FQ3ODERS01 TO FQ3ODERS34R (MISSING=-9999).
EXECUTE.
    
*STEP 5: RELIABILITY STATISTICS (TOTAL SCORE 1st, FOLLOWED BY SUBSCALES).
*DERS Total Score (36 items; n=53; alpha=.972).
REL VARS=FQ3ODERS01R, FQ3ODERS02R, FQ3ODERS03, FQ3ODERS04, FQ3ODERS05, FQ3ODERS06R, FQ3ODERS07R, FQ3ODERS08R, FQ3ODERS09, 
    FQ3ODERS10R, FQ3ODERS11, FQ3ODERS12, FQ3ODERS13, FQ3ODERS14, FQ3ODERS15, FQ3ODERS16, FQ3ODERS17R, FQ3ODERS18, FQ3ODERS19,
    FQ3ODERS20R, FQ3ODERS21, FQ3ODERS22R, FQ3ODERS23, FQ3ODERS24R, FQ3ODERS25, FQ3ODERS26, FQ3ODERS27, FQ3ODERS28,
    FQ3ODERS29, FQ3ODERS30, FQ3ODERS31, FQ3ODERS32, FQ3ODERS33, FQ3ODERS34R, FQ3ODERS35, FQ3ODERS36
/SCALE(All)= ALL.
*Non-Acceptance of emotional responses (NA) (6 items; n=54; alpha=.922).
REL VARS=FQ3ODERS11, FQ3ODERS12, FQ3ODERS21, FQ3ODERS23, FQ3ODERS25, FQ3ODERS29
/SCALE(All)= ALL.
*Difficulty engaging in goal-directed behavior (GB) (5 items; n=54; alpha=.925).
REL VARS=FQ3ODERS13, FQ3ODERS18, FQ3ODERS20R, FQ3ODERS26, FQ3ODERS33
/SCALE(All)= ALL.
*Impulse control difficulties (IC) (6 items; n=54; alpha=.899).
REL VARS=FQ3ODERS03, FQ3ODERS14, FQ3ODERS19, FQ3ODERS24R, FQ3ODERS27, FQ3ODERS32
/SCALE(All)= ALL.
*Lack of emotional awareness (EA) (6 items; n=54; alpha=.831).
REL VARS=FQ3ODERS02R, FQ3ODERS06R, FQ3ODERS08R, FQ3ODERS10R, FQ3ODERS17R, FQ3ODERS34R
/SCALE(All)= ALL.
*Limited access to emotion regulation strategies (LA) (8 items; n=53; alpha=.936).
REL VARS=FQ3ODERS15, FQ3ODERS16, FQ3ODERS22R, FQ3ODERS28, FQ3ODERS30, FQ3ODERS31, FQ3ODERS35, FQ3ODERS36
/SCALE(All)= ALL.
*Lack of emotional clarity (EC) (5 items; n=54; alpha=.902).
REL VARS=FQ3ODERS01R, FQ3ODERS04, FQ3ODERS05, FQ3ODERS07R, FQ3ODERS09
/SCALE(All)= ALL.

*STEP 6: COUNTING MISSING DATA (TOTAL SCORE 1st, FOLLOWED BY SUBSCALES), THEN RECODING TO 0 TO AVOID NEGATIVE EFFECTS ON CONSTRUCTS.
*Non-Acceptance of emotional responses (NA). 
COUNT MISSNA=FQ3ODERS11, FQ3ODERS12, FQ3ODERS21, FQ3ODERS23, FQ3ODERS25, FQ3ODERS29 (-9999).
*Difficulty engaging in goal-directed behavior (GB).
COUNT MISSGB=FQ3ODERS13, FQ3ODERS18, FQ3ODERS20R, FQ3ODERS26, FQ3ODERS33 (-9999).
*Impulse control difficulties (IC).
COUNT MISSIC=FQ3ODERS03, FQ3ODERS14, FQ3ODERS19, FQ3ODERS24R, FQ3ODERS27, FQ3ODERS32 (-9999).
*Lack of emotional awareness (EA).
COUNT MISSEA=FQ3ODERS02R, FQ3ODERS06R, FQ3ODERS08R, FQ3ODERS10R, FQ3ODERS17R, FQ3ODERS34R (-9999).
*Limited access to emotion regulation strategies (LA).
COUNT MISSLA=FQ3ODERS15, FQ3ODERS16, FQ3ODERS22R, FQ3ODERS28, FQ3ODERS30, FQ3ODERS31, FQ3ODERS35, FQ3ODERS36 (-9999).
*Lack of emotional clarity (EC).
COUNT MISSEC=FQ3ODERS01R, FQ3ODERS04, FQ3ODERS05, FQ3ODERS07R, FQ3ODERS09 (-9999).

RECODE FQ3ODERS01 TO FQ3ODERS34R (-9999=0).
EXECUTE.

*STEP 7: CREATE TOTAL AND SUBSCALES SCORES  (CHECK THAT REVERSE-SCORED ITEMS INCLUDED).
*Note each subscale name and calculate missingness allowed (EXAMPLE BELOW).
*CREATING TOTAL SCORE.
*Total Score (36 items) -- USE MISSINGNESS FOR EACH SUBSCALE as a cut-off point.
COMPUTE FQ3ODERSTOT=-9999.
EXECUTE.
IF (MISSNA <  1.98  AND MISSGB < 1.65 AND MISSIC < 1.98 AND MISSEA < 1.98 AND MISSLA < 2.64 AND MISSEC < 1.65) FQ3ODERSTOT=RND(((FQ3ODERS01R + FQ3ODERS02R + FQ3ODERS03 + FQ3ODERS04 + FQ3ODERS05 + FQ3ODERS06R + FQ3ODERS07R + FQ3ODERS08R + FQ3ODERS09 + 
    FQ3ODERS10R + FQ3ODERS11 + FQ3ODERS12 + FQ3ODERS13 + FQ3ODERS14 + FQ3ODERS15 + FQ3ODERS16 + FQ3ODERS17R + FQ3ODERS18 + FQ3ODERS19 +
    FQ3ODERS20R + FQ3ODERS21 + FQ3ODERS22R + FQ3ODERS23 + FQ3ODERS24R + FQ3ODERS25 + FQ3ODERS26 + FQ3ODERS27 + FQ3ODERS28 +
    FQ3ODERS29 + FQ3ODERS30 + FQ3ODERS31 + FQ3ODERS32 + FQ3ODERS33 + FQ3ODERS34R + FQ3ODERS35 + FQ3ODERS36)/(36-MISSNA-MISSGB-MISSIC-MISSEA-MISSLA-MISSEC))*36).
EXECUTE.
*CREATING ALL SUBSCALES (CHECK THAT REVERSE-SCORED ITEMS INCLUDED).
*Nonacceptance of emotional responses (NA) (6 items) -- 66.7% (i.e., if MISS is less than or equal to 1.98) as a cut-off point.
COMPUTE FQ3ODERSNA=-9999.
EXECUTE.
IF (MISSNA < 1.98) FQ3ODERSNA=RND(((FQ3ODERS11+ FQ3ODERS12 + FQ3ODERS21 + FQ3ODERS23 + FQ3ODERS25 + FQ3ODERS29)/(6-MISSNA))*6).
EXECUTE.
*Difficulty engaging in goal-directed behavior (GB) (5 items) --  66.7% (i.e., if MISS is less than or equal to 1.65) as a cut-off point.
COMPUTE FQ3ODERSGB=-9999.
EXECUTE.
IF (MISSGB < 1.65) FQ3ODERSGB=RND(((FQ3ODERS13+ FQ3ODERS18 + FQ3ODERS20R + FQ3ODERS26 + FQ3ODERS33)/(5-MISSGB))*5).
EXECUTE.   
*Impulse control difficulties (IC) (6 items) -- 66.7% (i.e., if MISS is less than or equal to 1.98) as a cut-off point.
COMPUTE FQ3ODERSIC=-9999.
IF (MISSIC < 1.98) FQ3ODERSIC=RND(((FQ3ODERS03 + FQ3ODERS14 + FQ3ODERS19 + FQ3ODERS24R + FQ3ODERS27 + FQ3ODERS32)/(6-MISSIC))*6).
EXECUTE.    
*Lack of emotional awareness (EA) (6 items) -- 66.7% (i.e., if MISS is less than or equal to 1.98) as a cut-off point.
COMPUTE FQ3ODERSEA=-9999.
IF (MISSEA < 1.98) FQ3ODERSEA=RND(((FQ3ODERS02R+ FQ3ODERS06R + FQ3ODERS08R + FQ3ODERS10R + FQ3ODERS17R + FQ3ODERS34R)/(6-MISSEA))*6).
EXECUTE.    
*Limited access to emotion regulation strategies (LA) (8 items) -- 66.7% (i.e., if MISS is less than or equal to 2.64) as a cut-off point..
COMPUTE FQ3ODERSLA=-9999.
IF (MISSLA < 2.64) FQ3ODERSLA=RND(((FQ3ODERS15+ FQ3ODERS16 + FQ3ODERS22R + FQ3ODERS28 + FQ3ODERS30 + FQ3ODERS31 + FQ3ODERS35 + FQ3ODERS36)/(8-MISSLA))*8).
EXECUTE.  
*Lack of emotional clarity (EC) (5 items) --  66.7% (i.e., if MISS is less than or equal to 1.65) as a cut-off point. .
COMPUTE FQ3ODERSEC=-9999.
IF (MISSEC < 1.65) FQ3ODERSEC=RND(((FQ3ODERS01R+ FQ3ODERS04 + FQ3ODERS05 + FQ3ODERS07R + FQ3ODERS09)/(5-MISSEC))*5).
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
**-11 'Participant (parent or child) deceased'                                  /* (Participant (parent or child) deceased) */
**-10 'Prefer not to answer'                                                           /* (Participant selected prefer not to answer) */.
DO IF MISSING(FD3OSTAT).
DO REPEAT x = FQ3ODERSTOT TO FQ3ODERSEC.
RECODE FD3OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.
*Checking frequenices for constructs to look at missingness. 
FREQUENCIES VARIABLES=FD3OSTAT FQ3ODERSTOT FQ3ODERSNA FQ3ODERSGB FQ3ODERSIC FQ3ODERSEA FQ3ODERSLA FQ3ODERSEC 
  /ORDER=ANALYSIS.
*If there IS missingness that was not accounted for in the STAT variable (for example in DERSAC, participants who indicated they did not have an additional caregiver should be coded as -44
Each construct needs to be coded by ID here. **CHECKED AND NOT NEEDED.
*At this point, the only remaining missingness should represent when participant did not answer a sufficient number of questions, assuming STAT variable was correctly coded for this measure -- CHECK THIS! 
*The following syntax will recode this remaining missingness for each new construct.
IF (FQ3ODERSTOT=-9999) FQ3ODERSTOT=-43.
EXECUTE.  
IF (FQ3ODERSNA=-9999) FQ3ODERSNA=-43.
EXECUTE.  
IF (FQ3ODERSGB=-9999) FQ3ODERSGB=-43.
EXECUTE.  
IF (FQ3ODERSIC=-9999) FQ3ODERSIC=-43.
EXECUTE.  
IF (FQ3ODERSEA=-9999) FQ3ODERSEA=-43.
EXECUTE.  
IF (FQ3ODERSLA=-9999) FQ3ODERSLA=-43.
EXECUTE.  
IF (FQ3ODERSEC=-9999) FQ3ODERSEC=-43.
EXECUTE.  
MISSING VALUES
   FQ3ODERSTOT FQ3ODERSNA FQ3ODERSGB FQ3ODERSIC FQ3ODERSEA FQ3ODERSLA FQ3ODERSEC 
    (LO THRU -1).
EXECUTE.

*STEP 9: LABELING CONSTRUCTS.
VARIABLE LABELS
FQ3ODERSTOT 'DERS Total Score [FQ3ODERSTOT]'
FQ3ODERSNA 'DERS Nonacceptance of emotional responses [FQ3ODERSNA]'
FQ3ODERSGB 'DERS Difficulty engaging in goal-directed behavior [FQ3ODERSGB]'
FQ3ODERSIC 'DERS Impulse control difficulties [FQ3ODERSIC]'
FQ3ODERSEA 'DERS Lack of emotional awareness [FQ3ODERSEA]'
FQ3ODERSLA 'DERS Limited access to emotion regulation strategies [FQ3ODERSLA]'
FQ3ODERSEC 'DERS Lack of emotional clarity [FQ3ODERSEC]'.
EXECUTE.

*STEP 9A: ADD VALUE LABELS.
*Include ALL missing value labels (SEE STEP 8 FOR FULL LIST). 
*Be sure to also include value labels for any constructs that need labels (e.g., 0 'No', 1 'Yes'). Summed or averaged scores do NOT need value labels.
VALUE LABELS
FQ3ODERSTOT TO FQ3ODERSEC
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
FREQUENCIES VARIABLES=FD3OSTAT FQ3ODERSTOT FQ3ODERSNA FQ3ODERSGB FQ3ODERSIC FQ3ODERSEA FQ3ODERSLA FQ3ODERSEC 
  /ORDER=ANALYSIS.

*STEP 11: CHECK DESCRIPTIVES.
*Checking descriptives for all constructs.
DESCRIPTIVES VARIABLES=FQ3ODERSTOT FQ3ODERSNA FQ3ODERSGB FQ3ODERSIC FQ3ODERSEA FQ3ODERSLA FQ3ODERSEC 
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 12: SAVE CLEANED DATA FILE.
*First, sorting the data file by ID and resaving the final file.
*Using /KEEP command to keep ONLY ID + RD + the constructs that were created.
SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3ODERS_Constructs.sav'
  /KEEP ID FD3ORD FQ3ODERSTOT FQ3ODERSNA FQ3ODERSGB FQ3ODERSIC FQ3ODERSEA FQ3ODERSLA FQ3ODERSEC   
  /COMPRESSED.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3ODERS_Constructs.sav'.
EXECUTE.

*STEP 13: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE 
 OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3ODERS_Constructs.spv'
LOCK=NO.


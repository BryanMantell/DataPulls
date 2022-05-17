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
 
*12-17-21(BM): Adapted syntax for UO DERS. Completed STEPS 1-13.
*1-3-22(BM): Doubled check STEPS 1 -13.
*1-5-22(BM): Updated STEP 7.
*1-6-22(BM): Updated STEP 5 and 7.
*1-12-22(AAC): Checked. Switched STEPS 3 + 4 to match template. 
*3-9-22(AAC): Rerun after fixing reverse coded value labels. 
*4-13-22(AAC): Reran with no changes.
*4-24-22(AAC): Re-ran with no changes to update output file. 
*------------------------------------------------------------------------------.
*STEP 1: OPENING CLEANED DATA.
*Insert the correct file path and file name. Use syntax to open cleaned data file.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1ODERS_Cleaned.sav'.

*STEP 2: SAVING CLEANED DATA AS A CONSTRUCT FILE. 
*Insert the correct file path and file name.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1ODERS_Constructs.sav'
  /COMPRESSED.

*STEP 3: DESCRIPTIVE STATISTICS (1. FREQ AND 2. CORR) FOR RAW VARIABLES (TOTAL SCORE 1ST, THEN SUBSCALES).
*When running this step note any additional missingness (any other codes) that are not accounted for in the STAT variable. These missing codes (and corresponding IDs) will need to be 
incorporated in STEP 8 below.
FREQ VARS=FQ1ODERS01R, FQ1ODERS02R, FQ1ODERS03, FQ1ODERS04, FQ1ODERS05, FQ1ODERS06R, FQ1ODERS07R, FQ1ODERS08R, FQ1ODERS09, 
    FQ1ODERS10R, FQ1ODERS11, FQ1ODERS12, FQ1ODERS13, FQ1ODERS14, FQ1ODERS15, FQ1ODERS16, FQ1ODERS17R, FQ1ODERS18, FQ1ODERS19,
    FQ1ODERS20R, FQ1ODERS21, FQ1ODERS22R, FQ1ODERS23, FQ1ODERS24R, FQ1ODERS25, FQ1ODERS26, FQ1ODERS27, FQ1ODERS28,
    FQ1ODERS29, FQ1ODERS30, FQ1ODERS31, FQ1ODERS32, FQ1ODERS33, FQ1ODERS34R, FQ1ODERS35, FQ1ODERS36.
*DERS Total Score.
CORR VARS=FQ1ODERS01R, FQ1ODERS02R, FQ1ODERS03, FQ1ODERS04, FQ1ODERS05, FQ1ODERS06R, FQ1ODERS07R, FQ1ODERS08R, FQ1ODERS09, 
    FQ1ODERS10R, FQ1ODERS11, FQ1ODERS12, FQ1ODERS13, FQ1ODERS14, FQ1ODERS15, FQ1ODERS16, FQ1ODERS17R, FQ1ODERS18, FQ1ODERS19,
    FQ1ODERS20R, FQ1ODERS21, FQ1ODERS22R, FQ1ODERS23, FQ1ODERS24R, FQ1ODERS25, FQ1ODERS26, FQ1ODERS27, FQ1ODERS28,
    FQ1ODERS29, FQ1ODERS30, FQ1ODERS31, FQ1ODERS32, FQ1ODERS33, FQ1ODERS34R, FQ1ODERS35, FQ1ODERS36.
*Non-Acceptance of emotional responses (NA).
CORR VARS=FQ1ODERS11, FQ1ODERS12, FQ1ODERS21, FQ1ODERS23, FQ1ODERS25, FQ1ODERS29.
*Difficulty engaging in goal-directed behavior (GB).
CORR VARS=FQ1ODERS13, FQ1ODERS18, FQ1ODERS20R, FQ1ODERS26, FQ1ODERS33.
*Impulse control difficulties (IC).
CORR VARS=FQ1ODERS03, FQ1ODERS14, FQ1ODERS19, FQ1ODERS24R, FQ1ODERS27, FQ1ODERS32.
*Lack of emotional awareness (EA).
CORR VARS=FQ1ODERS02R, FQ1ODERS06R, FQ1ODERS08R, FQ1ODERS10R, FQ1ODERS17R, FQ1ODERS34R.
*Limited access to emotion regulation strategies (LA).
CORR VARS=FQ1ODERS15, FQ1ODERS16, FQ1ODERS22R, FQ1ODERS28, FQ1ODERS30, FQ1ODERS31, FQ1ODERS35, FQ1ODERS36.
*Lack of emotional clarity (EC).
CORR VARS=FQ1ODERS01R, FQ1ODERS04, FQ1ODERS05, FQ1ODERS07R, FQ1ODERS09.

*STEP 4: RECODING MISSING VALUES.
RECODE FQ1ODERS01 TO FQ1ODERS34R (MISSING=-9999).
EXECUTE.
    
*STEP 5: RELIABILITY STATISTICS (TOTAL SCORE 1st, FOLLOWED BY SUBSCALES).
*DERS Total Score (36 items; n=78; alpha=.975).
REL VARS=FQ1ODERS01R, FQ1ODERS02R, FQ1ODERS03, FQ1ODERS04, FQ1ODERS05, FQ1ODERS06R, FQ1ODERS07R, FQ1ODERS08R, FQ1ODERS09, 
    FQ1ODERS10R, FQ1ODERS11, FQ1ODERS12, FQ1ODERS13, FQ1ODERS14, FQ1ODERS15, FQ1ODERS16, FQ1ODERS17R, FQ1ODERS18, FQ1ODERS19,
    FQ1ODERS20R, FQ1ODERS21, FQ1ODERS22R, FQ1ODERS23, FQ1ODERS24R, FQ1ODERS25, FQ1ODERS26, FQ1ODERS27, FQ1ODERS28,
    FQ1ODERS29, FQ1ODERS30, FQ1ODERS31, FQ1ODERS32, FQ1ODERS33, FQ1ODERS34R, FQ1ODERS35, FQ1ODERS36
/SCALE(All)= ALL.
*Non-Acceptance of emotional responses (NA) (6 items; n=80; alpha=.949).
REL VARS=FQ1ODERS11, FQ1ODERS12, FQ1ODERS21, FQ1ODERS23, FQ1ODERS25, FQ1ODERS29
/SCALE(All)= ALL.
*Difficulty engaging in goal-directed behavior (GB) (5 items; n=80; alpha=.905).
REL VARS=FQ1ODERS13, FQ1ODERS18, FQ1ODERS20R, FQ1ODERS26, FQ1ODERS33
/SCALE(All)= ALL.
*Impulse control difficulties (IC) (6 items; n=80; alpha=.942).
REL VARS=FQ1ODERS03, FQ1ODERS14, FQ1ODERS19, FQ1ODERS24R, FQ1ODERS27, FQ1ODERS32
/SCALE(All)= ALL.
*Lack of emotional awareness (EA) (6 items; n=80; alpha=.849).
REL VARS=FQ1ODERS02R, FQ1ODERS06R, FQ1ODERS08R, FQ1ODERS10R, FQ1ODERS17R, FQ1ODERS34R
/SCALE(All)= ALL.
*Limited access to emotion regulation strategies (LA) (8 items; n=78; alpha=.943).
REL VARS=FQ1ODERS15, FQ1ODERS16, FQ1ODERS22R, FQ1ODERS28, FQ1ODERS30, FQ1ODERS31, FQ1ODERS35, FQ1ODERS36
/SCALE(All)= ALL.
*Lack of emotional clarity (EC) (5 items; n=79; alpha=.919).
REL VARS=FQ1ODERS01R, FQ1ODERS04, FQ1ODERS05, FQ1ODERS07R, FQ1ODERS09
/SCALE(All)= ALL.

*STEP 6: COUNTING MISSING DATA (TOTAL SCORE 1st, FOLLOWED BY SUBSCALES), THEN RECODING TO 0 TO AVOID NEGATIVE EFFECTS ON CONSTRUCTS.
*Non-Acceptance of emotional responses (NA). 
COUNT MISSNA=FQ1ODERS11, FQ1ODERS12, FQ1ODERS21, FQ1ODERS23, FQ1ODERS25, FQ1ODERS29 (-9999).
*Difficulty engaging in goal-directed behavior (GB).
COUNT MISSGB=FQ1ODERS13, FQ1ODERS18, FQ1ODERS20R, FQ1ODERS26, FQ1ODERS33 (-9999).
*Impulse control difficulties (IC).
COUNT MISSIC=FQ1ODERS03, FQ1ODERS14, FQ1ODERS19, FQ1ODERS24R, FQ1ODERS27, FQ1ODERS32 (-9999).
*Lack of emotional awareness (EA).
COUNT MISSEA=FQ1ODERS02R, FQ1ODERS06R, FQ1ODERS08R, FQ1ODERS10R, FQ1ODERS17R, FQ1ODERS34R (-9999).
*Limited access to emotion regulation strategies (LA).
COUNT MISSLA=FQ1ODERS15, FQ1ODERS16, FQ1ODERS22R, FQ1ODERS28, FQ1ODERS30, FQ1ODERS31, FQ1ODERS35, FQ1ODERS36 (-9999).
*Lack of emotional clarity (EC).
COUNT MISSEC=FQ1ODERS01R, FQ1ODERS04, FQ1ODERS05, FQ1ODERS07R, FQ1ODERS09 (-9999).

RECODE FQ1ODERS01 TO FQ1ODERS34R (-9999=0).
EXECUTE.

*STEP 7: CREATE TOTAL AND SUBSCALES SCORES  (CHECK THAT REVERSE-SCORED ITEMS INCLUDED).
*Note each subscale name and calculate missingness allowed (EXAMPLE BELOW).
*CREATING TOTAL SCORE.
*Total Score (36 items) -- USE MISSINGNESS FOR EACH SUBSCALE as a cut-off point.
COMPUTE FQ1ODERSTOT=-9999.
EXECUTE.
IF (MISSNA <  1.98  AND MISSGB < 1.65 AND MISSIC < 1.98 AND MISSEA < 1.98 AND MISSLA < 2.64 AND MISSEC < 1.65) FQ1ODERSTOT=RND(((FQ1ODERS01R + FQ1ODERS02R + FQ1ODERS03 + FQ1ODERS04 + FQ1ODERS05 + FQ1ODERS06R + FQ1ODERS07R + FQ1ODERS08R + FQ1ODERS09 + 
    FQ1ODERS10R + FQ1ODERS11 + FQ1ODERS12 + FQ1ODERS13 + FQ1ODERS14 + FQ1ODERS15 + FQ1ODERS16 + FQ1ODERS17R + FQ1ODERS18 + FQ1ODERS19 +
    FQ1ODERS20R + FQ1ODERS21 + FQ1ODERS22R + FQ1ODERS23 + FQ1ODERS24R + FQ1ODERS25 + FQ1ODERS26 + FQ1ODERS27 + FQ1ODERS28 +
    FQ1ODERS29 + FQ1ODERS30 + FQ1ODERS31 + FQ1ODERS32 + FQ1ODERS33 + FQ1ODERS34R + FQ1ODERS35 + FQ1ODERS36)/(36-MISSNA-MISSGB-MISSIC-MISSEA-MISSLA-MISSEC))*36).
EXECUTE.
*CREATING ALL SUBSCALES (CHECK THAT REVERSE-SCORED ITEMS INCLUDED).
*Nonacceptance of emotional responses (NA) (6 items) -- 66.7% (i.e., if MISS is less than or equal to 1.98) as a cut-off point.
COMPUTE FQ1ODERSNA=-9999.
EXECUTE.
IF (MISSNA < 1.98) FQ1ODERSNA=RND(((FQ1ODERS11+ FQ1ODERS12 + FQ1ODERS21 + FQ1ODERS23 + FQ1ODERS25 + FQ1ODERS29)/(6-MISSNA))*6).
EXECUTE.
*Difficulty engaging in goal-directed behavior (GB) (5 items) --  66.7% (i.e., if MISS is less than or equal to 1.65) as a cut-off point.
COMPUTE FQ1ODERSGB=-9999.
EXECUTE.
IF (MISSGB < 1.65) FQ1ODERSGB=RND(((FQ1ODERS13+ FQ1ODERS18 + FQ1ODERS20R + FQ1ODERS26 + FQ1ODERS33)/(5-MISSGB))*5).
EXECUTE.   
*Impulse control difficulties (IC) (6 items) -- 66.7% (i.e., if MISS is less than or equal to 1.98) as a cut-off point.
COMPUTE FQ1ODERSIC=-9999.
IF (MISSIC < 1.98) FQ1ODERSIC=RND(((FQ1ODERS03 + FQ1ODERS14 + FQ1ODERS19 + FQ1ODERS24R + FQ1ODERS27 + FQ1ODERS32)/(6-MISSIC))*6).
EXECUTE.    
*Lack of emotional awareness (EA) (6 items) -- 66.7% (i.e., if MISS is less than or equal to 1.98) as a cut-off point.
COMPUTE FQ1ODERSEA=-9999.
IF (MISSEA < 1.98) FQ1ODERSEA=RND(((FQ1ODERS02R+ FQ1ODERS06R + FQ1ODERS08R + FQ1ODERS10R + FQ1ODERS17R + FQ1ODERS34R)/(6-MISSEA))*6).
EXECUTE.    
*Limited access to emotion regulation strategies (LA) (8 items) -- 66.7% (i.e., if MISS is less than or equal to 2.64) as a cut-off point..
COMPUTE FQ1ODERSLA=-9999.
IF (MISSLA < 2.64) FQ1ODERSLA=RND(((FQ1ODERS15+ FQ1ODERS16 + FQ1ODERS22R + FQ1ODERS28 + FQ1ODERS30 + FQ1ODERS31 + FQ1ODERS35 + FQ1ODERS36)/(8-MISSLA))*8).
EXECUTE.  
*Lack of emotional clarity (EC) (5 items) --  66.7% (i.e., if MISS is less than or equal to 1.65) as a cut-off point. .
COMPUTE FQ1ODERSEC=-9999.
IF (MISSEC < 1.65) FQ1ODERSEC=RND(((FQ1ODERS01R+ FQ1ODERS04 + FQ1ODERS05 + FQ1ODERS07R + FQ1ODERS09)/(5-MISSEC))*5).
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
DO REPEAT x = FQ1ODERSTOT TO FQ1ODERSEC.
RECODE FD1OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.
*Checking frequenices for constructs to look at missingness. 
FREQUENCIES VARIABLES=FD1OSTAT FQ1ODERSTOT FQ1ODERSNA FQ1ODERSGB FQ1ODERSIC FQ1ODERSEA FQ1ODERSLA FQ1ODERSEC 
  /ORDER=ANALYSIS.
*If there IS missingness that was not accounted for in the STAT variable (for example in DERSAC, participants who indicated they did not have an additional caregiver should be coded as -44
Each construct needs to be coded by ID here. **CHECKED AND NOT NEEDED.
*At this point, the only remaining missingness should represent when participant did not answer a sufficient number of questions, assuming STAT variable was correctly coded for this measure -- CHECK THIS! 
*The following syntax will recode this remaining missingness for each new construct.
IF (FQ1ODERSTOT=-9999) FQ1ODERSTOT=-43.
EXECUTE.  
IF (FQ1ODERSNA=-9999) FQ1ODERSNA=-43.
EXECUTE.  
IF (FQ1ODERSGB=-9999) FQ1ODERSGB=-43.
EXECUTE.  
IF (FQ1ODERSIC=-9999) FQ1ODERSIC=-43.
EXECUTE.  
IF (FQ1ODERSEA=-9999) FQ1ODERSEA=-43.
EXECUTE.  
IF (FQ1ODERSLA=-9999) FQ1ODERSLA=-43.
EXECUTE.  
IF (FQ1ODERSEC=-9999) FQ1ODERSEC=-43.
EXECUTE.  
MISSING VALUES
   FQ1ODERSTOT FQ1ODERSNA FQ1ODERSGB FQ1ODERSIC FQ1ODERSEA FQ1ODERSLA FQ1ODERSEC 
    (LO THRU -1).
EXECUTE.

*STEP 9: LABELING CONSTRUCTS.
VARIABLE LABELS
FQ1ODERSTOT 'DERS Total Score [FQ1ODERSTOT]'
FQ1ODERSNA 'DERS Nonacceptance of emotional responses [FQ1ODERSNA]'
FQ1ODERSGB 'DERS Difficulty engaging in goal-directed behavior [FQ1ODERSGB]'
FQ1ODERSIC 'DERS Impulse control difficulties [FQ1ODERSIC]'
FQ1ODERSEA 'DERS Lack of emotional awareness [FQ1ODERSEA]'
FQ1ODERSLA 'DERS Limited access to emotion regulation strategies [FQ1ODERSLA]'
FQ1ODERSEC 'DERS Lack of emotional clarity [FQ1ODERSEC]'.
EXECUTE.

*STEP 9A: ADD VALUE LABELS.
*Include ALL missing value labels (SEE STEP 8 FOR FULL LIST). 
*Be sure to also include value labels for any constructs that need labels (e.g., 0 'No', 1 'Yes'). Summed or averaged scores do NOT need value labels.
VALUE LABELS
FQ1ODERSTOT TO FQ1ODERSEC
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
FREQUENCIES VARIABLES=FD1OSTAT FQ1ODERSTOT FQ1ODERSNA FQ1ODERSGB FQ1ODERSIC FQ1ODERSEA FQ1ODERSLA FQ1ODERSEC 
  /ORDER=ANALYSIS.

*STEP 11: CHECK DESCRIPTIVES.
*Checking descriptives for all constructs.
DESCRIPTIVES VARIABLES=FQ1ODERSTOT FQ1ODERSNA FQ1ODERSGB FQ1ODERSIC FQ1ODERSEA FQ1ODERSLA FQ1ODERSEC 
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 12: SAVE CLEANED DATA FILE.
*First, sorting the data file by ID and resaving the final file.
*Using /KEEP command to keep ONLY ID + RD + the constructs that were created.
SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1ODERS_Constructs.sav'
  /KEEP ID FD1ORD FQ1ODERSTOT FQ1ODERSNA FQ1ODERSGB FQ1ODERSIC FQ1ODERSEA FQ1ODERSLA FQ1ODERSEC   
  /COMPRESSED.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1ODERS_Constructs.sav'.
EXECUTE.

*STEP 13: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE 
 OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1ODERS_Constructs.spv'
LOCK=NO.


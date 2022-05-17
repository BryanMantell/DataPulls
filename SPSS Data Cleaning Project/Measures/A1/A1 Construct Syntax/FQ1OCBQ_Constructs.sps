* Encoding: UTF-8.
*STEP 0: NOTES.
*CHILD BEHAVIOR QUESTIONNAIRE-VERY SHORT FORM (CBQ-VSF).
*CREATED THE FOLLOWING SUBSCALES & RAN APLHAS; LIST SUBSCALES BELOW.
*Surgency (SUR). 
*Negative Affect (NA). 
*Effortful Control (EC).
 
*01-18-22(BM): Adapted syntax for CBQ completed STEP 1-STEP 13.
*01-19-22(BM): Double checked Measure.
*01-24-22(AAC): CHECKED.
*03-14-22(AAC): Updated with reverse scored items.
*03-16-22(BM): Changed subscales from sums to means.
*03-28-22(AAC): Checked.

*--------------------------------------------------------------------------------------------------------------------------------.
*STEP 1: OPENING CLEANED DATA.
*Insert the correct file path and file name. Use syntax to open cleaned data file.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OCBQ_Cleaned.sav'.

*STEP 2: SAVING CLEANED DATA AS A CONSTRUCT FILE. 
*Insert the correct file path and file name.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OCBQ_Constructs.sav'
  /COMPRESSED.

*STEP 3: DESCRIPTIVE STATISTICS (1. FREQ AND 2. CORR) FOR RAW VARIABLES (TOTAL SCORE 1ST, THEN SUBSCALES).
*When running this step note any additional missingness (any other codes) that are not accounted for in the STAT variable. These missing codes (and corresponding IDs) will need to be 
incorporated in STEP 8 below.
FREQ VARS=FQ1OCBQ01, FQ1OCBQ02, FQ1OCBQ03, FQ1OCBQ04, FQ1OCBQ05, FQ1OCBQ06, FQ1OCBQ07, 
FQ1OCBQ08, FQ1OCBQ09, FQ1OCBQ10, FQ1OCBQ11, FQ1OCBQ12, FQ1OCBQ13R,  
FQ1OCBQ14, FQ1OCBQ15, FQ1OCBQ16 , FQ1OCBQ17, FQ1OCBQ18, FQ1OCBQ19R,
FQ1OCBQ20R, FQ1OCBQ21, FQ1OCBQ22R, FQ1OCBQ23, FQ1OCBQ24, FQ1OCBQ25, 
FQ1OCBQ26R, FQ1OCBQ27, FQ1OCBQ28, FQ1OCBQ29R, FQ1OCBQ30, FQ1OCBQ31R, 
FQ1OCBQ32, FQ1OCBQ33, FQ1OCBQ34R, FQ1OCBQ35, FQ1OCBQ36. 
*Surgency (SUR). 
CORR VARS=FQ1OCBQ01, FQ1OCBQ04, FQ1OCBQ07, FQ1OCBQ10, FQ1OCBQ13R, FQ1OCBQ16, FQ1OCBQ19R, FQ1OCBQ22R, FQ1OCBQ25, FQ1OCBQ28, FQ1OCBQ31R, FQ1OCBQ34R.
*Negative Affect (NA).
CORR VARS=FQ1OCBQ02, FQ1OCBQ05, FQ1OCBQ08, FQ1OCBQ11, FQ1OCBQ14, FQ1OCBQ17, FQ1OCBQ20R, FQ1OCBQ23, FQ1OCBQ26R, FQ1OCBQ29R, FQ1OCBQ32, FQ1OCBQ35.
*Effortful Control (EC).
CORR VARS=FQ1OCBQ03, FQ1OCBQ06, FQ1OCBQ09, FQ1OCBQ12, FQ1OCBQ15, FQ1OCBQ18, FQ1OCBQ21, FQ1OCBQ24, FQ1OCBQ27, FQ1OCBQ30, FQ1OCBQ33, FQ1OCBQ36.       
   
*STEP 4: RECODING MISSING VALUES.
RECODE FQ1OCBQ01 TO FQ1OCBQ34R (MISSING=-9999).
EXECUTE.
    
*STEP 5: RELIABILITY STATISTICS (TOTAL SCORE 1st, FOLLOWED BY SUBSCALES).
*Surgency (SUR) (12 items; n=75; alpha=.754).
REL VARS=FQ1OCBQ01, FQ1OCBQ04, FQ1OCBQ07, FQ1OCBQ10, FQ1OCBQ13R, FQ1OCBQ16, FQ1OCBQ19R, FQ1OCBQ22R, FQ1OCBQ25, FQ1OCBQ28, FQ1OCBQ31R, FQ1OCBQ34R
/SCALE(All)= ALL.
*Negative Affect (NA) (12 items; n=70; alpha=.793).
REL VARS=FQ1OCBQ02, FQ1OCBQ05, FQ1OCBQ08, FQ1OCBQ11, FQ1OCBQ14, FQ1OCBQ17, FQ1OCBQ20R, FQ1OCBQ23, FQ1OCBQ26R, FQ1OCBQ29R, FQ1OCBQ32, FQ1OCBQ35
/SCALE(All)= ALL.
*Effortful Control (EC) (12 items; n=66; alpha=.738).
REL VARS=FQ1OCBQ03, FQ1OCBQ06, FQ1OCBQ09, FQ1OCBQ12, FQ1OCBQ15, FQ1OCBQ18, FQ1OCBQ21, FQ1OCBQ24, FQ1OCBQ27, FQ1OCBQ30, FQ1OCBQ33, FQ1OCBQ36
/SCALE(All)= ALL.

*STEP 6: COUNTING MISSING DATA (JUST SUBSCALES), THEN RECODING TO 0 TO AVOID NEGATIVE EFFECTS ON CONSTRUCTS.
*Surgency (SUR).
COUNT MISSSUR=FQ1OCBQ01, FQ1OCBQ04, FQ1OCBQ07, FQ1OCBQ10, FQ1OCBQ13R, FQ1OCBQ16, FQ1OCBQ19R, FQ1OCBQ22R, FQ1OCBQ25, FQ1OCBQ28, FQ1OCBQ31R, FQ1OCBQ34R (-9999).
*Negative Affect (NA).
COUNT MISSNA=FQ1OCBQ02, FQ1OCBQ05, FQ1OCBQ08, FQ1OCBQ11, FQ1OCBQ14, FQ1OCBQ17, FQ1OCBQ20R, FQ1OCBQ23, FQ1OCBQ26R, FQ1OCBQ29R, FQ1OCBQ32, FQ1OCBQ35 (-9999).
*Effortful Control (EC).
COUNT MISSEC=FQ1OCBQ03, FQ1OCBQ06, FQ1OCBQ09, FQ1OCBQ12, FQ1OCBQ15, FQ1OCBQ18, FQ1OCBQ21, FQ1OCBQ24, FQ1OCBQ27, FQ1OCBQ30, FQ1OCBQ33, FQ1OCBQ36 (-9999).

RECODE FQ1OCBQ01 TO FQ1OCBQ34R (-9999=0).
EXECUTE.

*STEP 7: CREATE TOTAL AND SUBSCALES SCORES  (CHECK THAT REVERSE-SCORED ITEMS INCLUDED).
*Note each subscale name and calculate missingness allowed.
*CREATING TOTAL SCORE.
**CHECKED AND NOT NEEDED.
*CREATING ALL SUBSCALES (CHECK THAT REVERSE-SCORED ITEMS INCLUDED).
*Surgency (SUR) (12 items) -- 66.7% (i.e., if MISS is less than or equal to 3.96) as a cut-off point.
COMPUTE FQ1OCBQSUR=-9999.
EXECUTE.
IF (MISSSUR < 3.96) FQ1OCBQSUR=RND(((FQ1OCBQ01 + FQ1OCBQ04 + FQ1OCBQ07 + FQ1OCBQ10 + FQ1OCBQ13R + FQ1OCBQ16 + FQ1OCBQ19R + FQ1OCBQ22R + FQ1OCBQ25 + FQ1OCBQ28 + FQ1OCBQ31R + FQ1OCBQ34R)/(12-MISSSUR))).
EXECUTE.
*Negative Affect (NA) (12 items) --  66.7% (i.e., if MISS is less than or equal to 3.96) as a cut-off point.
COMPUTE FQ1OCBQNA=-9999.
EXECUTE.
IF (MISSNA < 3.96) FQ1OCBQNA=RND(((FQ1OCBQ02 + FQ1OCBQ05 + FQ1OCBQ08 + FQ1OCBQ11 + FQ1OCBQ14 + FQ1OCBQ17 + FQ1OCBQ20R + FQ1OCBQ23 + FQ1OCBQ26R + FQ1OCBQ29R + FQ1OCBQ32 + FQ1OCBQ35)/(12-MISSNA))).
EXECUTE.   
*Effortful Control (EC) (12 items) -- 66.7% (i.e., if MISS is less than or equal to 3.96) as a cut-off point.
COMPUTE FQ1OCBQEC=-9999.
IF (MISSEC < 3.96) FQ1OCBQEC=RND(((FQ1OCBQ03 + FQ1OCBQ06 + FQ1OCBQ09 + FQ1OCBQ12 + FQ1OCBQ15 + FQ1OCBQ18 + FQ1OCBQ21 + FQ1OCBQ24 + FQ1OCBQ27 + FQ1OCBQ30 + FQ1OCBQ33 + FQ1OCBQ36)/(12-MISSEC))).
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
**-11 'Participant (parent or child) deceased'                                  /* (Participant (parent or child) deceased) */
**-10 'Prefer not to answer'                                                           /* (Participant selected prefer not to answer) */.
DO IF MISSING(FD1OSTAT).
DO REPEAT x = FQ1OCBQSUR TO FQ1OCBQEC.
RECODE FD1OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.
*Checking frequenices for constructs to look at missingness. 
FREQUENCIES VARIABLES=FD1OSTAT FQ1OCBQSUR FQ1OCBQNA FQ1OCBQEC 
  /ORDER=ANALYSIS.
*If there IS missingness that was not accounted for in the STAT variable (for example in DERSAC, participants who indicated they did not have an additional caregiver should be coded as -44
Each construct needs to be coded by ID here. If there IS NO additional missingess not accounted for, delete only this section of syntax and write **CHECKED AND NOT NEEDED.
**CHECKED AND NOT NEEDED.
*At this point, the only remaining missingness should represent when participant did not answer a sufficient number of questions, assuming STAT variable was correctly coded for this measure -- CHECK THIS! 
*The following syntax will recode this remaining missingness for each new construct.
IF (FQ1OCBQSUR=-9999) FQ1OCBQSUR=-43.
EXECUTE.  
IF (FQ1OCBQNA=-9999) FQ1OCBQNA=-43.
EXECUTE.  
IF (FQ1OCBQEC=-9999) FQ1OCBQEC=-43.
EXECUTE.  
MISSING VALUES
   FQ1OCBQSUR FQ1OCBQNA FQ1OCBQEC 
    (LO THRU -1).
EXECUTE.

*STEP 9: LABELING CONSTRUCTS.
VARIABLE LABELS
FQ1OCBQSUR 'CBQ Surgency [FQ1OCBQSUR]'
FQ1OCBQNA 'CBQ Negative Affect [FQ1OCBQNA]'
FQ1OCBQEC 'CBQ Effortful Control [FQ1OCBQEC]'.
EXECUTE.


*STEP 9A: ADD VALUE LABELS.
*Include ALL missing value labels (SEE STEP 8 FOR FULL LIST). 
*Be sure to also include value labels for any constructs that need labels (e.g., 0 'No', 1 'Yes'). Summed or averaged scores do NOT need value labels.
VALUE LABELS
FQ1OCBQSUR TO FQ1OCBQEC
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
FREQUENCIES VARIABLES=FD1OSTAT FQ1OCBQSUR FQ1OCBQNA FQ1OCBQEC
  /ORDER=ANALYSIS.

*STEP 11: CHECK DESCRIPTIVES.
*Checking descriptives for all constructs.
DESCRIPTIVES VARIABLES=FQ1OCBQSUR FQ1OCBQNA FQ1OCBQEC
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 12: SAVE CLEANED DATA FILE.
*First, sorting the data file by ID and resaving the final file.
*Using /KEEP command to keep ONLY ID + RD + the constructs that were created. 
SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OCBQ_Constructs.sav'
  /KEEP ID FD1ORD FQ1OCBQSUR FQ1OCBQNA FQ1OCBQEC
  /COMPRESSED.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OCBQ_Constructs.sav'.
EXECUTE.

*STEP 13: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE 
 OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OCBQ_Constructs.spv'
LOCK=NO.


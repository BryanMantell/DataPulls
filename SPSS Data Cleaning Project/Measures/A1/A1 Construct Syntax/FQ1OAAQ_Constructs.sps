* Encoding: UTF-8.
*STEP 0: NOTES
*ACCEPTANCE AND ACTION QUESTIONNAIRE, 2ND VERSION (AAQ-II). 
*CREATED THE FOLLOWING SUBSCALES & RAN APLHAS; LIST SUBSCALES BELOW.
*AAQ Total Score 7 items (TOT7).
*AAQ Total Score 10 items (TOT10).
 
*1-12-22(BM): Adapted syntax for UO AAQ and ran STEPS 1-13.
*1-14-22(AAC): CHECKED. Updated alpha noted in the notes section of STEP 5.
*1-26-22(AAC): Added STEP9A. 
*--------------------------------------------------------------------------------------------------------------------------------.
*STEP 1: OPENING CLEANED DATA.
*Insert the correct file path and file name. Use syntax to open cleaned data file.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OAAQ_Cleaned.sav'.

*STEP 2: SAVING CLEANED DATA AS A CONSTRUCT FILE. 
*Insert the correct file path and file name.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OAAQ_Constructs.sav'
  /COMPRESSED.

*STEP 3: DESCRIPTIVE STATISTICS (1. FREQ AND 2. CORR) FOR RAW VARIABLES (TOTAL SCORE 1ST, THEN SUBSCALES).
*When running this step note any additional missingness (any other codes) that are not accounted for in the STAT variable. These missing codes (and corresponding IDs) will need to be 
incorporated in STEP 8 below.
FREQ VARS=FQ1OAAQ01R FQ1OAAQ02 FQ1OAAQ03 FQ1OAAQ04 FQ1OAAQ05 FQ1OAAQ06R FQ1OAAQ07 FQ1OAAQ08 FQ1OAAQ09 FQ1OAAQ10R. 
*AAQ Total Score 7 items (TOT7).
CORR VARS=FQ1OAAQ02 FQ1OAAQ03 FQ1OAAQ04 FQ1OAAQ05 FQ1OAAQ07 FQ1OAAQ08 FQ1OAAQ09. 
*AAQ Total Score 10 items (TOT10).
CORR VARS=FQ1OAAQ01R FQ1OAAQ02 FQ1OAAQ03 FQ1OAAQ04 FQ1OAAQ05 FQ1OAAQ06R FQ1OAAQ07 FQ1OAAQ08 FQ1OAAQ09 FQ1OAAQ10R. 
    
*STEP 4: RECODING MISSING VALUES.
RECODE FQ1OAAQ01 TO FQ1OAAQ10R (MISSING=-9999).
EXECUTE.

*STEP 5: RELIABILITY STATISTICS (TOTAL SCORE 1st, FOLLOWED BY SUBSCALES).
*AAQ Total Score 7 items (TOT7) (7 items; n=80; alpha=.954).
REL VARS=FQ1OAAQ02 FQ1OAAQ03 FQ1OAAQ04 FQ1OAAQ05 FQ1OAAQ07 FQ1OAAQ08 FQ1OAAQ09 
/SCALE(All)= ALL.
*AAQ Total Score 10 items (TOT10) (10 items; n=80; alpha=.946).
REL VARS=FQ1OAAQ01R FQ1OAAQ02 FQ1OAAQ03 FQ1OAAQ04 FQ1OAAQ05 FQ1OAAQ06R FQ1OAAQ07 FQ1OAAQ08 FQ1OAAQ09 FQ1OAAQ10R
/SCALE(All)= ALL.

*STEP 6: COUNTING MISSING DATA (JUST SUBSCALES), THEN RECODING TO 0 TO AVOID NEGATIVE EFFECTS ON CONSTRUCTS.
*AAQ Total Score 7 items (TOT7).
COUNT MISSTOT7=FQ1OAAQ02 FQ1OAAQ03 FQ1OAAQ04 FQ1OAAQ05 FQ1OAAQ07 FQ1OAAQ08 FQ1OAAQ09 (-9999).
*AAQ Total Score 10 items (TOT10).
COUNT MISSTOT10=FQ1OAAQ01R FQ1OAAQ02 FQ1OAAQ03 FQ1OAAQ04 FQ1OAAQ05 FQ1OAAQ06R FQ1OAAQ07 FQ1OAAQ08 FQ1OAAQ09 FQ1OAAQ10R (-9999).

RECODE FQ1OAAQ01 TO FQ1OAAQ10R (-9999=0).
EXECUTE.

*STEP 7: CREATE TOTAL AND SUBSCALES SCORES  (CHECK THAT REVERSE-SCORED ITEMS INCLUDED).
*Note each subscale name and calculate missingness allowed.
*CREATING TOTAL SCORE.
*AAQ Total Score (TOT10) (10 items) -- USE MISSINGNESS FOR EACH SUBSCALE as a cut-off point.
COMPUTE FQ1OAAQTOT10=-9999.
EXECUTE.
IF (MISSTOT10 < 3.30) FQ1OAAQTOT10=RND(((FQ1OAAQ01R + FQ1OAAQ02 + FQ1OAAQ03 + FQ1OAAQ04 + FQ1OAAQ05 + FQ1OAAQ06R + FQ1OAAQ07 + FQ1OAAQ08 + FQ1OAAQ09 + FQ1OAAQ10R)/(10-MISSTOT10))*10).
EXECUTE.
*AAQ Total Score (TOT7) (7 items) -- USE MISSINGNESS FOR EACH SUBSCALE as a cut-off point.
COMPUTE FQ1OAAQTOT7=-9999.
EXECUTE.
IF (MISSTOT7 < 2.31) FQ1OAAQTOT7=RND(((FQ1OAAQ02 + FQ1OAAQ03 + FQ1OAAQ04 + FQ1OAAQ05 + FQ1OAAQ07 + FQ1OAAQ08 + FQ1OAAQ09)/(7-MISSTOT7))*7).
EXECUTE.
*CREATING ALL SUBSCALES (CHECK THAT REVERSE-SCORED ITEMS INCLUDED).
*CHECKED AND NOT NEEDED.

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
DO REPEAT x = FQ1OAAQTOT7 FQ1OAAQTOT10.
RECODE FD1OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.
*Checking frequenices for constructs to look at missingness. 
FREQUENCIES VARIABLES=FD1OSTAT FQ1OAAQTOT7 FQ1OAAQTOT10
  /ORDER=ANALYSIS.
*If there IS missingness that was not accounted for in the STAT variable (for example in DERSAC, participants who indicated they did not have an additional caregiver should be coded as -44
Each construct needs to be coded by ID here. **CHECKED AND NOT NEEDED.
*At this point, the only remaining missingness should represent when participant did not answer a sufficient number of questions, assuming STAT variable was correctly coded for this measure -- CHECK THIS! 
*The following syntax will recode this remaining missingness for each new construct.
IF (FQ1OAAQTOT7=-9999) FQ1OAAQTOT7=-43.
EXECUTE.  
IF (FQ1OAAQTOT10=-9999) FQ1OAAQTOT10=-43.
EXECUTE.  
MISSING VALUES
   FQ1OAAQTOT7 FQ1OAAQTOT10
    (LO THRU -1).
EXECUTE.

*STEP 9: LABELING CONSTRUCTS.
VARIABLE LABELS
FQ1OAAQTOT7 'AAQ Total Score 7 items [FQ1OAAQTOT7]'
FQ1OAAQTOT10 'AAQ Total Score 10 items [FQ1OAAQTOT10]'.
EXECUTE.

*STEP 9A: ADD VALUE LABELS.
*Include ALL missing value labels (SEE STEP 8 FOR FULL LIST). 
*Be sure to also include value labels for any constructs that need labels (e.g., 0 'No', 1 'Yes'). Summed or averaged scores do NOT need value labels.
VALUE LABELS
FQ1OAAQTOT7 FQ1OAAQTOT10
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
FREQUENCIES VARIABLES=FD1OSTAT FQ1OAAQTOT7 FQ1OAAQTOT10
  /ORDER=ANALYSIS.

*STEP 11: CHECK DESCRIPTIVES.
*Checking descriptives for all constructs.
DESCRIPTIVES VARIABLES=FQ1OAAQTOT7 FQ1OAAQTOT10 
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 12: SAVE CLEANED DATA FILE.
*First, sorting the data file by ID and resaving the final file.
*Using /KEEP command to keep ONLY ID + RD + the constructs that were created. 
SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OAAQ_Constructs.sav'
  /KEEP ID FD1ORD FQ1OAAQTOT7 FQ1OAAQTOT10 
  /COMPRESSED.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OAAQ_Constructs.sav'.
EXECUTE.

*STEP 13: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE 
 OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OAAQ_Constructs.spv'
LOCK=NO.


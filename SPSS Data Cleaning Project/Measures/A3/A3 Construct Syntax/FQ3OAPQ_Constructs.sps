* Encoding: UTF-8.
*STEP 0: NOTES.
*ALABAMA PARENTING QUESTIONNAIRE-PRESCHOOL REVISION (APQ-PR).
*CREATED THE FOLLOWING SUBSCALES & RAN APLHAS; LIST SUBSCALES BELOW (EXAMPLE BELOW). 
*Positive Parenting (PP)- Parental Involvement and Positive Parenting.
*Negative/Inconsistent Parenting (NP)- Poor Monitoring/Supervision and Inconsistent Discipline.
*Punitive Parenting (PUN)- Corporal Punishment and 2 items from Other Discipline Practices.-UO will NOT include this subscale due to not administering 
3/5 items (corporal punishment items APQ24, APQ26, APQ29) from this subscale. Too low to impute.

*4-19-22(BM): Adapted syntax for A3.
*04-21-22(AAC): Checked.
*--------------------------------------------------------------------------------------------------------------------------------.
*STEP 1: OPENING CLEANED DATA.
*Insert the correct file path and file name. Use syntax to open cleaned data file.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OAPQ_Cleaned.sav'.

*STEP 2: SAVING CLEANED DATA AS A CONSTRUCT FILE. 
*Insert the correct file path and file name.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OAPQ_Constructs.sav'
  /COMPRESSED.

*STEP 3: DESCRIPTIVE STATISTICS (1. FREQ AND 2. CORR) FOR RAW VARIABLES (TOTAL SCORE 1ST, THEN SUBSCALES).
*When running this step note any additional missingness (any other codes) that are not accounted for in the STAT variable. These missing codes (and corresponding IDs) will need to be 
incorporated in STEP 8 below.
FREQ VARS=FQ3OAPQ01 FQ3OAPQ02 FQ3OAPQ03 FQ3OAPQ04 FQ3OAPQ06 FQ3OAPQ07 
FQ3OAPQ08 FQ3OAPQ09 FQ3OAPQ10 FQ3OAPQ11 FQ3OAPQ13 FQ3OAPQ14 FQ3OAPQ15 FQ3OAPQ16
FQ3OAPQ17 FQ3OAPQ18 FQ3OAPQ20 FQ3OAPQ22 FQ3OAPQ24 FQ3OAPQ25 FQ3OAPQ26 FQ3OAPQ29 FQ3OAPQ30 FQ3OAPQ31.
*Positive Parenting (PP).
CORR VARS=FQ3OAPQ01, FQ3OAPQ04, FQ3OAPQ06,FQ3OAPQ08, FQ3OAPQ09, FQ3OAPQ11, FQ3OAPQ13, FQ3OAPQ14, FQ3OAPQ15, FQ3OAPQ20, FQ3OAPQ31, FQ3OAPQ02.
*Negative/Inconsistent Parenting (NP).
CORR VARS=FQ3OAPQ03, FQ3OAPQ07, FQ3OAPQ10, FQ3OAPQ16, FQ3OAPQ17, FQ3OAPQ18, FQ3OAPQ22.
*PUN not included for UO.

*STEP 4: RECODING MISSING VALUES.
RECODE FQ3OAPQ01 TO FQ3OAPQ31 (MISSING=-9999).
EXECUTE.

*STEP 5: RELIABILITY STATISTICS (TOTAL SCORE 1st, FOLLOWED BY SUBSCALES).
*Positive Parenting (PP) (12 items; n=53; alpha=.845).
REL VARS=FQ3OAPQ01, FQ3OAPQ04, FQ3OAPQ06,FQ3OAPQ08, FQ3OAPQ09, FQ3OAPQ11, FQ3OAPQ13, FQ3OAPQ14, FQ3OAPQ15, FQ3OAPQ20, FQ3OAPQ31, FQ3OAPQ02
/SCALE(All)= ALL.
*Negative/Inconsistent Parenting (NP) (7 items; n=53; alpha=.833).
REL VARS=FQ3OAPQ03, FQ3OAPQ07, FQ3OAPQ10, FQ3OAPQ16, FQ3OAPQ17, FQ3OAPQ18, FQ3OAPQ22
/SCALE(All)= ALL.
*PUN not included for UO.

*STEP 6: COUNTING MISSING DATA (JUST SUBSCALES), THEN RECODING TO 0 TO AVOID NEGATIVE EFFECTS ON CONSTRUCTS.
*Positive Parenting (PP).
COUNT MISSPP=FQ3OAPQ01, FQ3OAPQ04, FQ3OAPQ06,FQ3OAPQ08, FQ3OAPQ09, FQ3OAPQ11, FQ3OAPQ13, FQ3OAPQ14, FQ3OAPQ15, FQ3OAPQ20, FQ3OAPQ31, FQ3OAPQ02 (-9999).
*Negative/Inconsistent Parenting (NP).
COUNT MISSNP=FQ3OAPQ03, FQ3OAPQ07, FQ3OAPQ10, FQ3OAPQ16, FQ3OAPQ17, FQ3OAPQ18, FQ3OAPQ22 (-9999).
*PUN not included for UO.

RECODE FQ3OAPQ01 TO FQ3OAPQ31 (-9999=0).
EXECUTE.

*STEP 7: CREATE TOTAL AND SUBSCALES SCORES  (CHECK THAT REVERSE-SCORED ITEMS INCLUDED).
*Note each subscale name and calculate missingness allowed (EXAMPLE BELOW).
*CREATING ALL SUBSCALES (CHECK THAT REVERSE-SCORED ITEMS INCLUDED).
*Positive Parenting (PP) (12 items) -- 66.7% (i.e., if MISS is less than or equal to 3.96) as a cut-off point.
COMPUTE FQ3OAPQPP=-9999.
EXECUTE.
IF (MISSPP < 3.96) FQ3OAPQPP=RND(((FQ3OAPQ01+ FQ3OAPQ04+ FQ3OAPQ06 + FQ3OAPQ08 + FQ3OAPQ09 + FQ3OAPQ11 + FQ3OAPQ13 + FQ3OAPQ14 
+ FQ3OAPQ15 + FQ3OAPQ20 + FQ3OAPQ31 + FQ3OAPQ02)/(12-MISSPP))*12).
EXECUTE.
*Negative/Inconsistent Parenting (NP) (7 items) --  66.7% (i.e., if MISS is less than or equal to 2.31) as a cut-off point.
COMPUTE FQ3OAPQNP=-9999.
EXECUTE.
IF (MISSNP < 2.31) FQ3OAPQNP=RND(((FQ3OAPQ03+ FQ3OAPQ07 + FQ3OAPQ10 + FQ3OAPQ16 + FQ3OAPQ17 + FQ3OAPQ18 + FQ3OAPQ22)/(7-MISSNP))*7).
EXECUTE.   
*Punitive Parenting (PUN) (5 items) -- 66.7% (i.e., if MISS is less than or equal to 1.65) as a cut-off point.
COMPUTE FQ3OAPQPUN=-41. 

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
**-56 'Consent withdrawn'                                                            /*(consent withdrawn) */
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
DO REPEAT x = FQ3OAPQPP TO FQ3OAPQPUN.
RECODE FD3OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.
*Checking frequenices for constructs to look at missingness. 
FREQUENCIES VARIABLES=FD3OSTAT FQ3OAPQPP FQ3OAPQNP FQ3OAPQPUN
  /ORDER=ANALYSIS.
*If there IS missingness that was not accounted for in the STAT variable (for example in DERSAC, participants who indicated they did not have an additional caregiver should be coded as -44
Each construct needs to be coded by ID here. If there IS NO additional missingess not accounted for, delete only this section of syntax and write **CHECKED AND NOT NEEDED.
**CHECKED AND NOT NEEDED.
*At this point, the only remaining missingness should represent when participant did not answer a sufficient number of questions, assuming STAT variable was correctly coded for this measure -- CHECK THIS! 
*The following syntax will recode this remaining missingness for each new construct.
IF (FQ3OAPQPP=-9999) FQ3OAPQPP=-43.
EXECUTE.  
IF (FQ3OAPQNP=-9999) FQ3OAPQNP=-43.
EXECUTE.   
IF (FQ3OAPQPUN=-9999) FQ3OAPQPUN=-43.
EXECUTE.   
MISSING VALUES
   FQ3OAPQPP FQ3OAPQNP FQ3OAPQPUN
    (LO THRU -1).
EXECUTE.

*STEP 9: LABELING CONSTRUCTS.
*(EXAMPLE BELOW).
VARIABLE LABELS
FQ3OAPQPP 'APQ Positive Parenting [FQ3OAPQPP]'
FQ3OAPQNP 'APQ Negative/Inconsistent Parenting [FQ3OAPQNP]'
FQ3OAPQPUN 'APQ Punitive Parenting [FQ3OAPQPUN]'.
EXECUTE.


*STEP 9A: ADD VALUE LABELS.
*Include ALL missing value labels (SEE STEP 8 FOR FULL LIST). 
*Be sure to also include value labels for any constructs that need labels (e.g., 0 'No', 1 'Yes'). Summed or averaged scores do NOT need value labels.
VALUE LABELS
FQ3OAPQPP FQ3OAPQNP FQ3OAPQPUN
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
FREQUENCIES VARIABLES=FD3OSTAT FQ3OAPQPP FQ3OAPQNP FQ3OAPQPUN
  /ORDER=ANALYSIS.

*STEP 11: CHECK DESCRIPTIVES.
*Checking descriptives for all constructs.
DESCRIPTIVES VARIABLES=FQ3OAPQPP FQ3OAPQNP FQ3OAPQPUN
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 12: SAVE CLEANED DATA FILE.
*First, sorting the data file by ID and resaving the final file.
*Using /KEEP command to keep ONLY ID + RD + the constructs that were created. 
SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OAPQ_Constructs.sav'
  /KEEP ID FD3ORD FQ3OAPQPP FQ3OAPQNP FQ3OAPQPUN
  /COMPRESSED.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OAPQ_Constructs.sav'.
EXECUTE.

*STEP 13: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE 
 OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OAPQ_Constructs.spv'
LOCK=NO.


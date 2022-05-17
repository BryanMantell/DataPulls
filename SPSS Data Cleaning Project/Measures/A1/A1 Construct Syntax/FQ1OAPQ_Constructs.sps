* Encoding: UTF-8.
*STEP 0: NOTES.
*ALABAMA PARENTING QUESTIONNAIRE-PRESCHOOL REVISION (APQ-PR).
*CREATED THE FOLLOWING SUBSCALES & RAN APLHAS; LIST SUBSCALES BELOW (EXAMPLE BELOW). 
*Positive Parenting (PP)- Parental Involvement and Positive Parenting.
*Negative/Inconsistent Parenting (NP)- Poor Monitoring/Supervision and Inconsistent Discipline.
*Punitive Parenting (PUN)- Corporal Punishment and 2 items from Other Discipline Practices.-UO will NOT include this subscale due to not administering 
3/5 items (corporal punishment items APQ24, APQ26, APQ29) from this subscale. Too low to impute.

*02-02-22(BM): Adapted syntax completed STEPS 1 -13 (UO doesnt have the corporal punishment scale, so they will have 4 and 2).
*02-03-22(BM): Added missing items for FQ1OAPQPUN
*02-07-22(BM): Checked and Fixed Mistakes.
*02-09-22(AAC): CHECKED. Added an "l" to protocol to STEP 9A. 
*--------------------------------------------------------------------------------------------------------------------------------.
*STEP 1: OPENING CLEANED DATA.
*Insert the correct file path and file name. Use syntax to open cleaned data file.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OAPQ_Cleaned.sav'.

*STEP 2: SAVING CLEANED DATA AS A CONSTRUCT FILE. 
*Insert the correct file path and file name.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OAPQ_Constructs.sav'
  /COMPRESSED.

*STEP 3: DESCRIPTIVE STATISTICS (1. FREQ AND 2. CORR) FOR RAW VARIABLES (TOTAL SCORE 1ST, THEN SUBSCALES).
*When running this step note any additional missingness (any other codes) that are not accounted for in the STAT variable. These missing codes (and corresponding IDs) will need to be 
incorporated in STEP 8 below.
FREQ VARS=FQ1OAPQ01 FQ1OAPQ02 FQ1OAPQ03 FQ1OAPQ04 FQ1OAPQ06 FQ1OAPQ07 
FQ1OAPQ08 FQ1OAPQ09 FQ1OAPQ10 FQ1OAPQ11 FQ1OAPQ13 FQ1OAPQ14 FQ1OAPQ15 FQ1OAPQ16
FQ1OAPQ17 FQ1OAPQ18 FQ1OAPQ20 FQ1OAPQ22 FQ1OAPQ24 FQ1OAPQ25 FQ1OAPQ26 FQ1OAPQ29 FQ1OAPQ30 FQ1OAPQ31.
*Positive Parenting (PP).
CORR VARS=FQ1OAPQ01, FQ1OAPQ04, FQ1OAPQ06,FQ1OAPQ08, FQ1OAPQ09, FQ1OAPQ11, FQ1OAPQ13, FQ1OAPQ14, FQ1OAPQ15, FQ1OAPQ20, FQ1OAPQ31, FQ1OAPQ02.
*Negative/Inconsistent Parenting (NP).
CORR VARS=FQ1OAPQ03, FQ1OAPQ07, FQ1OAPQ10, FQ1OAPQ16, FQ1OAPQ17, FQ1OAPQ18, FQ1OAPQ22.

*STEP 4: RECODING MISSING VALUES.
RECODE FQ1OAPQ01 TO FQ1OAPQ31 (MISSING=-9999).
EXECUTE.

*STEP 5: RELIABILITY STATISTICS (TOTAL SCORE 1st, FOLLOWED BY SUBSCALES).
*Positive Parenting (PP) (12 items; n=76; alpha=.851).
REL VARS=FQ1OAPQ01, FQ1OAPQ04, FQ1OAPQ06,FQ1OAPQ08, FQ1OAPQ09, FQ1OAPQ11, FQ1OAPQ13, FQ1OAPQ14, FQ1OAPQ15, FQ1OAPQ20, FQ1OAPQ31, FQ1OAPQ02
/SCALE(All)= ALL.
*Negative/Inconsistent Parenting (NP) (7 items; n=79; alpha=.814).
REL VARS=FQ1OAPQ03, FQ1OAPQ07, FQ1OAPQ10, FQ1OAPQ16, FQ1OAPQ17, FQ1OAPQ18, FQ1OAPQ22
/SCALE(All)= ALL.

*STEP 6: COUNTING MISSING DATA (JUST SUBSCALES), THEN RECODING TO 0 TO AVOID NEGATIVE EFFECTS ON CONSTRUCTS.
*Positive Parenting (PP).
COUNT MISSPP=FQ1OAPQ01, FQ1OAPQ04, FQ1OAPQ06,FQ1OAPQ08, FQ1OAPQ09, FQ1OAPQ11, FQ1OAPQ13, FQ1OAPQ14, FQ1OAPQ15, FQ1OAPQ20, FQ1OAPQ31, FQ1OAPQ02 (-9999).
*Negative/Inconsistent Parenting (NP).
COUNT MISSNP=FQ1OAPQ03, FQ1OAPQ07, FQ1OAPQ10, FQ1OAPQ16, FQ1OAPQ17, FQ1OAPQ18, FQ1OAPQ22 (-9999).

RECODE FQ1OAPQ01 TO FQ1OAPQ31 (-9999=0).
EXECUTE.

*STEP 7: CREATE TOTAL AND SUBSCALES SCORES  (CHECK THAT REVERSE-SCORED ITEMS INCLUDED).
*Note each subscale name and calculate missingness allowed (EXAMPLE BELOW).
*CREATING ALL SUBSCALES (CHECK THAT REVERSE-SCORED ITEMS INCLUDED).
*Positive Parenting (PP) (12 items) -- 66.7% (i.e., if MISS is less than or equal to 3.96) as a cut-off point.
COMPUTE FQ1OAPQPP=-9999.
EXECUTE.
IF (MISSPP < 3.96) FQ1OAPQPP=RND(((FQ1OAPQ01+ FQ1OAPQ04+ FQ1OAPQ06 + FQ1OAPQ08 + FQ1OAPQ09 + FQ1OAPQ11 + FQ1OAPQ13 + FQ1OAPQ14 
+ FQ1OAPQ15 + FQ1OAPQ20 + FQ1OAPQ31 + FQ1OAPQ02)/(12-MISSPP))*12).
EXECUTE.
*Negative/Inconsistent Parenting (NP) (7 items) --  66.7% (i.e., if MISS is less than or equal to 2.31) as a cut-off point.
COMPUTE FQ1OAPQNP=-9999.
EXECUTE.
IF (MISSNP < 2.31) FQ1OAPQNP=RND(((FQ1OAPQ03+ FQ1OAPQ07 + FQ1OAPQ10 + FQ1OAPQ16 + FQ1OAPQ17 + FQ1OAPQ18 + FQ1OAPQ22)/(7-MISSNP))*7).
EXECUTE.   
*Punitive Parenting (PUN) (5 items) -- 66.7% (i.e., if MISS is less than or equal to 1.65) as a cut-off point.
COMPUTE FQ1OAPQPUN=-41. 

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
**-12 'Pariticipant refused follow-up'                                             /* (Participant refused follow-up) */     
**-11 'Participant (child) deceased'                                                /* (Participant (child) deceased) */
**-10 'Prefer not to answer'                                                           /* (Participant selected prefer not to answer) */.
DO IF MISSING(FD1OSTAT).
DO REPEAT x = FQ1OAPQPP TO FQ1OAPQPUN.
RECODE FD1OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.
*Checking frequenices for constructs to look at missingness. 
FREQUENCIES VARIABLES=FD1OSTAT FQ1OAPQPP FQ1OAPQNP FQ1OAPQPUN
  /ORDER=ANALYSIS.
*If there IS missingness that was not accounted for in the STAT variable (for example in DERSAC, participants who indicated they did not have an additional caregiver should be coded as -44
Each construct needs to be coded by ID here. If there IS NO additional missingess not accounted for, delete only this section of syntax and write **CHECKED AND NOT NEEDED.
**CHECKED AND NOT NEEDED.
*At this point, the only remaining missingness should represent when participant did not answer a sufficient number of questions, assuming STAT variable was correctly coded for this measure -- CHECK THIS! 
*The following syntax will recode this remaining missingness for each new construct.
IF (FQ1OAPQPP=-9999) FQ1OAPQPP=-43.
EXECUTE.  
IF (FQ1OAPQNP=-9999) FQ1OAPQNP=-43.
EXECUTE.   
IF (FQ1OAPQPUN=-9999) FQ1OAPQPUN=-43.
EXECUTE.   
MISSING VALUES
   FQ1OAPQPP FQ1OAPQNP FQ1OAPQPUN
    (LO THRU -1).
EXECUTE.

*STEP 9: LABELING CONSTRUCTS.
*(EXAMPLE BELOW).
VARIABLE LABELS
FQ1OAPQPP 'APQ Positive Parenting [FQ1OAPQPP]'
FQ1OAPQNP 'APQ Negative/Inconsistent Parenting [FQ1OAPQNP]'
FQ1OAPQPUN 'APQ Punitive Parenting [FQ1OAPQPUN]'.
EXECUTE.


*STEP 9A: ADD VALUE LABELS.
*Include ALL missing value labels (SEE STEP 8 FOR FULL LIST). 
*Be sure to also include value labels for any constructs that need labels (e.g., 0 'No', 1 'Yes'). Summed or averaged scores do NOT need value labels.
VALUE LABELS
FQ1OAPQPP FQ1OAPQNP FQ1OAPQPUN
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
-12 'Pariticipant refused follow-up (-12)'                                        
-11 'Participant (child) deceased (-11)'                              
-10 'Prefer not to Answer (-10)'.
EXECUTE. 

*STEP 10: CHECK FREQUENCIES.
*Checking frequencies of all constructs.
FREQUENCIES VARIABLES=FD1OSTAT FQ1OAPQPP FQ1OAPQNP FQ1OAPQPUN
  /ORDER=ANALYSIS.

*STEP 11: CHECK DESCRIPTIVES.
*Checking descriptives for all constructs.
DESCRIPTIVES VARIABLES=FQ1OAPQPP FQ1OAPQNP FQ1OAPQPUN
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 12: SAVE CLEANED DATA FILE.
*First, sorting the data file by ID and resaving the final file.
*Using /KEEP command to keep ONLY ID + RD + the constructs that were created. 
SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OAPQ_Constructs.sav'
  /KEEP ID FD1ORD FQ1OAPQPP FQ1OAPQNP FQ1OAPQPUN
  /COMPRESSED.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OAPQ_Constructs.sav'.
EXECUTE.

*STEP 13: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE 
 OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OAPQ_Constructs.spv'
LOCK=NO.


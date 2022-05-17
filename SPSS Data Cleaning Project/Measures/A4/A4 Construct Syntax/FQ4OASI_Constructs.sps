* Encoding: UTF-8.
*STEP 0: NOTES.
*ADDICTION SEVERITY INDEX (ASI).
*CREATED THE FOLLOWING SUBSCALES & RAN APLHAS; LIST SUBSCALES BELOW (EXAMPLE BELOW).
*Any History of Alcohol Use (AU).
*Recent History of Alcohol Use (past 30 days) (AUR).
*Any History Binge Drinking Alcohol (BD).
*Recent History of Binge Drinking Alcohol (past 30 days) (BDR).
*Any History of Marijuana Use (MU).
*Recent History of Marijuana Use (past 30 days) (MUR).
*Any History of Stimulant Use (SU).
*Recent History of Stimulant Use (past 30 days) (SUR).
*Any History of Opiate Use (OU).
*Recent History of Opiate Use (past 30 days) (OUR).
*Any History of Barbiturate/Sedative Use (BU).
*Recent History of Barbiturate/Sedative Use (past 30 days) (BUR).
*Any History of Hallucinogen/Inhalant Use (HU).
*Recent History of Hallucinogen/Inhalant Use (past 30 days) (HUR).
*Any History of Polysubstance Use (PU).
*Recent History of Polysubstance Use (past 30 days) (PUR).	

*04-19-22(BM): Adapted syntax for A4.
*04-21-22(AAC): Checked.
*04-25-22(BM): Fixed unlabeled sysmiss.
*04-27-22(AAC): Checked.
*--------------------------------------------------------------------------------------------------------------------------------.
*STEP 1: OPENING CLEANED DATA.
*Insert the correct file path and file name. Use syntax to open cleaned data file.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OASI_Cleaned.sav'.

*STEP 2: SAVING CLEANED DATA AS A CONSTRUCT FILE. 
*Insert the correct file path and file name.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OASI_Constructs.sav'
  /COMPRESSED.

*STEP 3: DESCRIPTIVE STATISTICS (1. FREQ AND 2. CORR) FOR RAW VARIABLES (TOTAL SCORE 1ST, THEN SUBSCALES).
*When running this step note any additional missingness (any other codes) that are not accounted for in the STAT variable. These missing codes (and corresponding IDs) will need to be 
incorporated in STEP 8 below.
FREQ VARS=FQ4OASI01, FQ4OASI01A, FQ4OASI02, FQ4OASI02A, FQ4OASI03, FQ4OASI03A, FQ4OASI04, FQ4OASI04A, FQ4OASI05, FQ4OASI05A, 
    FQ4OASI06, FQ4OASI06A, FQ4OASI07, FQ4OASI07A, FQ4OASI08, FQ4OASI08A, FQ4OASI09, FQ4OASI09A, FQ4OASI10, FQ4OASI10A, 
    FQ4OASI11, FQ4OASI11A, FQ4OASI12, FQ4OASI12A, FQ4OASI13, FQ4OASI13A.
**Do not need to run correlations, so syntax for that part of step was deleted.

*STEP 4: RECODING MISSING VALUES.
**Do not need this step, so syntax deleted.

*STEP 5: RELIABILITY STATISTICS (TOTAL SCORE 1st, FOLLOWED BY SUBSCALES).
**Do not need this step, so syntax deleted.

*STEP 6: COUNTING MISSING DATA (JUST SUBSCALES), THEN RECODING TO 0 TO AVOID NEGATIVE EFFECTS ON CONSTRUCTS.
**Do not need this step, so syntax deleted.

*STEP 7: CREATE TOTAL AND SUBSCALES SCORES  (CHECK THAT REVERSE-SCORED ITEMS INCLUDED).
*Note each subscale name and calculate missingness allowed (EXAMPLE BELOW).
*CREATING ALL SUBSCALES (CHECK THAT REVERSE-SCORED ITEMS INCLUDED).
*Create constructs-specific to ASI syntax.
*Any History of Alcohol Use (AU) (1 item).
IF (FQ4OASI01=0) FQ4OASIAU=0.
EXECUTE.  
IF (FQ4OASI01=1) FQ4OASIAU=1.
EXECUTE.  
*Recent History of Alcohol Use (past 30 days) (AUR) (1 item). 
IF (FQ4OASI01A=0) FQ4OASIAUR=0.
EXECUTE.  
IF (FQ4OASI01A=1) FQ4OASIAUR=1.
EXECUTE.  
*Any History Binge Drinking Alcohol (BD) (1 item). 
IF (FQ4OASI02=0) FQ4OASIBD=0.
EXECUTE.  
IF (FQ4OASI02=1) FQ4OASIBD=1.
EXECUTE.  
*Recent History of Binge Drinking Alcohol (past 30 days) (BDR) (1 item). 
IF (FQ4OASI02A=0) FQ4OASIBDR=0.
EXECUTE.  
IF (FQ4OASI02A=1) FQ4OASIBDR=1.
EXECUTE.  
*Any History of Marijuana Use (MU) (1 item). 
IF (FQ4OASI10=0) FQ4OASIMU=0.
EXECUTE.  
IF (FQ4OASI10=1) FQ4OASIMU=1.
EXECUTE.  
*Recent History of Marijuana Use (past 30 days) (MUR) (1 item). 
IF (FQ4OASI10A=0) FQ4OASIMUR=0.
EXECUTE.  
IF (FQ4OASI10A=1) FQ4OASIMUR=1.
EXECUTE.  
*Any History of Stimulant Use (SU) (2 items). 
IF (FQ4OASI08=0 AND FQ4OASI09=0) FQ4OASISU=0.
EXECUTE.  
IF (FQ4OASI08=1 OR FQ4OASI09=1) FQ4OASISU=1.
EXECUTE.  
*Recent History of Stimulant Use (past 30 days) (SUR) (2 items). 
IF (FQ4OASI08A=0 AND FQ4OASI09A=0) FQ4OASISUR=0. 
EXECUTE.  
IF (FQ4OASI08A=1 OR FQ4OASI09A=1) FQ4OASISUR=1.
EXECUTE.  
IF (FQ4OASI08A=0 AND value(FQ4OASI09A)=-44) FQ4OASISUR=0.
EXECUTE.  
IF (value(FQ4OASI08A)=-44 AND FQ4OASI09A=0) FQ4OASISUR=0.
EXECUTE.  
IF (FQ4OASI08A=1 AND value(FQ4OASI09A)=-44) FQ4OASISUR=1.
EXECUTE.  
IF (value(FQ4OASI08A)=-44 AND FQ4OASI09A=1) FQ4OASISUR=1.
EXECUTE.  
*Any History of Opiate Use (OU) (3 items).  
IF (FQ4OASI03=0 AND FQ4OASI04=0 AND FQ4OASI05=0) FQ4OASIOU=0.
EXECUTE.  
IF (FQ4OASI03=1 OR FQ4OASI04=1 OR FQ4OASI05=1) FQ4OASIOU=1.
EXECUTE.  
*Recent Any History of Opiate Use (past 30 days) (OUR) (3 items). 
IF (FQ4OASI03A=0 AND FQ4OASI04A=0 AND FQ4OASI05A=0) FQ4OASIOUR=0.
EXECUTE.  
IF (FQ4OASI03A=1 OR FQ4OASI04A=1 OR FQ4OASI05A=1) FQ4OASIOUR=1.
EXECUTE.  
IF (value(FQ4OASI03A)=-44 AND FQ4OASI04A=0 AND FQ4OASI05A=0) FQ4OASIOUR=0.
EXECUTE.  
IF (FQ4OASI03A=0 AND value(FQ4OASI04A)=-44 AND FQ4OASI05A=0) FQ4OASIOUR=0.
EXECUTE.  
IF (FQ4OASI03A=0 AND FQ4OASI04A=0 AND value(FQ4OASI05A)=-44) FQ4OASIOUR=0.
EXECUTE.  
IF (value(FQ4OASI03A)=-44 AND FQ4OASI04A=1 AND FQ4OASI05A=1) FQ4OASIOUR=1.
EXECUTE.  
IF (FQ4OASI03A=1 AND value(FQ4OASI04A)=-44 AND FQ4OASI05A=1) FQ4OASIOUR=1.
EXECUTE.  
IF (FQ4OASI03A=1 AND FQ4OASI04A=1 AND value(FQ4OASI05A)=-44) FQ4OASIOUR=1.
EXECUTE.  
IF (value(FQ4OASI03A)=-44 AND value(FQ4OASI04A)=-44 AND FQ4OASI05A=1) FQ4OASIOUR=1.
EXECUTE. 
IF (FQ4OASI03A=1 AND value(FQ4OASI04A)=-44 AND value(FQ4OASI05A)=-44) FQ4OASIOUR=1.
EXECUTE. 
IF (value(FQ4OASI03A)=-44 AND FQ4OASI04A=1 AND value(FQ4OASI05A)=-44) FQ4OASIOUR=1.
EXECUTE. 
IF (value(FQ4OASI03A)=-44 AND value(FQ4OASI04A)=-44 AND FQ4OASI05A=0) FQ4OASIOUR=0.
EXECUTE. 
IF (FQ4OASI03A=0 AND value(FQ4OASI04A)=-44 AND value(FQ4OASI05A)=-44) FQ4OASIOUR=0.
EXECUTE. 
IF (value(FQ4OASI03A)=-44 AND FQ4OASI04A=0 AND value(FQ4OASI05A)=-44) FQ4OASIOUR=0.
EXECUTE. 
*Any History of Barbiturate/Sedative Use (BU) (2 items).  
IF (FQ4OASI06=0 AND FQ4OASI07=0) FQ4OASIBU=0.
EXECUTE.  
IF (FQ4OASI06=1 OR FQ4OASI07=1) FQ4OASIBU=1.
EXECUTE.  
*Recent History of Barbiturate/Sedative Use (past 30 days) (BUR) (2 items).  
IF (FQ4OASI06A=0 AND FQ4OASI07A=0) FQ4OASIBUR=0. 
EXECUTE.  
IF (FQ4OASI06A=1 OR FQ4OASI07A=1) FQ4OASIBUR=1.
EXECUTE.  
IF (FQ4OASI06A=0 AND value(FQ4OASI07A)=-44) FQ4OASIBUR=0.
EXECUTE.  
IF (value(FQ4OASI06A)=-44 AND FQ4OASI07A=0) FQ4OASIBUR=0.
EXECUTE.  
IF (FQ4OASI06A=1 AND value(FQ4OASI07A)=-44) FQ4OASIBUR=1.
EXECUTE.  
IF (value(FQ4OASI06A)=-44 AND FQ4OASI07A=1) FQ4OASIBUR=1.
EXECUTE.  
*Any History of Hallucinogen/Inhalant Use (HU) (2 items).  
IF (FQ4OASI11=0 AND FQ4OASI12=0) FQ4OASIHU=0.
EXECUTE.  
IF (FQ4OASI11=1 OR FQ4OASI12=1) FQ4OASIHU=1.
EXECUTE.  
*Recent History of Hallucinogen/Inhalant Use (past 30 days) HUR) (2 items). 
IF (FQ4OASI11A=0 AND FQ4OASI12A=0) FQ4OASIHUR=0. 
EXECUTE.  
IF (FQ4OASI11A=1 OR FQ4OASI12A=1) FQ4OASIHUR=1.
EXECUTE.  
IF (FQ4OASI11A=0 AND value(FQ4OASI12A)=-44) FQ4OASIHUR=0.
EXECUTE.  
IF (value(FQ4OASI11A)=-44 AND FQ4OASI12A=0) FQ4OASIHUR=0.
EXECUTE.  
IF (FQ4OASI11A=1 AND value(FQ4OASI12A)=-44) FQ4OASIHUR=1.
EXECUTE.  
IF (value(FQ4OASI11A)=-44 AND FQ4OASI12A=1) FQ4OASIHUR=1.
EXECUTE.  
*Any History of Polysubstance Use (PU). 
IF (FQ4OASI13=0) FQ4OASIPU=0.
EXECUTE.  
IF (FQ4OASI13=1) FQ4OASIPU=1.
EXECUTE.  
*Recent History of Polysubstance Use (past 30 days) (PUR).   
IF (FQ4OASI13A=0) FQ4OASIPUR=0.
EXECUTE.  
IF (FQ4OASI13A=1) FQ4OASIPUR=1.
EXECUTE.  

RECODE FQ4OASIAU TO FQ4OASIPUR (MISSING=-10).
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
DO IF MISSING(FD4OSTAT).
DO REPEAT x = FQ4OASI01 TO FQ4OASIPUR.
RECODE FD4OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.
*Checking frequenices for constructs to look at missingness. 
FREQUENCIES VARIABLES=FD4OSTAT FQ4OASI01 FQ4OASI01A FQ4OASI02 FQ4OASI02A FQ4OASI03 FQ4OASI03A FQ4OASI04 FQ4OASI04A FQ4OASI05 FQ4OASI05A 
FQ4OASI06 FQ4OASI06A FQ4OASI07 FQ4OASI07A FQ4OASI08 FQ4OASI08A FQ4OASI09 FQ4OASI09A FQ4OASI10 FQ4OASI10A
FQ4OASI11 FQ4OASI11A FQ4OASI12 FQ4OASI12A FQ4OASI13 FQ4OASI13A 
FQ4OASIAU FQ4OASIAUR FQ4OASIBD FQ4OASIBDR FQ4OASIMU FQ4OASIMUR FQ4OASISU FQ4OASISUR FQ4OASIOU FQ4OASIOUR 
  FQ4OASIBU FQ4OASIBUR FQ4OASIHU FQ4OASIHUR FQ4OASIPU FQ4OASIPUR
  /ORDER=ANALYSIS.
*If there IS missingness that was not accounted for in the STAT variable (for example in DERSAC, participants who indicated they did not have an additional caregiver should be coded as -44
Each construct needs to be coded by ID here. If there IS NO additional missingess not accounted for, delete only this section of syntax and write **CHECKED AND NOT NEEDED.
*IF statments to code, if history construct is 0, then recent (30 day) construct is missing value -44.
IF (FQ4OASIAU=0) FQ4OASIAUR =-44.
EXECUTE.  
IF (FQ4OASIAU=0) FQ4OASIBD=-44.
EXECUTE.  
IF (FQ4OASIAU=0) FQ4OASIBDR=-44.
EXECUTE.  
IF (FQ4OASIBD=0) FQ4OASIBDR=-44.
EXECUTE.  
IF (FQ4OASIMU=0) FQ4OASIMUR=-44.
EXECUTE.   
IF (FQ4OASISU=0) FQ4OASISUR=-44.
EXECUTE.  
IF (FQ4OASIOU=0) FQ4OASIOUR=-44.
EXECUTE.  
IF (FQ4OASIBU=0) FQ4OASIBUR=-44.
EXECUTE.  
IF (FQ4OASIHU=0) FQ4OASIHUR=-44.
EXECUTE.  
IF (FQ4OASIPU=0) FQ4OASIPUR=-44.
EXECUTE.  
*At this point, the only remaining missingness should represent when participant did not answer a sufficient number of questions, assuming STAT variable was correctly coded for this measure -- CHECK THIS! 
*The following syntax will recode this remaining missingness for each new construct.

MISSING VALUES
   FQ4OASI01 FQ4OASI01A FQ4OASI02 FQ4OASI02A FQ4OASI03 FQ4OASI03A FQ4OASI04 FQ4OASI04A FQ4OASI05 FQ4OASI05A 
FQ4OASI06 FQ4OASI06A FQ4OASI07 FQ4OASI07A FQ4OASI08 FQ4OASI08A FQ4OASI09 FQ4OASI09A FQ4OASI10 FQ4OASI10A
FQ4OASI11 FQ4OASI11A FQ4OASI12 FQ4OASI12A FQ4OASI13 FQ4OASI13A FQ4OASIAU FQ4OASIAUR FQ4OASIBD FQ4OASIBDR 
FQ4OASIMU FQ4OASIMUR FQ4OASISU FQ4OASISUR FQ4OASIOU FQ4OASIOUR FQ4OASIBU FQ4OASIBUR FQ4OASIHU FQ4OASIHUR FQ4OASIPU FQ4OASIPUR
    (LO THRU -1).
EXECUTE.

*STEP 9: LABELING CONSTRUCTS.
VARIABLE LABELS
FQ4OASIAU 'ASI Any History of Alcohol Use [FQ4OASIAU]'
FQ4OASIAUR 'ASI Recent History of Alcohol Use (past 30 days) [FQ4OASIAUR]'
FQ4OASIBD 'ASI Any History Binge Drinking Alcohol [FQ4OASIBD]'
FQ4OASIBDR 'ASI Recent History of Binge Drinking Alcohol (past 30 days) [FQ4OASIBDR]'
FQ4OASIMU 'ASI Any History of Marijuana Use [FQ4OASIMU]'
FQ4OASIMUR 'ASI Recent History of Marijuana Use (past 30 days) [FQ4OASIMUR]'
FQ4OASISU 'ASI Any History of Stimulant Use [FQ4OASISU]'
FQ4OASISUR 'ASI Recent History of Stimulant Use (past 30 days) [FQ4OASISUR]'
FQ4OASIOU 'ASI Any History of Opiate Use [FQ4OASIOU]'
FQ4OASIOUR 'ASI Recent History of Opiate Use (past 30 days) [FQ4OASIOUR]'
FQ4OASIBU 'ASI Any History of Barbiturate/Sedative Use [FQ4OASIBU]'
FQ4OASIBUR 'ASI Recent History of Barbiturate/Sedative Use (past 30 days) [FQ4OASIBUR]'
FQ4OASIHU 'ASI Any History of Hallucinogen/Inhalant Use [FQ4OASIHU]'
FQ4OASIHUR 'ASI Recent History of Hallucinogen/Inhalant Use (past 30 days) [FQ4OASIHUR]'
FQ4OASIPU 'ASI Any History of Polysubstance Use [FQ4OASIPU]'
FQ4OASIPUR 'ASI Recent History of Polysubstance Use (past 30 days) [FQ4OASIPUR]'.
EXECUTE.

*STEP 9A: ADD VALUE LABELS.
*Include ALL missing value labels (SEE STEP 8 FOR FULL LIST). 
*Be sure to also include value labels for any constructs that need labels (e.g., 0 'No', 1 'Yes'). Summed or averaged scores do NOT need value labels.
VALUE LABELS
FQ4OASI01 TO FQ4OASIPUR
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
-10 'Prefer not to Answer (-10)'
1 'Yes (1)'
0 'No (0)'.  
EXECUTE.  

*STEP 10: CHECK FREQUENCIES.
*Checking frequencies of all constructs.
FREQUENCIES VARIABLES=FD4OSTAT FQ4OASI01 FQ4OASI01A FQ4OASI02 FQ4OASI02A FQ4OASI03 FQ4OASI03A FQ4OASI04 FQ4OASI04A FQ4OASI05 FQ4OASI05A 
FQ4OASI06 FQ4OASI06A FQ4OASI07 FQ4OASI07A FQ4OASI08 FQ4OASI08A FQ4OASI09 FQ4OASI09A FQ4OASI10 FQ4OASI10A
FQ4OASI11 FQ4OASI11A FQ4OASI12 FQ4OASI12A FQ4OASI13 FQ4OASI13A FQ4OASIAU FQ4OASIAUR FQ4OASIBD FQ4OASIBDR 
FQ4OASIMU FQ4OASIMUR FQ4OASISU FQ4OASISUR FQ4OASIOU FQ4OASIOUR FQ4OASIBU FQ4OASIBUR FQ4OASIHU FQ4OASIHUR FQ4OASIPU FQ4OASIPUR
  /ORDER=ANALYSIS.

*STEP 11: CHECK DESCRIPTIVES.
*Checking descriptives for all constructs.
DESCRIPTIVES VARIABLES=FQ4OASI01 FQ4OASI01A FQ4OASI02 FQ4OASI02A FQ4OASI03 FQ4OASI03A FQ4OASI04 FQ4OASI04A FQ4OASI05 FQ4OASI05A 
FQ4OASI06 FQ4OASI06A FQ4OASI07 FQ4OASI07A FQ4OASI08 FQ4OASI08A FQ4OASI09 FQ4OASI09A FQ4OASI10 FQ4OASI10A
FQ4OASI11 FQ4OASI11A FQ4OASI12 FQ4OASI12A FQ4OASI13 FQ4OASI13A FQ4OASIAU FQ4OASIAUR FQ4OASIBD FQ4OASIBDR 
FQ4OASIMU FQ4OASIMUR FQ4OASISU FQ4OASISUR FQ4OASIOU FQ4OASIOUR FQ4OASIBU FQ4OASIBUR FQ4OASIHU FQ4OASIHUR FQ4OASIPU FQ4OASIPUR
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 12: SAVE CLEANED DATA FILE.
*First, sorting the data file by ID and resaving the final file.
*Using /KEEP command to keep ONLY ID + RD + the constructs that were created. 
SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OASI_Constructs.sav'
  /KEEP ID FD4ORD FQ4OASI01 FQ4OASI01A FQ4OASI02 FQ4OASI02A FQ4OASI03 FQ4OASI03A FQ4OASI04 FQ4OASI04A FQ4OASI05 FQ4OASI05A 
FQ4OASI06 FQ4OASI06A FQ4OASI07 FQ4OASI07A FQ4OASI08 FQ4OASI08A FQ4OASI09 FQ4OASI09A FQ4OASI10 FQ4OASI10A
FQ4OASI11 FQ4OASI11A FQ4OASI12 FQ4OASI12A FQ4OASI13 FQ4OASI13A FQ4OASIAU FQ4OASIAUR FQ4OASIBD FQ4OASIBDR 
FQ4OASIMU FQ4OASIMUR FQ4OASISU FQ4OASISUR FQ4OASIOU FQ4OASIOUR FQ4OASIBU FQ4OASIBUR FQ4OASIHU FQ4OASIHUR FQ4OASIPU FQ4OASIPUR
  /COMPRESSED.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OASI_Constructs.sav'.
EXECUTE.

*STEP 13: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE 
 OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OASI_Constructs.spv'
LOCK=NO.


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

*02-17-22(BM): Adapted Syntax from Pitt to UO.
*02-21-22(BM): Fixed unlabeled missing.
*02-21-22(AAC): Checked.
*05-10-22(AAC): Re-ran with updated renamed data. 

*--------------------------------------------------------------------------------------------------------------------------------.
*STEP 1: OPENING CLEANED DATA.
*Insert the correct file path and file name. Use syntax to open cleaned data file.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OASI_Cleaned.sav'.

*STEP 2: SAVING CLEANED DATA AS A CONSTRUCT FILE. 
*Insert the correct file path and file name.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OASI_Constructs.sav'
  /COMPRESSED.

*STEP 3: DESCRIPTIVE STATISTICS (1. FREQ AND 2. CORR) FOR RAW VARIABLES (TOTAL SCORE 1ST, THEN SUBSCALES).
*When running this step note any additional missingness (any other codes) that are not accounted for in the STAT variable. These missing codes (and corresponding IDs) will need to be 
incorporated in STEP 8 below.
FREQ VARS=FQ1OASI01A, FQ1OASI01C, FQ1OASI02A, FQ1OASI02C, FQ1OASI03A, FQ1OASI03C, FQ1OASI04A, FQ1OASI04C, FQ1OASI05A, FQ1OASI05C, 
    FQ1OASI06A, FQ1OASI06C, FQ1OASI07A, FQ1OASI07C, FQ1OASI08A, FQ1OASI08C, FQ1OASI09A, FQ1OASI09C, FQ1OASI10A, FQ1OASI10C, 
    FQ1OASI11A, FQ1OASI11C, FQ1OASI12A, FQ1OASI12C, FQ1OASI13A, FQ1OASI13C.
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
IF (FQ1OASI01A=0) FQ1OASIAU=0.
EXECUTE.  
IF (FQ1OASI01A=1) FQ1OASIAU=1.
EXECUTE.  
*Recent History of Alcohol Use (past 30 days) (AUR) (1 item). 
IF (FQ1OASI01C=0) FQ1OASIAUR=0.
EXECUTE.  
IF (FQ1OASI01C=1) FQ1OASIAUR=1.
EXECUTE.  
*Any History Binge Drinking Alcohol (BD) (1 item). 
IF (FQ1OASI02A=0) FQ1OASIBD=0.
EXECUTE.  
IF (FQ1OASI02A=1) FQ1OASIBD=1.
EXECUTE.  
*Recent History of Binge Drinking Alcohol (past 30 days) (BDR) (1 item). 
IF (FQ1OASI02C=0) FQ1OASIBDR=0.
EXECUTE.  
IF (FQ1OASI02C=1) FQ1OASIBDR=1.
EXECUTE.  
*Any History of Marijuana Use (MU) (1 item). 
IF (FQ1OASI10A=0) FQ1OASIMU=0.
EXECUTE.  
IF (FQ1OASI10A=1) FQ1OASIMU=1.
EXECUTE.  
*Recent History of Marijuana Use (past 30 days) (MUR) (1 item). 
IF (FQ1OASI10C=0) FQ1OASIMUR=0.
EXECUTE.  
IF (FQ1OASI10C=1) FQ1OASIMUR=1.
EXECUTE.  
*Any History of Stimulant Use (SU) (2 items). 
IF (FQ1OASI08A=0 AND FQ1OASI09A=0) FQ1OASISU=0.
EXECUTE.  
IF (FQ1OASI08A=1 OR FQ1OASI09A=1) FQ1OASISU=1.
EXECUTE.  
*Recent History of Stimulant Use (past 30 days) (SUR) (2 items). 
IF (FQ1OASI08C=0 AND FQ1OASI09C=0) FQ1OASISUR=0. 
EXECUTE.  
IF (FQ1OASI08C=1 OR FQ1OASI09C=1) FQ1OASISUR=1.
EXECUTE.  
IF (FQ1OASI08C=0 AND value(FQ1OASI09C)=-44) FQ1OASISUR=0.
EXECUTE.  
IF (value(FQ1OASI08C)=-44 AND FQ1OASI09C=0) FQ1OASISUR=0.
EXECUTE.  
IF (FQ1OASI08C=1 AND value(FQ1OASI09C)=-44) FQ1OASISUR=1.
EXECUTE.  
IF (value(FQ1OASI08C)=-44 AND FQ1OASI09C=1) FQ1OASISUR=1.
EXECUTE.  
*Any History of Opiate Use (OU) (3 items).  
IF (FQ1OASI03A=0 AND FQ1OASI04A=0 AND FQ1OASI05A=0) FQ1OASIOU=0.
EXECUTE.  
IF (FQ1OASI03A=1 OR FQ1OASI04A=1 OR FQ1OASI05A=1) FQ1OASIOU=1.
EXECUTE.  
*Recent Any History of Opiate Use (past 30 days) (OUR) (3 items). 
IF (FQ1OASI03C=0 AND FQ1OASI04C=0 AND FQ1OASI05C=0) FQ1OASIOUR=0.
EXECUTE.  
IF (FQ1OASI03C=1 OR FQ1OASI04C=1 OR FQ1OASI05C=1) FQ1OASIOUR=1.
EXECUTE.  
IF (value(FQ1OASI03C)=-44 AND FQ1OASI04C=0 AND FQ1OASI05C=0) FQ1OASIOUR=0.
EXECUTE.  
IF (FQ1OASI03C=0 AND value(FQ1OASI04C)=-44 AND FQ1OASI05C=0) FQ1OASIOUR=0.
EXECUTE.  
IF (FQ1OASI03C=0 AND FQ1OASI04C=0 AND value(FQ1OASI05C)=-44) FQ1OASIOUR=0.
EXECUTE.  
IF (value(FQ1OASI03C)=-44 AND FQ1OASI04C=1 AND FQ1OASI05C=1) FQ1OASIOUR=1.
EXECUTE.  
IF (FQ1OASI03C=1 AND value(FQ1OASI04C)=-44 AND FQ1OASI05C=1) FQ1OASIOUR=1.
EXECUTE.  
IF (FQ1OASI03C=1 AND FQ1OASI04C=1 AND value(FQ1OASI05C)=-44) FQ1OASIOUR=1.
EXECUTE.  
IF (value(FQ1OASI03C)=-44 AND value(FQ1OASI04C)=-44 AND FQ1OASI05C=1) FQ1OASIOUR=1.
EXECUTE. 
IF (FQ1OASI03C=1 AND value(FQ1OASI04C)=-44 AND value(FQ1OASI05C)=-44) FQ1OASIOUR=1.
EXECUTE. 
IF (value(FQ1OASI03C)=-44 AND FQ1OASI04C=1 AND value(FQ1OASI05C)=-44) FQ1OASIOUR=1.
EXECUTE. 
IF (value(FQ1OASI03C)=-44 AND value(FQ1OASI04C)=-44 AND FQ1OASI05C=0) FQ1OASIOUR=0.
EXECUTE. 
IF (FQ1OASI03C=0 AND value(FQ1OASI04C)=-44 AND value(FQ1OASI05C)=-44) FQ1OASIOUR=0.
EXECUTE. 
IF (value(FQ1OASI03C)=-44 AND FQ1OASI04C=0 AND value(FQ1OASI05C)=-44) FQ1OASIOUR=0.
EXECUTE. 
*Any History of Barbiturate/Sedative Use (BU) (2 items).  
IF (FQ1OASI06A=0 AND FQ1OASI07A=0) FQ1OASIBU=0.
EXECUTE.  
IF (FQ1OASI06A=1 OR FQ1OASI07A=1) FQ1OASIBU=1.
EXECUTE.  
*Recent History of Barbiturate/Sedative Use (past 30 days) (BUR) (2 items).  
IF (FQ1OASI06C=0 AND FQ1OASI07C=0) FQ1OASIBUR=0. 
EXECUTE.  
IF (FQ1OASI06C=1 OR FQ1OASI07C=1) FQ1OASIBUR=1.
EXECUTE.  
IF (FQ1OASI06C=0 AND value(FQ1OASI07C)=-44) FQ1OASIBUR=0.
EXECUTE.  
IF (value(FQ1OASI06C)=-44 AND FQ1OASI07C=0) FQ1OASIBUR=0.
EXECUTE.  
IF (FQ1OASI06C=1 AND value(FQ1OASI07C)=-44) FQ1OASIBUR=1.
EXECUTE.  
IF (value(FQ1OASI06C)=-44 AND FQ1OASI07C=1) FQ1OASIBUR=1.
EXECUTE.  
*Any History of Hallucinogen/Inhalant Use (HU) (2 items).  
IF (FQ1OASI11A=0 AND FQ1OASI12A=0) FQ1OASIHU=0.
EXECUTE.  
IF (FQ1OASI11A=1 OR FQ1OASI12A=1) FQ1OASIHU=1.
EXECUTE.  
*Recent History of Hallucinogen/Inhalant Use (past 30 days) HUR) (2 items). 
IF (FQ1OASI11C=0 AND FQ1OASI12C=0) FQ1OASIHUR=0. 
EXECUTE.  
IF (FQ1OASI11C=1 OR FQ1OASI12C=1) FQ1OASIHUR=1.
EXECUTE.  
IF (FQ1OASI11C=0 AND value(FQ1OASI12C)=-44) FQ1OASIHUR=0.
EXECUTE.  
IF (value(FQ1OASI11C)=-44 AND FQ1OASI12C=0) FQ1OASIHUR=0.
EXECUTE.  
IF (FQ1OASI11C=1 AND value(FQ1OASI12C)=-44) FQ1OASIHUR=1.
EXECUTE.  
IF (value(FQ1OASI11C)=-44 AND FQ1OASI12C=1) FQ1OASIHUR=1.
EXECUTE.  
*Any History of Polysubstance Use (PU). 
IF (FQ1OASI13A=0) FQ1OASIPU=0.
EXECUTE.  
IF (FQ1OASI13A=1) FQ1OASIPU=1.
EXECUTE.  
*Recent History of Polysubstance Use (past 30 days) (PUR).   
IF (FQ1OASI13C=0) FQ1OASIPUR=0.
EXECUTE.  
IF (FQ1OASI13C=1) FQ1OASIPUR=1.
EXECUTE.  

DO IF(ID = 90210).
    RECODE 
    FQ1OASIAU TO FQ1OASIPUR
    (SYSMIS=-10).
END IF.
EXECUTE.

IF(ID = 90933) FQ1OASIOUR = -43.
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
**-11 'Participant (parent or child) deceased'                                  /* (Participant (child) deceased) */
**-10 'Prefer not to answer'                                                           /* (Participant selected prefer not to answer) */.
DO IF MISSING(FD1OSTAT).
DO REPEAT x = FQ1OASI01A TO FQ1OASIPUR.
RECODE FD1OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.
*Checking frequenices for constructs to look at missingness. 
FREQUENCIES VARIABLES=FD1OSTAT FQ1OASI01A FQ1OASI01C FQ1OASI02A FQ1OASI02C FQ1OASI03A FQ1OASI03C FQ1OASI04A FQ1OASI04C FQ1OASI05A FQ1OASI05C 
FQ1OASI06A FQ1OASI06C FQ1OASI07A FQ1OASI07C FQ1OASI08A FQ1OASI08C FQ1OASI09A FQ1OASI09C FQ1OASI10A FQ1OASI10C
FQ1OASI11A FQ1OASI11C FQ1OASI12A FQ1OASI12C FQ1OASI13A FQ1OASI13C 
FQ1OASIAU FQ1OASIAUR FQ1OASIBD FQ1OASIBDR FQ1OASIMU FQ1OASIMUR FQ1OASISU FQ1OASISUR FQ1OASIOU FQ1OASIOUR 
  FQ1OASIBU FQ1OASIBUR FQ1OASIHU FQ1OASIHUR FQ1OASIPU FQ1OASIPUR
  /ORDER=ANALYSIS.
*If there IS missingness that was not accounted for in the STAT variable (for example in DERSAC, participants who indicated they did not have an additional caregiver should be coded as -44
Each construct needs to be coded by ID here. If there IS NO additional missingess not accounted for, delete only this section of syntax and write **CHECKED AND NOT NEEDED.
*IF statments to code, if history construct is 0, then recent (30 day) construct is missing value -44.
IF (FQ1OASIAU=0) FQ1OASIAUR =-44.
EXECUTE.  
IF (FQ1OASIAU=0) FQ1OASIBD=-44.
EXECUTE.  
IF (FQ1OASIAU=0) FQ1OASIBDR=-44.
EXECUTE.  
IF (FQ1OASIBD=0) FQ1OASIBDR=-44.
EXECUTE.  
IF (FQ1OASIMU=0) FQ1OASIMUR=-44.
EXECUTE.   
IF (FQ1OASISU=0) FQ1OASISUR=-44.
EXECUTE.  
IF (FQ1OASIOU=0) FQ1OASIOUR=-44.
EXECUTE.  
IF (FQ1OASIBU=0) FQ1OASIBUR=-44.
EXECUTE.  
IF (FQ1OASIHU=0) FQ1OASIHUR=-44.
EXECUTE.  
IF (FQ1OASIPU=0) FQ1OASIPUR=-44.
EXECUTE.  
*At this point, the only remaining missingness should represent when participant did not answer a sufficient number of questions, assuming STAT variable was correctly coded for this measure -- CHECK THIS! 
*The following syntax will recode this remaining missingness for each new construct.

MISSING VALUES
   FQ1OASI01A FQ1OASI01C FQ1OASI02A FQ1OASI02C FQ1OASI03A FQ1OASI03C FQ1OASI04A FQ1OASI04C FQ1OASI05A FQ1OASI05C 
FQ1OASI06A FQ1OASI06C FQ1OASI07A FQ1OASI07C FQ1OASI08A FQ1OASI08C FQ1OASI09A FQ1OASI09C FQ1OASI10A FQ1OASI10C
FQ1OASI11A FQ1OASI11C FQ1OASI12A FQ1OASI12C FQ1OASI13A FQ1OASI13C FQ1OASIAU FQ1OASIAUR FQ1OASIBD FQ1OASIBDR 
FQ1OASIMU FQ1OASIMUR FQ1OASISU FQ1OASISUR FQ1OASIOU FQ1OASIOUR FQ1OASIBU FQ1OASIBUR FQ1OASIHU FQ1OASIHUR FQ1OASIPU FQ1OASIPUR
    (LO THRU -1).
EXECUTE.

*STEP 9: LABELING CONSTRUCTS.
VARIABLE LABELS
FQ1OASIAU 'ASI Any History of Alcohol Use [FQ1OASIAU]'
FQ1OASIAUR 'ASI Recent History of Alcohol Use (past 30 days) [FQ1OASIAUR]'
FQ1OASIBD 'ASI Any History Binge Drinking Alcohol [FQ1OASIBD]'
FQ1OASIBDR 'ASI Recent History of Binge Drinking Alcohol (past 30 days) [FQ1OASIBDR]'
FQ1OASIMU 'ASI Any History of Marijuana Use [FQ1OASIMU]'
FQ1OASIMUR 'ASI Recent History of Marijuana Use (past 30 days) [FQ1OASIMUR]'
FQ1OASISU 'ASI Any History of Stimulant Use [FQ1OASISU]'
FQ1OASISUR 'ASI Recent History of Stimulant Use (past 30 days) [FQ1OASISUR]'
FQ1OASIOU 'ASI Any History of Opiate Use [FQ1OASIOU]'
FQ1OASIOUR 'ASI Recent History of Opiate Use (past 30 days) [FQ1OASIOUR]'
FQ1OASIBU 'ASI Any History of Barbiturate/Sedative Use [FQ1OASIBU]'
FQ1OASIBUR 'ASI Recent History of Barbiturate/Sedative Use (past 30 days) [FQ1OASIBUR]'
FQ1OASIHU 'ASI Any History of Hallucinogen/Inhalant Use [FQ1OASIHU]'
FQ1OASIHUR 'ASI Recent History of Hallucinogen/Inhalant Use (past 30 days) [FQ1OASIHUR]'
FQ1OASIPU 'ASI Any History of Polysubstance Use [FQ1OASIPU]'
FQ1OASIPUR 'ASI Recent History of Polysubstance Use (past 30 days) [FQ1OASIPUR]'.
EXECUTE.

*STEP 9A: ADD VALUE LABELS.
*Include ALL missing value labels (SEE STEP 8 FOR FULL LIST). 
*Be sure to also include value labels for any constructs that need labels (e.g., 0 'No', 1 'Yes'). Summed or averaged scores do NOT need value labels.
VALUE LABELS
FQ1OASI01A TO FQ1OASIPUR
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
-10 'Prefer not to answer (-10)'
1 'Yes (1)'
0 'No (0)'.  
EXECUTE.  

*STEP 10: CHECK FREQUENCIES.
*Checking frequencies of all constructs.
FREQUENCIES VARIABLES=FD1OSTAT FQ1OASI01A FQ1OASI01C FQ1OASI02A FQ1OASI02C FQ1OASI03A FQ1OASI03C FQ1OASI04A FQ1OASI04C FQ1OASI05A FQ1OASI05C 
FQ1OASI06A FQ1OASI06C FQ1OASI07A FQ1OASI07C FQ1OASI08A FQ1OASI08C FQ1OASI09A FQ1OASI09C FQ1OASI10A FQ1OASI10C
FQ1OASI11A FQ1OASI11C FQ1OASI12A FQ1OASI12C FQ1OASI13A FQ1OASI13C FQ1OASIAU FQ1OASIAUR FQ1OASIBD FQ1OASIBDR 
FQ1OASIMU FQ1OASIMUR FQ1OASISU FQ1OASISUR FQ1OASIOU FQ1OASIOUR FQ1OASIBU FQ1OASIBUR FQ1OASIHU FQ1OASIHUR FQ1OASIPU FQ1OASIPUR
  /ORDER=ANALYSIS.

*STEP 11: CHECK DESCRIPTIVES.
*Checking descriptives for all constructs.
DESCRIPTIVES VARIABLES=FQ1OASI01A FQ1OASI01C FQ1OASI02A FQ1OASI02C FQ1OASI03A FQ1OASI03C FQ1OASI04A FQ1OASI04C FQ1OASI05A FQ1OASI05C 
FQ1OASI06A FQ1OASI06C FQ1OASI07A FQ1OASI07C FQ1OASI08A FQ1OASI08C FQ1OASI09A FQ1OASI09C FQ1OASI10A FQ1OASI10C
FQ1OASI11A FQ1OASI11C FQ1OASI12A FQ1OASI12C FQ1OASI13A FQ1OASI13C FQ1OASIAU FQ1OASIAUR FQ1OASIBD FQ1OASIBDR 
FQ1OASIMU FQ1OASIMUR FQ1OASISU FQ1OASISUR FQ1OASIOU FQ1OASIOUR FQ1OASIBU FQ1OASIBUR FQ1OASIHU FQ1OASIHUR FQ1OASIPU FQ1OASIPUR
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 12: SAVE CLEANED DATA FILE.
*First, sorting the data file by ID and resaving the final file.
*Using /KEEP command to keep ONLY ID + RD + the constructs that were created. 
SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OASI_Constructs.sav'
  /KEEP ID FD1ORD FD1OSTAT FQ1OASI01A FQ1OASI01C FQ1OASI02A FQ1OASI02C FQ1OASI03A FQ1OASI03C FQ1OASI04A FQ1OASI04C FQ1OASI05A FQ1OASI05C 
FQ1OASI06A FQ1OASI06C FQ1OASI07A FQ1OASI07C FQ1OASI08A FQ1OASI08C FQ1OASI09A FQ1OASI09C FQ1OASI10A FQ1OASI10C
FQ1OASI11A FQ1OASI11C FQ1OASI12A FQ1OASI12C FQ1OASI13A FQ1OASI13C FQ1OASIAU FQ1OASIAUR FQ1OASIBD FQ1OASIBDR 
FQ1OASIMU FQ1OASIMUR FQ1OASISU FQ1OASISUR FQ1OASIOU FQ1OASIOUR FQ1OASIBU FQ1OASIBUR FQ1OASIHU FQ1OASIHUR FQ1OASIPU FQ1OASIPUR
  /COMPRESSED.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OASI_Constructs.sav'.
EXECUTE.

*STEP 13: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE 
 OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OASI_Constructs.spv'
LOCK=NO.


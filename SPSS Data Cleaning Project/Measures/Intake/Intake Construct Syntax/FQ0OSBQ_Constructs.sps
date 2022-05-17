* Encoding: UTF-8.
*STEP 0: NOTES.
*SUICIDE BEHAVIORS QUESTIONNAIRE - REVISED (SBQ-R).
*CREATED THE FOLLOWING SUBSCALES & RAN APLHAS; LIST SUBSCALES BELOW (EXAMPLE BELOW).
*Total Score (TOT).
*Lifetime history of suicide behavior (e.g., ideation, attempt) (SBQHxSB).
*Past year history of suicide behavior (e.g., ideation, attempt) (SBQPYSB).
*Suicide Behavior by Group: No history, Lifetime history (none in past year), Past year history (SBQ3GRP).

*02-08-22(BM): Adapted construct syntax for SBQ-R.
*02-18-22(BM): Double Checked.
*02-21-22(BM): Fixed Total construct to have the correct missing number.
*02-21-22(AAC): Checked.
*03-28-22(BM): Added new variable
*03-29-22(BM): Double Checked
*04-27-22(BM): Checked with Pitts syntax and reran.
*05-02-22(AAC): Checked. 

*--------------------------------------------------------------------------------------------------------------------------------.
*STEP 1: OPENING CLEANED DATA.
*Insert the correct file path and file name. Use syntax to open cleaned data file.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ0OSBQ_Cleaned.sav'.

*STEP 2: SAVING CLEANED DATA AS A CONSTRUCT FILE. 
*Insert the correct file path and file name.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ0OSBQ_Constructs.sav'
  /COMPRESSED.

*STEP 3: DESCRIPTIVE STATISTICS (1. FREQ AND 2. CORR) FOR RAW VARIABLES (TOTAL SCORE 1ST, THEN SUBSCALES).
*When running this step note any additional missingness (any other codes) that are not accounted for in the STAT variable. These missing codes (and corresponding IDs) will need to be 
incorporated in STEP 8 below.
FREQ VARS=FQ0OSBQ01C, FQ0OSBQ02, FQ0OSBQ03C, FQ0OSBQ04.
*SBQ-R Total Score.
CORR VARS=FQ0OSBQ01C, FQ0OSBQ02, FQ0OSBQ03C, FQ0OSBQ04.

*STEP 4: RECODING MISSING VALUES.
RECODE FQ0OSBQ01 TO FQ0OSBQ03C (MISSING=-9999).
EXECUTE.

*STEP 5: RELIABILITY STATISTICS (TOTAL SCORE 1st, FOLLOWED BY SUBSCALES).
*SBQ-R Total Score (4 items; n=81; alpha=.849).
REL VARS=FQ0OSBQ01C, FQ0OSBQ02, FQ0OSBQ03C, FQ0OSBQ04
/SCALE(All)= ALL.

*STEP 6: COUNTING MISSING DATA (JUST SUBSCALES), THEN RECODING TO 0 TO AVOID NEGATIVE EFFECTS ON CONSTRUCTS.
*SBQ-R Total Score (TOT).
COUNT MISSTOT=FQ0OSBQ01C, FQ0OSBQ02, FQ0OSBQ03C, FQ0OSBQ04 (-9999).

*RECODE FQ0OSBQ01 TO FQ0OSBQ04 (-9999=0).
*EXECUTE.

*STEP 7: CREATE TOTAL AND SUBSCALES SCORES  (CHECK THAT REVERSE-SCORED ITEMS INCLUDED).
*Note each subscale name and calculate missingness allowed.
*CREATING TOTAL SCORE.
*SBQ-R Total Score (4 items) -- USE MISSINGNESS FOR EACH SUBSCALE as a cut-off point.
COMPUTE FQ0OSBQTOT=-9999.
EXECUTE.
IF (MISSTOT < 1.32) FQ0OSBQTOT=RND(((FQ0OSBQ01C + FQ0OSBQ02 + FQ0OSBQ03C + FQ0OSBQ04)/(4-MISSTOT))*4).
EXECUTE.
*CREATING ALL SUBSCALES (CHECK THAT REVERSE-SCORED ITEMS INCLUDED).
**CHECKED AND NOT NEEDED SINCE NO SUBSCALES.
*CREATING ADDITIONAL CONSTRUCTS.            
*Creating Construct for History of Suicide Behavior (SBQHxSB).
IF (FQ0OSBQ01C=1 AND FQ0OSBQ02=1 AND FQ0OSBQ03C=1) FQ0OSBQHxSB=0.
EXECUTE.
IF (FQ0OSBQ01C GE 2 OR FQ0OSBQ02 GE 2 OR FQ0OSBQ03C GE 2) FQ0OSBQHxSB=1.
EXECUTE.
*Creating Construct for Past Year Suicide Behavior (SBQPYSB). 
IF (FQ0OSBQ02=1) FQ0OSBQPYSB=0.
EXECUTE.
IF (FQ0OSBQ02 GE 2) FQ0OSBQPYSB=1.
EXECUTE.
*Creating construct to create 3 groups: No history of suicide behavior; Lifetime history of suicide behavior (none in past year); Past year history of suicide behavior (SBQ3GRP).
IF (FQ0OSBQHxSB=0) FQ0OSBQ3GRP=0.
EXECUTE.
IF (FQ0OSBQHxSB=1 AND FQ0OSBQPYSB=0) FQ0OSBQ3GRP=1.
EXECUTE.
IF (FQ0OSBQPYSB=1) FQ0OSBQ3GRP=2.
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
**-11 'Participant (parent or child) deceased'                                   /* (Participant (parent or child) deceased) */
**-10 'Prefer not to answer'                                                           /* (Participant selected prefer not to answer) */.
DO IF MISSING(FD0OSTAT).
DO REPEAT x = FQ0OSBQTOT TO FQ0OSBQ3GRP.
RECODE FD0OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.

*Add new variable for when they took the questionnaire.
IF (ID=91637 OR ID=91123 OR ID=90687 OR ID=90999 OR ID=90443 OR ID=90754 OR ID=90104 OR ID=90975 OR ID=91759 OR ID=90230 OR ID=90449 OR ID=90238 OR ID=90830) FQ0OSBQAD=1.
EXECUTE.

IF(ID=90077 OR ID=90083 OR ID=90088 OR ID=90097 OR ID=90102 OR ID=90192 OR ID=90196 OR ID=90210 OR ID=90230 OR ID=90234 OR ID=90250 OR ID=90253 OR ID=90279 OR ID=90331 OR ID=90386 
    OR ID=90439 OR ID=90449 OR ID=90546 OR ID=90564 OR ID=90624 OR ID=90671 OR ID=90724 OR ID=90729 OR ID=90730 OR ID=90739 OR ID=90800 OR ID=90841 OR ID=90846 OR ID=90861 OR ID=90870 
    OR ID=90872 OR ID=90887 OR ID=90891 OR ID=90945 OR ID=90990 OR ID=90991 OR ID=90996 OR ID=90998 OR ID=91040 OR ID=91065 OR ID=91069 OR ID=91072 OR ID=91081 OR ID=91103 OR ID=91133 
    OR ID=91143 OR ID=91155 OR ID=91165 OR ID=91171 OR ID=91199 OR ID=91206 OR ID=91233 OR ID=91260 OR ID=91292 OR ID=91339 OR ID=91469 OR ID=91487 OR ID=91506 OR ID=91533 OR ID=91548 
    OR ID=91552 OR ID=91621 OR ID=91641 OR ID=91662 OR ID=91747 OR ID=91768 OR ID=91769 OR ID=91858 OR ID=91921 OR ID=91995) FQ0OSBQAD=0.
EXECUTE.

IF(ID=91607 OR ID=90933 OR ID=90476 OR ID=90417 OR ID=90203 OR ID=90112 OR ID=90027) FQ0OSBQAD=-33.
EXECUTE.

*Checking frequenices for constructs to look at missingness. 
FREQUENCIES VARIABLES=FD0OSTAT FQ0OSBQTOT FQ0OSBQHxSB FQ0OSBQPYSB FQ0OSBQ3GRP FQ0OSBQAD
  /ORDER=ANALYSIS.
*If there IS missingness that was not accounted for in the STAT variable (for example in DERSAC, participants who indicated they did not have an additional caregiver should be coded as -44
Each construct needs to be coded by ID here. If there IS NO additional missingess not accounted for, delete only this section of syntax and write.
IF (MISSTOT = 4) FQ0OSBQTOT = -33.
IF (MISSTOT = 4) FQ0OSBQHxSB = -33.
IF (MISSTOT = 4) FQ0OSBQPYSB = -33.
IF (MISSTOT = 4) FQ0OSBQ3GRP = -33.
IF (MISSTOT = 4) FQ0OSBQ01 = -33.
IF (MISSTOT = 4) FQ0OSBQ02 = -33.
IF (MISSTOT = 4) FQ0OSBQ03 = -33.
IF (MISSTOT = 4) FQ0OSBQ04 = -33.
IF (MISSTOT = 4) FQ0OSBQ01C = -33.
IF (MISSTOT = 4) FQ0OSBQ03C = -33.
EXECUTE.  

*At this point, the only remaining missingness should represent when participant did not answer a sufficient number of questions, assuming STAT variable was correctly coded for this measure -- CHECK THIS! 
*The following syntax will recode this remaining missingness for each new construct.
IF (FQ0OSBQTOT=-9999) FQ0OSBQTOT=-43.
EXECUTE.  
IF (FQ0OSBQHxSB=-9999) FQ0OSBQHxSB=-43.
EXECUTE.  
IF (FQ0OSBQPYSB=-9999) FQ0OSBQPYSB=-43.
EXECUTE.  
IF (FQ0OSBQ3GRP=-9999) FQ0OSBQ3GRP=-43.
EXECUTE.  
MISSING VALUES
   FQ0OSBQTOT FQ0OSBQHxSB FQ0OSBQPYSB FQ0OSBQ3GRP FQ0OSBQAD
    (LO THRU -1).
EXECUTE.

*STEP 9: LABELING CONSTRUCTS.
VARIABLE LABELS
FQ0OSBQTOT 'SBQ-R Total Score [FQ0OSBQTOT]'
FQ0OSBQHxSB 'Lifetime history of suicide behavior (e.g., ideation, attempt) [FQ0OSBQHxSB]'
FQ0OSBQPYSB 'Past year history of suicide behavior (e.g., ideation, attempt) [FQ0OSBQPYSB]'
FQ0OSBQ3GRP 'Suicide Behavior by Group: No history, Lifetime history (none in past year), Past year history [FQ0OSBQ3GRP]'
FQ0OSBQAD 'What timepoint was the SBQ Administered [FQ0OSBQAD]'.
EXECUTE.

*STEP 9A: ADD VALUE LABELS.
*Include ALL missing value labels (SEE STEP 8 FOR FULL LIST). 
*Be sure to also include value labels for any constructs that need labels (e.g., 0 'No', 1 'Yes'). Summed or averaged scores do NOT need value labels.
VALUE LABELS
FQ0OSBQTOT 
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
-10 'Prefer not to answer (-10)'.
EXECUTE.  

VALUE LABELS
FQ0OSBQHxSB 
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
0 'No history of suicide behavior'
1 'History of suicide behavior'.
EXECUTE.   

VALUE LABELS
FQ0OSBQPYSB 
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
0 'No past year history of suicide behavior'
1 'Yes past year history of suicide behavior'.
EXECUTE.  

VALUE LABELS
FQ0OSBQ3GRP           
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
0 'No history of suicide behavior'
1 'Lifetime history of suicide behavior (none in past year)'
2 'Past year history of suicide behavior'.
EXECUTE.  

VALUE LABELS
FQ0OSBQAD
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
0 'Clinical Intake (0)'
1 'Assessment 1 (1)'.
EXECUTE. 

*STEP 10: CHECK FREQUENCIES.
*Checking frequencies of all constructs.
FREQUENCIES VARIABLES=FD0OSTAT FQ0OSBQTOT FQ0OSBQHxSB FQ0OSBQPYSB FQ0OSBQ3GRP FQ0OSBQAD FQ0OSBQ01 FQ0OSBQ01C FQ0OSBQ02 FQ0OSBQ03 FQ0OSBQ03C FQ0OSBQ04
  /ORDER=ANALYSIS.

*STEP 11: CHECK DESCRIPTIVES.
*Checking descriptives for all constructs.
DESCRIPTIVES VARIABLES=FQ0OSBQTOT FQ0OSBQHxSB FQ0OSBQPYSB FQ0OSBQ3GRP FQ0OSBQAD FQ0OSBQ01 FQ0OSBQ01C FQ0OSBQ02 FQ0OSBQ03 FQ0OSBQ03C FQ0OSBQ04
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 12: SAVE CLEANED DATA FILE.
*First, sorting the data file by ID and resaving the final file.
*Using /KEEP command to keep ONLY ID + RD + the constructs that were created. 
*(EXAMPLE BELOW).
SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ0OSBQ_Constructs.sav'
  /KEEP ID FD0ORD FQ0OSBQTOT FQ0OSBQHxSB FQ0OSBQPYSB FQ0OSBQ3GRP FQ0OSBQAD FQ0OSBQ01 FQ0OSBQ02 FQ0OSBQ03 FQ0OSBQ04
  /COMPRESSED.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ0OSBQ_Constructs.sav'.
EXECUTE.

*STEP 13: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE 
 OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ0OSBQ_Constructs.spv'
LOCK=NO.


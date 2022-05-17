* Encoding: UTF-8.
*STEP 0: NOTES.
*ADVERSE CHILDHOOD EXPERIENCES (ACES).
*CREATED THE FOLLOWING SUBSCALES & RAN APLHAS; LIST SUBSCALES BELOW.
*Total score (TOT).
*Abuse (AB).
*Neglect (NE).
*Household dysfunction (HD).
 
*02-18-22(BM): Adapted to UO data.
*03-07-22(AAC): Checked + applied missing data
*03-09-22(BM): Edited Step 7
*03-15-22(BM): Edited Step 8 To recode items with -9999 to their orignal missing codes. 
*03-15-22(AAC): Checked.

*------------------------------------------------------------------------------.
*STEP 1: OPENING CLEANED DATA.
*Insert the correct file path and file name. Use syntax to open cleaned data file.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OACES_Cleaned.sav'.

*STEP 2: SAVING CLEANED DATA AS A CONSTRUCT FILE. 
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OACES_Constructs.sav'
    /KEEP ID FD1OSTAT FD1ORD FQ1OACES01 FQ1OACES02 FQ1OACES03 FQ1OACES04 FQ1OACES05 FQ1OACES06 FQ1OACES07 FQ1OACES08 FQ1OACES09 FQ1OACES10
  /COMPRESSED.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OACES_Constructs.sav'.
EXECUTE.

*STEP 3: DESCRIPTIVE STATISTICS (1. FREQ AND 2. CORR) FOR RAW VARIABLES (TOTAL SCORE 1ST, THEN SUBSCALES).
*When running this step note any additional missingness (any other codes) that are not accounted for in the STAT variable. These missing codes (and corresponding IDs) will need to be 
incorporated in STEP 8 below.
FREQ VARS=FQ1OACES01, FQ1OACES02, FQ1OACES03, FQ1OACES04, FQ1OACES05, FQ1OACES06, FQ1OACES07, FQ1OACES08, FQ1OACES09, FQ1OACES10.
**Do not need to run correlations, so syntax for that part of step was deleted..

*STEP 4: RECODING MISSING VALUES.
RECODE FQ1OACES01 TO FQ1OACES10 (MISSING=-9999).
EXECUTE.

*STEP 5: RELIABILITY STATISTICS (TOTAL SCORE 1st, FOLLOWED BY SUBSCALES).
**Do not need this step, so syntax deleted.

*STEP 6: COUNTING MISSING DATA (JUST SUBSCALES), THEN RECODING TO 0 TO AVOID NEGATIVE EFFECTS ON CONSTRUCTS.
*Total Score (10 items).
COUNT MISSTOT=FQ1OACES01 FQ1OACES02 FQ1OACES03 FQ1OACES04 FQ1OACES05 FQ1OACES06 FQ1OACES07 FQ1OACES08 FQ1OACES09 FQ1OACES10 (-9999).
*Abuse Scale (AB) (3 items).
COUNT MISSAB=FQ1OACES01 FQ1OACES02 FQ1OACES03 (-9999).
*Neglect Scale (NE) (2 items).
COUNT MISSNE=FQ1OACES04 FQ1OACES05 (-9999).
*Household Dysfunction Scale (HD) (5 items).
COUNT MISSHD=FQ1OACES06 FQ1OACES07 FQ1OACES08 FQ1OACES09 FQ1OACES10 (-9999).
*Checking frequenices to look at missingness. 
FREQUENCIES VARIABLES=MISSTOT MISSAB MISSNE MISSHD
  /ORDER=ANALYSIS.

*STEP 7: CREATE TOTAL AND SUBSCALES SCORES  (CHECK THAT REVERSE-SCORED ITEMS INCLUDED).
*Note each subscale name and calculate missingness allowed.
**Create constructs-specific to ACES syntax.
*CREATING TOTAL SCORE.
*Total Score (10 items).
COMPUTE FQ1OACESTOT=-9999.
EXECUTE.
IF (MISSTOT < 3.33) FQ1OACESTOT=RND(((FQ1OACES01 + FQ1OACES02 + FQ1OACES03 + FQ1OACES04 + FQ1OACES05 + FQ1OACES06 + FQ1OACES07 + FQ1OACES08 + FQ1OACES09 + FQ1OACES10)/(10-MISSTOT))*10).
EXECUTE.
*CREATING ALL SUBSCALES (CHECK THAT REVERSE-SCORED ITEMS INCLUDED).
*Abuse Scale (AB) (3 items) -- 66.7% (i.e., if MISS is less than or equal to 1.00) as a cut-off point.
COMPUTE FQ1OACESAB=-9999.
EXECUTE.
IF (MISSAB < 1.00) FQ1OACESAB=RND(((FQ1OACES01 + FQ1OACES02 + FQ1OACES03)/(3-MISSAB))*3).

EXECUTE.
*Neglect Scale (NE) (2 items) -- 66.7% (i.e., if MISS is less than or equal to 0.66) as a cut-off point.
COMPUTE FQ1OACESNE=-9999.
EXECUTE.
IF (MISSNE < 0.66) FQ1OACESNE=RND(((FQ1OACES04+ FQ1OACES05)/(2-MISSNE))*2).
EXECUTE.
*Household Dysfunction Scale (HD) (5 items) -- 66.7% (i.e., if MISS is less than or equal to 1.65) as a cut-off point.
COMPUTE FQ1OACESHD=-9999.
EXECUTE.
IF (MISSHD < 1.65) FQ1OACESHD=RND(((FQ1OACES06 + FQ1OACES07 + FQ1OACES08 + FQ1OACES09 + FQ1OACES10)/(5-MISSHD))*5).
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
**-11 'Participant (parent or child) deceased'                                 /* (Participant (parent or child) deceased) */
**-10 'Prefer not to answer'                                                           /* (Participant selected prefer not to answer) */.
DO IF MISSING(FD1OSTAT).
DO REPEAT x = FQ1OACES01 TO FQ1OACESHD.
RECODE FD1OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.

IF (ID=90192 OR ID=90210 OR ID=90730 OR ID=90996 OR ID=91072 OR ID=91768 OR ID=91995) FQ1OACESTOT=-43.
EXECUTE.

IF (ID=90192 OR ID=90210 OR ID=90730 OR ID=90996 OR ID=91995) FQ1OACESAB=-43.
EXECUTE.

IF (ID=90210 OR ID=91768) FQ1OACESNE=-43.
EXECUTE.

IF (ID=90210 OR ID=90996 OR ID=91072) FQ1OACESHD=-43.
EXECUTE.

DO IF (value(FQ1OACES01)) = -9999. 
    RECODE FQ1OACES01(-9999 = -10). 
    END IF.

DO IF (value(FQ1OACES02)) = -9999. 
    RECODE FQ1OACES02(-9999 = -10). 
    END IF.

DO IF (value(FQ1OACES03)) = -9999. 
    RECODE FQ1OACES03(-9999 = -10). 
    END IF.

DO IF (value(FQ1OACES04)) = -9999. 
    RECODE FQ1OACES04(-9999 = -10). 
    END IF.

DO IF (value(FQ1OACES05)) = -9999. 
    RECODE FQ1OACES05(-9999 = -10). 
    END IF.

DO IF (value(FQ1OACES06)) = -9999. 
    RECODE FQ1OACES06(-9999 = -10). 
    END IF.

DO IF (value(FQ1OACES07)) = -9999. 
    RECODE FQ1OACES07(-9999 = -10). 
    END IF.

DO IF (value(FQ1OACES08)) = -9999. 
    RECODE FQ1OACES08(-9999 = -10). 
    END IF.

DO IF (value(FQ1OACES09)) = -9999. 
    RECODE FQ1OACES09(-9999 = -10). 
    END IF.

DO IF (value(FQ1OACES10)) = -9999. 
    RECODE FQ1OACES10(-9999 = -10). 
    END IF.

*Checking frequenices for constructs to look at missingness. 
FREQUENCIES VARIABLES=FD1OSTAT FQ1OACES01 FQ1OACES02 FQ1OACES03 FQ1OACES04 FQ1OACES05 FQ1OACES06 FQ1OACES07 FQ1OACES08 FQ1OACES09 FQ1OACES10 
  FQ1OACESTOT FQ1OACESAB FQ1OACESNE FQ1OACESHD 
  /ORDER=ANALYSIS.
*If there IS missingness that was not accounted for in the STAT variable (for example in DERSAC, participants who indicated they did not have an additional caregiver should be coded as -44
Each construct needs to be coded by ID here. If there IS NO additional missingess not accounted for, delete only this section of syntax and write **CHECKED AND NOT NEEDED.
**CHECKED AND NOT NEEDED.
*At this point, the only remaining missingness should represent when participant did not answer a sufficient number of questions, assuming STAT variable was correctly coded for this measure -- CHECK THIS! 
*The following syntax will recode this remaining missingness for each new construct.


MISSING VALUES
   FQ1OACES01 FQ1OACES02 FQ1OACES03 FQ1OACES04 FQ1OACES05 FQ1OACES06 FQ1OACES07 FQ1OACES08 FQ1OACES09 FQ1OACES10 
   FQ1OACESTOT FQ1OACESAB FQ1OACESNE FQ1OACESHD 
    (LO THRU -1).
EXECUTE.

*STEP 9: LABELING CONSTRUCTS.
*(EXAMPLE BELOW).
*Labeling individual items since multiple questions/items from the Pitt cleaned file needed to be combined so they matched the 10 individual items asked in the original ACES measure.     
VARIABLE LABELS
FQ1OACES01 'Prior to your 18th birthday: Did a parent or other adult in the household often or very often swear at you, insult you, put you down, or humiliate you? Or act in a way that made you afraid that you might be physically hurt? [FQ1OACES01]'
FQ1OACES02 'Prior to your 18th birthday: Did a parent or other adult in the household often or very often push, grab, slap, or throw something at you? Or ever hit you so hard that you had marks or were injured? [FQ1OACES02]'
FQ1OACES03 'Prior to your 18th birthday: Did an adult or person at least 5 years older than you ever touch or fondle you or have you touch their body in a sexual way? Or attempt or actually have oral, anal, or vaginal intercourse with you? [FQ1OACES03]'
FQ1OACES04 'Prior to your 18th birthday: Did you often or very often feel that no one in your family loved you or thought you were important or special? Or your family didnt look out for each other, feel close to each other, or support each other? [FQ1OACES04]'
FQ1OACES05 'Prior to your 18th birthday: Did you often or very often feel that you didnt have enough to eat, had to wear dirty clothes, and had no one to protect you? Or your parents were too drunk or high to take care of you or take you to the doctor? [FQ1OACES05]'
FQ1OACES06 'Prior to your 18th birthday: Were your parents ever separated or divorced? [FQ1OACES06]'
FQ1OACES07 'Prior to your 18th birthday: Was your mother or stepmother pushed, grabbed, slapped, or had something thrown at her? Or kicked, bitten, hit with a fist, or hit with something hard? Or repeatedly hit or threatened with a gun or knife? [FQ1OACES07]'
FQ1OACES08 'Prior to your 18th birthday: Did you live with anyone who was a problem drinker or alcoholic, or who used street drugs? [FQ1OACES08]'
FQ1OACES09 'Prior to your 18th birthday: Was a household member depressed or mentally ill, or did a household member attempt suicide? [FQ1OACES09]'
FQ1OACES10 'Prior to your 18th birthday: Did a household member go to prison? [FQ1OACES10]'.
EXECUTE.

VARIABLE LABELS
FQ1OACESTOT 'ACES Total Score [FQ1OACESTOT]'
FQ1OACESAB 'ACES Abuse Scale [FQ1OACESAB]'
FQ1OACESNE 'ACES Neglect Scale [FQ1OACESNE]'
FQ1OACESHD 'ACES Household Dysfunction [FQ1OACESHD]'.
EXECUTE.

*STEP 9A: ADD VALUE LABELS.
*Include ALL missing value labels (SEE STEP 8 FOR FULL LIST). 
*Be sure to also include value labels for any constructs that need labels (e.g., 0 'No', 1 'Yes'). Summed or averaged scores do NOT need value labels.
VALUE LABELS
FQ1OACES01 FQ1OACES02 FQ1OACES03 FQ1OACES04 FQ1OACES05 FQ1OACES06 FQ1OACES07 FQ1OACES08 FQ1OACES09 FQ1OACES10  
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
-10 'Prefer not to Answer (-10)'
0 'No (0)'
1 'Yes (1)'.
EXECUTE.  


VALUE LABELS
FQ1OACESTOT TO FQ1OACESHD
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
*Checking frequencies of all constructs (EXAMPLE BELOW).
FREQUENCIES VARIABLES=FD1OSTAT FQ1OACES01 FQ1OACES02 FQ1OACES03 FQ1OACES04 FQ1OACES05 FQ1OACES06 FQ1OACES07 FQ1OACES08 FQ1OACES09 FQ1OACES10  
  FQ1OACESTOT FQ1OACESAB FQ1OACESNE FQ1OACESHD 
  /ORDER=ANALYSIS.

*STEP 11: CHECK DESCRIPTIVES.
*Checking descriptives for all constructs (EXAMPLE BELOW).
DESCRIPTIVES VARIABLES=FQ1OACES01 FQ1OACES02 FQ1OACES03 FQ1OACES04 FQ1OACES05 FQ1OACES06 FQ1OACES07 FQ1OACES08 FQ1OACES09 FQ1OACES10  
  FQ1OACESTOT FQ1OACESAB FQ1OACESNE FQ1OACESHD 
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 12: SAVE CLEANED DATA FILE.
*First, sorting the data file by ID and resaving the final file.
*Using /KEEP command to keep ONLY ID + RD + the constructs that were created. 
*(EXAMPLE BELOW).
SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OACES_Constructs.sav'
  /KEEP ID FD1ORD FQ1OACES01 FQ1OACES02 FQ1OACES03 FQ1OACES04 FQ1OACES05 FQ1OACES06 FQ1OACES07 FQ1OACES08 FQ1OACES09 FQ1OACES10 
  FQ1OACESTOT FQ1OACESAB FQ1OACESNE FQ1OACESHD  
  /COMPRESSED.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OACES_Constructs.sav'.
EXECUTE.

*STEP 13: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE 
 OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OACES_Constructs.spv'
LOCK=NO.


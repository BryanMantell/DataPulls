* Encoding: UTF-8.
*STEP 0: NOTES
*DEMOGRAPHICS.
 
*05-03-22(AAC): Ran STEPS.
*05-05-22(AAC): Reran steps with revised data. 
*05-10-22(AAC): Reran steps with revised data.
*05-11-22(AAC): Reran steps with revised data.
*05-17-22(BM): Added Sex variable.
*------------------------------------------------------------------------------.
*STEP 1: OPENING CLEANED DATA FILES AND RENAMING ALL VARIABLES FROM 'P' OR 'O' TO 'B'.
*Insert the correct file paths and file names. Use syntax to open cleaned data files.

GET
  FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ0ODEMO_Cleaned.sav'.
SELECT IF NOT(ID = 90077 OR ID = 90097 OR ID = 90253 OR ID = 90386 OR ID = 90830 OR ID = 90846 
    OR ID = 90887 OR ID = 90998 OR ID = 91171).
EXECUTE.
SAVE OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ0ODEMO1C_Cleaned.sav'
   /KEEP ID FD0OSTAT FQ0ODEMO01A FQ0ODEMO01B FQ0ODEMO01D FQ0ODEMO01E FQ0ODEMO01F FQ0ODEMO01G
  FQ0ODEMO21A FQ0ODEMO21B FQ0ODEMO21D FQ0ODEMO21E FQ0ODEMO21F FQ0ODEMO21G
  FQ0ODEMO01C 
  FQ0ODEMO21C 
  FQ0ODEMO02 
  FQ0ODEMO10A FQ0ODEMO10B FQ0ODEMO10C FQ0ODEMO10D FQ0ODEMO10E FQ0ODEMO10F
  FQ0ODEMO14 FQ0ODEMO09A FQ0ODEMO09B FQ0ODEMO11
  FQ0ODEMO06A FQ0ODEMO06B FQ0ODEMO06C FQ0ODEMO06D FQ0ODEMO06E FQ0ODEMO06F FQ0ODEMO06G FQ0ODEMO06H FQ0ODEMO06I
  FQ0ODEMO06J FQ0ODEMO06K FQ0ODEMO06L FQ0ODEMO06M FQ0ODEMO06N
  /COMPRESSED.
  EXECUTE.

GET
  FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ0ODEMO2_Cleaned.sav'.
SELECT IF(ID = 90077 OR ID = 90097 OR ID = 90253 OR ID = 90386 OR ID = 90830 OR ID = 90846 
    OR ID = 90887 OR ID = 90998 OR ID = 91171).
EXECUTE.
SAVE OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ0ODEMO2C_Cleaned.sav'
   /KEEP ID FD0OSTAT FQ0ODEMO00B
  FQ0ODEMO21A FQ0ODEMO21B FQ0ODEMO21D FQ0ODEMO21E FQ0ODEMO21F FQ0ODEMO21G
  FQ0ODEMO01C 
  FQ0ODEMO21C 
  FQ0ODEMO02 
  FQ0ODEMO10A FQ0ODEMO10B FQ0ODEMO10C FQ0ODEMO10D FQ0ODEMO10E FQ0ODEMO10F
  FQ0ODEMO14 FQ0ODEMO09A FQ0ODEMO09B FQ0ODEMO11
  FQ0ODEMO06A FQ0ODEMO06B FQ0ODEMO06C FQ0ODEMO06D FQ0ODEMO06E FQ0ODEMO06F FQ0ODEMO06G FQ0ODEMO06H FQ0ODEMO06I
  FQ0ODEMO06J FQ0ODEMO06K FQ0ODEMO06L FQ0ODEMO06M FQ0ODEMO06N
  /COMPRESSED.
EXECUTE.

MATCH FILES
/FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ0ODEMO1C_Cleaned.sav'
/FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ0ODEMO2C_Cleaned.sav'
/BY ID.
EXECUTE.

GET
  FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\Raw\FQ0OSEX.sav'.
EXECUTE.
SORT CASES BY ID(A).
EXECUTE.
SAVE OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\Raw\FQ0OSEX.sav'
   /KEEP ID Sex 
  /COMPRESSED.
EXECUTE.

MATCH FILES
/FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FD0ODEMOC_Cleaned.sav'
/FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\Raw\FQ0OSEX.sav'
/BY ID.
EXECUTE.

*STEP 2: SAVING CLEANED DATA AS A CONSTRUCT FILE AND OPENING IT. 
*Insert the correct file path and file name. Include ID, FD1PSTAT, FD1OSTAT, and questionnaire 'B' items in order.
SAVE OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FD0ODEMOC_Cleaned.sav'
  /KEEP ID FD0OSTAT Sex
  FQ0ODEMO00B 
  FQ0ODEMO01A FQ0ODEMO01B FQ0ODEMO01D FQ0ODEMO01E FQ0ODEMO01F FQ0ODEMO01G 
  FQ0ODEMO21A FQ0ODEMO21B FQ0ODEMO21D FQ0ODEMO21E FQ0ODEMO21F FQ0ODEMO21G
  FQ0ODEMO01C
  FQ0ODEMO21C
  FQ0ODEMO02 
  FQ0ODEMO10A FQ0ODEMO10B FQ0ODEMO10C FQ0ODEMO10D FQ0ODEMO10E FQ0ODEMO10F
  FQ0ODEMO14 
  FQ0ODEMO09A FQ0ODEMO09B 
  FQ0ODEMO11
  FQ0ODEMO06A FQ0ODEMO06B FQ0ODEMO06C FQ0ODEMO06D FQ0ODEMO06E FQ0ODEMO06F FQ0ODEMO06G FQ0ODEMO06H FQ0ODEMO06I FQ0ODEMO06J FQ0ODEMO06K FQ0ODEMO06L FQ0ODEMO06M FQ0ODEMO06N
  /COMPRESSED.
EXECUTE.

GET FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FD0ODEMOC_Cleaned.sav'.
EXECUTE.



*STEP 3: DESCRIPTIVE STATISTICS (1. FREQ AND 2. CORR) FOR RAW VARIABLES (TOTAL SCORE 1ST, THEN SUBSCALES).
*When running this step note any additional missingness (any other codes) that are not accounted for in the STAT variable. These missing codes (and corresponding IDs) will need to be 
incorporated in STEP 8 below.
FREQ VARS=FD0OSTAT 
  FQ0ODEMO00B 
  FQ0ODEMO01A FQ0ODEMO01B FQ0ODEMO01D FQ0ODEMO01E FQ0ODEMO01F FQ0ODEMO01G 
  FQ0ODEMO21A FQ0ODEMO21B FQ0ODEMO21D FQ0ODEMO21E FQ0ODEMO21F FQ0ODEMO21G
  FQ0ODEMO01C
  FQ0ODEMO21C
  FQ0ODEMO02 
  FQ0ODEMO10A FQ0ODEMO10B FQ0ODEMO10C FQ0ODEMO10D FQ0ODEMO10E FQ0ODEMO10F
  FQ0ODEMO14 
  FQ0ODEMO09A FQ0ODEMO09B 
  FQ0ODEMO11
  FQ0ODEMO06A FQ0ODEMO06B FQ0ODEMO06C FQ0ODEMO06D FQ0ODEMO06E FQ0ODEMO06F FQ0ODEMO06G FQ0ODEMO06H FQ0ODEMO06I FQ0ODEMO06J FQ0ODEMO06K FQ0ODEMO06L FQ0ODEMO06M FQ0ODEMO06N.

*STEP 4: RECODING MISSING VALUES.
**CHECKED AND NOT NEEDED

*STEP 5: RELIABILITY STATISTICS (TOTAL SCORE 1st, FOLLOWED BY SUBSCALES).
**CHECKED AND NOT NEEDED

*STEP 6: COUNTING MISSING DATA (TOTAL SCORE 1st, FOLLOWED BY SUBSCALES), THEN RECODING TO 0 TO AVOID NEGATIVE EFFECTS ON CONSTRUCTS.
**CHECKED AND NOT NEEDED.

*STEP 7: CREATE TOTAL AND SUBSCALES SCORES  (CHECK THAT REVERSE-SCORED ITEMS INCLUDED).
*Note each subscale name and calculate missingness allowed.
**CHECKED AND NOT NEEDED.

*STEP 8: RECODING -9999 VALUES TO MISSING VALUES USING THE STAT VARIABLE & LABELING VALUES AS MISSING.
**All missingness should be checked and labeled correctly here. 
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
**-43 'Question skipped (participant refused question(s))'             /* (participant refused question(s): e.g., prefer not answer)*/
**-41 'Instrument not part of the protocol'                                      /* (instrument added later, not in this version) */
**-33 'Staff Error'                                                                         /* (question incorrectly skipped by staff, PANAS/EMA not administered, etc.) */
**-22 'Not applicable (Staff/Clinician)'                                            /* (KSADS, behavior codes) */
**-21 'Not applicable (Participant)'                                                /* (Questionnaires - participant decided) */
**-17 'Unable to contact teacher'                                                    /* (Staff unable to contact teacher for TRF) */
**-16 'Participant search exhausted'                                              /* (Participant search exhausted - PI decision */    
**-14 'Participant repeated cancellations/delays'                            /* (Participant repeated cancellations/delays */
**-12 'Participant refused follow-up'                                             /* (Participant refused follow-up) */     
**-11 'Participant (parent or child) deceased'                                 /* (Participant (parent or child) deceased) */
**-10 'Prefer not to answer'                                                           /* (Participant selected prefer not to answer) */.
**CHECKED AND NOT NEEDED.

COMPUTE DEMO = 1.
EXECUTE.
IF (ID = 90077 OR ID = 90097 OR ID = 90253 OR ID = 90386 OR ID = 90830 OR ID = 90846 
    OR ID = 90887 OR ID = 90998 OR ID = 91171) DEMO = 2.
EXECUTE.

*STEP 9: LABELING CONSTRUCTS.
VARIABLE LABELS
FQ0ODEMO00B 'What is your racial background? [FQ0ODEMO00B]'
FQ0ODEMO01A 'What is your ethnic or racial background? (Select all that apply) - Selected Choice African-American or Black [FQ0ODEMO01A]'
FQ0ODEMO01B 'What is your ethnic or racial background? (Select all that apply) - Selected Choice Asian [FQ0ODEMO01B]'
FQ0ODEMO01D 'What is your ethnic or racial background? (Select all that apply) - Selected Choice American Indian, Alaskan Native [FQ0ODEMO01D]'
FQ0ODEMO01E 'What is your ethnic or racial background? (Select all that apply) - Selected Choice Native Hawaiian or Pacific Islander [FQ0ODEMO01E]'
FQ0ODEMO01F 'What is your ethnic or racial background? (Select all that apply) - Selected Choice European American or White [FQ0ODEMO01F]'
FQ0ODEMO01G 'What is your ethnic or racial background? (Select all that apply) - Selected Choice Other [FQ0ODEMO01G]'
FQ0ODEMO21A 'Your Child: Please answer the following questions about TC. What is TCs ethnic or racial background? (Select all that apply) - Selected Choice African American or Black [FQ0ODEMO21A]' 
FQ0ODEMO21B 'Your Child: Please answer the following questions about TC. What is TCs ethnic or racial background? (Select all that apply) - Selected Choice Asian [FQ0ODEMO21B]'
FQ0ODEMO21D 'Your Child: Please answer the following questions about TC. What is TCs ethnic or racial background? (Select all that apply) - Selected Choice American Indian, Alaskan Native [FQ0ODEMO21D]'
FQ0ODEMO21E 'Your Child: Please answer the following questions about TC. What is TCs ethnic or racial background? (Select all that apply) - Selected Choice Native Hawaiian or Pacific Islander [FQ0ODEMO21E]' 
FQ0ODEMO21F 'Your Child: Please answer the following questions about TC. What is TCs ethnic or racial background? (Select all that apply) - Selected Choice European American or White [FQ0ODEMO21F]'
FQ0ODEMO21G 'Your Child: Please answer the following questions about TC. What is TCs ethnic or racial background? (Select all that apply) - Selected Choice Other [FQ0ODEMO21G]'
FQ0ODEMO01C 'What is your ethnic or racial background? (Select all that apply) - Selected Choice Latino(a) or Hispanic [FQ0ODEMO01C]'
FQ0ODEMO21C 'Your Child: Please answer the following questions about TC. What is TCs ethnic or racial background? (Select all that apply) - Selected Choice Latino(a) or Hispanic [FQ0ODEMO21C]'
FQ0ODEMO02 'What is your current relationship status? - Selected Choice [FQ0ODEMO02]'
FQ0ODEMO10A 'Income: What is your familys primary source of income? (only select 2 options if both apply) - Selected Choice Salary/Wage from your job [FQ0ODEMO10A]'
FQ0ODEMO10B 'Income: What is your familys primary source of income? (only select 2 options if both apply) - Selected Choice Salary/wage from another household members job [FQ0ODEMO10B]'
FQ0ODEMO10C 'Income: What is your familys primary source of income? (only select 2 options if both apply) - Selected Choice Investments [FQ0ODEMO10C]'
FQ0ODEMO10D 'Income: What is your familys primary source of income? (only select 2 options if both apply) - Selected Choice Child support or alimony [FQ0ODEMO10D]'
FQ0ODEMO10E 'Income: What is your familys primary source of income? (only select 2 options if both apply) - Selected Choice State or Federal aid [FQ0ODEMO10E]'
FQ0ODEMO10F 'Income: What is your familys primary source of income? (only select 2 options if both apply) - Selected Choice Other [FQ0ODEMO10F]'
FQ0ODEMO14 'What is your familys average annual income from all sources? (salary, investments, child support or alimony, state or federal aid) [FQ0ODEMO14]'
FQ0ODEMO09A 'Education: How many years of formal education does each of the following people have? - Mother [FQ0ODEMO09A]'
FQ0ODEMO09B 'Education: How many years of formal education does each of the following people have? - Father [FQ0ODEMO09B]'
FQ0ODEMO11 'Are you currently employed? [FQ0ODEMO11]'
FQ0ODEMO06A 'Who lives at home with TC? TCs Biological Mother [FQ0ODEMO06A]'
FQ0ODEMO06B 'Who lives at home with TC? TCs Biological Father [FQ0ODEMO06B]'
FQ0ODEMO06C 'Who lives at home with TC? Sister(s) (other than TC) [FQ0ODEMO06C]'
FQ0ODEMO06D 'Who lives at home with TC? Brother(s) (other than TC) [FQ0ODEMO06D]'
FQ0ODEMO06E 'Who lives at home with TC? TCs Stepmother [FQ0ODEMO06E]'
FQ0ODEMO06F 'Who lives at home with TC? TCs Stepfather [FQ0ODEMO06F]'
FQ0ODEMO06G 'Who lives at home with TC? Stepsister(s) (other than TC) [FQ0ODEMO06G]'
FQ0ODEMO06H 'Who lives at home with TC? Stepbrother(s) (other than TC) [FQ0ODEMO06H]'
FQ0ODEMO06I 'Who lives at home with TC? TCs Grandmother [FQ0ODEMO06I]'
FQ0ODEMO06J 'Who lives at home with TC? TCs Grandfather [FQ0ODEMO06J]'
FQ0ODEMO06K 'Who lives at home with TC? TCs Aunt [FQ0ODEMO06K]'
FQ0ODEMO06L 'Who lives at home with TC? TCs Uncle [FQ0ODEMO06L]'
FQ0ODEMO06M 'Who lives at home with TC? TCs Friend [FQ0ODEMO06M]'
FQ0ODEMO06N 'Who lives at home with TC? Parents Girlfriend/Boyfriend [FQ0ODEMO06N]'
DEMO 'Version of DEMO Given (1 or 2)'.
EXECUTE.

*STEP 9A: ADD VALUE LABELS.
*Include ALL missing value labels (SEE STEP 8 FOR FULL LIST). 
*Be sure to also include value labels for any constructs that need labels (e.g., 0 'No', 1 'Yes'). Summed or averaged scores do NOT need value labels.
VALUE LABELS
FQ0ODEMO01A FQ0ODEMO01B FQ0ODEMO01D FQ0ODEMO01E FQ0ODEMO01F FQ0ODEMO01G 
FQ0ODEMO01C
FQ0ODEMO21A FQ0ODEMO21B FQ0ODEMO21D FQ0ODEMO21E FQ0ODEMO21F FQ0ODEMO21G
FQ0ODEMO21C
FQ0ODEMO10A FQ0ODEMO10B FQ0ODEMO10C FQ0ODEMO10D FQ0ODEMO10E FQ0ODEMO10F
FQ0ODEMO11
FQ0ODEMO06A FQ0ODEMO06B FQ0ODEMO06C FQ0ODEMO06D FQ0ODEMO06E FQ0ODEMO06F FQ0ODEMO06G FQ0ODEMO06H FQ0ODEMO06I FQ0ODEMO06J FQ0ODEMO06K FQ0ODEMO06L FQ0ODEMO06M FQ0ODEMO06N
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
-43 'Question Skipped (participant refused question(s)) (-43)'     
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
0 'No (0)'
1 'Yes (1)'.
EXECUTE.

VALUE LABELS
FQ0ODEMO00B
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
-43 'Question Skipped (participant refused question(s)) (-43)'     
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
1 'African American or Black (1)'
2 'Asian or Asian American (2)'
3 'American Indian, Alaskan Native (3)'
4 'Native Hawaiian or Pacific Islander (4)'
5 'European American or White (5)'
6 'Other (6)'.
EXECUTE.

VALUE LABELS
FQ0ODEMO02
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
-43 'Question Skipped (participant refused question(s)) (-43)'     
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
1 'Never Married (1)'
2 'Married - Living Together (2)'
3 'Married - Separated (3)'
4 'Divorced (4)'
5 'Remarried (5)'
6 'Living with partner (6)'
7 'Widowed (7)'
8 'Other (8)'.
EXECUTE.

VALUE LABELS
FQ0ODEMO09A FQ0ODEMO09B
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
-43 'Question Skipped (participant refused question(s)) (-43)'     
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
1 'Less than 8th grade (1)'
2 '8th grade (2)'
3 'Some high school (3)'
4 'H.S. graduate (4)'
5 'Some college (5)'
6 'Tech./Prof. School (6)'
7 'College/Univ. graduate (7)'
8 'Some graduate school (8)'
9 'Masters Degree (9)'
10 'J.D., M.D., or Ph.D. (10)'.
EXECUTE.

VALUE LABELS
FQ0ODEMO14
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
-43 'Question Skipped (participant refused question(s)) (-43)'     
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
1 '$22,310 or less (1)'
2 'Between $22,311 and $30,044 (2)'
3 'Between $30,045 and $37,777 (3)'
4 'Between $37,778 and $45,510 (4)'
5 'Between $45,511 and $53,243 (5)'
6 'Between $53,244 and $60,976 (6)'
7 'Between $60,977 and $68,709 (7)'
8 'Between $68,710 and $76,442 (8)'
9 'More than $76,442 (9)'.
EXECUTE.

VALUE LABELS
DEMO
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
-43 'Question skipped (participant refused question(s)) (-43)'     
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
1 'DEMO Version 1'
2 'DEMO Version 2'.
EXECUTE.  

*STEP 10: CHECK FREQUENCIES.
*Checking frequencies of all constructs.
FREQUENCIES VARIABLES=FD0OSTAT Sex
  FQ0ODEMO00B 
  FQ0ODEMO01A FQ0ODEMO01B FQ0ODEMO01D FQ0ODEMO01E FQ0ODEMO01F FQ0ODEMO01G 
  FQ0ODEMO21A FQ0ODEMO21B FQ0ODEMO21D FQ0ODEMO21E FQ0ODEMO21F FQ0ODEMO21G
  FQ0ODEMO01C
  FQ0ODEMO21C
  FQ0ODEMO02 
  FQ0ODEMO10A FQ0ODEMO10B FQ0ODEMO10C FQ0ODEMO10D FQ0ODEMO10E FQ0ODEMO10F
  FQ0ODEMO14 
  FQ0ODEMO09A FQ0ODEMO09B 
  FQ0ODEMO11
  FQ0ODEMO06A FQ0ODEMO06B FQ0ODEMO06C FQ0ODEMO06D FQ0ODEMO06E FQ0ODEMO06F FQ0ODEMO06G FQ0ODEMO06H FQ0ODEMO06I FQ0ODEMO06J FQ0ODEMO06K FQ0ODEMO06L FQ0ODEMO06M FQ0ODEMO06N
  /ORDER=ANALYSIS.

*STEP 11: CHECK DESCRIPTIVES.
*Checking descriptives for all constructs.
DESCRIPTIVES VARIABLES= FD0OSTAT Sex
  FQ0ODEMO00B 
  FQ0ODEMO01A FQ0ODEMO01B FQ0ODEMO01D FQ0ODEMO01E FQ0ODEMO01F FQ0ODEMO01G 
  FQ0ODEMO21A FQ0ODEMO21B FQ0ODEMO21D FQ0ODEMO21E FQ0ODEMO21F FQ0ODEMO21G
  FQ0ODEMO01C
  FQ0ODEMO21C
  FQ0ODEMO02 
  FQ0ODEMO10A FQ0ODEMO10B FQ0ODEMO10C FQ0ODEMO10D FQ0ODEMO10E FQ0ODEMO10F
  FQ0ODEMO14 
  FQ0ODEMO09A FQ0ODEMO09B 
  FQ0ODEMO11
  FQ0ODEMO06A FQ0ODEMO06B FQ0ODEMO06C FQ0ODEMO06D FQ0ODEMO06E FQ0ODEMO06F FQ0ODEMO06G FQ0ODEMO06H FQ0ODEMO06I FQ0ODEMO06J FQ0ODEMO06K FQ0ODEMO06L FQ0ODEMO06M FQ0ODEMO06N
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 12: SAVE CLEANED DATA FILE.
*First, sorting the data file by ID and resaving the final file.
*Using /KEEP command to keep ONLY ID + RD + the constructs that were created.
SORT CASES BY ID(A).
SAVE OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FD0ODEMOC_Cleaned.sav'
  /KEEP ID FD0OSTAT Sex
  FQ0ODEMO00B 
  FQ0ODEMO01A FQ0ODEMO01B FQ0ODEMO01D FQ0ODEMO01E FQ0ODEMO01F FQ0ODEMO01G 
  FQ0ODEMO21A FQ0ODEMO21B FQ0ODEMO21D FQ0ODEMO21E FQ0ODEMO21F FQ0ODEMO21G
  FQ0ODEMO01C
  FQ0ODEMO21C
  FQ0ODEMO02 
  FQ0ODEMO10A FQ0ODEMO10B FQ0ODEMO10C FQ0ODEMO10D FQ0ODEMO10E FQ0ODEMO10F
  FQ0ODEMO14 
  FQ0ODEMO09A FQ0ODEMO09B 
  FQ0ODEMO11
  FQ0ODEMO06A FQ0ODEMO06B FQ0ODEMO06C FQ0ODEMO06D FQ0ODEMO06E FQ0ODEMO06F FQ0ODEMO06G FQ0ODEMO06H FQ0ODEMO06I FQ0ODEMO06J FQ0ODEMO06K FQ0ODEMO06L FQ0ODEMO06M FQ0ODEMO06N
  DEMO
   /COMPRESSED.

GET
  FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FD0ODEMOC_Cleaned.sav'.
EXECUTE.

*STEP 13: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE 
 OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FD0ODEMOC_Cleaned.spv'
LOCK=NO.

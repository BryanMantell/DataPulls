﻿* Encoding: UTF-8.
*STEP 0: NOTES.
*INTOLERANCE OF UNCERTAINTY SCALE (IUS).

*CREATED THE FOLLOWING SUBSCALES & RAN APLHAS; LIST SUBSCALES BELOW (EXAMPLE BELOW).
*Total score (TOT).
*IUS Prospective Anxiety (PA)
*IUS Inhibitory Anxiety (IA)

*03-08-22(BM):Adapted for A2.
*03-09-22(AAC): Checked. Alpha added to syntax.

*------------------------------------------------------------------------------.
*STEP 1: OPENING CLEANED DATA.
*Insert the correct file path and file name. Use syntax to open cleaned data file.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OIUS_Cleaned.sav'.

*STEP 2: SAVING CLEANED DATA AS A CONSTRUCT FILE. 
*Insert the correct file path and file name.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OIUS_Constructs.sav'
  /COMPRESSED.

*STEP 3: DESCRIPTIVE STATISTICS (1. FREQ AND 2. CORR) FOR RAW VARIABLES (TOTAL SCORE 1ST, THEN SUBSCALES).
*When running this step note any additional missingness (any other codes) that are not accounted for in the STAT variable. These missing codes (and corresponding IDs) will need to be 
incorporated in STEP 8 below.
FREQ VARS=FQ2OIUS01, FQ2OIUS02, FQ2OIUS03, FQ2OIUS04, FQ2OIUS05, FQ2OIUS06, FQ2OIUS07, FQ2OIUS08, FQ2OIUS09, 
    FQ2OIUS10, FQ2OIUS11, FQ2OIUS12.
*IUS Total Score.
CORR VARS=FQ2OIUS01, FQ2OIUS02, FQ2OIUS03, FQ2OIUS05, FQ2OIUS06, FQ2OIUS07, FQ2OIUS08, FQ2OIUS09, 
    FQ2OIUS10, FQ2OIUS11, FQ2OIUS12.
*IUS Prospective Anxiety (PA).
CORR VARS=FQ2OIUS01 FQ2OIUS02 FQ2OIUS03 FQ2OIUS04 FQ2OIUS05 FQ2OIUS06 FQ2OIUS07.
*IUS Inhibitory Anxiety (IA).
CORR VARS=FQ2OIUS08 FQ2OIUS09 FQ2OIUS10 FQ2OIUS11 FQ2OIUS12.

*STEP 4: RECODING MISSING VALUES.
RECODE FQ2OIUS01 TO FQ2OIUS12 (MISSING=-9999).
EXECUTE.
    
*STEP 5: RELIABILITY STATISTICS (TOTAL SCORE 1st, FOLLOWED BY SUBSCALES).
*IUS Total Score (12 items; n=36; alpha=.929).
REL VARS=FQ2OIUS01 FQ2OIUS02 FQ2OIUS03 FQ2OIUS04 FQ2OIUS05 FQ2OIUS06 FQ2OIUS07 FQ2OIUS08 FQ2OIUS09 
    FQ2OIUS10 FQ2OIUS11 FQ2OIUS12
/SCALE(All)= ALL.
*IUS Prospective Anxiety (PA) (7 items; n=36; alpha=.892).
REL VARS=FQ2OIUS01 FQ2OIUS02 FQ2OIUS03 FQ2OIUS04 FQ2OIUS05 FQ2OIUS06 FQ2OIUS07
/SCALE(All)= ALL.
*IUS Inhibitory Anxiety (IA) (5 items; n=36; alpha=.860).
REL VARS=FQ2OIUS08 FQ2OIUS09 FQ2OIUS10 FQ2OIUS11 FQ2OIUS12
/SCALE(All)= ALL.

*STEP 6: COUNTING MISSING DATA (JUST SUBSCALES), THEN RECODING TO 0 TO AVOID NEGATIVE EFFECTS ON CONSTRUCTS.
*IUS TOTAL (TOT).
COUNT MISSTOT=FQ2OIUS01 FQ2OIUS02 FQ2OIUS03 FQ2OIUS05 FQ2OIUS06 FQ2OIUS07 FQ2OIUS08 FQ2OIUS09 
    FQ2OIUS10 FQ2OIUS11 FQ2OIUS12 (-9999).
*IUS Prospective Anxiety (PA).
COUNT MISSPA=FQ2OIUS01 FQ2OIUS02 FQ2OIUS03 FQ2OIUS05 FQ2OIUS06 FQ2OIUS07 (-9999).
*IUS Inhibitory Anxiety (IA).
COUNT MISSIA=FQ2OIUS08 FQ2OIUS09 FQ2OIUS10 FQ2OIUS11 FQ2OIUS12 (-9999).

RECODE FQ2OIUS01 TO FQ2OIUS12 (-9999=0).
EXECUTE.

*STEP 7: CREATE TOTAL AND SUBSCALES SCORES  (CHECK THAT REVERSE-SCORED ITEMS INCLUDED).
*Note each subscale name and calculate missingness allowed.
*CREATING TOTAL SCORE.
*Total Score (12 items) -- USE MISSINGNESS FOR EACH SUBSCALE as a cut-off point.
COMPUTE FQ2OIUSTOT=-9999.
EXECUTE.
IF (MISSTOT < 3.96) FQ2OIUSTOT=RND(((FQ2OIUS01 + FQ2OIUS02 + FQ2OIUS03 + FQ2OIUS04 + FQ2OIUS05 + FQ2OIUS06 + FQ2OIUS07 + FQ2OIUS08 + FQ2OIUS09 + 
    FQ2OIUS10 + FQ2OIUS11 + FQ2OIUS12)/(12-MISSTOT))*12).
EXECUTE.
*IUS Prospective Anxiety (PA) (7 items) --  66.7% (i.e., if MISS is less than or equal to 2.31) as a cut-off point.
COMPUTE FQ2OIUSPA=-9999.
EXECUTE.
IF (MISSPA < 2.31) FQ2OIUSPA=RND(((FQ2OIUS01 + FQ2OIUS02 + FQ2OIUS03 + FQ2OIUS04 + FQ2OIUS05 + FQ2OIUS06 + FQ2OIUS07)/(7-MISSTOT))*7).
EXECUTE.
*IUS Inhibitory Anxiety (IA) (5 items) --  66.7% (i.e., if MISS is less than or equal to 1.65) as a cut-off point.
COMPUTE FQ2OIUSIA=-9999.
EXECUTE.
IF (MISSIA < 1.65) FQ2OIUSIA=RND(((FQ2OIUS08 + FQ2OIUS09 + FQ2OIUS10 + FQ2OIUS11 + FQ2OIUS12)/(5-MISSTOT))*5).
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
**-11 'Participant (parent or child) deceased'                                                /* (Participant (child) deceased) */
**-10 'Prefer not to answer'                                                           /* (Participant selected prefer not to answer) */.
DO IF MISSING(FD2OSTAT).
DO REPEAT x = FQ2OIUSTOT TO FQ2OIUSIA.
RECODE FD2OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.
*Checking frequenices for constructs to look at missingness. 
FREQUENCIES VARIABLES=FD2OSTAT FQ2OIUSTOT FQ2OIUSPA FQ2OIUSIA
  /ORDER=ANALYSIS.
*If there IS missingness that was not accounted for in the STAT variable (for example in DERSAC, participants who indicated they did not have an additional caregiver should be coded as -44
Each construct needs to be coded by ID here. If there IS NO additional missingess not accounted for, delete only this section of syntax and write **CHECKED AND NOT NEEDED.

*At this point, the only remaining missingness should represent when participant did not answer a sufficient number of questions, assuming STAT variable was correctly coded for this measure -- CHECK THIS! 
*The following syntax will recode this remaining missingness for each new construct.
IF(ID=90687 OR ID=91637 OR ID=90999 OR ID=91123 OR ID=90754 OR ID=90975 OR
ID=91759 OR ID=90443 OR ID=90449 OR ID=90230 OR ID=90238 OR ID=90830 OR
ID=90210 OR ID=90102 OR ID=90234 OR ID=90841 OR ID=90564 OR ID=90861 OR
ID=90739 OR ID=91768 OR ID=90996 OR ID=90945 OR ID=91469 OR ID=91165 OR
ID=90671 OR ID=90800 OR ID=90724) FQ2OIUSTOT=-41.
EXECUTE.

IF(ID=90687 OR ID=91637 OR ID=90999 OR ID=91123 OR ID=90754 OR ID=90975 OR
ID=91759 OR ID=90443 OR ID=90449 OR ID=90230 OR ID=90238 OR ID=90830 OR
ID=90210 OR ID=90102 OR ID=90234 OR ID=90841 OR ID=90564 OR ID=90861 OR
ID=90739 OR ID=91768 OR ID=90996 OR ID=90945 OR ID=91469 OR ID=91165 OR
ID=90671 OR ID=90800 OR ID=90724) FQ2OIUSPA=-41.
EXECUTE.

IF(ID=90687 OR ID=91637 OR ID=90999 OR ID=91123 OR ID=90754 OR ID=90975 OR
ID=91759 OR ID=90443 OR ID=90449 OR ID=90230 OR ID=90238 OR ID=90830 OR
ID=90210 OR ID=90102 OR ID=90234 OR ID=90841 OR ID=90564 OR ID=90861 OR
ID=90739 OR ID=91768 OR ID=90996 OR ID=90945 OR ID=91469 OR ID=91165 OR
ID=90671 OR ID=90800 OR ID=90724) FQ2OIUSIA=-41.
EXECUTE.

MISSING VALUES
   FQ2OIUSTOT FQ2OIUSPA FQ2OIUSIA
    (LO THRU -1).
EXECUTE.

*STEP 9: LABELING CONSTRUCTS.
VARIABLE LABELS
FQ2OIUSTOT 'IUS Total Score [FQ2OIUSTOT]'
FQ2OIUSPA 'IUS Prospective Anxiety [FQ2OIUSPA]'
FQ2OIUSIA 'IUS Inhibitory Anxiety [FQ2OIUSIA]'.
EXECUTE.

*STEP 9A: ADD VALUE LABELS.
*Include ALL missing value labels (SEE STEP 8 FOR FULL LIST). 
*Be sure to also include value labels for any constructs that need labels (e.g., 0 'No', 1 'Yes'). Summed or averaged scores do NOT need value labels.
VALUE LABELS
   FQ2OIUSTOT FQ2OIUSPA FQ2OIUSIA
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
-11 'Participant (parent or child) deceased (-11)'                              
-10 'Prefer not to Answer (-10)'.
EXECUTE. 

*STEP 10: CHECK FREQUENCIES.
*Checking frequencies of all constructs.
FREQUENCIES VARIABLES=FD2OSTAT FQ2OIUSTOT FQ2OIUSPA FQ2OIUSIA 
      /ORDER=ANALYSIS.

*STEP 11: CHECK DESCRIPTIVES.
*Checking descriptives for all constructs.
DESCRIPTIVES VARIABLES=FQ2OIUSTOT FQ2OIUSPA FQ2OIUSIA
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 12: SAVE CLEANED DATA FILE.
*First, sorting the data file by ID and resaving the final file.
*Using /KEEP command to keep ONLY ID + RD + the constructs that were created. 
SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OIUS_Constructs.sav'
  /KEEP ID FD2ORD FQ2OIUSTOT FQ2OIUSPA FQ2OIUSIA 
  /COMPRESSED.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OIUS_Constructs.sav'.
EXECUTE.

*STEP 13: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE 
 OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OIUS_Constructs.spv'
LOCK=NO.


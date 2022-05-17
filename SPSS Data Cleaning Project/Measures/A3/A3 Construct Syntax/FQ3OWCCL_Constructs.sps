* Encoding: UTF-8.
*STEP 0: NOTES.
*DBT-WAYS OF COPING CHECKLIST (DBT-WCCL)
*CREATED THE FOLLOWING SUBSCALES & RAN APLHAS.
*Skills Use Scale (SU).
*Dysfunctional Coping Scale 1: General dysfunctional coping factor (GD).
*Dysfunctional Coping Ccale 2: Blaming others factor (BO).
 
*4-19-22(BM): Adapted syntax for A3.
*04-21-22(AAC): Checked.
*--------------------------------------------------------------------------------------------------------------------------------.
*STEP 1: OPENING CLEANED DATA.
*Insert the correct file path and file name. Use syntax to open cleaned data file.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OWCCL_Cleaned.sav'.

*STEP 2: SAVING CLEANED DATA AS A CONSTRUCT FILE. 
*Insert the correct file path and file name.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OWCCL_Constructs.sav'
  /COMPRESSED.

*STEP 3: DESCRIPTIVE STATISTICS (1. FREQ AND 2. CORR) FOR RAW VARIABLES (TOTAL SCORE 1ST, THEN SUBSCALES).
*When running this step note any additional missingness (any other codes) that are not accounted for in the STAT variable. These missing codes (and corresponding IDs) will need to be 
incorporated in STEP 8 below.
FREQ VARS=FQ3OWCCL01, FQ3OWCCL02, FQ3OWCCL03, FQ3OWCCL04, FQ3OWCCL05, FQ3OWCCL06, FQ3OWCCL07, FQ3OWCCL08, FQ3OWCCL09, 
    FQ3OWCCL10, FQ3OWCCL11, FQ3OWCCL12, FQ3OWCCL13, FQ3OWCCL14, FQ3OWCCL15, FQ3OWCCL16, FQ3OWCCL17, FQ3OWCCL18, FQ3OWCCL19,
    FQ3OWCCL20, FQ3OWCCL21, FQ3OWCCL22, FQ3OWCCL23, FQ3OWCCL24, FQ3OWCCL25, FQ3OWCCL26, FQ3OWCCL27, FQ3OWCCL28, FQ3OWCCL29,
    FQ3OWCCL30, FQ3OWCCL31, FQ3OWCCL32, FQ3OWCCL33, FQ3OWCCL34, FQ3OWCCL35, FQ3OWCCL36, FQ3OWCCL37, FQ3OWCCL38, FQ3OWCCL39,
    FQ3OWCCL40, FQ3OWCCL41, FQ3OWCCL42, FQ3OWCCL43, FQ3OWCCL44, FQ3OWCCL45, FQ3OWCCL46, FQ3OWCCL47, FQ3OWCCL48, FQ3OWCCL49,
    FQ3OWCCL50, FQ3OWCCL51, FQ3OWCCL52, FQ3OWCCL53, FQ3OWCCL54, FQ3OWCCL55, FQ3OWCCL56, FQ3OWCCL57, FQ3OWCCL58, FQ3OWCCL59.
*Skills Use Scale (SU).
CORR VARS=FQ3OWCCL01, FQ3OWCCL02, FQ3OWCCL04, FQ3OWCCL06, FQ3OWCCL09, FQ3OWCCL10, FQ3OWCCL11, FQ3OWCCL13, FQ3OWCCL16,
    FQ3OWCCL18, FQ3OWCCL19, FQ3OWCCL21, FQ3OWCCL22, FQ3OWCCL23, FQ3OWCCL26, FQ3OWCCL27, FQ3OWCCL29, FQ3OWCCL31, FQ3OWCCL33,
    FQ3OWCCL34, FQ3OWCCL35, FQ3OWCCL36, FQ3OWCCL38, FQ3OWCCL39, FQ3OWCCL40, FQ3OWCCL42, FQ3OWCCL43, FQ3OWCCL44, FQ3OWCCL47, 
    FQ3OWCCL49, FQ3OWCCL50, FQ3OWCCL51, FQ3OWCCL53, FQ3OWCCL54, FQ3OWCCL56, FQ3OWCCL57, FQ3OWCCL58, FQ3OWCCL59.
*Dysfunctional Coping Scale 1: General dysfunctional coping factor (GD).
CORR VARS=FQ3OWCCL03, FQ3OWCCL05, FQ3OWCCL08, FQ3OWCCL12, FQ3OWCCL14, FQ3OWCCL17, FQ3OWCCL20, FQ3OWCCL25, FQ3OWCCL32, FQ3OWCCL37, 
    FQ3OWCCL41, FQ3OWCCL45, FQ3OWCCL46, FQ3OWCCL52, FQ3OWCCL55.
*Dysfunctional Coping Scale 2: blaming others factor (BO).
CORR VARS=FQ3OWCCL07, FQ3OWCCL15, FQ3OWCCL24, FQ3OWCCL28, FQ3OWCCL30, FQ3OWCCL48.

*STEP 4: RECODING MISSING VALUES.
RECODE FQ3OWCCL01 TO FQ3OWCCL59 (MISSING=-9999).
EXECUTE.

*STEP 5: RELIABILITY STATISTICS (TOTAL SCORE 1st, FOLLOWED BY SUBSCALES).
*Skills Use Scale (SU) (38 items; n=53; alpha=.949).
REL VARS=FQ3OWCCL01, FQ3OWCCL02, FQ3OWCCL04, FQ3OWCCL06, FQ3OWCCL09, FQ3OWCCL10, FQ3OWCCL11, FQ3OWCCL13, FQ3OWCCL16,
    FQ3OWCCL18, FQ3OWCCL19, FQ3OWCCL21, FQ3OWCCL22, FQ3OWCCL23, FQ3OWCCL26, FQ3OWCCL27, FQ3OWCCL29, FQ3OWCCL31, FQ3OWCCL33,
    FQ3OWCCL34, FQ3OWCCL35, FQ3OWCCL36, FQ3OWCCL38, FQ3OWCCL39, FQ3OWCCL40, FQ3OWCCL42, FQ3OWCCL43, FQ3OWCCL44, FQ3OWCCL47, 
    FQ3OWCCL49, FQ3OWCCL50, FQ3OWCCL51, FQ3OWCCL53, FQ3OWCCL54, FQ3OWCCL56, FQ3OWCCL57, FQ3OWCCL58, FQ3OWCCL59
/SCALE(All)= ALL.
*Dysfunctional Coping Scale 1: General dysfunctional coping factor (GD) (15 items; n=51; alpha=.917).
REL VARS=FQ3OWCCL03, FQ3OWCCL05, FQ3OWCCL08, FQ3OWCCL12, FQ3OWCCL14, FQ3OWCCL17, FQ3OWCCL20, FQ3OWCCL25, FQ3OWCCL32, FQ3OWCCL37, 
    FQ3OWCCL41, FQ3OWCCL45, FQ3OWCCL46, FQ3OWCCL52, FQ3OWCCL55
/SCALE(All)= ALL.
*Dysfunctional Coping Scale 2: Blaming others factor (BO) (6 items; n=54; alpha=.866).
REL VARS=FQ3OWCCL07, FQ3OWCCL15, FQ3OWCCL24, FQ3OWCCL28, FQ3OWCCL30, FQ3OWCCL48
/SCALE(All)= ALL.

*STEP 6: COUNTING MISSING DATA (TOTAL SCORE 1st, FOLLOWED BY SUBSCALES), THEN RECODING TO 0 TO AVOID NEGATIVE EFFECTS ON CONSTRUCTS.
*Skills Use Scale (SU). 
COUNT MISSSU=FQ3OWCCL01, FQ3OWCCL02, FQ3OWCCL04, FQ3OWCCL06, FQ3OWCCL09, FQ3OWCCL10, FQ3OWCCL11, FQ3OWCCL13, FQ3OWCCL16,
    FQ3OWCCL18, FQ3OWCCL19, FQ3OWCCL21, FQ3OWCCL22, FQ3OWCCL23, FQ3OWCCL26, FQ3OWCCL27, FQ3OWCCL29, FQ3OWCCL31, FQ3OWCCL33,
    FQ3OWCCL34, FQ3OWCCL35, FQ3OWCCL36, FQ3OWCCL38, FQ3OWCCL39, FQ3OWCCL40, FQ3OWCCL42, FQ3OWCCL43, FQ3OWCCL44, FQ3OWCCL47, 
    FQ3OWCCL49, FQ3OWCCL50, FQ3OWCCL51, FQ3OWCCL53, FQ3OWCCL54, FQ3OWCCL56, FQ3OWCCL57, FQ3OWCCL58, FQ3OWCCL59 (-9999).
*Dysfunctional Coping Scale 1: General dysfunctional coping factor (GD).
COUNT MISSGD=FQ3OWCCL03, FQ3OWCCL05, FQ3OWCCL08, FQ3OWCCL12, FQ3OWCCL14, FQ3OWCCL17, FQ3OWCCL20, FQ3OWCCL25, FQ3OWCCL32, FQ3OWCCL37, 
    FQ3OWCCL41, FQ3OWCCL45, FQ3OWCCL46, FQ3OWCCL52, FQ3OWCCL55 (-9999).
*Dysfunctional Coping Scale 2: Blaming others factor (BO).
COUNT MISSBO=FQ3OWCCL07, FQ3OWCCL15, FQ3OWCCL24, FQ3OWCCL28, FQ3OWCCL30, FQ3OWCCL48 (-9999).

RECODE FQ3OWCCL01 TO FQ3OWCCL59 (-9999=0).
EXECUTE.

*STEP 7: CREATE TOTAL AND SUBSCALES SCORES  (CHECK THAT REVERSE-SCORED ITEMS INCLUDED).
*Note each subscale name and calculate missingness allowed.
*CREATING ALL SUBSCALES (CHECK THAT REVERSE-SCORED ITEMS INCLUDED).
*Skills Use Scale (SU) (38 items) -- 66.7% (i.e., if MISS is less than or equal to 12.54) as a cut-off point.
COMPUTE FQ3OWCCLSU=-9999.
EXECUTE.
IF (MISSSU < 12.54) FQ3OWCCLSU=((FQ3OWCCL01 + FQ3OWCCL02 + FQ3OWCCL04 + FQ3OWCCL06 + FQ3OWCCL09 + FQ3OWCCL10 + FQ3OWCCL11 + FQ3OWCCL13 + FQ3OWCCL16 +
    FQ3OWCCL18 + FQ3OWCCL19 + FQ3OWCCL21 + FQ3OWCCL22 + FQ3OWCCL23 + FQ3OWCCL26 + FQ3OWCCL27 + FQ3OWCCL29 + FQ3OWCCL31 + FQ3OWCCL33 +
    FQ3OWCCL34 + FQ3OWCCL35 + FQ3OWCCL36 + FQ3OWCCL38 + FQ3OWCCL39 + FQ3OWCCL40 + FQ3OWCCL42 + FQ3OWCCL43 + FQ3OWCCL44 + FQ3OWCCL47 + 
    FQ3OWCCL49 + FQ3OWCCL50 + FQ3OWCCL51 + FQ3OWCCL53 + FQ3OWCCL54 + FQ3OWCCL56 + FQ3OWCCL57 + FQ3OWCCL58 + FQ3OWCCL59)/(38-MISSSU)).
EXECUTE.
*Dysfunctional Coping Scale 1: General dysfunctional coping factor (GD) (15 items) --  66.7% (i.e., if MISS is less than or equal to 4.95) as a cut-off point.
COMPUTE FQ3OWCCLGD=-9999.
EXECUTE.
IF (MISSGD < 4.95) FQ3OWCCLGD=((FQ3OWCCL03 + FQ3OWCCL05 + FQ3OWCCL08 + FQ3OWCCL12 + FQ3OWCCL14 + FQ3OWCCL17 + FQ3OWCCL20 + FQ3OWCCL25 + FQ3OWCCL32 + FQ3OWCCL37 + 
    FQ3OWCCL41 + FQ3OWCCL45 + FQ3OWCCL46 + FQ3OWCCL52 + FQ3OWCCL55)/(15-MISSGD)).
EXECUTE.  
*Dysfunctional Coping Scale 2: Blaming others factor (BO) (6 items) -- 66.7% (i.e., if MISS is less than or equal to 1.98) as a cut-off point.
COMPUTE FQ3OWCCLBO=-9999.
IF (MISSBO < 1.98) FQ3OWCCLBO=((FQ3OWCCL07 + FQ3OWCCL15 + FQ3OWCCL24 + FQ3OWCCL28 + FQ3OWCCL30 + FQ3OWCCL48)/(6-MISSBO)).
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
**-11 'Participant (parent or child) deceased'                                 /* (Participant (parent or child) deceased) */
**-10 'Prefer not to answer'                                                           /* (Participant selected prefer not to answer) */.
DO IF MISSING(FD3OSTAT).
DO REPEAT x = FQ3OWCCLSU TO FQ3OWCCLBO.
RECODE FD3OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.
*Checking frequenices for constructs to look at missingness. 
FREQUENCIES VARIABLES=FD3OSTAT FQ3OWCCLSU FQ3OWCCLGD FQ3OWCCLBO 
  /ORDER=ANALYSIS.
*If there IS missingness that was not accounted for in the STAT variable (for example in DERSAC, participants who indicated they did not have an additional caregiver should be coded as -44
Each construct needs to be coded by ID here. **CHECKED AND NOT NEEDED
*At this point, the only remaining missingness should represent when participant did not answer a sufficient number of questions, assuming STAT variable was correctly coded for this measure -- CHECK THIS! 
*The following syntax will recode this remaining missingness for each new construct.
IF (FQ3OWCCLSU=-9999) FQ3OWCCLSU=-43.
EXECUTE.  
IF (FQ3OWCCLGD=-9999) FQ3OWCCLGD=-43.
EXECUTE.  
IF (FQ3OWCCLBO=-9999) FQ3OWCCLBO=-43.
EXECUTE.  
MISSING VALUES
   FQ3OWCCLSU FQ3OWCCLGD FQ3OWCCLBO 
    (LO THRU -1).
EXECUTE.

*STEP 9: LABELING CONSTRUCTS.
VARIABLE LABELS
FQ3OWCCLSU 'Skills Use Scale [FQ3OWCCLSU]'
FQ3OWCCLGD 'Dysfunctional Coping Scale 1:Ggeneral dysfunctional coping factor [FQ3OWCCLGD]'
FQ3OWCCLBO 'Dysfunctional Coping Scale 2: Blaming others factor [FQ3OWCCLBO]'.
EXECUTE.

*STEP 9A: ADD VALUE LABELS.
*Include ALL missing value labels (SEE STEP 8 FOR FULL LIST). 
*Be sure to also include value labels for any constructs that need labels (e.g., 0 'No', 1 'Yes'). Summed or averaged scores do NOT need value labels.
VALUE LABELS
FQ3OWCCLSU TO FQ3OWCCLBO
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
FREQUENCIES VARIABLES=FD3OSTAT FQ3OWCCLSU FQ3OWCCLGD FQ3OWCCLBO
  /ORDER=ANALYSIS.

*STEP 11: CHECK DESCRIPTIVES.
*Checking descriptives for all constructs.
DESCRIPTIVES VARIABLES=FQ3OWCCLSU FQ3OWCCLGD FQ3OWCCLBO 
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 12: SAVE CLEANED DATA FILE.
*First, sorting the data file by ID and resaving the final file.
*Using /KEEP command to keep ONLY ID + RD + the constructs that were created. 
SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OWCCL_Constructs.sav'
  /KEEP ID FD3ORD FQ3OWCCLSU FQ3OWCCLGD FQ3OWCCLBO   
  /COMPRESSED.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OWCCL_Constructs.sav'.
EXECUTE.

*STEP 13: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE 
 OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OWCCL_Constructs.spv'
LOCK=NO.


* Encoding: UTF-8.
*STEP 0: NOTES.
*DBT-WAYS OF COPING CHECKLIST (DBT-WCCL)
*CREATED THE FOLLOWING SUBSCALES & RAN APLHAS.
*Skills Use Scale (SU).
*Dysfunctional Coping Scale 1: General dysfunctional coping factor (GD).
*Dysfunctional Coping Ccale 2: Blaming others factor (BO).
 
*03-08-22(BM): Adapted syntax for A2.
*03-09-22(AAC): Checked. Added alphas into syntax.

*--------------------------------------------------------------------------------------------------------------------------------.
*STEP 1: OPENING CLEANED DATA.
*Insert the correct file path and file name. Use syntax to open cleaned data file.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OWCCL_Cleaned.sav'.

*STEP 2: SAVING CLEANED DATA AS A CONSTRUCT FILE. 
*Insert the correct file path and file name.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OWCCL_Constructs.sav'
  /COMPRESSED.

*STEP 3: DESCRIPTIVE STATISTICS (1. FREQ AND 2. CORR) FOR RAW VARIABLES (TOTAL SCORE 1ST, THEN SUBSCALES).
*When running this step note any additional missingness (any other codes) that are not accounted for in the STAT variable. These missing codes (and corresponding IDs) will need to be 
incorporated in STEP 8 below.
FREQ VARS=FQ2OWCCL01, FQ2OWCCL02, FQ2OWCCL03, FQ2OWCCL04, FQ2OWCCL05, FQ2OWCCL06, FQ2OWCCL07, FQ2OWCCL08, FQ2OWCCL09, 
    FQ2OWCCL10, FQ2OWCCL11, FQ2OWCCL12, FQ2OWCCL13, FQ2OWCCL14, FQ2OWCCL15, FQ2OWCCL16, FQ2OWCCL17, FQ2OWCCL18, FQ2OWCCL19,
    FQ2OWCCL20, FQ2OWCCL21, FQ2OWCCL22, FQ2OWCCL23, FQ2OWCCL24, FQ2OWCCL25, FQ2OWCCL26, FQ2OWCCL27, FQ2OWCCL28, FQ2OWCCL29,
    FQ2OWCCL30, FQ2OWCCL31, FQ2OWCCL32, FQ2OWCCL33, FQ2OWCCL34, FQ2OWCCL35, FQ2OWCCL36, FQ2OWCCL37, FQ2OWCCL38, FQ2OWCCL39,
    FQ2OWCCL40, FQ2OWCCL41, FQ2OWCCL42, FQ2OWCCL43, FQ2OWCCL44, FQ2OWCCL45, FQ2OWCCL46, FQ2OWCCL47, FQ2OWCCL48, FQ2OWCCL49,
    FQ2OWCCL50, FQ2OWCCL51, FQ2OWCCL52, FQ2OWCCL53, FQ2OWCCL54, FQ2OWCCL55, FQ2OWCCL56, FQ2OWCCL57, FQ2OWCCL58, FQ2OWCCL59.
*Skills Use Scale (SU).
CORR VARS=FQ2OWCCL01, FQ2OWCCL02, FQ2OWCCL04, FQ2OWCCL06, FQ2OWCCL09, FQ2OWCCL10, FQ2OWCCL11, FQ2OWCCL13, FQ2OWCCL16,
    FQ2OWCCL18, FQ2OWCCL19, FQ2OWCCL21, FQ2OWCCL22, FQ2OWCCL23, FQ2OWCCL26, FQ2OWCCL27, FQ2OWCCL29, FQ2OWCCL31, FQ2OWCCL33,
    FQ2OWCCL34, FQ2OWCCL35, FQ2OWCCL36, FQ2OWCCL38, FQ2OWCCL39, FQ2OWCCL40, FQ2OWCCL42, FQ2OWCCL43, FQ2OWCCL44, FQ2OWCCL47, 
    FQ2OWCCL49, FQ2OWCCL50, FQ2OWCCL51, FQ2OWCCL53, FQ2OWCCL54, FQ2OWCCL56, FQ2OWCCL57, FQ2OWCCL58, FQ2OWCCL59.
*Dysfunctional Coping Scale 1: General dysfunctional coping factor (GD).
CORR VARS=FQ2OWCCL03, FQ2OWCCL05, FQ2OWCCL08, FQ2OWCCL12, FQ2OWCCL14, FQ2OWCCL17, FQ2OWCCL20, FQ2OWCCL25, FQ2OWCCL32, FQ2OWCCL37, 
    FQ2OWCCL41, FQ2OWCCL45, FQ2OWCCL46, FQ2OWCCL52, FQ2OWCCL55.
*Dysfunctional Coping Scale 2: blaming others factor (BO).
CORR VARS=FQ2OWCCL07, FQ2OWCCL15, FQ2OWCCL24, FQ2OWCCL28, FQ2OWCCL30, FQ2OWCCL48.

*STEP 4: RECODING MISSING VALUES.
RECODE FQ2OWCCL01 TO FQ2OWCCL59 (MISSING=-9999).
EXECUTE.

*STEP 5: RELIABILITY STATISTICS (TOTAL SCORE 1st, FOLLOWED BY SUBSCALES).
*Skills Use Scale (SU) (38 items; n=59; alpha=.937).
REL VARS=FQ2OWCCL01, FQ2OWCCL02, FQ2OWCCL04, FQ2OWCCL06, FQ2OWCCL09, FQ2OWCCL10, FQ2OWCCL11, FQ2OWCCL13, FQ2OWCCL16,
    FQ2OWCCL18, FQ2OWCCL19, FQ2OWCCL21, FQ2OWCCL22, FQ2OWCCL23, FQ2OWCCL26, FQ2OWCCL27, FQ2OWCCL29, FQ2OWCCL31, FQ2OWCCL33,
    FQ2OWCCL34, FQ2OWCCL35, FQ2OWCCL36, FQ2OWCCL38, FQ2OWCCL39, FQ2OWCCL40, FQ2OWCCL42, FQ2OWCCL43, FQ2OWCCL44, FQ2OWCCL47, 
    FQ2OWCCL49, FQ2OWCCL50, FQ2OWCCL51, FQ2OWCCL53, FQ2OWCCL54, FQ2OWCCL56, FQ2OWCCL57, FQ2OWCCL58, FQ2OWCCL59
/SCALE(All)= ALL.
*Dysfunctional Coping Scale 1: General dysfunctional coping factor (GD) (15 items; n=63; alpha=.915).
REL VARS=FQ2OWCCL03, FQ2OWCCL05, FQ2OWCCL08, FQ2OWCCL12, FQ2OWCCL14, FQ2OWCCL17, FQ2OWCCL20, FQ2OWCCL25, FQ2OWCCL32, FQ2OWCCL37, 
    FQ2OWCCL41, FQ2OWCCL45, FQ2OWCCL46, FQ2OWCCL52, FQ2OWCCL55
/SCALE(All)= ALL.
*Dysfunctional Coping Scale 2: Blaming others factor (BO) (6 items; n=63; alpha=.907).
REL VARS=FQ2OWCCL07, FQ2OWCCL15, FQ2OWCCL24, FQ2OWCCL28, FQ2OWCCL30, FQ2OWCCL48
/SCALE(All)= ALL.

*STEP 6: COUNTING MISSING DATA (TOTAL SCORE 1st, FOLLOWED BY SUBSCALES), THEN RECODING TO 0 TO AVOID NEGATIVE EFFECTS ON CONSTRUCTS.
*Skills Use Scale (SU). 
COUNT MISSSU=FQ2OWCCL01, FQ2OWCCL02, FQ2OWCCL04, FQ2OWCCL06, FQ2OWCCL09, FQ2OWCCL10, FQ2OWCCL11, FQ2OWCCL13, FQ2OWCCL16,
    FQ2OWCCL18, FQ2OWCCL19, FQ2OWCCL21, FQ2OWCCL22, FQ2OWCCL23, FQ2OWCCL26, FQ2OWCCL27, FQ2OWCCL29, FQ2OWCCL31, FQ2OWCCL33,
    FQ2OWCCL34, FQ2OWCCL35, FQ2OWCCL36, FQ2OWCCL38, FQ2OWCCL39, FQ2OWCCL40, FQ2OWCCL42, FQ2OWCCL43, FQ2OWCCL44, FQ2OWCCL47, 
    FQ2OWCCL49, FQ2OWCCL50, FQ2OWCCL51, FQ2OWCCL53, FQ2OWCCL54, FQ2OWCCL56, FQ2OWCCL57, FQ2OWCCL58, FQ2OWCCL59 (-9999).
*Dysfunctional Coping Scale 1: General dysfunctional coping factor (GD).
COUNT MISSGD=FQ2OWCCL03, FQ2OWCCL05, FQ2OWCCL08, FQ2OWCCL12, FQ2OWCCL14, FQ2OWCCL17, FQ2OWCCL20, FQ2OWCCL25, FQ2OWCCL32, FQ2OWCCL37, 
    FQ2OWCCL41, FQ2OWCCL45, FQ2OWCCL46, FQ2OWCCL52, FQ2OWCCL55 (-9999).
*Dysfunctional Coping Scale 2: Blaming others factor (BO).
COUNT MISSBO=FQ2OWCCL07, FQ2OWCCL15, FQ2OWCCL24, FQ2OWCCL28, FQ2OWCCL30, FQ2OWCCL48 (-9999).

RECODE FQ2OWCCL01 TO FQ2OWCCL59 (-9999=0).
EXECUTE.

*STEP 7: CREATE TOTAL AND SUBSCALES SCORES  (CHECK THAT REVERSE-SCORED ITEMS INCLUDED).
*Note each subscale name and calculate missingness allowed.
*CREATING ALL SUBSCALES (CHECK THAT REVERSE-SCORED ITEMS INCLUDED).
*Skills Use Scale (SU) (38 items) -- 66.7% (i.e., if MISS is less than or equal to 12.54) as a cut-off point.
COMPUTE FQ2OWCCLSU=-9999.
EXECUTE.
IF (MISSSU < 12.54) FQ2OWCCLSU=((FQ2OWCCL01 + FQ2OWCCL02 + FQ2OWCCL04 + FQ2OWCCL06 + FQ2OWCCL09 + FQ2OWCCL10 + FQ2OWCCL11 + FQ2OWCCL13 + FQ2OWCCL16 +
    FQ2OWCCL18 + FQ2OWCCL19 + FQ2OWCCL21 + FQ2OWCCL22 + FQ2OWCCL23 + FQ2OWCCL26 + FQ2OWCCL27 + FQ2OWCCL29 + FQ2OWCCL31 + FQ2OWCCL33 +
    FQ2OWCCL34 + FQ2OWCCL35 + FQ2OWCCL36 + FQ2OWCCL38 + FQ2OWCCL39 + FQ2OWCCL40 + FQ2OWCCL42 + FQ2OWCCL43 + FQ2OWCCL44 + FQ2OWCCL47 + 
    FQ2OWCCL49 + FQ2OWCCL50 + FQ2OWCCL51 + FQ2OWCCL53 + FQ2OWCCL54 + FQ2OWCCL56 + FQ2OWCCL57 + FQ2OWCCL58 + FQ2OWCCL59)/(38-MISSSU)).
EXECUTE.
*Dysfunctional Coping Scale 1: General dysfunctional coping factor (GD) (15 items) --  66.7% (i.e., if MISS is less than or equal to 4.95) as a cut-off point.
COMPUTE FQ2OWCCLGD=-9999.
EXECUTE.
IF (MISSGD < 4.95) FQ2OWCCLGD=((FQ2OWCCL03 + FQ2OWCCL05 + FQ2OWCCL08 + FQ2OWCCL12 + FQ2OWCCL14 + FQ2OWCCL17 + FQ2OWCCL20 + FQ2OWCCL25 + FQ2OWCCL32 + FQ2OWCCL37 + 
    FQ2OWCCL41 + FQ2OWCCL45 + FQ2OWCCL46 + FQ2OWCCL52 + FQ2OWCCL55)/(15-MISSGD)).
EXECUTE.  
*Dysfunctional Coping Scale 2: Blaming others factor (BO) (6 items) -- 66.7% (i.e., if MISS is less than or equal to 1.98) as a cut-off point.
COMPUTE FQ2OWCCLBO=-9999.
IF (MISSBO < 1.98) FQ2OWCCLBO=((FQ2OWCCL07 + FQ2OWCCL15 + FQ2OWCCL24 + FQ2OWCCL28 + FQ2OWCCL30 + FQ2OWCCL48)/(6-MISSBO)).
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
DO REPEAT x = FQ2OWCCLSU TO FQ2OWCCLBO.
RECODE FD2OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.
*Checking frequenices for constructs to look at missingness. 
FREQUENCIES VARIABLES=FD2OSTAT FQ2OWCCLSU FQ2OWCCLGD FQ2OWCCLBO 
  /ORDER=ANALYSIS.
*If there IS missingness that was not accounted for in the STAT variable (for example in DERSAC, participants who indicated they did not have an additional caregiver should be coded as -44
Each construct needs to be coded by ID here. **CHECKED AND NOT NEEDED
*At this point, the only remaining missingness should represent when participant did not answer a sufficient number of questions, assuming STAT variable was correctly coded for this measure -- CHECK THIS! 
*The following syntax will recode this remaining missingness for each new construct.
IF (FQ2OWCCLSU=-9999) FQ2OWCCLSU=-43.
EXECUTE.  
IF (FQ2OWCCLGD=-9999) FQ2OWCCLGD=-43.
EXECUTE.  
IF (FQ2OWCCLBO=-9999) FQ2OWCCLBO=-43.
EXECUTE.  
MISSING VALUES
   FQ2OWCCLSU FQ2OWCCLGD FQ2OWCCLBO 
    (LO THRU -1).
EXECUTE.

*STEP 9: LABELING CONSTRUCTS.
VARIABLE LABELS
FQ2OWCCLSU 'Skills Use Scale [FQ2OWCCLSU]'
FQ2OWCCLGD 'Dysfunctional Coping Scale 1:Ggeneral dysfunctional coping factor [FQ2OWCCLGD]'
FQ2OWCCLBO 'Dysfunctional Coping Scale 2: Blaming others factor [FQ2OWCCLBO]'.
EXECUTE.

*STEP 9A: ADD VALUE LABELS.
*Include ALL missing value labels (SEE STEP 8 FOR FULL LIST). 
*Be sure to also include value labels for any constructs that need labels (e.g., 0 'No', 1 'Yes'). Summed or averaged scores do NOT need value labels.
VALUE LABELS
FQ2OWCCLSU TO FQ2OWCCLBO
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
-11 'Participant (parent or child) deceased (-11)'                              
-10 'Prefer not to Answer (-10)'.
EXECUTE.

*STEP 10: CHECK FREQUENCIES.
*Checking frequencies of all constructs.
FREQUENCIES VARIABLES=FD2OSTAT FQ2OWCCLSU FQ2OWCCLGD FQ2OWCCLBO
  /ORDER=ANALYSIS.

*STEP 11: CHECK DESCRIPTIVES.
*Checking descriptives for all constructs.
DESCRIPTIVES VARIABLES=FQ2OWCCLSU FQ2OWCCLGD FQ2OWCCLBO 
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 12: SAVE CLEANED DATA FILE.
*First, sorting the data file by ID and resaving the final file.
*Using /KEEP command to keep ONLY ID + RD + the constructs that were created. 
SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OWCCL_Constructs.sav'
  /KEEP ID FD2ORD FQ2OWCCLSU FQ2OWCCLGD FQ2OWCCLBO   
  /COMPRESSED.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OWCCL_Constructs.sav'.
EXECUTE.

*STEP 13: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE 
 OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OWCCL_Constructs.spv'
LOCK=NO.


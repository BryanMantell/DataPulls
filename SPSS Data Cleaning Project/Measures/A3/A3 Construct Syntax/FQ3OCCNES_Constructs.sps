﻿* Encoding: UTF-8.
*STEP 0: NOTES.
*COPING WITH CHILDREN'S NEGATIVE EMOTIONS SCALE (CCNES).
*CREATED THE FOLLOWING SUBSCALES & RAN APLHAS; LIST SUBSCALES BELOW (EXAMPLE BELOW).
*Unsupportive Reactions (UnSup).
*Supportive Reactions (Sup).
*Distress Reactions (DR).
*Punitive Reactions (PR).
*Expressive Encouragement (EE).
*Emotion-Focused Reactions (EFR).
*Problem-Focused Reactions (PFR).
*Minimization Reactions (MR).

*4-19-22(BM): Adapted syntax for A3.
*04-21-22(AAC): Checked.
*--------------------------------------------------------------------------------------------------------------------------------.
*STEP 1: OPENING CLEANED DATA.
*Insert the correct file path and file name. Use syntax to open cleaned data file.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OCCNES_Cleaned.sav'.

*STEP 2: SAVING CLEANED DATA AS A CONSTRUCT FILE. 
*Insert the correct file path and file name.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OCCNES_Constructs.sav'
  /COMPRESSED.

*STEP 3: DESCRIPTIVE STATISTICS (1. FREQ AND 2. CORR) FOR RAW VARIABLES (TOTAL SCORE 1ST, THEN SUBSCALES).
*When running this step note any additional missingness (any other codes) that are not accounted for in the STAT variable. These missing codes (and corresponding IDs) will need to be 
incorporated in STEP 8 below.
FREQ VARS=FQ3OCCNES01A FQ3OCCNES01B FQ3OCCNES01C FQ3OCCNES01D FQ3OCCNES01E FQ3OCCNES01F
FQ3OCCNES02AR FQ3OCCNES02B FQ3OCCNES02C FQ3OCCNES02D FQ3OCCNES02E FQ3OCCNES02F 
FQ3OCCNES03A FQ3OCCNES03B FQ3OCCNES03C FQ3OCCNES03D FQ3OCCNES03E FQ3OCCNES03F
FQ3OCCNES04A FQ3OCCNES04B FQ3OCCNES04C FQ3OCCNES04D FQ3OCCNES04E FQ3OCCNES04F 
FQ3OCCNES05A FQ3OCCNES05B FQ3OCCNES05C FQ3OCCNES05D FQ3OCCNES05E FQ3OCCNES05F
FQ3OCCNES06A FQ3OCCNES06B FQ3OCCNES06C FQ3OCCNES06D FQ3OCCNES06E FQ3OCCNES06F
FQ3OCCNES07A FQ3OCCNES07B FQ3OCCNES07CR FQ3OCCNES07D FQ3OCCNES07E FQ3OCCNES07F
FQ3OCCNES08A FQ3OCCNES08B FQ3OCCNES08CR FQ3OCCNES08D FQ3OCCNES08E FQ3OCCNES08F
FQ3OCCNES09A FQ3OCCNES09B FQ3OCCNES09C FQ3OCCNES09D FQ3OCCNES09E FQ3OCCNES09F
FQ3OCCNES10AR FQ3OCCNES10B FQ3OCCNES10C FQ3OCCNES10D FQ3OCCNES10E FQ3OCCNES10F 
FQ3OCCNES11A FQ3OCCNES11B FQ3OCCNES11C FQ3OCCNES11D FQ3OCCNES11E FQ3OCCNES11F
FQ3OCCNES12A FQ3OCCNES12B FQ3OCCNES12C FQ3OCCNES12D FQ3OCCNES12E FQ3OCCNES12F.
*Unsupportive Reactions (UnSup).
CORR VARS=FQ3OCCNES01D, FQ3OCCNES02C, FQ3OCCNES03B, FQ3OCCNES04C, FQ3OCCNES05C, FQ3OCCNES06B, FQ3OCCNES07D, FQ3OCCNES08D, FQ3OCCNES09C, FQ3OCCNES10F, FQ3OCCNES11A, FQ3OCCNES12F, 
FQ3OCCNES01A, FQ3OCCNES02F, FQ3OCCNES03F, FQ3OCCNES04A, FQ3OCCNES05D, FQ3OCCNES06D, FQ3OCCNES07E, FQ3OCCNES08E, FQ3OCCNES09E, FQ3OCCNES10B, FQ3OCCNES11C, FQ3OCCNES12E, 
FQ3OCCNES01B, FQ3OCCNES02AR, FQ3OCCNES03A, FQ3OCCNES04D, FQ3OCCNES05E, FQ3OCCNES06C, FQ3OCCNES07CR, FQ3OCCNES08CR, FQ3OCCNES09B, FQ3OCCNES10AR, FQ3OCCNES11B, FQ3OCCNES12D.
*Minimization Reactions (MR).
CORR VARS=FQ3OCCNES01D, FQ3OCCNES02C, FQ3OCCNES03B, FQ3OCCNES04C, FQ3OCCNES05C, FQ3OCCNES06B, FQ3OCCNES07D, FQ3OCCNES08D, FQ3OCCNES09C, FQ3OCCNES10F, FQ3OCCNES11A, FQ3OCCNES12F.
*Punitive Reactions (PR).
CORR VARS=FQ3OCCNES01A, FQ3OCCNES02F, FQ3OCCNES03F, FQ3OCCNES04A, FQ3OCCNES05D, FQ3OCCNES06D, FQ3OCCNES07E, FQ3OCCNES08E, FQ3OCCNES09E, FQ3OCCNES10B, FQ3OCCNES11C, FQ3OCCNES12E.
*Distress Reactions (DR).
CORR VARS=FQ3OCCNES01B, FQ3OCCNES02AR, FQ3OCCNES03A, FQ3OCCNES04D, FQ3OCCNES05E, FQ3OCCNES06C, FQ3OCCNES07CR, FQ3OCCNES08CR, FQ3OCCNES09B, FQ3OCCNES10AR, FQ3OCCNES11B, FQ3OCCNES12D.

*Supportive Reactions (Sup).
CORR VARS=FQ3OCCNES01E, FQ3OCCNES02E, FQ3OCCNES03E, FQ3OCCNES04B, FQ3OCCNES05F, FQ3OCCNES06E, FQ3OCCNES07F, FQ3OCCNES08A, FQ3OCCNES09A, FQ3OCCNES10C, FQ3OCCNES11F, FQ3OCCNES12B,
FQ3OCCNES01F, FQ3OCCNES02B, FQ3OCCNES03D, FQ3OCCNES04E, FQ3OCCNES05A, FQ3OCCNES06A, FQ3OCCNES07B, FQ3OCCNES08F, FQ3OCCNES09F, FQ3OCCNES10D, FQ3OCCNES11E, FQ3OCCNES12C,
FQ3OCCNES01C, FQ3OCCNES02D, FQ3OCCNES03C, FQ3OCCNES04F, FQ3OCCNES05B, FQ3OCCNES06F, FQ3OCCNES07A, FQ3OCCNES08B, FQ3OCCNES09D, FQ3OCCNES10E, FQ3OCCNES11D, FQ3OCCNES12A.
*Expressive Encouragement (EE).
CORR VARS=FQ3OCCNES01E, FQ3OCCNES02E, FQ3OCCNES03E, FQ3OCCNES04B, FQ3OCCNES05F, FQ3OCCNES06E, FQ3OCCNES07F, FQ3OCCNES08A, FQ3OCCNES09A, FQ3OCCNES10C, FQ3OCCNES11F, FQ3OCCNES12B.
*Emotion-Focused Reactions (EFR).
CORR VARS=FQ3OCCNES01F, FQ3OCCNES02B, FQ3OCCNES03D, FQ3OCCNES04E, FQ3OCCNES05A, FQ3OCCNES06A, FQ3OCCNES07B, FQ3OCCNES08F, FQ3OCCNES09F, FQ3OCCNES10D, FQ3OCCNES11E, FQ3OCCNES12C.
*Problem-Focused Reactions (PFR).
CORR VARS=FQ3OCCNES01C, FQ3OCCNES02D, FQ3OCCNES03C, FQ3OCCNES04F, FQ3OCCNES05B, FQ3OCCNES06F, FQ3OCCNES07A, FQ3OCCNES08B, FQ3OCCNES09D, FQ3OCCNES10E, FQ3OCCNES11D, FQ3OCCNES12A.

*STEP 4: RECODING MISSING VALUES.
RECODE FQ3OCCNES01A TO FQ3OCCNES12F (MISSING=-9999).
EXECUTE.

*STEP 5: RELIABILITY STATISTICS (TOTAL SCORE 1st, FOLLOWED BY SUBSCALES).
*Unsupportive Reactions (UnSup) (36 items; n=52; alpha=.891). 
REL VARS=FQ3OCCNES01D, FQ3OCCNES02C, FQ3OCCNES03B, FQ3OCCNES04C, FQ3OCCNES05C, FQ3OCCNES06B, FQ3OCCNES07D, FQ3OCCNES08D, FQ3OCCNES09C, FQ3OCCNES10F, FQ3OCCNES11A, FQ3OCCNES12F, 
FQ3OCCNES01A, FQ3OCCNES02F, FQ3OCCNES03F, FQ3OCCNES04A, FQ3OCCNES05D, FQ3OCCNES06D, FQ3OCCNES07E, FQ3OCCNES08E, FQ3OCCNES09E, FQ3OCCNES10B, FQ3OCCNES11C, FQ3OCCNES12E, 
FQ3OCCNES01B, FQ3OCCNES02AR, FQ3OCCNES03A, FQ3OCCNES04D, FQ3OCCNES05E, FQ3OCCNES06C, FQ3OCCNES07CR, FQ3OCCNES08CR, FQ3OCCNES09B, FQ3OCCNES10AR, FQ3OCCNES11B, FQ3OCCNES12D
/SCALE(All)= ALL.
*Minimization Reactions (MR) (12 items; n=54; alpha=.829).
REL VARS=FQ3OCCNES01D, FQ3OCCNES02C, FQ3OCCNES03B, FQ3OCCNES04C, FQ3OCCNES05C, FQ3OCCNES06B, FQ3OCCNES07D, FQ3OCCNES08D, FQ3OCCNES09C, FQ3OCCNES10F, FQ3OCCNES11A, FQ3OCCNES12F
/SCALE(All)= ALL.
*Punitive Reactions (PR) (12 items; n=54; alpha=.822).
REL VARS=FQ3OCCNES01A, FQ3OCCNES02F, FQ3OCCNES03F, FQ3OCCNES04A, FQ3OCCNES05D, FQ3OCCNES06D, FQ3OCCNES07E, FQ3OCCNES08E, FQ3OCCNES09E, FQ3OCCNES10B, FQ3OCCNES11C, FQ3OCCNES12E
/SCALE(All)= ALL.
*Distress Reactions (DR) (12 items; n=52; alpha=.736).
REL VARS=FQ3OCCNES01B, FQ3OCCNES02AR, FQ3OCCNES03A, FQ3OCCNES04D, FQ3OCCNES05E, FQ3OCCNES06C, FQ3OCCNES07CR, FQ3OCCNES08CR, FQ3OCCNES09B, FQ3OCCNES10AR, FQ3OCCNES11B, FQ3OCCNES12D
/SCALE(All)= ALL.

*Supportive Reactions (Sup) (36 items; n=52; alpha=.915). 
REL VARS=FQ3OCCNES01E, FQ3OCCNES02E, FQ3OCCNES03E, FQ3OCCNES04B, FQ3OCCNES05F, FQ3OCCNES06E, FQ3OCCNES07F, FQ3OCCNES08A, FQ3OCCNES09A, FQ3OCCNES10C, FQ3OCCNES11F, FQ3OCCNES12B,
FQ3OCCNES01F, FQ3OCCNES02B, FQ3OCCNES03D, FQ3OCCNES04E, FQ3OCCNES05A, FQ3OCCNES06A, FQ3OCCNES07B, FQ3OCCNES08F, FQ3OCCNES09F, FQ3OCCNES10D, FQ3OCCNES11E, FQ3OCCNES12C,
FQ3OCCNES01C, FQ3OCCNES02D, FQ3OCCNES03C, FQ3OCCNES04F, FQ3OCCNES05B, FQ3OCCNES06F, FQ3OCCNES07A, FQ3OCCNES08B, FQ3OCCNES09D, FQ3OCCNES10E, FQ3OCCNES11D, FQ3OCCNES12A
/SCALE(All)= ALL.
*Expressive Encouragement (EE) (12 items; n=53; alpha=.909).
REL VARS=FQ3OCCNES01E, FQ3OCCNES02E, FQ3OCCNES03E, FQ3OCCNES04B, FQ3OCCNES05F, FQ3OCCNES06E, FQ3OCCNES07F, FQ3OCCNES08A, FQ3OCCNES09A, FQ3OCCNES10C, FQ3OCCNES11F, FQ3OCCNES12B
/SCALE(All)= ALL.
*Emotion-Focused Reactions (EFR) (12 items; n=53; alpha=.800).
REL VARS=FQ3OCCNES01F, FQ3OCCNES02B, FQ3OCCNES03D, FQ3OCCNES04E, FQ3OCCNES05A, FQ3OCCNES06A, FQ3OCCNES07B, FQ3OCCNES08F, FQ3OCCNES09F, FQ3OCCNES10D, FQ3OCCNES11E, FQ3OCCNES12C
/SCALE(All)= ALL.
*Problem-Focused Reactions (PFR) (12 items; n=54; alpha=.781).
REL VARS=FQ3OCCNES01C, FQ3OCCNES02D, FQ3OCCNES03C, FQ3OCCNES04F, FQ3OCCNES05B, FQ3OCCNES06F, FQ3OCCNES07A, FQ3OCCNES08B, FQ3OCCNES09D, FQ3OCCNES10E, FQ3OCCNES11D, FQ3OCCNES12A
/SCALE(All)= ALL.

*STEP 6: COUNTING MISSING DATA (JUST SUBSCALES), THEN RECODING TO 0 TO AVOID NEGATIVE EFFECTS ON CONSTRUCTS.
*Distress Reactions (DR).
COUNT MISSDR=FQ3OCCNES01B, FQ3OCCNES02AR, FQ3OCCNES03A, FQ3OCCNES04D, FQ3OCCNES05E, FQ3OCCNES06C, FQ3OCCNES07CR, FQ3OCCNES08CR, FQ3OCCNES09B, FQ3OCCNES10AR, FQ3OCCNES11B, FQ3OCCNES12D (-9999).
*Punitive Reactions (PR).
COUNT MISSPR=FQ3OCCNES01A, FQ3OCCNES02F, FQ3OCCNES03F, FQ3OCCNES04A, FQ3OCCNES05D, FQ3OCCNES06D, FQ3OCCNES07E, FQ3OCCNES08E, FQ3OCCNES09E, FQ3OCCNES10B, FQ3OCCNES11C, FQ3OCCNES12E (-9999).
*Expressive Encouragement (EE).
COUNT MISSEE=FQ3OCCNES01E, FQ3OCCNES02E, FQ3OCCNES03E, FQ3OCCNES04B, FQ3OCCNES05F, FQ3OCCNES06E, FQ3OCCNES07F, FQ3OCCNES08A, FQ3OCCNES09A, FQ3OCCNES10C, FQ3OCCNES11F, FQ3OCCNES12B (-9999).
*Emotion-Focused Reactions (EFR).
COUNT MISSEFR=FQ3OCCNES01F, FQ3OCCNES02B, FQ3OCCNES03D, FQ3OCCNES04E, FQ3OCCNES05A, FQ3OCCNES06A, FQ3OCCNES07B, FQ3OCCNES08F, FQ3OCCNES09F, FQ3OCCNES10D, FQ3OCCNES11E, FQ3OCCNES12C (-9999).
*Problem-Focused Reactions (PFR).
COUNT MISSPFR=FQ3OCCNES01C, FQ3OCCNES02D, FQ3OCCNES03C, FQ3OCCNES04F, FQ3OCCNES05B, FQ3OCCNES06F, FQ3OCCNES07A, FQ3OCCNES08B, FQ3OCCNES09D, FQ3OCCNES10E, FQ3OCCNES11D, FQ3OCCNES12A (-9999).
*Minimization Reactions (MR).
COUNT MISSMR=FQ3OCCNES01D, FQ3OCCNES02C, FQ3OCCNES03B, FQ3OCCNES04C, FQ3OCCNES05C, FQ3OCCNES06B, FQ3OCCNES07D, FQ3OCCNES08D, FQ3OCCNES09C, FQ3OCCNES10F, FQ3OCCNES11A, FQ3OCCNES12F (-9999).

RECODE FQ3OCCNES01A TO FQ3OCCNES12F (-9999=0).
EXECUTE.

*STEP 7: CREATE TOTAL AND SUBSCALES SCORES  (CHECK THAT REVERSE-SCORED ITEMS INCLUDED).
*Note each subscale name and calculate missingness allowed.
*CREATING TOTAL SCORE-Unsupportive Reactions (UnSup)
*Total Score (36 items) -- USE MISSINGNESS FOR EACH SUBSCALE as a cut-off point.
COMPUTE FQ3OCCNESUnSup=-9999.
EXECUTE.
IF (MISSMR < 3.96 AND MISSPR < 3.96 AND MISSDR < 3.96) FQ3OCCNESUnSup=((FQ3OCCNES01D + FQ3OCCNES02C + FQ3OCCNES03B + FQ3OCCNES04C + FQ3OCCNES05C + FQ3OCCNES06B + FQ3OCCNES07D + FQ3OCCNES08D + FQ3OCCNES09C + FQ3OCCNES10F + FQ3OCCNES11A + FQ3OCCNES12F +
FQ3OCCNES01A + FQ3OCCNES02F + FQ3OCCNES03F + FQ3OCCNES04A + FQ3OCCNES05D + FQ3OCCNES06D + FQ3OCCNES07E + FQ3OCCNES08E + FQ3OCCNES09E + FQ3OCCNES10B + FQ3OCCNES11C + FQ3OCCNES12E +
FQ3OCCNES01B + FQ3OCCNES02AR + FQ3OCCNES03A + FQ3OCCNES04D + FQ3OCCNES05E + FQ3OCCNES06C + FQ3OCCNES07CR + FQ3OCCNES08CR + FQ3OCCNES09B + FQ3OCCNES10AR + FQ3OCCNES11B + FQ3OCCNES12D)/(36-MISSMR-MISSPR-MISSDR)).
EXECUTE.
*CREATING ALL SUBSCALES (CHECK THAT REVERSE-SCORED ITEMS INCLUDED).
*Minimization Reactions (MR) (12 items) -- 66.7% (i.e., if MISS is less than or equal to 3.96) as a cut-off point.
COMPUTE FQ3OCCNESMR=-9999.
EXECUTE.
IF (MISSMR < 3.96) FQ3OCCNESMR=((FQ3OCCNES01D + FQ3OCCNES02C + FQ3OCCNES03B + FQ3OCCNES04C + FQ3OCCNES05C + FQ3OCCNES06B + FQ3OCCNES07D + FQ3OCCNES08D + FQ3OCCNES09C + FQ3OCCNES10F + FQ3OCCNES11A + FQ3OCCNES12F)/(12-MISSMR)).
EXECUTE.
*Punitive Reactions (PR) (12 items) -- 66.7% (i.e., if MISS is less than or equal to 3.96) as a cut-off point.
COMPUTE FQ3OCCNESPR=-9999.
EXECUTE.
IF (MISSPR < 3.96) FQ3OCCNESPR=((FQ3OCCNES01A + FQ3OCCNES02F + FQ3OCCNES03F + FQ3OCCNES04A + FQ3OCCNES05D + FQ3OCCNES06D + FQ3OCCNES07E + FQ3OCCNES08E + FQ3OCCNES09E + FQ3OCCNES10B + FQ3OCCNES11C + FQ3OCCNES12E)/(12-MISSPR)).
EXECUTE.
*Distress Reactions (DR) (12 items) -- 66.7% (i.e., if MISS is less than or equal to 3.96) as a cut-off point.
COMPUTE FQ3OCCNESDR=-9999.
EXECUTE.
IF (MISSDR < 3.96) FQ3OCCNESDR=((FQ3OCCNES01B + FQ3OCCNES02AR + FQ3OCCNES03A + FQ3OCCNES04D + FQ3OCCNES05E + FQ3OCCNES06C + FQ3OCCNES07CR + FQ3OCCNES08CR + FQ3OCCNES09B + FQ3OCCNES10AR + FQ3OCCNES11B + FQ3OCCNES12D)/(12-MISSDR)).
EXECUTE.

*CREATING TOTAL SCORE-Supportive Reactions (Sup)
*Total Score (36 items) -- USE MISSINGNESS FOR EACH SUBSCALE as a cut-off point.
COMPUTE FQ3OCCNESSup=-9999.
EXECUTE.
IF (MISSEE < 3.96 AND MISSEFR < 3.96 AND MISSPFR < 3.96) FQ3OCCNESSup=((FQ3OCCNES01E + FQ3OCCNES02E + FQ3OCCNES03E + FQ3OCCNES04B + FQ3OCCNES05F + FQ3OCCNES06E + FQ3OCCNES07F + FQ3OCCNES08A + FQ3OCCNES09A + FQ3OCCNES10C + FQ3OCCNES11F + FQ3OCCNES12B +
FQ3OCCNES01F + FQ3OCCNES02B + FQ3OCCNES03D + FQ3OCCNES04E + FQ3OCCNES05A + FQ3OCCNES06A + FQ3OCCNES07B + FQ3OCCNES08F + FQ3OCCNES09F + FQ3OCCNES10D + FQ3OCCNES11E + FQ3OCCNES12C +
FQ3OCCNES01C + FQ3OCCNES02D + FQ3OCCNES03C + FQ3OCCNES04F + FQ3OCCNES05B + FQ3OCCNES06F + FQ3OCCNES07A + FQ3OCCNES08B + FQ3OCCNES09D + FQ3OCCNES10E + FQ3OCCNES11D + FQ3OCCNES12A)/(36-MISSEE-MISSEFR-MISSPFR)).
EXECUTE.
*CREATING ALL SUBSCALES (CHECK THAT REVERSE-SCORED ITEMS INCLUDED).
*Expressive Encouragement (EE) (12 items) -- 66.7% (i.e., if MISS is less than or equal to 3.96) as a cut-off point.
COMPUTE FQ3OCCNESEE=-9999.
EXECUTE.
IF (MISSEE < 3.96) FQ3OCCNESEE=((FQ3OCCNES01E + FQ3OCCNES02E + FQ3OCCNES03E + FQ3OCCNES04B + FQ3OCCNES05F + FQ3OCCNES06E + FQ3OCCNES07F + FQ3OCCNES08A + FQ3OCCNES09A + FQ3OCCNES10C + FQ3OCCNES11F + FQ3OCCNES12B)/(12-MISSEE)).
EXECUTE.
*Emotion-Focused Reactions (EFR) (12 items) -- 66.7% (i.e., if MISS is less than or equal to 3.96) as a cut-off point.
COMPUTE FQ3OCCNESEFR=-9999.
EXECUTE.
IF (MISSEFR < 3.96) FQ3OCCNESEFR=((FQ3OCCNES01F + FQ3OCCNES02B + FQ3OCCNES03D + FQ3OCCNES04E + FQ3OCCNES05A + FQ3OCCNES06A + FQ3OCCNES07B + FQ3OCCNES08F + FQ3OCCNES09F + FQ3OCCNES10D + FQ3OCCNES11E + FQ3OCCNES12C)/(12-MISSEFR)).
EXECUTE.
*Problem-Focused Reactions (PFR) (12 items) -- 66.7% (i.e., if MISS is less than or equal to 3.96) as a cut-off point.
COMPUTE FQ3OCCNESPFR=-9999.
EXECUTE.
IF (MISSPFR < 3.96) FQ3OCCNESPFR=((FQ3OCCNES01C + FQ3OCCNES02D + FQ3OCCNES03C + FQ3OCCNES04F + FQ3OCCNES05B + FQ3OCCNES06F + FQ3OCCNES07A + FQ3OCCNES08B + FQ3OCCNES09D + FQ3OCCNES10E + FQ3OCCNES11D + FQ3OCCNES12A)/(12-MISSPFR)).
EXECUTE.

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
DO REPEAT x = FQ3OCCNESUnSup TO FQ3OCCNESPFR.
RECODE FD3OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.
*Checking frequenices for constructs to look at missingness. 
FREQUENCIES VARIABLES=FD3OSTAT FQ3OCCNESUnSup FQ3OCCNESMR FQ3OCCNESPR FQ3OCCNESDR FQ3OCCNESSup FQ3OCCNESEE FQ3OCCNESEFR FQ3OCCNESPFR
  /ORDER=ANALYSIS.
*If there IS missingness that was not accounted for in the STAT variable (for example in DERSAC, participants who indicated they did not have an additional caregiver should be coded as -44
Each construct needs to be coded by ID here. If there IS NO additional missingess not accounted for, delete only this section of syntax and write **CHECKED AND NOT NEEDED.

*At this point, the only remaining missingness should represent when participant did not answer a sufficient number of questions, assuming STAT variable was correctly coded for this measure -- CHECK THIS! 
*The following syntax will recode this remaining missingness for each new construct.
IF (FQ3OCCNESUnSup=-9999) FQ3OCCNESUnSup=-43.
EXECUTE.  
IF (FQ3OCCNESMR=-9999) FQ3OCCNESMR=-43.
EXECUTE.  
IF (FQ3OCCNESPR=-9999) FQ3OCCNESPR=-43.
EXECUTE.  
IF (FQ3OCCNESDR=-9999) FQ3OCCNESDR=-43.
EXECUTE.  
IF (FQ3OCCNESSup=-9999) FQ3OCCNESSup=-43.
EXECUTE.  
IF (FQ3OCCNESEE=-9999) FQ3OCCNESEE=-43.
EXECUTE.  
IF (FQ3OCCNESEFR=-9999) FQ3OCCNESEFR=-43.
EXECUTE.  
IF (FQ3OCCNESPFR=-9999) FQ3OCCNESPFR=-43.
EXECUTE.  
MISSING VALUES
   FQ3OCCNESUnSup FQ3OCCNESMR FQ3OCCNESPR FQ3OCCNESDR FQ3OCCNESSup FQ3OCCNESEE FQ3OCCNESEFR FQ3OCCNESPFR
    (LO THRU -1).
EXECUTE.

*STEP 9: LABELING CONSTRUCTS.
VARIABLE LABELS
FQ3OCCNESUnSup 'CCNES Unsupportive Reactions [FQ3OCCNESUnSup]'
FQ3OCCNESMR 'CCNES Minimization Reactions [FQ3OCCNESMR]'
FQ3OCCNESPR 'CCNES Punitive Reactions [FQ3OCCNESPR]'
FQ3OCCNESDR 'CCNES Distress Reactions [FQ3OCCNESDR]'
FQ3OCCNESSup 'CCNES Supportive Reactions [FQ3OCCNESSup]'
FQ3OCCNESEE 'CCNES Expressive Encouragement [FQ3OCCNESEE]'
FQ3OCCNESEFR 'CCNES Emotion-Focused Reactions [FQ3OCCNESEFR]'
FQ3OCCNESPFR 'CCNES Problem-Focused Reactions [FQ3OCCNESPFR]'.
EXECUTE.

*STEP 9A: ADD VALUE LABELS.
*Include ALL missing value labels (SEE STEP 8 FOR FULL LIST). 
*Be sure to also include value labels for any constructs that need labels (e.g., 0 'No', 1 'Yes'). Summed or averaged scores do NOT need value labels.
VALUE LABELS
FQ3OCCNESUnSup TO FQ3OCCNESPFR
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
FREQUENCIES VARIABLES=FD3OSTAT FQ3OCCNESUnSup FQ3OCCNESMR FQ3OCCNESPR FQ3OCCNESDR FQ3OCCNESSup FQ3OCCNESEE FQ3OCCNESEFR FQ3OCCNESPFR
  /ORDER=ANALYSIS.

*STEP 11: CHECK DESCRIPTIVES.
*Checking descriptives for all constructs.
DESCRIPTIVES VARIABLES=FQ3OCCNESUnSup FQ3OCCNESMR FQ3OCCNESPR FQ3OCCNESDR FQ3OCCNESSup FQ3OCCNESEE FQ3OCCNESEFR FQ3OCCNESPFR
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 12: SAVE CLEANED DATA FILE.
*First, sorting the data file by ID and resaving the final file.
*Using /KEEP command to keep ONLY ID + RD + the constructs that were created. 

SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OCCNES_Constructs.sav'
  /KEEP ID FD3ORD FQ3OCCNESUnSup FQ3OCCNESMR FQ3OCCNESPR FQ3OCCNESDR FQ3OCCNESSup FQ3OCCNESEE FQ3OCCNESEFR FQ3OCCNESPFR
  /COMPRESSED.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OCCNES_Constructs.sav'.
EXECUTE.

*STEP 13: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE 
 OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OCCNES_Constructs.spv'
LOCK=NO.
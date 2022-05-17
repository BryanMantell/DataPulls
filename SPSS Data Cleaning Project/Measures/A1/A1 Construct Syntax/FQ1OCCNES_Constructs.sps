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

*1-6-22(BM):Finalized and ran syntax STEPS 1-13.
*1-12-22(BM):Updated STEPS 3, 4, and 8.
*1-26-22(AAC): CHECKED + Added STEP 9A
*1-27-22(BM): Fixed system missing
*2-5-22(AAC): CHECKED.
*--------------------------------------------------------------------------------------------------------------------------------.
*STEP 1: OPENING CLEANED DATA.
*Insert the correct file path and file name. Use syntax to open cleaned data file.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OCCNES_Cleaned.sav'.

*STEP 2: SAVING CLEANED DATA AS A CONSTRUCT FILE. 
*Insert the correct file path and file name.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OCCNES_Constructs.sav'
  /COMPRESSED.

*STEP 3: DESCRIPTIVE STATISTICS (1. FREQ AND 2. CORR) FOR RAW VARIABLES (TOTAL SCORE 1ST, THEN SUBSCALES).
*When running this step note any additional missingness (any other codes) that are not accounted for in the STAT variable. These missing codes (and corresponding IDs) will need to be 
incorporated in STEP 8 below.
FREQ VARS=FQ1OCCNES01A FQ1OCCNES01B FQ1OCCNES01C FQ1OCCNES01D FQ1OCCNES01E FQ1OCCNES01F
FQ1OCCNES02AR FQ1OCCNES02B FQ1OCCNES02C FQ1OCCNES02D FQ1OCCNES02E FQ1OCCNES02F 
FQ1OCCNES03A FQ1OCCNES03B FQ1OCCNES03C FQ1OCCNES03D FQ1OCCNES03E FQ1OCCNES03F
FQ1OCCNES04A FQ1OCCNES04B FQ1OCCNES04C FQ1OCCNES04D FQ1OCCNES04E FQ1OCCNES04F 
FQ1OCCNES05A FQ1OCCNES05B FQ1OCCNES05C FQ1OCCNES05D FQ1OCCNES05E FQ1OCCNES05F
FQ1OCCNES06A FQ1OCCNES06B FQ1OCCNES06C FQ1OCCNES06D FQ1OCCNES06E FQ1OCCNES06F
FQ1OCCNES07A FQ1OCCNES07B FQ1OCCNES07CR FQ1OCCNES07D FQ1OCCNES07E FQ1OCCNES07F
FQ1OCCNES08A FQ1OCCNES08B FQ1OCCNES08CR FQ1OCCNES08D FQ1OCCNES08E FQ1OCCNES08F
FQ1OCCNES09A FQ1OCCNES09B FQ1OCCNES09C FQ1OCCNES09D FQ1OCCNES09E FQ1OCCNES09F
FQ1OCCNES10AR FQ1OCCNES10B FQ1OCCNES10C FQ1OCCNES10D FQ1OCCNES10E FQ1OCCNES10F 
FQ1OCCNES11A FQ1OCCNES11B FQ1OCCNES11C FQ1OCCNES11D FQ1OCCNES11E FQ1OCCNES11F
FQ1OCCNES12A FQ1OCCNES12B FQ1OCCNES12C FQ1OCCNES12D FQ1OCCNES12E FQ1OCCNES12F.
*Unsupportive Reactions (UnSup).
CORR VARS=FQ1OCCNES01D, FQ1OCCNES02C, FQ1OCCNES03B, FQ1OCCNES04C, FQ1OCCNES05C, FQ1OCCNES06B, FQ1OCCNES07D, FQ1OCCNES08D, FQ1OCCNES09C, FQ1OCCNES10F, FQ1OCCNES11A, FQ1OCCNES12F, 
FQ1OCCNES01A, FQ1OCCNES02F, FQ1OCCNES03F, FQ1OCCNES04A, FQ1OCCNES05D, FQ1OCCNES06D, FQ1OCCNES07E, FQ1OCCNES08E, FQ1OCCNES09E, FQ1OCCNES10B, FQ1OCCNES11C, FQ1OCCNES12E, 
FQ1OCCNES01B, FQ1OCCNES02AR, FQ1OCCNES03A, FQ1OCCNES04D, FQ1OCCNES05E, FQ1OCCNES06C, FQ1OCCNES07CR, FQ1OCCNES08CR, FQ1OCCNES09B, FQ1OCCNES10AR, FQ1OCCNES11B, FQ1OCCNES12D.
*Minimization Reactions (MR).
CORR VARS=FQ1OCCNES01D, FQ1OCCNES02C, FQ1OCCNES03B, FQ1OCCNES04C, FQ1OCCNES05C, FQ1OCCNES06B, FQ1OCCNES07D, FQ1OCCNES08D, FQ1OCCNES09C, FQ1OCCNES10F, FQ1OCCNES11A, FQ1OCCNES12F.
*Punitive Reactions (PR).
CORR VARS=FQ1OCCNES01A, FQ1OCCNES02F, FQ1OCCNES03F, FQ1OCCNES04A, FQ1OCCNES05D, FQ1OCCNES06D, FQ1OCCNES07E, FQ1OCCNES08E, FQ1OCCNES09E, FQ1OCCNES10B, FQ1OCCNES11C, FQ1OCCNES12E.
*Distress Reactions (DR).
CORR VARS=FQ1OCCNES01B, FQ1OCCNES02AR, FQ1OCCNES03A, FQ1OCCNES04D, FQ1OCCNES05E, FQ1OCCNES06C, FQ1OCCNES07CR, FQ1OCCNES08CR, FQ1OCCNES09B, FQ1OCCNES10AR, FQ1OCCNES11B, FQ1OCCNES12D.

*Supportive Reactions (Sup).
CORR VARS=FQ1OCCNES01E, FQ1OCCNES02E, FQ1OCCNES03E, FQ1OCCNES04B, FQ1OCCNES05F, FQ1OCCNES06E, FQ1OCCNES07F, FQ1OCCNES08A, FQ1OCCNES09A, FQ1OCCNES10C, FQ1OCCNES11F, FQ1OCCNES12B,
FQ1OCCNES01F, FQ1OCCNES02B, FQ1OCCNES03D, FQ1OCCNES04E, FQ1OCCNES05A, FQ1OCCNES06A, FQ1OCCNES07B, FQ1OCCNES08F, FQ1OCCNES09F, FQ1OCCNES10D, FQ1OCCNES11E, FQ1OCCNES12C,
FQ1OCCNES01C, FQ1OCCNES02D, FQ1OCCNES03C, FQ1OCCNES04F, FQ1OCCNES05B, FQ1OCCNES06F, FQ1OCCNES07A, FQ1OCCNES08B, FQ1OCCNES09D, FQ1OCCNES10E, FQ1OCCNES11D, FQ1OCCNES12A.
*Expressive Encouragement (EE).
CORR VARS=FQ1OCCNES01E, FQ1OCCNES02E, FQ1OCCNES03E, FQ1OCCNES04B, FQ1OCCNES05F, FQ1OCCNES06E, FQ1OCCNES07F, FQ1OCCNES08A, FQ1OCCNES09A, FQ1OCCNES10C, FQ1OCCNES11F, FQ1OCCNES12B.
*Emotion-Focused Reactions (EFR).
CORR VARS=FQ1OCCNES01F, FQ1OCCNES02B, FQ1OCCNES03D, FQ1OCCNES04E, FQ1OCCNES05A, FQ1OCCNES06A, FQ1OCCNES07B, FQ1OCCNES08F, FQ1OCCNES09F, FQ1OCCNES10D, FQ1OCCNES11E, FQ1OCCNES12C.
*Problem-Focused Reactions (PFR).
CORR VARS=FQ1OCCNES01C, FQ1OCCNES02D, FQ1OCCNES03C, FQ1OCCNES04F, FQ1OCCNES05B, FQ1OCCNES06F, FQ1OCCNES07A, FQ1OCCNES08B, FQ1OCCNES09D, FQ1OCCNES10E, FQ1OCCNES11D, FQ1OCCNES12A.

*STEP 4: RECODING MISSING VALUES.
RECODE FQ1OCCNES01A TO FQ1OCCNES12F (MISSING=-9999).
EXECUTE.

*STEP 5: RELIABILITY STATISTICS (TOTAL SCORE 1st, FOLLOWED BY SUBSCALES).
*Unsupportive Reactions (UnSup) (36 items; n=56; alpha=.903). 
REL VARS=FQ1OCCNES01D, FQ1OCCNES02C, FQ1OCCNES03B, FQ1OCCNES04C, FQ1OCCNES05C, FQ1OCCNES06B, FQ1OCCNES07D, FQ1OCCNES08D, FQ1OCCNES09C, FQ1OCCNES10F, FQ1OCCNES11A, FQ1OCCNES12F, 
FQ1OCCNES01A, FQ1OCCNES02F, FQ1OCCNES03F, FQ1OCCNES04A, FQ1OCCNES05D, FQ1OCCNES06D, FQ1OCCNES07E, FQ1OCCNES08E, FQ1OCCNES09E, FQ1OCCNES10B, FQ1OCCNES11C, FQ1OCCNES12E, 
FQ1OCCNES01B, FQ1OCCNES02AR, FQ1OCCNES03A, FQ1OCCNES04D, FQ1OCCNES05E, FQ1OCCNES06C, FQ1OCCNES07CR, FQ1OCCNES08CR, FQ1OCCNES09B, FQ1OCCNES10AR, FQ1OCCNES11B, FQ1OCCNES12D
/SCALE(All)= ALL.
*Minimization Reactions (MR) (12 items; n=79; alpha=.846).
REL VARS=FQ1OCCNES01D, FQ1OCCNES02C, FQ1OCCNES03B, FQ1OCCNES04C, FQ1OCCNES05C, FQ1OCCNES06B, FQ1OCCNES07D, FQ1OCCNES08D, FQ1OCCNES09C, FQ1OCCNES10F, FQ1OCCNES11A, FQ1OCCNES12F
/SCALE(All)= ALL.
*Punitive Reactions (PR) (12 items; n=56; alpha=.813).
REL VARS=FQ1OCCNES01A, FQ1OCCNES02F, FQ1OCCNES03F, FQ1OCCNES04A, FQ1OCCNES05D, FQ1OCCNES06D, FQ1OCCNES07E, FQ1OCCNES08E, FQ1OCCNES09E, FQ1OCCNES10B, FQ1OCCNES11C, FQ1OCCNES12E
/SCALE(All)= ALL.
*Distress Reactions (DR) (12 items; n=79; alpha=.745).
REL VARS=FQ1OCCNES01B, FQ1OCCNES02AR, FQ1OCCNES03A, FQ1OCCNES04D, FQ1OCCNES05E, FQ1OCCNES06C, FQ1OCCNES07CR, FQ1OCCNES08CR, FQ1OCCNES09B, FQ1OCCNES10AR, FQ1OCCNES11B, FQ1OCCNES12D
/SCALE(All)= ALL.

*Supportive Reactions (Sup) (36 items; n=78; alpha=.914). 
REL VARS=FQ1OCCNES01E, FQ1OCCNES02E, FQ1OCCNES03E, FQ1OCCNES04B, FQ1OCCNES05F, FQ1OCCNES06E, FQ1OCCNES07F, FQ1OCCNES08A, FQ1OCCNES09A, FQ1OCCNES10C, FQ1OCCNES11F, FQ1OCCNES12B,
FQ1OCCNES01F, FQ1OCCNES02B, FQ1OCCNES03D, FQ1OCCNES04E, FQ1OCCNES05A, FQ1OCCNES06A, FQ1OCCNES07B, FQ1OCCNES08F, FQ1OCCNES09F, FQ1OCCNES10D, FQ1OCCNES11E, FQ1OCCNES12C,
FQ1OCCNES01C, FQ1OCCNES02D, FQ1OCCNES03C, FQ1OCCNES04F, FQ1OCCNES05B, FQ1OCCNES06F, FQ1OCCNES07A, FQ1OCCNES08B, FQ1OCCNES09D, FQ1OCCNES10E, FQ1OCCNES11D, FQ1OCCNES12A
/SCALE(All)= ALL.
*Expressive Encouragement (EE) (12 items; n=78; alpha=.915).
REL VARS=FQ1OCCNES01E, FQ1OCCNES02E, FQ1OCCNES03E, FQ1OCCNES04B, FQ1OCCNES05F, FQ1OCCNES06E, FQ1OCCNES07F, FQ1OCCNES08A, FQ1OCCNES09A, FQ1OCCNES10C, FQ1OCCNES11F, FQ1OCCNES12B
/SCALE(All)= ALL.
*Emotion-Focused Reactions (EFR) (12 items; n=79; alpha=.854).
REL VARS=FQ1OCCNES01F, FQ1OCCNES02B, FQ1OCCNES03D, FQ1OCCNES04E, FQ1OCCNES05A, FQ1OCCNES06A, FQ1OCCNES07B, FQ1OCCNES08F, FQ1OCCNES09F, FQ1OCCNES10D, FQ1OCCNES11E, FQ1OCCNES12C
/SCALE(All)= ALL.
*Problem-Focused Reactions (PFR) (12 items; n=78; alpha=.747).
REL VARS=FQ1OCCNES01C, FQ1OCCNES02D, FQ1OCCNES03C, FQ1OCCNES04F, FQ1OCCNES05B, FQ1OCCNES06F, FQ1OCCNES07A, FQ1OCCNES08B, FQ1OCCNES09D, FQ1OCCNES10E, FQ1OCCNES11D, FQ1OCCNES12A
/SCALE(All)= ALL.

*STEP 6: COUNTING MISSING DATA (JUST SUBSCALES), THEN RECODING TO 0 TO AVOID NEGATIVE EFFECTS ON CONSTRUCTS.
*Distress Reactions (DR).
COUNT MISSDR=FQ1OCCNES01B, FQ1OCCNES02AR, FQ1OCCNES03A, FQ1OCCNES04D, FQ1OCCNES05E, FQ1OCCNES06C, FQ1OCCNES07CR, FQ1OCCNES08CR, FQ1OCCNES09B, FQ1OCCNES10AR, FQ1OCCNES11B, FQ1OCCNES12D (-9999).
*Punitive Reactions (PR).
COUNT MISSPR=FQ1OCCNES01A, FQ1OCCNES02F, FQ1OCCNES03F, FQ1OCCNES04A, FQ1OCCNES05D, FQ1OCCNES06D, FQ1OCCNES07E, FQ1OCCNES08E, FQ1OCCNES09E, FQ1OCCNES10B, FQ1OCCNES11C, FQ1OCCNES12E (-9999).
*Expressive Encouragement (EE).
COUNT MISSEE=FQ1OCCNES01E, FQ1OCCNES02E, FQ1OCCNES03E, FQ1OCCNES04B, FQ1OCCNES05F, FQ1OCCNES06E, FQ1OCCNES07F, FQ1OCCNES08A, FQ1OCCNES09A, FQ1OCCNES10C, FQ1OCCNES11F, FQ1OCCNES12B (-9999).
*Emotion-Focused Reactions (EFR).
COUNT MISSEFR=FQ1OCCNES01F, FQ1OCCNES02B, FQ1OCCNES03D, FQ1OCCNES04E, FQ1OCCNES05A, FQ1OCCNES06A, FQ1OCCNES07B, FQ1OCCNES08F, FQ1OCCNES09F, FQ1OCCNES10D, FQ1OCCNES11E, FQ1OCCNES12C (-9999).
*Problem-Focused Reactions (PFR).
COUNT MISSPFR=FQ1OCCNES01C, FQ1OCCNES02D, FQ1OCCNES03C, FQ1OCCNES04F, FQ1OCCNES05B, FQ1OCCNES06F, FQ1OCCNES07A, FQ1OCCNES08B, FQ1OCCNES09D, FQ1OCCNES10E, FQ1OCCNES11D, FQ1OCCNES12A (-9999).
*Minimization Reactions (MR).
COUNT MISSMR=FQ1OCCNES01D, FQ1OCCNES02C, FQ1OCCNES03B, FQ1OCCNES04C, FQ1OCCNES05C, FQ1OCCNES06B, FQ1OCCNES07D, FQ1OCCNES08D, FQ1OCCNES09C, FQ1OCCNES10F, FQ1OCCNES11A, FQ1OCCNES12F (-9999).

RECODE FQ1OCCNES01A TO FQ1OCCNES12F (-9999=0).
EXECUTE.

*STEP 7: CREATE TOTAL AND SUBSCALES SCORES  (CHECK THAT REVERSE-SCORED ITEMS INCLUDED).
*Note each subscale name and calculate missingness allowed.
*CREATING TOTAL SCORE-Unsupportive Reactions (UnSup)
*Total Score (36 items) -- USE MISSINGNESS FOR EACH SUBSCALE as a cut-off point.
COMPUTE FQ1OCCNESUnSup=-9999.
EXECUTE.
IF (MISSMR < 3.96 AND MISSPR < 3.96 AND MISSDR < 3.96) FQ1OCCNESUnSup=((FQ1OCCNES01D + FQ1OCCNES02C + FQ1OCCNES03B + FQ1OCCNES04C + FQ1OCCNES05C + FQ1OCCNES06B + FQ1OCCNES07D + FQ1OCCNES08D + FQ1OCCNES09C + FQ1OCCNES10F + FQ1OCCNES11A + FQ1OCCNES12F +
FQ1OCCNES01A + FQ1OCCNES02F + FQ1OCCNES03F + FQ1OCCNES04A + FQ1OCCNES05D + FQ1OCCNES06D + FQ1OCCNES07E + FQ1OCCNES08E + FQ1OCCNES09E + FQ1OCCNES10B + FQ1OCCNES11C + FQ1OCCNES12E +
FQ1OCCNES01B + FQ1OCCNES02AR + FQ1OCCNES03A + FQ1OCCNES04D + FQ1OCCNES05E + FQ1OCCNES06C + FQ1OCCNES07CR + FQ1OCCNES08CR + FQ1OCCNES09B + FQ1OCCNES10AR + FQ1OCCNES11B + FQ1OCCNES12D)/(36-MISSMR-MISSPR-MISSDR)).
EXECUTE.
*CREATING ALL SUBSCALES (CHECK THAT REVERSE-SCORED ITEMS INCLUDED).
*Minimization Reactions (MR) (12 items) -- 66.7% (i.e., if MISS is less than or equal to 3.96) as a cut-off point.
COMPUTE FQ1OCCNESMR=-9999.
EXECUTE.
IF (MISSMR < 3.96) FQ1OCCNESMR=((FQ1OCCNES01D + FQ1OCCNES02C + FQ1OCCNES03B + FQ1OCCNES04C + FQ1OCCNES05C + FQ1OCCNES06B + FQ1OCCNES07D + FQ1OCCNES08D + FQ1OCCNES09C + FQ1OCCNES10F + FQ1OCCNES11A + FQ1OCCNES12F)/(12-MISSMR)).
EXECUTE.
*Punitive Reactions (PR) (12 items) -- 66.7% (i.e., if MISS is less than or equal to 3.96) as a cut-off point.
COMPUTE FQ1OCCNESPR=-9999.
EXECUTE.
IF (MISSPR < 3.96) FQ1OCCNESPR=((FQ1OCCNES01A + FQ1OCCNES02F + FQ1OCCNES03F + FQ1OCCNES04A + FQ1OCCNES05D + FQ1OCCNES06D + FQ1OCCNES07E + FQ1OCCNES08E + FQ1OCCNES09E + FQ1OCCNES10B + FQ1OCCNES11C + FQ1OCCNES12E)/(12-MISSPR)).
EXECUTE.
*Distress Reactions (DR) (12 items) -- 66.7% (i.e., if MISS is less than or equal to 3.96) as a cut-off point.
COMPUTE FQ1OCCNESDR=-9999.
EXECUTE.
IF (MISSDR < 3.96) FQ1OCCNESDR=((FQ1OCCNES01B + FQ1OCCNES02AR + FQ1OCCNES03A + FQ1OCCNES04D + FQ1OCCNES05E + FQ1OCCNES06C + FQ1OCCNES07CR + FQ1OCCNES08CR + FQ1OCCNES09B + FQ1OCCNES10AR + FQ1OCCNES11B + FQ1OCCNES12D)/(12-MISSDR)).
EXECUTE.

*CREATING TOTAL SCORE-Supportive Reactions (Sup)
*Total Score (36 items) -- USE MISSINGNESS FOR EACH SUBSCALE as a cut-off point.
COMPUTE FQ1OCCNESSup=-9999.
EXECUTE.
IF (MISSEE < 3.96 AND MISSEFR < 3.96 AND MISSPFR < 3.96) FQ1OCCNESSup=((FQ1OCCNES01E + FQ1OCCNES02E + FQ1OCCNES03E + FQ1OCCNES04B + FQ1OCCNES05F + FQ1OCCNES06E + FQ1OCCNES07F + FQ1OCCNES08A + FQ1OCCNES09A + FQ1OCCNES10C + FQ1OCCNES11F + FQ1OCCNES12B +
FQ1OCCNES01F + FQ1OCCNES02B + FQ1OCCNES03D + FQ1OCCNES04E + FQ1OCCNES05A + FQ1OCCNES06A + FQ1OCCNES07B + FQ1OCCNES08F + FQ1OCCNES09F + FQ1OCCNES10D + FQ1OCCNES11E + FQ1OCCNES12C +
FQ1OCCNES01C + FQ1OCCNES02D + FQ1OCCNES03C + FQ1OCCNES04F + FQ1OCCNES05B + FQ1OCCNES06F + FQ1OCCNES07A + FQ1OCCNES08B + FQ1OCCNES09D + FQ1OCCNES10E + FQ1OCCNES11D + FQ1OCCNES12A)/(36-MISSEE-MISSEFR-MISSPFR)).
EXECUTE.
*CREATING ALL SUBSCALES (CHECK THAT REVERSE-SCORED ITEMS INCLUDED).
*Expressive Encouragement (EE) (12 items) -- 66.7% (i.e., if MISS is less than or equal to 3.96) as a cut-off point.
COMPUTE FQ1OCCNESEE=-9999.
EXECUTE.
IF (MISSEE < 3.96) FQ1OCCNESEE=((FQ1OCCNES01E + FQ1OCCNES02E + FQ1OCCNES03E + FQ1OCCNES04B + FQ1OCCNES05F + FQ1OCCNES06E + FQ1OCCNES07F + FQ1OCCNES08A + FQ1OCCNES09A + FQ1OCCNES10C + FQ1OCCNES11F + FQ1OCCNES12B)/(12-MISSEE)).
EXECUTE.
*Emotion-Focused Reactions (EFR) (12 items) -- 66.7% (i.e., if MISS is less than or equal to 3.96) as a cut-off point.
COMPUTE FQ1OCCNESEFR=-9999.
EXECUTE.
IF (MISSEFR < 3.96) FQ1OCCNESEFR=((FQ1OCCNES01F + FQ1OCCNES02B + FQ1OCCNES03D + FQ1OCCNES04E + FQ1OCCNES05A + FQ1OCCNES06A + FQ1OCCNES07B + FQ1OCCNES08F + FQ1OCCNES09F + FQ1OCCNES10D + FQ1OCCNES11E + FQ1OCCNES12C)/(12-MISSEFR)).
EXECUTE.
*Problem-Focused Reactions (PFR) (12 items) -- 66.7% (i.e., if MISS is less than or equal to 3.96) as a cut-off point.
COMPUTE FQ1OCCNESPFR=-9999.
EXECUTE.
IF (MISSPFR < 3.96) FQ1OCCNESPFR=((FQ1OCCNES01C + FQ1OCCNES02D + FQ1OCCNES03C + FQ1OCCNES04F + FQ1OCCNES05B + FQ1OCCNES06F + FQ1OCCNES07A + FQ1OCCNES08B + FQ1OCCNES09D + FQ1OCCNES10E + FQ1OCCNES11D + FQ1OCCNES12A)/(12-MISSPFR)).
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
**-12 'Pariticipant refused follow-up'                                             /* (Participant refused follow-up) */     
**-11 'Participant (child) deceased'                                                /* (Participant (child) deceased) */
**-10 'Prefer not to answer'                                                           /* (Participant selected prefer not to answer) */.
DO IF MISSING(FD1OSTAT).
DO REPEAT x = FQ1OCCNESUnSup TO FQ1OCCNESPFR.
RECODE FD1OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.
*Checking frequenices for constructs to look at missingness. 
FREQUENCIES VARIABLES=FD1OSTAT FQ1OCCNESUnSup FQ1OCCNESMR FQ1OCCNESPR FQ1OCCNESDR FQ1OCCNESSup FQ1OCCNESEE FQ1OCCNESEFR FQ1OCCNESPFR
  /ORDER=ANALYSIS.
*If there IS missingness that was not accounted for in the STAT variable (for example in DERSAC, participants who indicated they did not have an additional caregiver should be coded as -44
Each construct needs to be coded by ID here. If there IS NO additional missingess not accounted for, delete only this section of syntax and write **CHECKED AND NOT NEEDED.
IF (ID=91072) FQ1OCCNESUnSup=-10.
EXECUTE.

IF (ID=91072) FQ1OCCNESDR=-10.
EXECUTE.

*At this point, the only remaining missingness should represent when participant did not answer a sufficient number of questions, assuming STAT variable was correctly coded for this measure -- CHECK THIS! 
*The following syntax will recode this remaining missingness for each new construct.
IF (FQ1OCCNESUnSup=-9999) FQ1OCCNESUnSup=-43.
EXECUTE.  
IF (FQ1OCCNESMR=-9999) FQ1OCCNESMR=-43.
EXECUTE.  
IF (FQ1OCCNESPR=-9999) FQ1OCCNESPR=-43.
EXECUTE.  
IF (FQ1OCCNESDR=-9999) FQ1OCCNESDR=-43.
EXECUTE.  
IF (FQ1OCCNESSup=-9999) FQ1OCCNESSup=-43.
EXECUTE.  
IF (FQ1OCCNESEE=-9999) FQ1OCCNESEE=-43.
EXECUTE.  
IF (FQ1OCCNESEFR=-9999) FQ1OCCNESEFR=-43.
EXECUTE.  
IF (FQ1OCCNESPFR=-9999) FQ1OCCNESPFR=-43.
EXECUTE.  
MISSING VALUES
   FQ1OCCNESUnSup FQ1OCCNESMR FQ1OCCNESPR FQ1OCCNESDR FQ1OCCNESSup FQ1OCCNESEE FQ1OCCNESEFR FQ1OCCNESPFR
    (LO THRU -1).
EXECUTE.

*STEP 9: LABELING CONSTRUCTS.
VARIABLE LABELS
FQ1OCCNESUnSup 'CCNES Unsupportive Reactions [FQ1OCCNESUnSup]'
FQ1OCCNESMR 'CCNES Minimization Reactions [FQ1OCCNESMR]'
FQ1OCCNESPR 'CCNES Punitive Reactions [FQ1OCCNESPR]'
FQ1OCCNESDR 'CCNES Distress Reactions [FQ1OCCNESDR]'
FQ1OCCNESSup 'CCNES Supportive Reactions [FQ1OCCNESSup]'
FQ1OCCNESEE 'CCNES Expressive Encouragement [FQ1OCCNESEE]'
FQ1OCCNESEFR 'CCNES Emotion-Focused Reactions [FQ1OCCNESEFR]'
FQ1OCCNESPFR 'CCNES Problem-Focused Reactions [FQ1OCCNESPFR]'.
EXECUTE.

*STEP 9A: ADD VALUE LABELS.
*Include ALL missing value labels (SEE STEP 8 FOR FULL LIST). 
*Be sure to also include value labels for any constructs that need labels (e.g., 0 'No', 1 'Yes'). Summed or averaged scores do NOT need value labels.
VALUE LABELS
FQ1OCCNESUnSup TO FQ1OCCNESPFR
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
*Checking frequencies of all constructs.
FREQUENCIES VARIABLES=FD1OSTAT FQ1OCCNESUnSup FQ1OCCNESMR FQ1OCCNESPR FQ1OCCNESDR FQ1OCCNESSup FQ1OCCNESEE FQ1OCCNESEFR FQ1OCCNESPFR
  /ORDER=ANALYSIS.

*STEP 11: CHECK DESCRIPTIVES.
*Checking descriptives for all constructs.
DESCRIPTIVES VARIABLES=FQ1OCCNESUnSup FQ1OCCNESMR FQ1OCCNESPR FQ1OCCNESDR FQ1OCCNESSup FQ1OCCNESEE FQ1OCCNESEFR FQ1OCCNESPFR
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 12: SAVE CLEANED DATA FILE.
*First, sorting the data file by ID and resaving the final file.
*Using /KEEP command to keep ONLY ID + RD + the constructs that were created. 

SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OCCNES_Constructs.sav'
  /KEEP ID FD1ORD FQ1OCCNESUnSup FQ1OCCNESMR FQ1OCCNESPR FQ1OCCNESDR FQ1OCCNESSup FQ1OCCNESEE FQ1OCCNESEFR FQ1OCCNESPFR
  /COMPRESSED.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OCCNES_Constructs.sav'.
EXECUTE.

*STEP 13: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE 
 OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OCCNES_Constructs.spv'
LOCK=NO.

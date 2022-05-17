* Encoding: UTF-8.
*STEP 0: NOTES
*DEMOGRAPHICS.
 
*02-28-22(BM): Adatped DEMO 1 to DEMO2. 
*03-07-22(BM): Fixed Step 1 and Comments. 
*03-30-22(BM): Updated Demo 2 to Match Demo 1
*03-30-22(AAC): Checked.
*04-05-22(BM): Updated Item 21A and 02G.
*04-07-22(AAC): Checked. Fixed 02E and 02G missing values.
*04-07-22(BM): Fixed comment for mismatched dates.
*05-10-22(AAC): Updating missing code step.

*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------.
*STEP 1: OPENING RAW DATA.
*Insert the correct file path and file name. Use syntax to open raw data file.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/Serv Mother Intake Survey-Modification (24)_April 5, 2022_12.19.sav'.

*STEP 2: SAVING QUESTIONNAIRE SPECIFIC RAW DATA. 
*Insert the correct file path and file name. Save this file with only those variables that you need, in the following order; ID, Start Date, Questionnaire Items (i.e., DERS_1 to DERS_36).
  SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ0ODEMO2_Cleaned.sav'
  /KEEP 
  ID
  StartDate
  FQ0ODEMO01A TO FQ0ODEMO23A
  /COMPRESSED.
  EXECUTE.

*STEP 3: OPEN NEW DATA FILE.  
*Insert the correct file path and file name. Open the file you just created and saved so that you are able to clean the data.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ0ODEMO2_Cleaned.sav'.

*STEP 4: TRANSFORM VARIABLES AND SORT IDS ASCENDING ORDER.
*Transforming ID from a string to a numeric variable, change the date format of startdate, and sort IDs in ascending order.
ALTER TYPE ID (F10.0).
EXECUTE.
FORMATS StartDate (adate10).
EXECUTE.
SORT CASES BY ID(A).
EXECUTE.

*STEP 5: RENAME ‘RAW DATA’ VARIABLES TO ‘CLEANED’ VARIABLES NAMES. 
*Rename all variables so they reflect our naming scheme. ID should always be labeled as 'ID'. Item should be numbers 01-36 or 001-106.  
RENAME VARIABLE (StartDate=FQ0ODEMODATE).
EXECUTE.

*Alexis also fixed the alphabet order in the 06letters.
RENAME VARIABLE
    (FQ0ODEMO02_8_TEXT=FQ0ODEMO02T) (FQ0ODEMO03A=FQ0ODEMO03B1)
    (FQ0ODEMO05A=FQ0ODEMO05H2) (FQ0ODEMO05B=FQ0ODEMO05H3) (FQ0ODEMO05C=FQ0ODEMO05H4) (FQ0ODEMO05D=FQ0ODEMO05H5)  (FQ0ODEMO06_1=FQ0ODEMO06A)
    (FQ0ODEMO03_2=FQ0ODEMO03B) (FQ0ODEMO03_1=FQ0ODEMO03A) (FQ0ODEMO05_1=FQ0ODEMO05A) (FQ0ODEMO05_2=FQ0ODEMO05B) (FQ0ODEMO05_3=FQ0ODEMO05C)
    (FQ0ODEMO05_4=FQ0ODEMO05D) (FQ0ODEMO05_5=FQ0ODEMO05E) (FQ0ODEMO05_6=FQ0ODEMO05F) (FQ0ODEMO05_7=FQ0ODEMO05G) (FQ0ODEMO05_8=FQ0ODEMO05H1)
    (FQ0ODEMO06_2=FQ0ODEMO06B) (FQ0ODEMO06_3=FQ0ODEMO06C) (FQ0ODEMO06_4=FQ0ODEMO06D) (FQ0ODEMO06_5=FQ0ODEMO06E) (FQ0ODEMO06_6=FQ0ODEMO06F)
    (FQ0ODEMO06_7=FQ0ODEMO06G) (FQ0ODEMO06_8=FQ0ODEMO06H) (FQ0ODEMO06_9=FQ0ODEMO06I) (FQ0ODEMO06_10=FQ0ODEMO06J) (FQ0ODEMO06_11=FQ0ODEMO06K)
    (FQ0ODEMO06_12=FQ0ODEMO06L) (FQ0ODEMO06_13=FQ0ODEMO06M) (FQ0ODEMO06_14=FQ0ODEMO06N) (FQ0ODEMO06_15=FQ0ODEMO06O) (FQ0ODEMO06_15_TEXT=FQ0ODEMO06OT)
    (FQ0ODEMO07=FQ0ODEMO07A1) (FQ0ODEMO07A_1=FQ0ODEMO07A2) (FQ0ODEMO07A_2=FQ0ODEMO07A3) (FQ0ODEMO07A_6=FQ0ODEMO07A4) (FQ0ODEMO07A_7=FQ0ODEMO07A5)
    (FQ0ODEMO07A_8=FQ0ODEMO07A6) (FQ0ODEMO02A_9_TEXT=FQ0ODEMO02AT) (FQ0ODEMO09_1=FQ0ODEMO09A) (FQ0ODEMO09_2=FQ0ODEMO09B) (FQ0ODEMO09_3=FQ0ODEMO09C)
    (FQ0ODEMO09_4=FQ0ODEMO09D) (FQ0ODEMO09_5=FQ0ODEMO09E) (FQ0ODEMO10_1=FQ0ODEMO10A) (FQ0ODEMO10_2=FQ0ODEMO10B) (FQ0ODEMO10_3=FQ0ODEMO10C)
    (FQ0ODEMO10_4=FQ0ODEMO10D) (FQ0ODEMO10_5=FQ0ODEMO10E) (FQ0ODEMO10_6=FQ0ODEMO10F) (FQ0ODEMO10_6_TEXT=FQ0ODEMO10FT) (FQ0ODEMO02F_3_TEXT=FQ0ODEMO02FT) (FQ0ODEMO21A = FQ0ODEMO21C)
    (FQ0ODEMO21B_1=FQ0ODEMO21A) (FQ0ODEMO21B_2=FQ0ODEMO21B) (FQ0ODEMO21B_3=FQ0ODEMO21D) (FQ0ODEMO21B_4=FQ0ODEMO21E) (FQ0ODEMO21B_5=FQ0ODEMO21F) (FQ0ODEMO21B_6=FQ0ODEMO21G)
    (FQ0ODEMO01A = FQ0ODEMO01C) (FQ0ODEMO01B = FQ0ODEMO00B).
EXECUTE.

SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ0ODEMO2_Cleaned.sav'.
EXECUTE.

*STEP 5A: MERGING FINAL ID FILE WITH CURRENT DATA FILE.
*This will ensure that all files have the correct # of enrolled and eligible IDs (Pitt=90; UO=88). Any missingness should be investigated (should they be missing?) and
labeled in STEP XX using information from the status (STAT) variable. If the status variable does not 'tell the whole story' (i.e., visit occured but data is missing),
missingness should be labeled by ID using syntax and notes in the syntax should provide information to justify the missing code.
*When using the syntax include which variables you want to DROP from the Assessment Summary file -- THE FULL LIST OF VARIABLES IS BELOW -- 
You should retain date (RD) and status (STAT) for the wave you are using (example below is A1; FD1ORD FD1OSTAT are REMOVED so that they are NOT dropped):
FD0OSTAT FD0ORD
FD1OSTAT FD1OTD FD1ORD FD1ODIFF
FD2OSTAT FD2OTD FD2ORD FD2ODIFF
FD3OSTAT FD3OTD FD3ORD FD3ODIFF
FD4OSTAT FD4OTD FD4ORD FD4ODIFF
FD4AOSTAT FD4AOTD FD4AORD FD4AODIFF.
MATCH FILES
/FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FD0OACS_Constructs.sav'
/IN=f
/FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ0ODEMO2_Cleaned.sav'
/BY ID
/DROP=
FD1OSTAT FD1OTD FD1ORD FD1ODIFF
FD2OSTAT FD2OTD FD2ORD FD2ODIFF
FD3OSTAT FD3OTD FD3ORD FD3ODIFF
FD4OSTAT FD4OTD FD4ORD FD4ODIFF
FD4AOSTAT FD4AOTD FD4AORD FD4AODIFF.
SELECT IF f=1.
EXECUTE.
*Comparing REDCap and Qualtrics dates of completion. Be sure to update the date variables used to reflect the accurate RD and questionnaire date.
COMPUTE DATEDIFF = DATEDIFF(FD0ORD,FQ0ODEMODATE,'days').
EXECUTE.
COUNT DATEDIFF0=DATEDIFF(Lowest thru -1) DATEDIFF(1 thru Highest).
EXECUTE.
FREQUENCIES VARIABLES=DATEDIFF0
  /ORDER=ANALYSIS.
SORT CASES BY DATEDIFF0(D).
*CHECK ALL IDS WITH DISCREPANT DATES TO DETERMINE WHAT IS CORRECT. CONSULT BEFORE MAKING ANY CHANGES TO RAW DATA IN REDCAP OR QUALTRICS.
*INCLUDE NOTES HERE FOR EACH ID THAT WAS DISCREPANT.
*THE FOLLOWING IDs (INCLUDE IDs) HAVE A A0 QUALTRICS DATE [FQ0ODEMODATE] THAT DOES NOT MATCH THEIR A0 VISIT DATE [FD0ORD]. 
*90097, 90386, 90830, 90846, 90887, 91171
*Date discrepancies are due to incorrect Qualtrics date. Checked and reconciled.
SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ0ODEMO2_Cleaned.sav'
/DROP
DATEDIFF
DATEDIFF0
f.
EXECUTE.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ0ODEMO2_Cleaned.sav'.
EXECUTE.

**STEP 6 (DELETE SYNTAX - NOT NOTES - IF NOT NEEDED): RECODING VALUES (INCLUDING MISSING VALUES). 
*Check to be sure the variables are coded correctly (should appear as numbers). If they are not, recode all variables. 
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
*For race variables, changing missingness to 0(if didn't apply to the participant,so didn't check that box) or -44(if didn't apply to the participant AND question wasn't presented to them).


*For race variables, changing missingness to 0(if didn't apply to the participant,so didn't check that box) or -44(if didn't apply to the participant AND question wasn't presented to them).
RECODE FQ0ODEMO01C TO FQ0ODEMO02
    (SYSMIS=-44).
RECODE FQ0ODEMO03A FQ0ODEMO03B
    (SYSMIS=-44).
RECODE FQ0ODEMO05A TO FQ0ODEMO05H1
    (SYSMIS=-44).
RECODE FQ0ODEMO06A TO FQ0ODEMO06O
    (SYSMIS=-44).
RECODE FQ0ODEMO06A1 TO FQ0ODEMO07A6
    (SYSMIS=-44).
RECODE FQ0ODEMO06B1 TO FQ0ODEMO02A
    (SYSMIS=-44).
RECODE FQ0ODEMO02C
    (SYSMIS=-44).
RECODE FQ0ODEMO09A TO FQ0ODEMO10F
    (SYSMIS=-44).
RECODE FQ0ODEMO02E
    (SYSMIS=-44).
RECODE FQ0ODEMO02F
    (SYSMIS=-44).
RECODE FQ0ODEMO02G FQ0ODEMO11 
    (SYSMIS=-44).   
RECODE FQ0ODEMO13 TO FQ0ODEMO14 
    (SYSMIS=-44).   
RECODE FQ0ODEMO21C TO FQ0ODEMO23
    (SYSMIS=-44).

IF(ID = 90077 OR ID = 90097 OR ID = 90253 OR ID = 90386 OR ID = 90830 OR ID = 90846 
    OR ID = 90887 OR ID = 90998 OR ID = 91171) FQ0ODEMO21A = 0.
EXECUTE.

IF(ID = 90077 OR ID = 90097 OR ID = 90386 OR ID = 90830 OR ID = 90846 
    OR ID = 90887 OR ID = 90998 OR ID = 91171) FQ0ODEMO21B = 0.
EXECUTE.

IF(ID = 90077 OR ID = 90097 OR ID = 90386 OR ID = 90830 OR ID = 90846 
    OR ID = 90887 OR ID = 90998 OR ID = 91171) FQ0ODEMO21D = 0.
EXECUTE.

IF(ID = 90077 OR ID = 90097 OR ID = 90253 OR ID = 90386 OR ID = 90830 OR ID = 90846 
    OR ID = 90887 OR ID = 90998 OR ID = 91171) FQ0ODEMO21E = 0.
EXECUTE.

IF(ID = 90097) FQ0ODEMO21F = 0.
EXECUTE.

IF(ID = 90077 OR ID = 90097 OR ID = 90253 OR ID = 90386 OR ID = 90830 OR ID = 90846 
    OR ID = 90887 OR ID = 90998 OR ID = 91171) FQ0ODEMO21G = 0.
EXECUTE.

**STEP 7 (DELETE IF NOT NEEDED): CREATING NEW VARIABLES FOR REVERSED SCORED ITEMS.
**Reverse-Scored Items; see scoring document to determine if there are reverse-scored items. If no reverse-scored items, delete this syntax.
**CHECK AND NOT NEEDED.

**STEP 7A: RECODING SYSMIS (PARTICIPANTS THAT MISSED THE ASSESSMENT).
*This will use the STAT variable to recode all SYSMIS data. CHANGE THE STAT VARIABLE TO MATCH THE ASSESSMENT WAVE YOU ARE WORKING IN.
*Include full list of numeric variables (including new reverse-scored items).
DO IF MISSING(FD0OSTAT).
DO REPEAT x =  FQ0ODEMO01C TO FQ0ODEMO02 FQ0ODEMO03A FQ0ODEMO03B FQ0ODEMO05A TO FQ0ODEMO05H1
    FQ0ODEMO06A TO FQ0ODEMO06O FQ0ODEMO06A1 TO FQ0ODEMO07A6 FQ0ODEMO06B1 TO FQ0ODEMO02A FQ0ODEMO02C
    FQ0ODEMO02E FQ0ODEMO09A TO FQ0ODEMO10F FQ0ODEMO02F FQ0ODEMO02G FQ0ODEMO11 FQ0ODEMO13 TO FQ0ODEMO14
    FQ0ODEMO21C TO FQ0ODEMO23.
RECODE FD0OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.

*STEP 8: STANDARDIZING DECIMAL PLACES (CANNOT INCLUDE TEXT/STRING VARIABLES).-NEED TO EDIT.
*Making all variables have the same number of decimal places. Ensure that variables include all new reverse-scored variables. Change the number AFTER the decimal place as needed.
FORMATS FQ0ODEMO01C TO FQ0ODEMO02 FQ0ODEMO03A FQ0ODEMO03B FQ0ODEMO05A TO FQ0ODEMO05H1
    FQ0ODEMO06A TO FQ0ODEMO06O FQ0ODEMO06A1 TO FQ0ODEMO07A6 FQ0ODEMO06B1 TO FQ0ODEMO02A FQ0ODEMO02C
    FQ0ODEMO02E FQ0ODEMO09A TO FQ0ODEMO10F FQ0ODEMO02F FQ0ODEMO02G FQ0ODEMO11 FQ0ODEMO13 TO FQ0ODEMO14
    FQ0ODEMO21C TO FQ0ODEMO23 (F8.0).
EXECUTE.

*STEP 9: CREATING VARIABLE LABLES.
*Label all variables. Use the original questionnaire to include the exact text that participants saw. Include the questionnaire name and number at the end of the label.
VARIABLE LABELS  ID 'Participant ID'.
EXECUTE.
VARIABLE LABELS  FQ0ODEMODATE 'Date of completion as indicated by Qualtrics'.
EXECUTE.

VARIABLE LABELS 
FQ0ODEMO01C 'Do you identify as Hispanic and/or Latino(a)? [FQ0ODEMO01C]'
FQ0ODEMO00B 'What is your racial background? [FQ0ODEMO00B]'
FQ0ODEMO02 'What is your current relationship status? - Selected Choice [FQ0ODEMO02]'
FQ0ODEMO02T 'What is your current relationship status? - Other (please describe) - Text [FQ0ODEMO02T]'
FQ0ODEMO02A 'What is your current spouses relation to TC? - Selected Choice [FQ0ODEMO02A]'
FQ0ODEMO02AT 'What is your current spouses relation to TC? - Other - Text [FQ0ODEMO02AT]'
FQ0ODEMO02B 'How long ago was the most recent divorce? (Time in years, months) [FQ0ODEMO02B]'
FQ0ODEMO02C 'How many times have you been divorced in TCs lifetime? (number of times) [FQ0ODEMO02C]'
FQ0ODEMO02D 'How long have you been remarried? (Time in years, months) [FQ0ODEMO02D]'
FQ0ODEMO02E 'How many times have you remarried in TCs lifetime? (number of times) [FQ0ODEMO02E]'
FQ0ODEMO02F 'What is your physical custody status of TC? - Selected Choice [FQ0ODEMO02F]'
FQ0ODEMO02FT 'What is your physical custody status of TC? - Less than Partial Physical Custody (Please Describe) - Text [FQ0ODEMO02FT]'
FQ0ODEMO02G 'Do you currently receive Child support payments? [FQ0ODEMO02G]'
FQ0ODEMO02H 'What does your spouse/partner do for a living? [FQ0ODEMO02H]'
FQ0ODEMO03A 'Have either of the following happened in TCs lifetime? - You had a child [FQ0ODEMO03A]'
FQ0ODEMO03B 'Have either of the following happened in TCs lifetime? - You became pregnant [FQ0ODEMO03B]'
FQ0ODEMO03B1 'Number of children you had [FQ0ODEMO03B1]'
FQ0ODEMO05A 'Who is in TCs immediate family? Mother of TC [FQ0ODEMO05A]'
FQ0ODEMO05B 'Who is in TCs immediate family? Father of TC [FQ0ODEMO05B]'
FQ0ODEMO05C 'Who is in TCs immediate family? Sister(s) (other than TC) [FQ0ODEMO05C]'
FQ0ODEMO05D 'Who is in TCs immediate family? Brothers(s) (other than TC) [FQ0ODEMO05D]'
FQ0ODEMO05E 'Who is in TCs immediate family? Stepmother (of TC) [FQ0ODEMO05E]'
FQ0ODEMO05F 'Who is in TCs immediate family? Stepfather (of TC) [FQ0ODEMO05F]'
FQ0ODEMO05G 'Who is in TCs immediate family? Stepsister (other than TC) [FQ0ODEMO05G]'
FQ0ODEMO05H1 'Who is in TCs immediate family? Stepbrother (other than TC) [FQ0ODEMO05H1]' 
FQ0ODEMO05H2 'Number of Sister(s) TC has [FQ0ODEMO05H2]'
FQ0ODEMO05H3 'Number of Brother(s) TC has [FQ0ODEMO05H3]'
FQ0ODEMO05H4 'Number of Stepsister(s) TC has [FQ0ODEMO05H4]'
FQ0ODEMO05H5 'Number of Stepbrother(s) TC has [FQ0ODEMO05H5]'.
EXECUTE.

VARIABLE LABELS 
FQ0ODEMO06A 'Who lives at home with TC? TCs Biological Mother [FQ0ODEMO06A]'
FQ0ODEMO06A1 'How much contact do you have with TC? [FQ0ODEMO06A1]'
FQ0ODEMO06B 'Who lives at home with TC? TCs Biological Father [FQ0ODEMO06B]'
FQ0ODEMO06B1 'How much contact does TCs biological father have with him/her? [FQ0ODEMO06B1]'
FQ0ODEMO06B2 'When is the last time TC saw his/her biological father? [FQ0ODEMO06B2]'
FQ0ODEMO06B3 'How well does TCs biological father get along with him/her? [FQ0ODEMO06B3]'
FQ0ODEMO06B4 'How old is TCs father? (age in years) [FQ0ODEMO06B4]'
FQ0ODEMO06C 'Who lives at home with TC? Sister(s) (other than TC) [FQ0ODEMO06C]'
FQ0ODEMO06C1 'Number of Sister(s) living at home with TC [FQ0ODEMO06C1]'
FQ0ODEMO06C2 'How much contact do(es) TCs Sister(s) have with him/her? [FQ0ODEMO06C2]'
FQ0ODEMO06C3 'How well do(es) TCs sister(s) get along with him/her? [FQ0ODEMO06C3]'
FQ0ODEMO06D 'Who lives at home with TC? Brother(s) (other than TC) [FQ0ODEMO06D]'
FQ0ODEMO06D1 'Number of Brother(s) living at home with TC [FQ0ODEMO06D1]'
FQ0ODEMO06D2 'How much contact do(es) TCs Brother(s) have with him/her? [FQ0ODEMO06D2]' 
FQ0ODEMO06E 'Who lives at home with TC? TCs Stepmother [FQ0ODEMO06E]'
FQ0ODEMO06E1 'How much contact does TCs Stepmother have with him/her? [FQ0ODEMO06E1]' 
FQ0ODEMO06E2 'How well does TCs Stepmother get along with him/her? [FQ0ODEMO06E2]' 
FQ0ODEMO06F 'Who lives at home with TC? TCs Stepfather [FQ0ODEMO06F]'
FQ0ODEMO06F1 'How much contact does TCs Stepfather have with him/her? [FQ0ODEMO06F1]'
FQ0ODEMO06F2 'How well does TCs Stepfather get along with him/her? [FQ0ODEMO06F2]'
FQ0ODEMO06F3 'How old is TCs step father? (age in years) [FQ0ODEMO06F3]'
FQ0ODEMO06G 'Who lives at home with TC? Stepsister(s) (other than TC) [FQ0ODEMO06G]'
FQ0ODEMO06G1 'Number of Stepsister(s) living at home with TC [FQ0ODEMO06G1]'
FQ0ODEMO06G2 'How much contact do(es) TCs Stepsister(s) have with him/her? [FQ0ODEMO06G2]'
FQ0ODEMO06G3 'How well do(es) TCs Stepsister(s) get along with him/her? [FQ0ODEMO06G3]'
FQ0ODEMO06H 'Who lives at home with TC? Stepbrother(s) (other than TC) [FQ0ODEMO06H]'
FQ0ODEMO06H1 'Number of Stepbrother(s) living at home with TC [FQ0ODEMO06H1]'
FQ0ODEMO06H2 'How much contact do(es) TCs Stepbrother(s) have with him/her? [FQ0ODEMO06H2]'
FQ0ODEMO06H3 'How well do(es) TCs Stepbrother(s) get along with him/her? [FQ0ODEMO06H3]'
FQ0ODEMO06I 'Who lives at home with TC? TCs Grandmother [FQ0ODEMO06I]'
FQ0ODEMO06I1 'How much contact does TCs Grandmother have with him/her? [FQ0ODEMO06I1]'
FQ0ODEMO06I2 'How well does TCs Grandmother get along with him/her? [FQ0ODEMO06I2]'
FQ0ODEMO06J 'Who lives at home with TC? TCs Grandfather [FQ0ODEMO06J]'
FQ0ODEMO06J1 'How much contact does TCs Grandfather have with him/her? [FQ0ODEMO06J1]'
FQ0ODEMO06J2 'How well does TCs Grandfather get along with him/her? [FQ0ODEMO06J2]'
FQ0ODEMO06K 'Who lives at home with TC? TCs Aunt [FQ0ODEMO06K]'
FQ0ODEMO06K1 'How much contact does TCs Aunt have with him/her? [FQ0ODEMO06K1]'
FQ0ODEMO06K2 'How well does TCs Aunt get along with him/her? [FQ0ODEMO06K2]'
FQ0ODEMO06L 'Who lives at home with TC? TCs Uncle [FQ0ODEMO06L]'
FQ0ODEMO06L1 'How much contact does TCs Uncle have with him/her? [FQ0ODEMO06L1]'
FQ0ODEMO06L2 'How well does TCs Uncle get along with him/her? [FQ0ODEMO06L2]'
FQ0ODEMO06M 'Who lives at home with TC? TCs Friend [FQ0ODEMO06M]'
FQ0ODEMO06M1 'How much contact does TCs Friend have with him/her? [FQ0ODEMO06M1]'
FQ0ODEMO06M2 'How well does TCs Friend get along with him/her? [FQ0ODEMO06M2]'
FQ0ODEMO06N 'Who lives at home with TC? Parents Girlfriend/Boyfriend [FQ0ODEMO06N]'
FQ0ODEMO06N1 'How much contact does TCs Parents Girlfriend/Boyfriend have with him/her? [FQ0ODEMO06N1]'
FQ0ODEMO06N2 'How well does TCs parents Girlfriend/Boyfriend get along with him/her? [FQ0ODEMO06N2]'
FQ0ODEMO06N4 'How long has your boyfriend/girlfriend lived with your family? (Time in years, months) [FQ0ODEMO06N3]'
FQ0ODEMO06N5 'What is your boyfriend/girlfriends age? (age in years) [FQ0ODEMO06N4]'
FQ0ODEMO06O 'Who lives at home with TC? Other [FQ0ODEMO06O]'
FQ0ODEMO06OT 'Who lives at home with TC? Other - Text [FQ0ODEMO06OT]'.
EXECUTE. 

VARIABLE LABELS 
FQ0ODEMO07A1 'Has TC lived away from you for more than one month, like with relatives, in a foster home, or in a special facility? [FQ0ODEMO07A1]'
FQ0ODEMO07A2 'Where did TC live or whom did s/he live with? Check all that apply. Foster Home [FQ0ODEMO07A2]'
FQ0ODEMO07A3 'Where did TC live or whom did s/he live with? Check all that apply. Relatives [FQ0ODEMO07A3]'
FQ0ODEMO07A4 'Where did TC live or whom did s/he live with? Check all that apply. Other parent [FQ0ODEMO07A4]'
FQ0ODEMO07A5 'Where did TC live or whom did s/he live with? Check all that apply. Summer camp [FQ0ODEMO07A5]'
FQ0ODEMO07A6 'Where did TC live or whom did s/he live with? Check all that apply. Other [FQ0ODEMO07A6]'
FQ0ODEMO07B 'How long did TC live away from you, in total (years; months; weeks)? [FQ0ODEMO07B]'
FQ0ODEMO08 'If you have more than one child, where does TC fall in the birth order? [FQ0ODEMO08]'
FQ0ODEMO09A 'Education: How many years of formal education does each of the following people have? - Mother [FQ0ODEMO09A]'
FQ0ODEMO09B 'Education: How many years of formal education does each of the following people have? - Father [FQ0ODEMO09B]'
FQ0ODEMO09C 'Education: How many years of formal education does each of the following people have? - Step-Mother [FQ0ODEMO09C]'
FQ0ODEMO09D 'Education: How many years of formal education does each of the following people have? - Step-Father [FQ0ODEMO09D]'
FQ0ODEMO09E 'Education: How many years of formal education does each of the following people have? - Live in Partner [FQ0ODEMO09E]'
FQ0ODEMO10A 'Income: What is your familys primary source of income? (only select 2 options if both apply) - Selected Choice Salary/Wage from your job [FQ0ODEMO10A]'
FQ0ODEMO10B 'Income: What is your familys primary source of income? (only select 2 options if both apply) - Selected Choice Salary/wage from another household members job [FQ0ODEMO10B]'
FQ0ODEMO10C 'Income: What is your familys primary source of income? (only select 2 options if both apply) - Selected Choice Investments [FQ0ODEMO10C]'
FQ0ODEMO10D 'Income: What is your familys primary source of income? (only select 2 options if both apply) - Selected Choice Child support or alimony [FQ0ODEMO10D]'
FQ0ODEMO10E 'Income: What is your familys primary source of income? (only select 2 options if both apply) - Selected Choice State or Federal aid [FQ0ODEMO10E]'
FQ0ODEMO10F 'Income: What is your familys primary source of income? (only select 2 options if both apply) - Selected Choice Other [FQ0ODEMO10F]'
FQ0ODEMO10FT 'Income: What is your familys primary source of income? (only select 2 options if both apply) - Other - Text [FQ0ODEMO10FT]'
FQ0ODEMO11 'Are you currently employed? [FQ0ODEMO11]'
FQ0ODEMO11A 'In TCs lifetime, have you stopped working for a long period of time (not because of retirement)? [FQ0ODEMO11A]'
FQ0ODEMO11B 'Have you recently had a decrease in wages or salary? [FQ0ODEMO11B]'
FQ0ODEMO12 'What do you do for a living? [FQ0ODEMO12]'
FQ0ODEMO13 'Some families have other sources of income besides their jobs and public assistance (financial assistance, interest on savings, rental income, and so on). Does anyone in the household currently receive income like this? [FQ0ODEMO13]'
FQ0ODEMO14 'What is your familys average annual income from all sources? (salary, investments, child support or alimony, state or federal aid) [FQ0ODEMO14]'
FQ0ODEMO14A 'What is your familys average annual income from all sources? (salary, investments, child support or alimony, state or federal aid) (e.g. 077,000) [FQ0ODEMO14A]'
FQ0ODEMO15 'How long has your household received this income? [FQ0ODEMO15]'
FQ0ODEMO16 'Home: How many rooms are there in your home (Including living, dining, kitchen, family, bath, and bed rooms)? [FQ0ODEMO16]'
FQ0ODEMO17 'How many bedrooms are there in your home? (number) [FQ0ODEMO17]'
FQ0ODEMO18 'How long has your family lived in your current home? (time in years, months) [FQ0ODEMO18]'
FQ0ODEMO19 'How many times have you moved in TCs lifetime? (number of times) [FQ0ODEMO19]'
FQ0ODEMO20 'In a typical year, how many hours per week does TC spend in school? [FQ0ODEMO20]'
FQ0ODEMO21C 'Is your Child Hispanic and/or Latino(a)?[FQ0ODEMO21C]' 
FQ0ODEMO21A 'Your Child: Please answer the following questions about TC. What is TCs ethnic or racial background? African American or Black [FQ0ODEMO21A]'
FQ0ODEMO21B 'Your Child: Please answer the following questions about TC. What is TCs ethnic or racial background? Asian [FQ0ODEMO21B]'
FQ0ODEMO21D 'Your Child: Please answer the following questions about TC. What is TCs ethnic or racial background? American Indian, Alaskan Native [FQ0ODEMO21D]'
FQ0ODEMO21E 'Your Child: Please answer the following questions about TC. What is TCs ethnic or racial background? Native Hawaiian or Pacific Islander [FQ0ODEMO21E]' 
FQ0ODEMO21F 'Your Child: Please answer the following questions about TC. What is TCs ethnic or racial background? European American or White [FQ0ODEMO21F]'
FQ0ODEMO21G 'Your Child: Please answer the following questions about TC. What is TCs ethnic or racial background? Other [FQ0ODEMO21G]'
FQ0ODEMO22 'How is TC’s overall health? [FQ0ODEMO22]'
FQ0ODEMO23 'Is TC taking any medications? [FQ0ODEMO23]'
FQ0ODEMO23A 'What medications is s/he taking? [FQ0ODEMO23A]'.
EXECUTE.

*STEP 10: ADD VALUE LABELS.
*Include missing values like 'Prefer not to Answer' (or something similar) if applicable.
*Include ALL missing value labels (SEE ABOVE FOR FULL LIST).
VALUE LABELS
FQ0ODEMO01C FQ0ODEMO00B FQ0ODEMO07A1 TO FQ0ODEMO07A6 FQ0ODEMO10A TO FQ0ODEMO10F FQ0ODEMO21C TO FQ0ODEMO21G FQ0ODEMO02G
FQ0ODEMO03A FQ0ODEMO03B FQ0ODEMO05A TO FQ0ODEMO05H1 FQ0ODEMO06A TO FQ0ODEMO06O FQ0ODEMO07A1 FQ0ODEMO11 FQ0ODEMO13 TO FQ0ODEMO11B FQ0ODEMO23
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
0 'No (0)'
1 'Yes (1)'.
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
FQ0ODEMO06A1 FQ0ODEMO06B1 FQ0ODEMO06C2 FQ0ODEMO06D2 FQ0ODEMO06E1 FQ0ODEMO06F1 FQ0ODEMO06G2 FQ0ODEMO06H2 
FQ0ODEMO06I1 FQ0ODEMO06J1 FQ0ODEMO06K1 FQ0ODEMO06L1 FQ0ODEMO06M1 FQ0ODEMO06N1
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
1 'Daily (1)'
2 '4-6 Times Per Week (2)'
3 '1-3 Days Per Week (3)'
4 'Every Other Week (4)'
5 'Other (5)'.
EXECUTE.

VALUE LABELS
FQ0ODEMO06B3 FQ0ODEMO06C3 FQ0ODEMO06E2 FQ0ODEMO06F2 FQ0ODEMO06G3 FQ0ODEMO06H3 FQ0ODEMO06I2 FQ0ODEMO06J2 FQ0ODEMO06K2 FQ0ODEMO06L2 FQ0ODEMO06M2 FQ0ODEMO06N2 
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
1 'Not Well (1)'
2 'Okay (2)'
3 'Very Well (3)'.
EXECUTE.

VALUE LABELS
FQ0ODEMO06B2
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
1 'Last week (1)'
2 'Within the last month (2)'
3 'Within the last 3 months (3)'
4 'Within the last 6 months (4)'
5 'Within the last year (5)'
6 'More than a year ago (6)'
7 'Has never seen father (7)'.
EXECUTE.

VALUE LABELS
FQ0ODEMO06C1 FQ0ODEMO06D1 FQ0ODEMO06G1 FQ0ODEMO06H1 FQ0ODEMO02C FQ0ODEMO02E
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
1 'One (1)'
2 'Two (2)'
3 'Three (3)'
4 'Four (4)'
5 'Five (5)'
6 'Six or More (6)'.
EXECUTE.

VALUE LABELS
FQ0ODEMO08
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
1 'First/Oldest (1)'
2 'Second (2)'
3 'Thrid (3)'
4 'Fourth (4)'
5 'Fifth or More (5)'.
EXECUTE.

VALUE LABELS
FQ0ODEMO02A
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
2 'Adoptive Mother (2)'
4 'Biological Father (4)'
5 'Adoptive Father (5)'
6 'Step Father (6)'
7 'Grandmother (7)'
8 'Grandfather (8)'
9 'Other (9)'.
EXECUTE.

VALUE LABELS
FQ0ODEMO09A TO FQ0ODEMO09E
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
FQ0ODEMO02F
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
3 'Less than Partial Physical Custody (3)'
4 'Full Physical Custody (4)'
5 'Partial Physical Custody (50%) (5)'.
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
FQ0ODEMO22
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
1 'Good (1)'
2 'Fair (2)'
3 'Poor (3)'.
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
1 'African American or Black (1)'
2 'Asian or Asian American (2)'
3 'American Indian, Alaskan Native (3)'
4 'Native Hawaiian or Pacific Islander (4)'
5 'European American or White (5)'
6 'Other (6)'.
EXECUTE.

**STEP 11 (DELETE IF NOT NEEDED): LABELING MISSING VALUES AS MISSING.-WAITING ON RUNNING THIS STEP.
**Recoding all negative numbers as missing. If no missing values, delete this syntax.
MISSING VALUES FQ0ODEMO01C TO FQ0ODEMO02 FQ0ODEMO03A FQ0ODEMO03B FQ0ODEMO05A TO FQ0ODEMO05H1
    FQ0ODEMO06A TO FQ0ODEMO06O FQ0ODEMO06A1 TO FQ0ODEMO07A6 FQ0ODEMO06B1 TO FQ0ODEMO02A FQ0ODEMO02C
    FQ0ODEMO02E FQ0ODEMO09A TO FQ0ODEMO10F FQ0ODEMO02F FQ0ODEMO02G FQ0ODEMO11 FQ0ODEMO13 TO FQ0ODEMO14
    FQ0ODEMO21C TO FQ0ODEMO23
    (LO THRU -1).
EXECUTE.

*STEP 12: SAVE CLEANED DATA FILE.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ0ODEMO2_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.

*STEP 13: CHECK FREQUENCIES.-WAITING ON RUNNING THIS STEP.
*Checking frequencies of all items before creating constructs.
FREQUENCIES VARIABLES=FQ0ODEMO01C TO FQ0ODEMO02 FQ0ODEMO03A FQ0ODEMO03B FQ0ODEMO05A TO FQ0ODEMO05H1
    FQ0ODEMO06A TO FQ0ODEMO06O FQ0ODEMO06A1 TO FQ0ODEMO07A6 FQ0ODEMO06B1 TO FQ0ODEMO02A FQ0ODEMO02C
    FQ0ODEMO02E FQ0ODEMO09A TO FQ0ODEMO10F FQ0ODEMO02F FQ0ODEMO02G FQ0ODEMO11 FQ0ODEMO13 TO FQ0ODEMO14
    FQ0ODEMO21C TO FQ0ODEMO23  
  /ORDER=ANALYSIS.

*STEP 14: CHECK DESCRIPTIVES.-WAITING ON RUNNING THIS STEP.
*Checking descriptives for all items before creating constructs.
DESCRIPTIVES VARIABLES=FQ0ODEMO01C TO FQ0ODEMO02 FQ0ODEMO03A FQ0ODEMO03B FQ0ODEMO05A TO FQ0ODEMO05H1
    FQ0ODEMO06A TO FQ0ODEMO06O FQ0ODEMO06A1 TO FQ0ODEMO07A6 FQ0ODEMO06B1 TO FQ0ODEMO02A FQ0ODEMO02C
    FQ0ODEMO02E FQ0ODEMO09A TO FQ0ODEMO10F FQ0ODEMO02F FQ0ODEMO02G FQ0ODEMO11 FQ0ODEMO13 TO FQ0ODEMO14
    FQ0ODEMO21C TO FQ0ODEMO23 
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 15: SAVE CLEANED DATA FILE.
*Sorting the data file by ID and resaving the final file.
*To reorder items, use /KEEP {list all variables in order} -- insert in line after file name.
SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ0ODEMO2_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.

*STEP 16: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE
 OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ0ODEMO2_Cleaned.spv'
 LOCK=NO.



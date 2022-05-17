* Encoding: UTF-8.
*STEP 0: NOTES
*CHILD AND ADOLESCENT TRAUMA SCREEN (CATS) – CAREGIVER REPORT (AGES 3-6).

*05-15-22(BM): Adapted Syntax.
*05-16-22(BM) Fixed recoding
*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------.
*STEP 1: OPENING RAW DATA.
*Insert the correct file path and file name. Use syntax to open raw data file.
GET
  FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\Raw\DBT Moms R01 Study Mother Final Interview Survey_May 15, 2022_11.59.sav'.

*STEP 2: SAVING QUESTIONNAIRE SPECIFIC RAW DATA. 
*Insert the correct file path and file name. Save this file with only those variables that you need, in the following order; ID, Start Date, Questionnaire Items (i.e., DERS_1 to DERS_36).
SAVE OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ4AOCATS_Cleaned.sav'
  /KEEP
  ID
  STARTDATE
  FQ4AOCATS01 TO FQ4AOCATS15
  FQ4AOCATS15A TO FQ4AOCATS18_5
   /COMPRESSED.
  EXECUTE.

*STEP 3: OPEN NEW DATA FILE.  
*Insert the correct file path and file name. Open the file you just created and saved so that you are able to clean the data.
GET
  FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ4AOCATS_Cleaned.sav'.

*STEP 4: TRANSFORM VARIABLES AND SORT IDS ASCENDING ORDER.
*Transforming ID from a string to a numeric variable, change the date format of startdate, and sort IDs in ascending order.
ALTER TYPE ID (F10.0).
EXECUTE.
FORMATS STARTDATE (adate10).
EXECUTE.
SORT CASES BY ID(A).
EXECUTE.

*STEP 5: RENAME ‘RAW DATA’ VARIABLES TO ‘CLEANED’ VARIABLES NAMES. 
*Rename all variables so they reflect our naming scheme. ID should always be labeled as 'ID'. Item should be numbers 01-36 or 001-106. 
RENAME VARIABLE 
(StartDate=FQ4AOCATSDATE)
(FQ4AOCATS17_1 = FQ4AOCATS17A) (FQ4AOCATS17_2 = FQ4AOCATS17B)
(FQ4AOCATS17_3 = FQ4AOCATS17C) (FQ4AOCATS17_4 = FQ4AOCATS17D) 
(FQ4AOCATS17_5 = FQ4AOCATS17E) (FQ4AOCATS17_6 = FQ4AOCATS17F)
(FQ4AOCATS17_7 = FQ4AOCATS17G) (FQ4AOCATS17_8 = FQ4AOCATS17H) 
(FQ4AOCATS17_9 = FQ4AOCATS17I) (FQ4AOCATS17_10 = FQ4AOCATS17J) 
(FQ4AOCATS17_11 = FQ4AOCATS17K) (FQ4AOCATS17_12 = FQ4AOCATS17L) 
(FQ4AOCATS17_13 = FQ4AOCATS17M) (FQ4AOCATS17_14 = FQ4AOCATS17N) 
(FQ4AOCATS17_15 = FQ4AOCATS17O) (FQ4AOCATS17_16 = FQ4AOCATS17P)
(FQ4AOCATS18_1 = FQ4AOCATS18A) (FQ4AOCATS18_2 = FQ4AOCATS18B)
(FQ4AOCATS18_3 = FQ4AOCATS18C) (FQ4AOCATS18_4 = FQ4AOCATS18D)
(FQ4AOCATS18_5 = FQ4AOCATS18E).     
EXECUTE.

*Remember to save your data file.
SAVE OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ4AOCATS_Cleaned.sav'.
EXECUTE.

*STEP 5A: MERGING FINAL ID FILE WITH CURRENT DATA FILE.
*This will ensure that all files have the correct # of enrolled and eligible IDs (Pitt=90; UO=88). Any missingness should be investigated (should they be missing?) and
labeled in STEP XX using information from the status (STAT) variable. If the status variable does not 'tell the whole story' (i.e., visit occurred but data is missing),
missingness should be labeled by ID using syntax and notes in the syntax should provide information to justify the missing code.
*When using the syntax include which variables you want to DROP from the Assessment Summary file -- THE FULL LIST OF VARIABLES IS BELOW -- 
You should retain the real date (RD) and status (STAT) for the wave you are using (example below is A1; FD1ORD FD1OSTAT are REMOVED so that they are NOT dropped from the file):
FD0OSTAT FD0ORD
FD1OSTAT FD1OTD FD1ORD FD1ODIFF
FD2OSTAT FD2OTD FD2ORD FD2ODIFF
FD3OSTAT FD3OTD FD3ORD FD3ODIFF
FD4OSTAT FD4OTD FD4ORD FD4ODIFF
FD4AOSTAT FD4AOTD FD4AORD FD4AODIFF.
MATCH FILES
/FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FD0OACS_Constructs.sav'
/IN=f
/FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ4AOCATS_Cleaned.sav'
/BY ID
/DROP=
FD0OSTAT FD0ORD
FD1OSTAT FD1OTD FD1ORD FD1ODIFF
FD2OSTAT FD2OTD FD2ORD FD2ODIFF
FD3OSTAT FD3OTD FD3ORD FD3ODIFF
FD4OSTAT FD4OTD FD4ORD FD4ODIFF
FD4AOTD FD4AODIFF.
SELECT IF f=1.
EXECUTE.
*Comparing REDCap and Qualtrics dates of completion. Be sure to update the date variables used to reflect the accurate RD and questionnaire date.
COMPUTE DATEDIFF = DATEDIFF(FD4AORD,FQ4AOCATSDATE,'days').
EXECUTE.
COUNT DATEDIFF0=DATEDIFF(Lowest thru -1) DATEDIFF(1 thru Highest).
EXECUTE.
FREQUENCIES VARIABLES=DATEDIFF0
  /ORDER=ANALYSIS.
SORT CASES BY DATEDIFF0(D).
*CHECK ALL IDS WITH DISCREPANT DATES TO DETERMINE WHAT IS CORRECT. CONSULT BEFORE MAKING ANY CHANGES TO RAW DATA IN REDCAP OR QUALTRICS.
*INCLUDE NOTES HERE FOR EACH ID THAT WAS DISCREPANT (EXAMPLE BELOW - ADAPT AS NEEDED)
*NOT NEEDED.
SORT CASES BY ID(A).
*DROPPING VARIABLES THAT ARE NO LONGER RELEVANT TO FINAL DATA FILE.
SAVE OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ4AOCATS_Cleaned.sav'
/DROP
FQ4AOCATSDATE
DATEDIFF
DATEDIFF0
f.
EXECUTE.
GET
  FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ4AOCATS_Cleaned.sav'.
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
**-43 'Question skipped (participant refused question(s))'            /* (participant refused question: e.g., prefer not to answer or refused to answer)*/
**-41 'Instrument not part of the protocol'                                      /* (instrument added later, not in this version) */
**-33 'Staff Error'                                                                         /* (question incorrectly skipped by staff, PANAS/EMA not administered, etc.) */
**-22 'Not applicable (Staff/Clinician)'                                            /* (KSADS, behavior codes) */
**-21 'Not applicable (Participant)'                                                /* (Questionnaires - participant decided) */
**-17 'Unable to contact teacher'                                                    /* (Staff unable to contact teacher for TRF) */
**-16 'Participant search exhausted'                                              /* (Participant search exhausted - PI decision */    
**-14 'Participant repeated cancellations/delays'                            /* (Participant repeated cancellations/delays */
**-12 'Participant refused follow-up'                                             /* (Participant refused follow-up) */     
**-11 'Participant (child) deceased'                                                /* (Participant (child) deceased) */
**-10 'Prefer not to answer'                                                           /* (Participant selected prefer not to answer, participant selected I don't know) */.
DO IF(FQ4AOCATS01 = 0).
   RECODE 
    FQ4AOCATS01A
   (SYSMIS=-43).
END IF.
EXECUTE.  

DO IF(FQ4AOCATS02 = 0).
   RECODE 
    FQ4AOCATS02A
   (SYSMIS=-43).
END IF.
EXECUTE.  

DO IF(FQ4AOCATS03 = 0).
   RECODE 
    FQ4AOCATS03A
   (SYSMIS=-43).
END IF.
EXECUTE.  

DO IF(FQ4AOCATS04 = 0).
   RECODE 
    FQ4AOCATS04A
   (SYSMIS=-43).
END IF.
EXECUTE.  

DO IF(FQ4AOCATS05 = 0).
   RECODE 
    FQ4AOCATS05A
   (SYSMIS=-43).
END IF.
EXECUTE.  

DO IF(FQ4AOCATS06 = 0).
   RECODE 
    FQ4AOCATS06A
   (SYSMIS=-43).
END IF.

EXECUTE.  
DO IF(FQ4AOCATS07 = 0).
   RECODE 
    FQ4AOCATS07A
   (SYSMIS=-43).
END IF.
EXECUTE.  

DO IF(FQ4AOCATS08 = 0).
   RECODE 
    FQ4AOCATS08A
   (SYSMIS=-43).
END IF.
EXECUTE.  

DO IF(FQ4AOCATS09 = 0).
   RECODE 
    FQ4AOCATS09A
   (SYSMIS=-43).
END IF.
EXECUTE.  

DO IF(FQ4AOCATS10 = 0).
   RECODE 
    FQ4AOCATS10A
   (SYSMIS=-43).
END IF.
EXECUTE.  

DO IF(FQ4AOCATS11 = 0).
   RECODE 
    FQ4AOCATS11A
   (SYSMIS=-43).
END IF.
EXECUTE.  

DO IF(FQ4AOCATS12 = 0).
   RECODE 
    FQ4AOCATS12A
   (SYSMIS=-43).
END IF.
EXECUTE.  

DO IF(FQ4AOCATS13 = 0).
   RECODE 
    FQ4AOCATS13A
   (SYSMIS=-43).
END IF.
EXECUTE.  

DO IF(FQ4AOCATS14 = 0).
   RECODE 
    FQ4AOCATS14A
   (SYSMIS=-43).
END IF.
EXECUTE.  

DO IF(FQ4AOCATS15 = 0).
   RECODE 
    FQ4AOCATS15A
   (SYSMIS=-43).
END IF.
EXECUTE.  

DO IF(
ID = 91069).
   RECODE 
    FQ4AOCATS01 TO FQ4AOCATS18E
   (SYSMIS=-33).
END IF.
EXECUTE.

RECODE FQ4AOCATS01 TO FQ4AOCATS18E
    (SYSMIS=-44).

**STEP 7 (DELETE IF NOT NEEDED): CREATING NEW VARIABLES FOR REVERSED SCORED ITEMS.
**Reverse-Scored Items; see scoring document to determine if there are reverse-scored items. If no reverse-scored items, delete this syntax.
**CHECKED AND NOT NEEDED.

*STEP 7A: RECODING SYSMIS (PARTICIPANTS THAT MISSED THE ASSESSMENT).
*This will use the STAT variable to recode all SYSMIS data. CHANGE THE STAT VARIABLE TO MATCH THE ASSESSMENT WAVE YOU ARE WORKING IN.
*Include full list of numeric variables (including new reverse-scored items).
DO IF MISSING(FD4AOSTAT).
DO REPEAT x = FQ4AOCATS01 TO FQ4AOCATS18E.
RECODE FD4AOSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.

*STEP 8: STANDARDIZING DECIMAL PLACES (CANNOT INCLUDE TEXT/STRING VARIABLES).
*Making all variables have the same number of decimal places. Ensure that variables include all new reverse-scored variables. Change the number AFTER the decimal place as needed.
FORMATS FQ4AOCATS01 TO FQ4AOCATS18E (F8.0).
EXECUTE.

*STEP 9: CREATING VARIABLE LABLES.
*Label all variables. Use the original questionnaire to include the exact text that participants saw. Include the questionnaire name and number at the end of the label.
VARIABLE LABELS  
ID 'Participant ID'
FQ4AOCATS01 'Serious natural disaster like a flood, tornado, hurricane, earthquake, or fire. [FQ4AOCATS01]'
FQ4AOCATS02 'Serious accident or injury like a car/bike crash, dog bite, sports injury. [FQ4AOCATS02]'
FQ4AOCATS03 'Robbed by threat, force, or weapon. [FQ4AOCATS03]'
FQ4AOCATS04 'Slapped, punched, or beat up in the family. [FQ4AOCATS04]'
FQ4AOCATS05 'Slapped, punched, or beat up by someone not in the family. [FQ4AOCATS05]'
FQ4AOCATS06 'Seeing someone in the family get slapped, punched or beat up. [FQ4AOCATS06]'
FQ4AOCATS07 'Seeing someone in the community get slapped, punched, or beat up. [FQ4AOCATS07]'
FQ4AOCATS08 'Someone older touching his/her private parts when they shouldnt. [FQ4AOCATS08]'
FQ4AOCATS09 'Someone forcing or pressuring sex, or when s/he couldnt say no. [FQ4AOCATS09]'
FQ4AOCATS10 'Someone close to the child dying suddenly or violently. [FQ4AOCATS10]'
FQ4AOCATS11 'Attacked, stabbed, shot at, hurt badly or killed. [FQ4AOCATS11]'
FQ4AOCATS12 'Seeing someone attacked, stabbed, shot at, hurt badly or killed. [FQ4AOCATS12]'
FQ4AOCATS13 'Stressful or scary medical procedure. [FQ4AOCATS13]'
FQ4AOCATS14 'Being around war. [FQ4AOCATS14]'
FQ4AOCATS15 'Other stressful or scary event? (describe) [FQ4AOCATS15]'
FQ4AOCATS01A 'Has a serious natural disaster like a flood, tornado, hurricane, earthquake, or fire happened in the past year? [FQ4AOCATS01A]'
FQ4AOCATS02A 'Has a serious accident or injury like a car/bike crash, dog bite, sports injury happened in the past year? [FQ4AOCATS02A]'
FQ4AOCATS03A 'Have you been robbed by threat, force, or weapon in the past year? [FQ4AOCATS03A]'
FQ4AOCATS04A 'Have you been slapped, punched, or beat up in the family in the past year? [FQ4AOCATS04A]'
FQ4AOCATS05A 'Have you been slapped, punched, or beat up by someone not in the family in the past year? [FQ4AOCATS05A]'
FQ4AOCATS06A 'Have you seen someone in the family get slapped, punched or beat up in the past year? [FQ4AOCATS06A]'
FQ4AOCATS07A 'Have you seen someone in the community get slapped, punched, or beat up in the past year? [FQ4AOCATS07A]'
FQ4AOCATS08A 'Has someone older touching his/her private parts when they shouldnt in the past year? [FQ4AOCATS08A]'
FQ4AOCATS09A 'Has someone forcing or pressuring sex, or when s/he couldnt say no in the past year? [FQ4AOCATS09A]'
FQ4AOCATS10A 'Has someone close to the child dying suddenly or violently in the past year? [FQ4AOCATS10A]'
FQ4AOCATS11A 'Have you been attacked, stabbed, shot at, hurt badly or killed in the past year? [FQ4AOCATS11A]'
FQ4AOCATS12A 'Have you seen someone attacked, stabbed, shot at, hurt badly or killed in the past year? [FQ4AOCATS12A]'
FQ4AOCATS13A 'Has a Stressful or scary medical procedure happened in the past year? [FQ4AOCATS13A]'
FQ4AOCATS14A 'Have you been around war in the past year? [FQ4AOCATS14A]'
FQ4AOCATS15A 'Have other stressful or scary events happened in the past year? (describe) [FQ4AOCATS15A]'
FQ4AOCATS16 'Which event that the child experienced is bothering him/her most now? [FQ4AOCATS16]'
FQ4AOCATS17A 'How often the following things have bothered the child in the last two weeks: Upsetting thoughts or images about a stressful event. Or re-enacting a stressful event in play. [FQ4AOCATS17A]'
FQ4AOCATS17B 'How often the following things have bothered the child in the last two weeks: Bad dreams related to a stressful event. [FQ4AOCATS17B]'
FQ4AOCATS17C 'How often the following things have bothered the child in the last two weeks:  Acting, playing or feeling as if a stressful event is happening right now. [FQ4AOCATS17C]'
FQ4AOCATS17D 'How often the following things have bothered the child in the last two weeks: Feeling very emotionally upset when reminded of a stressful event. [FQ4AOCATS17D]'
FQ4AOCATS17E 'How often the following things have bothered the child in the last two weeks: Strong physical reactions when reminded of a stressful event (sweating, heart beating fast).  [FQ4AOCATS17E]'
FQ4AOCATS17F 'How often the following things have bothered the child in the last two weeks:  Trying not to remember, talk about or have feelings about a stressful event. [FQ4AOCATS17F]'
FQ4AOCATS17G 'How often the following things have bothered the child in the last two weeks: Avoiding activities, people, places or things that are reminders of a stressful event. [FQ4AOCATS17G]'
FQ4AOCATS17H 'How often the following things have bothered the child in the last two weeks: Increase in negative emotional states (afraid, angry, guilty, ashamed, confusion). [FQ4AOCATS17H]'
FQ4AOCATS17I 'How often the following things have bothered the child in the last two weeks: Losing interest in activities s/he enjoyed before a stressful event. Including not playing as much. [FQ4AOCATS17I]'
FQ4AOCATS17J 'How often the following things have bothered the child in the last two weeks: Acting socially withdrawn. [FQ4AOCATS17J]'
FQ4AOCATS17K 'How often the following things have bothered the child in the last two weeks: Reduction in showing positive feelings (being happy, having loving feelings). [FQ4AOCATS17K]'
FQ4AOCATS17L 'How often the following things have bothered the child in the last two weeks: Being irritable. Or having angry outbursts without a good reason and taking it out on other people or things. [FQ4AOCATS17L]'
FQ4AOCATS17M 'How often the following things have bothered the child in the last two weeks: Being overly alert or on guard. [FQ4AOCATS17M]'
FQ4AOCATS17N 'How often the following things have bothered the child in the last two weeks: Being jumpy or easily startled. [FQ4AOCATS17N]'
FQ4AOCATS17O 'How often the following things have bothered the child in the last two weeks: Problems with concentration. [FQ4AOCATS17O]'
FQ4AOCATS17P 'How often the following things have bothered the child in the last two weeks: Trouble falling or staying asleep. [FQ4AOCATS17P]'
FQ4AOCATS18A 'Mark yes or no if the problems you marked interfered with: Getting along with others [FQ4AOCATS18A]'
FQ4AOCATS18B 'Mark yes or no if the problems you marked interfered with: Hobbies/Fun  [FQ4AOCATS18B]'
FQ4AOCATS18C 'Mark yes or no if the problems you marked interfered with: School or daycare  [FQ4AOCATS18C]'
FQ4AOCATS18D 'Mark yes or no if the problems you marked interfered with: Family relationships  [FQ4AOCATS18D]'
FQ4AOCATS18E 'Mark yes or no if the problems you marked interfered with: General happiness  [FQ4AOCATS18E]'.
EXECUTE.

*STEP 10: ADD VALUE LABELS.
*Include missing values like 'Prefer not to Answer' (or something similar) if applicable.
*Include ALL missing value labels (SEE ABOVE FOR FULL LIST).
VALUE LABELS
FQ4AOCATS01 TO FQ4AOCATS15A 
FQ4AOCATS18A TO FQ4AOCATS18E
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
-11 'Participant (child) deceased (-11)'                                                
-10 'Prefer not to answer (-10)'
0 'No'
1 'Yes'.  
EXECUTE.

VALUE LABELS
FQ4AOCATS16
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
-11 'Participant (child) deceased (-11)'                                                
-10 'Prefer not to answer (-10)'
1 'Serious natural disaster like a flood, tornado, hurricane, earthquake, or fire.(1)'
2 'Serious accident or injury like a car/bike crash, dog bite, sports injury. (2)' 
3 'Robbed by threat, force or weapon. (3)' 
4 'Slapped, punched, or beat up in the family. (4)'
5 'Slapped, punched, or beat up by someone not in the family.(5)'
6 'Seeing someone in the family get slapped, punched or beat up. (6)'
7 'Seeing someone in the community get slapped, punched or beat up. (7)'
8 'Someone older touching his/her private parts when they shouldnt. (8)'
9 'Someone forcing or pressuring sex, or when s /he couldn’t say no. (9)'
10 'Someone close to the child dying suddenly or violently. (10) '
11 'Attacked, stabbed, shot at or hurt badly. (11) '
12 'Seeing someone attacked, stabbed, shot at, hurt badly or killed. (12) '
13 'Stressful or scary medical procedure. (13)'
14 'Being around war. (14)'
15 'Other stressful or scary event. (15)'.
EXECUTE.

VALUE LABELS
FQ4AOCATS17A FQ4AOCATS17B FQ4AOCATS17C FQ4AOCATS17D FQ4AOCATS17E FQ4AOCATS17F FQ4AOCATS17G FQ4AOCATS17H FQ4AOCATS17I FQ4AOCATS17J FQ4AOCATS17K 
FQ4AOCATS17L FQ4AOCATS17M FQ4AOCATS17N FQ4AOCATS17O FQ4AOCATS17P
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
-11 'Participant (child) deceased (-11)'                                                
-10 'Prefer not to answer (-10)'
0 'Never (0)'
1 'Once in a while (1)'
2 'Half the Time (2)'
3 'Almost Always (3)'.  
EXECUTE.


*STEP 11: LABELING MISSING VALUES AS MISSING.
*Recoding all negative numbers as missing.
MISSING VALUES 
FQ4AOCATS01 TO FQ4AOCATS18E    
    (LO THRU -1).
EXECUTE.

*STEP 12: SAVE CLEANED DATA FILE.
SAVE OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ4AOCATS_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.

*STEP 13: CHECK FREQUENCIES.
*Checking frequencies of all items before creating constructs.
*Include STAT variable here to be sure all missingness was coded correctly.
FREQUENCIES VARIABLES=FD4AOSTAT FQ4AOCATS01 TO FQ4AOCATS18E
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=
FQ4AOCATS01 TO FQ4AOCATS18E
  /ORDER=ANALYSIS.

*STEP 14: CHECK DESCRIPTIVES.-THIS STEP IS MISSING THE VARIABLE FQ4PCATS15A SINCE IT IS A STRING VARIABLE-.
*Checking descriptives for all items before creating constructs.
DESCRIPTIVES VARIABLES=FQ4AOCATS01 TO FQ4AOCATS18E
  /STATISTICS=MEAN STDDEV MIN MAX.

DESCRIPTIVES VARIABLES=
FQ4AOCATS01 TO FQ4AOCATS18E
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 15: SAVE CLEANED DATA FILE.
*Sorting the data file by ID and resaving the final file.
*To reorder items, use /KEEP {list all variales in order} -- insert in line after file name.
SORT CASES BY ID(A).
SAVE OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ4AOCATS_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.
GET
  FILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ4AOCATS_Cleaned.sav'.
EXECUTE.

*STEP 16: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE
 OUTFILE='C:\Users\bryan\Desktop\Professional\Work\START\SPSS\FQ4AOCATS_Cleaned.spv'
 LOCK=NO.


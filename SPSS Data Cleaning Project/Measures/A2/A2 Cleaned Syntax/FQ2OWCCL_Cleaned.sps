* Encoding: UTF-8.
*STEP 0: NOTES
*DBT-Ways of Coping Checklist (DBT-WCCL).
 
*10-01-21(BM): Adapted STEPS 1-16 from A1 Syntax.
*10-05-21 (BM): Ran syntax on real data checked for problems.
*12-07-21(AZ): Edited T2 syntax for changes (Steps 5, 5A, 7A, 10, 13, 15) and ran syntax.
*1-13-22(BM): Checked and Edited comment in STEP 5A.
*1-20-22(AAC): CHECKED. Updated STEP 6, STEP 10, STEP 11, and STEP 13 notes to match syntax template. 
*1-27-22(BM): Double checked for Alexis to review.
*2-5-22(AAC): CHECKED.

*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------.
*STEP 1: OPENING RAW DATA.
*Insert the correct file path and file name. Use syntax to open raw data file.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/DBT Moms R01 Study Time 2 Mother Survey_December 3, 2021_13.49.sav'.

*STEP 2: SAVING QUESTIONNAIRE SPECIFIC RAW DATA. 
*Insert the correct file path and file name. Save this file with only those variables that you need, in the following order; ID, Start Date, Questionnaire Items (i.e., DERS_1 to DERS_36).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OWCCL_Cleaned.sav'
  /KEEP 
  FQ2ID 
  STARTDATE
  FQ2WCCL_1 TO FQ2WCCL_59
  /COMPRESSED.
  EXECUTE.

*STEP 3: OPEN NEW DATA FILE.  
*Insert the correct file path and file name. Open the file you just created and saved so that you are able to clean the data.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OWCCL_Cleaned.sav'.

*STEP 4: TRANSFORM VARIABLES AND SORT IDS ASCENDING ORDER.
*Transforming ID from a string to a numeric variable, change the date format of startdate, and sort IDs in ascending order.
ALTER TYPE FQ2ID (F10.0).
EXECUTE.
FORMATS STARTDATE (adate10).
EXECUTE.
SORT CASES BY FQ2ID(A).
EXECUTE.

*STEP 5: RENAME ‘RAW DATA’ VARIABLES TO ‘CLEANED’ VARIABLES NAMES. 
*Rename all variables so they reflect our naming scheme. ID should always be labeled as 'ID'. Item should be numbers 01-36 or 001-106. 
RENAME VARIABLE (FQ2ID=ID).
EXECUTE.
RENAME VARIABLE (STARTDATE=FQ2OWCCLDATE).
EXECUTE.
RENAME VARIABLE (FQ2WCCL_1 = FQ2OWCCL01) (FQ2WCCL_2 = FQ2OWCCL02) (FQ2WCCL_3 = FQ2OWCCL03) (FQ2WCCL_4 = FQ2OWCCL04)
 (FQ2WCCL_5 = FQ2OWCCL05) (FQ2WCCL_6 = FQ2OWCCL06) (FQ2WCCL_7 = FQ2OWCCL07) (FQ2WCCL_8 = FQ2OWCCL08) (FQ2WCCL_9 = FQ2OWCCL09)
 (FQ2WCCL_10 = FQ2OWCCL10) (FQ2WCCL_11 = FQ2OWCCL11) (FQ2WCCL_12 = FQ2OWCCL12) (FQ2WCCL_13 = FQ2OWCCL13) (FQ2WCCL_14 = FQ2OWCCL14)
 (FQ2WCCL_15 = FQ2OWCCL15) (FQ2WCCL_16 = FQ2OWCCL16) (FQ2WCCL_17 = FQ2OWCCL17) (FQ2WCCL_18 = FQ2OWCCL18) (FQ2WCCL_19 = FQ2OWCCL19)
 (FQ2WCCL_20 = FQ2OWCCL20) (FQ2WCCL_21 = FQ2OWCCL21) (FQ2WCCL_22 = FQ2OWCCL22) (FQ2WCCL_23 = FQ2OWCCL23) (FQ2WCCL_24 = FQ2OWCCL24)
 (FQ2WCCL_25 = FQ2OWCCL25) (FQ2WCCL_26 = FQ2OWCCL26) (FQ2WCCL_27 = FQ2OWCCL27) (FQ2WCCL_28 = FQ2OWCCL28) (FQ2WCCL_29 = FQ2OWCCL29) 
 (FQ2WCCL_30 = FQ2OWCCL30) (FQ2WCCL_31 = FQ2OWCCL31) (FQ2WCCL_32 = FQ2OWCCL32) (FQ2WCCL_33 = FQ2OWCCL33) (FQ2WCCL_34 = FQ2OWCCL34)
 (FQ2WCCL_35 = FQ2OWCCL35) (FQ2WCCL_36 = FQ2OWCCL36) (FQ2WCCL_37 = FQ2OWCCL37) (FQ2WCCL_38 = FQ2OWCCL38) (FQ2WCCL_39 = FQ2OWCCL39)
 (FQ2WCCL_40 = FQ2OWCCL40) (FQ2WCCL_41 = FQ2OWCCL41) (FQ2WCCL_42 = FQ2OWCCL42) (FQ2WCCL_43 = FQ2OWCCL43) (FQ2WCCL_44 = FQ2OWCCL44)
 (FQ2WCCL_45 = FQ2OWCCL45) (FQ2WCCL_46 = FQ2OWCCL46) (FQ2WCCL_47 = FQ2OWCCL47) (FQ2WCCL_48 = FQ2OWCCL48) (FQ2WCCL_49 = FQ2OWCCL49)
 (FQ2WCCL_50 = FQ2OWCCL50) (FQ2WCCL_51 = FQ2OWCCL51) (FQ2WCCL_52 = FQ2OWCCL52) (FQ2WCCL_53 = FQ2OWCCL53) (FQ2WCCL_54 = FQ2OWCCL54)
 (FQ2WCCL_55 = FQ2OWCCL55) (FQ2WCCL_56 = FQ2OWCCL56) (FQ2WCCL_57 = FQ2OWCCL57) (FQ2WCCL_58 = FQ2OWCCL58) (FQ2WCCL_59 = FQ2OWCCL59).
EXECUTE.
*Remember to save your data file.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OWCCL_Cleaned.sav'.
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
/FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FD0OACS_Cleaned.sav'
/IN=f
/FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OWCCL_Cleaned.sav'
/BY ID
/DROP=
FD0OSTAT FD0ORD
FD1OSTAT FD1OTD FD1ORD FD1ODIFF
FD2OTD FD2ODIFF
FD3OSTAT FD3OTD FD3ORD FD3ODIFF
FD4OSTAT FD4OTD FD4ORD FD4ODIFF
FD4AOSTAT FD4AOTD FD4AORD FD4AODIFF.
SELECT IF f=1.
EXECUTE.
*Comparing REDCap and Qualtrics dates of completion. Be sure to update the date variables used to reflect the accurate RD and questionnaire date.
COMPUTE DATEDIFF = DATEDIFF(FD2ORD,FQ2OWCCLDATE,'days').
EXECUTE.
COUNT DATEDIFF0=DATEDIFF(Lowest thru -1) DATEDIFF(1 thru Highest).
EXECUTE.
FREQUENCIES VARIABLES=DATEDIFF0
  /ORDER=ANALYSIS.
SORT CASES BY DATEDIFF0(D).
*CHECK ALL IDS WITH DISCREPANT DATES TO DETERMINE WHAT IS CORRECT. CONSULT BEFORE MAKING ANY CHANGES TO RAW DATA IN REDCAP OR QUALTRICS.
*INCLUDE NOTES HERE FOR EACH ID THAT WAS DISCREPANT (EXAMPLE BELOW - ADAPT AS NEEDED)
*THE FOLLOWING IDs (90996, 91133, 91292) HAVE A A2 QUALTRICS DATE [FQ2OXXXDATE] THAT DOES NOT MATCH THEIR A2 VISIT DATE [FD2ORD]. 
*THIS WAS INVESTIGATED BY STAFF (BM: 1-13-22) AND VISIT DATE [FD2ORD] WAS CONFIRMED USING MULTIPLE SOURCES.
SORT CASES BY ID(A).
*DROPPING VARIABLES THAT ARE NO LONGER RELEVANT TO FINAL DATA FILE.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OWCCL_Cleaned.sav'
/DROP
FQ2OWCCLDATE
DATEDIFF
DATEDIFF0
f.
EXECUTE.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OWCCL_Cleaned.sav'.
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
**-12 'Pariticipant refused follow-up'                                             /* (Participant refused follow-up) */     
**-11 'Participant (child) deceased'                                                /* (Participant (child) deceased) */
**-10 'Prefer not to answer'                                                           /* (Participant selected prefer not to answer) */.
**CHECKED AND NOT NEEDED
    
**STEP 7 (DELETE IF NOT NEEDED): CREATING NEW VARIABLES FOR REVERSED SCORED ITEMS.
**Reverse-Scored Items; see scoring document to determine if there are reverse-scored items. If no reverse-scored items, delete this syntax.
**CHECKED AND NOT NEEDED

*STEP 7A: RECODING SYSMIS (PARTICIPANTS THAT MISSED THE ASSESSMENT).
*This will use the STAT variable to recode all SYSMIS data. CHANGE THE STAT VARIABLE TO MATCH THE ASSESSMENT WAVE YOU ARE WORKING IN.
*Include full list of numeric variables (including new reverse-scored items).
DO IF MISSING(FD2OSTAT).
DO REPEAT x = FQ2OWCCL01 TO FQ2OWCCL59.
RECODE FD2OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.

*STEP 8: STANDARDIZING DECIMAL PLACES (CANNOT INCLUDE TEXT/STRING VARIABLES).
*Making all variables have the same number of decimal places. Ensure that variables include all new reverse-scored variables. Change the number AFTER the decimal place as needed.
FORMATS FQ2OWCCL01 to FQ2OWCCL59 (F8.0).
EXECUTE.

*STEP 9: CREATING VARIABLE LABLES.
*Label all variables. Use the original questionnaire to include the exact text that participants saw. Include the questionnaire name and number at the end of the label.
VARIABLE LABELS  ID 'Participant ID'.
EXECUTE.

VARIABLE LABELS 
FQ2OWCCL01 'Bargained or compromised to get something positive from the situation. [FQ2OWCCL01]'
FQ2OWCCL02 'Counted my blessings. [FQ2OWCCL02]'
FQ2OWCCL03 'Blamed myself. [FQ2OWCCL03]'
FQ2OWCCL04 'Concentrated on something good that could come out of the whole thing. [FQ2OWCCL04]'
FQ2OWCCL05 'Kept feelings to myself. [FQ2OWCCL05]'
FQ2OWCCL06 'Made sure Im responding in a way that doesnt alienate others. [FQ2OWCCL06]'
FQ2OWCCL07 'Figured out who to blame. [FQ2OWCCL07]'
FQ2OWCCL08 'Hoped a miracle would happen. [FQ2OWCCL08]'
FQ2OWCCL09 'Tried to get centered before taking any action. [FQ2OWCCL09]'
FQ2OWCCL10 'Talked to someone about how Im feeling. [FQ2OWCCL10]'
FQ2OWCCL11 'Stood my ground and fought for what Ive wanted. [FQ2OWCCL11]'
FQ2OWCCL12 'Refused to believe that it had happened. [FQ2OWCCL12]'
FQ2OWCCL13 'Treated myself to something really tasty. [FQ2OWCCL13]'
FQ2OWCCL14 'Criticized or lectured myself. [FQ2OWCCL14]'
FQ2OWCCL15 'Took it out on others. [FQ2OWCCL15]'
FQ2OWCCL16 'Came up with a couple of different solutions to my problem. [FQ2OWCCL16]'
FQ2OWCCL17 'Wished I were a stronger person--more optimistic and forceful. [FQ2OWCCL17]'
FQ2OWCCL18 'Accepted my strong feelings, but not let them interfere with other things too much. [FQ2OWCCL18]'
FQ2OWCCL19 'Focused on the good things in my life. [FQ2OWCCL19]'
FQ2OWCCL20 'Wished that I could change the way that I felt. [FQ2OWCCL20]'
FQ2OWCCL21 'Found something beautiful to look at to make me feel better. [FQ2OWCCL21]'
FQ2OWCCL22 'Changed something about myself so that I could deal with the situation better. [FQ2OWCCL22]'
FQ2OWCCL23 'Focused on the good aspects of my life and gave less attention to negative thoughts or feelings. [FQ2OWCCL23]'
FQ2OWCCL24 'Got mad at people or things that caused the problem. [FQ2OWCCL24]'
FQ2OWCCL25 'Felt bad that I couldnt avoid the problem. [FQ2OWCCL25]'
FQ2OWCCL26 'Tried to distract myself by getting active. [FQ2OWCCL26]'
FQ2OWCCL27 'Been aware of what has to be done, So Ive been doubling my efforts and trying harder to make things work. [FQ2OWCCL27]'
FQ2OWCCL28 'Thought that others were unfair to me. [FQ2OWCCL28]'
FQ2OWCCL29 'Soothed myself by surrounding myself with a nice fragrance of some kind. [FQ2OWCCL29]'
FQ2OWCCL30 'Blamed others. [FQ2OWCCL30]'
FQ2OWCCL31 'Listened to or played music that I found relaxing. [FQ2OWCCL31]'
FQ2OWCCL32 'Gone on as if nothing had happened. [FQ2OWCCL32]'
FQ2OWCCL33 'Accepted the next best thing to what I wanted. [FQ2OWCCL33]'
FQ2OWCCL34 'Told myself things could be worse. [FQ2OWCCL34]'
FQ2OWCCL35 'Occupied my mind with something else. [FQ2OWCCL35]'
FQ2OWCCL36 'Talked to someone who could do something concrete about the problem. [FQ2OWCCL36]'
FQ2OWCCL37 'Tried to make myself feel better by eating, drinking, smoking, taking medications, etc. [FQ2OWCCL37]'
FQ2OWCCL38 'Tried not to act too hastily or follow my own hunch. [FQ2OWCCL38]'
FQ2OWCCL39 'Changed something so things would turn out right. [FQ2OWCCL39]'
FQ2OWCCL40 'Pampered myself with something that felt good to the touch (e.g., a bubble bath or a hug). [FQ2OWCCL40]'
FQ2OWCCL41 'Avoided people. [FQ2OWCCL41]'
FQ2OWCCL42 'Thought how much better off I was than others. [FQ2OWCCL42]'
FQ2OWCCL43 'Just took things one step at a time. [FQ2OWCCL43]'
FQ2OWCCL44 'Did something to feel a totally different emotion (like gone to a funny movie). [FQ2OWCCL44]'
FQ2OWCCL45 'Wished the situation would go away or somehow be finished. [FQ2OWCCL45]'
FQ2OWCCL46 'Kept others from knowing how bad things were. [FQ2OWCCL46]'
FQ2OWCCL47 'Focused my energy on helping others. [FQ2OWCCL47]'
FQ2OWCCL48 'Found out what other person was responsible. [FQ2OWCCL48]'
FQ2OWCCL49 'Made sure to take care of my body and stay healthy so that I was less emotionally sensitive. [FQ2OWCCL49]'
FQ2OWCCL50 'Told myself how much I had already accomplished. [FQ2OWCCL50]'
FQ2OWCCL51 'Made sure I could respond in a way that I could still respect myself afterwards. [FQ2OWCCL51]'
FQ2OWCCL52 'Wished that I could change what had happened. [FQ2OWCCL52]'
FQ2OWCCL53 'Made a plan of action and followed it. [FQ2OWCCL53]'
FQ2OWCCL54 'Talked to someone to find out about the situation. [FQ2OWCCL54]'
FQ2OWCCL55 'Avoided my problem. [FQ2OWCCL55]'
FQ2OWCCL56 'Stepped back and tried to see things as they really are. [FQ2OWCCL56]'
FQ2OWCCL57 'Compared myself to others who are less fortunate. [FQ2OWCCL57]'
FQ2OWCCL58 'Increased the number of pleasant things in my life so that I had a more positive outlook. [FQ2OWCCL58]'
FQ2OWCCL59 'Tried not to burn my bridges behind me, but leave things open somewhat. [FQ2OWCCL59]'.
EXECUTE. 

*STEP 10: ADD VALUE LABELS.
*Include missing values like 'Prefer not to Answer' (or something similar) if applicable.
*Include ALL missing value labels (SEE ABOVE FOR FULL LIST).
VALUE LABELS
FQ2OWCCL01 FQ2OWCCL02 FQ2OWCCL03 FQ2OWCCL04 FQ2OWCCL05 FQ2OWCCL06 FQ2OWCCL07 FQ2OWCCL08 FQ2OWCCL09 FQ2OWCCL10
FQ2OWCCL11 FQ2OWCCL12 FQ2OWCCL13 FQ2OWCCL14 FQ2OWCCL15 FQ2OWCCL16 FQ2OWCCL17 FQ2OWCCL18 FQ2OWCCL19 FQ2OWCCL20
FQ2OWCCL21 FQ2OWCCL22 FQ2OWCCL23 FQ2OWCCL24 FQ2OWCCL25 FQ2OWCCL26 FQ2OWCCL27 FQ2OWCCL28 FQ2OWCCL29 FQ2OWCCL30
FQ2OWCCL31 FQ2OWCCL32 FQ2OWCCL33 FQ2OWCCL34 FQ2OWCCL35 FQ2OWCCL36 FQ2OWCCL37 FQ2OWCCL38 FQ2OWCCL39 FQ2OWCCL40
FQ2OWCCL41 FQ2OWCCL42 FQ2OWCCL43 FQ2OWCCL44 FQ2OWCCL45 FQ2OWCCL46 FQ2OWCCL47 FQ2OWCCL48 FQ2OWCCL49 FQ2OWCCL50
FQ2OWCCL51 FQ2OWCCL52 FQ2OWCCL53 FQ2OWCCL54 FQ2OWCCL55 FQ2OWCCL56 FQ2OWCCL57 FQ2OWCCL58 FQ2OWCCL59
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
-10 'Prefer not to answer (-10)' 
0 'Never Used (0)'
1 'Rarely Used (1)'
2 'Sometimes Used (2)'
3 'Regularly Used (3)'.  
EXECUTE.

*STEP 11: LABELING MISSING VALUES AS MISSING.
*Recoding all negative numbers as missing.
MISSING VALUES
FQ2OWCCL01 FQ2OWCCL02 FQ2OWCCL03 FQ2OWCCL04 FQ2OWCCL05 FQ2OWCCL06 FQ2OWCCL07 FQ2OWCCL08 FQ2OWCCL09 FQ2OWCCL10
FQ2OWCCL11 FQ2OWCCL12 FQ2OWCCL13 FQ2OWCCL14 FQ2OWCCL15 FQ2OWCCL16 FQ2OWCCL17 FQ2OWCCL18 FQ2OWCCL19 FQ2OWCCL20
FQ2OWCCL21 FQ2OWCCL22 FQ2OWCCL23 FQ2OWCCL24 FQ2OWCCL25 FQ2OWCCL26 FQ2OWCCL27 FQ2OWCCL28 FQ2OWCCL29 FQ2OWCCL30
FQ2OWCCL31 FQ2OWCCL32 FQ2OWCCL33 FQ2OWCCL34 FQ2OWCCL35 FQ2OWCCL36 FQ2OWCCL37 FQ2OWCCL38 FQ2OWCCL39 FQ2OWCCL40
FQ2OWCCL41 FQ2OWCCL42 FQ2OWCCL43 FQ2OWCCL44 FQ2OWCCL45 FQ2OWCCL46 FQ2OWCCL47 FQ2OWCCL48 FQ2OWCCL49 FQ2OWCCL50
FQ2OWCCL51 FQ2OWCCL52 FQ2OWCCL53 FQ2OWCCL54 FQ2OWCCL55 FQ2OWCCL56 FQ2OWCCL57 FQ2OWCCL58 FQ2OWCCL59
    (LO THRU -1).
EXECUTE.

*STEP 12: SAVE CLEANED DATA FILE.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OWCCL_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.

*STEP 13: CHECK FREQUENCIES.
*Checking frequencies of all items before creating constructs.
*Include STAT variable here to be sure all missingness was coded correctly.
FREQUENCIES VARIABLES=FD2OSTAT FQ2OWCCL01 FQ2OWCCL02 FQ2OWCCL03 FQ2OWCCL04 FQ2OWCCL05 FQ2OWCCL06 FQ2OWCCL07 FQ2OWCCL08 FQ2OWCCL09 FQ2OWCCL10
FQ2OWCCL11 FQ2OWCCL12 FQ2OWCCL13 FQ2OWCCL14 FQ2OWCCL15 FQ2OWCCL16 FQ2OWCCL17 FQ2OWCCL18 FQ2OWCCL19 FQ2OWCCL20
FQ2OWCCL21 FQ2OWCCL22 FQ2OWCCL23 FQ2OWCCL24 FQ2OWCCL25 FQ2OWCCL26 FQ2OWCCL27 FQ2OWCCL28 FQ2OWCCL29 FQ2OWCCL30
FQ2OWCCL31 FQ2OWCCL32 FQ2OWCCL33 FQ2OWCCL34 FQ2OWCCL35 FQ2OWCCL36 FQ2OWCCL37 FQ2OWCCL38 FQ2OWCCL39 FQ2OWCCL40
FQ2OWCCL41 FQ2OWCCL42 FQ2OWCCL43 FQ2OWCCL44 FQ2OWCCL45 FQ2OWCCL46 FQ2OWCCL47 FQ2OWCCL48 FQ2OWCCL49 FQ2OWCCL50
FQ2OWCCL51 FQ2OWCCL52 FQ2OWCCL53 FQ2OWCCL54 FQ2OWCCL55 FQ2OWCCL56 FQ2OWCCL57 FQ2OWCCL58 FQ2OWCCL59
  /ORDER=ANALYSIS.

*STEP 14: CHECK DESCRIPTIVES.
*Checking descriptives for all items before creating constructs.
DESCRIPTIVES VARIABLES=FQ2OWCCL01 FQ2OWCCL02 FQ2OWCCL03 FQ2OWCCL04 FQ2OWCCL05 FQ2OWCCL06 FQ2OWCCL07 FQ2OWCCL08 FQ2OWCCL09 FQ2OWCCL10
FQ2OWCCL11 FQ2OWCCL12 FQ2OWCCL13 FQ2OWCCL14 FQ2OWCCL15 FQ2OWCCL16 FQ2OWCCL17 FQ2OWCCL18 FQ2OWCCL19 FQ2OWCCL20
FQ2OWCCL21 FQ2OWCCL22 FQ2OWCCL23 FQ2OWCCL24 FQ2OWCCL25 FQ2OWCCL26 FQ2OWCCL27 FQ2OWCCL28 FQ2OWCCL29 FQ2OWCCL30
FQ2OWCCL31 FQ2OWCCL32 FQ2OWCCL33 FQ2OWCCL34 FQ2OWCCL35 FQ2OWCCL36 FQ2OWCCL37 FQ2OWCCL38 FQ2OWCCL39 FQ2OWCCL40
FQ2OWCCL41 FQ2OWCCL42 FQ2OWCCL43 FQ2OWCCL44 FQ2OWCCL45 FQ2OWCCL46 FQ2OWCCL47 FQ2OWCCL48 FQ2OWCCL49 FQ2OWCCL50
FQ2OWCCL51 FQ2OWCCL52 FQ2OWCCL53 FQ2OWCCL54 FQ2OWCCL55 FQ2OWCCL56 FQ2OWCCL57 FQ2OWCCL58 FQ2OWCCL59
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 15: SAVE CLEANED DATA FILE.
*Sorting the data file by ID and resaving the final file.
*To reorder items, use /KEEP {list all variales in order} -- insert in line after file name.
SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OWCCL_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OWCCL_Cleaned.sav'.
EXECUTE.

*STEP 16: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE
 OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OWCCL_Cleaned.spv'
 LOCK=NO.

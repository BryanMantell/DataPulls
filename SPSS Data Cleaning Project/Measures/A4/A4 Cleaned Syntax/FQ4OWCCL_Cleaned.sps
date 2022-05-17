* Encoding: UTF-8.
*STEP 0: NOTES
*DBT-Ways of Coping Checklist (DBT-WCCL).
 
*10-01-21(BM): Adapted STEPS 1-16 from A1 Syntax.
*04-13-2022 (BM):Adapted Syntax to Match Updated Template + Pass in Updated Data.
*04-15-22(AAC): Checked.
*04-18-2022(BM): Double Checked and Fixed Missing Codes.
*04-21-22(AAC): Checked.
*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------.
*STEP 1: OPENING RAW DATA.
*Insert the correct file path and file name. Use syntax to open raw data file.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/DBT Moms R01 Study Time 4 Mother Survey_April 18, 2022_16.19.sav'.

*STEP 2: SAVING QUESTIONNAIRE SPECIFIC RAW DATA. 
*Insert the correct file path and file name. Save this file with only those variables that you need, in the following order; ID, Start Date, Questionnaire Items (i.e., DERS_1 to DERS_36).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OWCCL_Cleaned.sav'
  /KEEP 
  FQ4ID 
  STARTDATE
  FQ4WCCL_1 TO FQ4WCCL_59
  /COMPRESSED.
  EXECUTE.

*STEP 3: OPEN NEW DATA FILE.  
*Insert the correct file path and file name. Open the file you just created and saved so that you are able to clean the data.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OWCCL_Cleaned.sav'.

*STEP 4: TRANSFORM VARIABLES AND SORT IDS ASCENDING ORDER.
*Transforming ID from a string to a numeric variable, change the date format of startdate, and sort IDs in ascending order.
ALTER TYPE FQ4ID (F10.0).
EXECUTE.
FORMATS STARTDATE (adate10).
EXECUTE.
SORT CASES BY FQ4ID(A).
EXECUTE.

*STEP 5: RENAME ‘RAW DATA’ VARIABLES TO ‘CLEANED’ VARIABLES NAMES. 
*Rename all variables so they reflect our naming scheme. ID should always be labeled as 'ID'. Item should be numbers 01-36 or 001-106. 
RENAME VARIABLE (FQ4ID=ID).
EXECUTE.
RENAME VARIABLE (STARTDATE=FQ4OWCCLDATE).
EXECUTE.
RENAME VARIABLE (FQ4WCCL_1 = FQ4OWCCL01) (FQ4WCCL_2 = FQ4OWCCL02) (FQ4WCCL_3 = FQ4OWCCL03) (FQ4WCCL_4 = FQ4OWCCL04)
 (FQ4WCCL_5 = FQ4OWCCL05) (FQ4WCCL_6 = FQ4OWCCL06) (FQ4WCCL_7 = FQ4OWCCL07) (FQ4WCCL_8 = FQ4OWCCL08) (FQ4WCCL_9 = FQ4OWCCL09)
 (FQ4WCCL_10 = FQ4OWCCL10) (FQ4WCCL_11 = FQ4OWCCL11) (FQ4WCCL_12 = FQ4OWCCL12) (FQ4WCCL_13 = FQ4OWCCL13) (FQ4WCCL_14 = FQ4OWCCL14)
 (FQ4WCCL_15 = FQ4OWCCL15) (FQ4WCCL_16 = FQ4OWCCL16) (FQ4WCCL_17 = FQ4OWCCL17) (FQ4WCCL_18 = FQ4OWCCL18) (FQ4WCCL_19 = FQ4OWCCL19)
 (FQ4WCCL_20 = FQ4OWCCL20) (FQ4WCCL_21 = FQ4OWCCL21) (FQ4WCCL_22 = FQ4OWCCL22) (FQ4WCCL_23 = FQ4OWCCL23) (FQ4WCCL_24 = FQ4OWCCL24)
 (FQ4WCCL_25 = FQ4OWCCL25) (FQ4WCCL_26 = FQ4OWCCL26) (FQ4WCCL_27 = FQ4OWCCL27) (FQ4WCCL_28 = FQ4OWCCL28) (FQ4WCCL_29 = FQ4OWCCL29) 
 (FQ4WCCL_30 = FQ4OWCCL30) (FQ4WCCL_31 = FQ4OWCCL31) (FQ4WCCL_32 = FQ4OWCCL32) (FQ4WCCL_33 = FQ4OWCCL33) (FQ4WCCL_34 = FQ4OWCCL34)
 (FQ4WCCL_35 = FQ4OWCCL35) (FQ4WCCL_36 = FQ4OWCCL36) (FQ4WCCL_37 = FQ4OWCCL37) (FQ4WCCL_38 = FQ4OWCCL38) (FQ4WCCL_39 = FQ4OWCCL39)
 (FQ4WCCL_40 = FQ4OWCCL40) (FQ4WCCL_41 = FQ4OWCCL41) (FQ4WCCL_42 = FQ4OWCCL42) (FQ4WCCL_43 = FQ4OWCCL43) (FQ4WCCL_44 = FQ4OWCCL44)
 (FQ4WCCL_45 = FQ4OWCCL45) (FQ4WCCL_46 = FQ4OWCCL46) (FQ4WCCL_47 = FQ4OWCCL47) (FQ4WCCL_48 = FQ4OWCCL48) (FQ4WCCL_49 = FQ4OWCCL49)
 (FQ4WCCL_50 = FQ4OWCCL50) (FQ4WCCL_51 = FQ4OWCCL51) (FQ4WCCL_52 = FQ4OWCCL52) (FQ4WCCL_53 = FQ4OWCCL53) (FQ4WCCL_54 = FQ4OWCCL54)
 (FQ4WCCL_55 = FQ4OWCCL55) (FQ4WCCL_56 = FQ4OWCCL56) (FQ4WCCL_57 = FQ4OWCCL57) (FQ4WCCL_58 = FQ4OWCCL58) (FQ4WCCL_59 = FQ4OWCCL59).
EXECUTE.
*Remember to save your data file.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OWCCL_Cleaned.sav'.
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
/FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FD0OACS_Constructs.sav'
/IN=f
/FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OWCCL_Cleaned.sav'
/BY ID
/DROP=
FD0OSTAT FD0ORD
FD1OSTAT FD1OTD FD1ORD FD1ODIFF
FD2OSTAT FD2OTD FD2ORD FD2ODIFF
FD3OSTAT FD3OTD FD3ORD FD3ODIFF
FD4OTD FD4ODIFF
FD4AOSTAT FD4AOTD FD4AORD FD4AODIFF.
SELECT IF f=1.
EXECUTE.
*Comparing REDCap and Qualtrics dates of completion. Be sure to update the date variables used to reflect the accurate RD and questionnaire date.
COMPUTE DATEDIFF = DATEDIFF(FD4ORD,FQ4OWCCLDATE,'days').
EXECUTE.
COUNT DATEDIFF0=DATEDIFF(Lowest thru -1) DATEDIFF(1 thru Highest).
EXECUTE.
FREQUENCIES VARIABLES=DATEDIFF0
  /ORDER=ANALYSIS.
SORT CASES BY DATEDIFF0(D).
*CHECK ALL IDS WITH DISCREPANT DATES TO DETERMINE WHAT IS CORRECT. CONSULT BEFORE MAKING ANY CHANGES TO RAW DATA IN REDCAP OR QUALTRICS.
*INCLUDE NOTES HERE FOR EACH ID THAT WAS DISCREPANT (EXAMPLE BELOW - ADAPT AS NEEDED)
*THE FOLLOWING IDs (90754 and 91123) HAVE A A4 QUALTRICS DATE [FQ4OXXXDATE] THAT DOES NOT MATCH THEIR A4 VISIT DATE [FD4ORD]. 
*THIS WAS INVESTIGATED BY STAFF (BM: 4-11-22) AND VISIT DATE [FQ4OXXXDATE] WAS CONFIRMED TO BE THE CORRECT DATE FOR QUALTRICS DATA USING MULTIPLE SOURCES.

IF(ID=90754)FD4ORD=13768849370.
EXECUTE.
IF(ID=91123)FD4ORD=13768849370.
EXECUTE.

SORT CASES BY ID(A).
*DROPPING VARIABLES THAT ARE NO LONGER RELEVANT TO FINAL DATA FILE.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OWCCL_Cleaned.sav'
/DROP
FQ4OWCCLDATE
DATEDIFF
DATEDIFF0
f.
EXECUTE.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OWCCL_Cleaned.sav'.
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

*91199 skipped a question.
DO IF (ID=91199). 
    RECODE
    FQ4OWCCL56 FQ4OWCCL38
    (SYSMIS=-10).
END IF.
EXECUTE.

*90253 skipped a question.
DO IF (ID=90253). 
    RECODE
    FQ4OWCCL54
    (SYSMIS=-10).
END IF.
EXECUTE.

*90671 skipped a question.
DO IF (ID=90671). 
    RECODE
    FQ4OWCCL49
    (SYSMIS=-10).
END IF.
EXECUTE.

*91487 skipped a question.
DO IF (ID=91487). 
    RECODE
    FQ4OWCCL43 FQ4OWCCL31
    (SYSMIS=-10).
END IF.
EXECUTE.

*91155 skipped a question.
DO IF (ID=91155). 
    RECODE
    FQ4OWCCL36
    (SYSMIS=-10).
END IF.
EXECUTE.

*90386 skipped a question.
DO IF (ID=90386). 
    RECODE
    FQ4OWCCL01
    (SYSMIS=-10).
END IF.
EXECUTE.
    
**STEP 7 (DELETE IF NOT NEEDED): CREATING NEW VARIABLES FOR REVERSED SCORED ITEMS.
**Reverse-Scored Items; see scoring document to determine if there are reverse-scored items. If no reverse-scored items, delete this syntax.
**CHECKED AND NOT NEEDED

*STEP 7A: RECODING SYSMIS (PARTICIPANTS THAT MISSED THE ASSESSMENT).
*This will use the STAT variable to recode all SYSMIS data. CHANGE THE STAT VARIABLE TO MATCH THE ASSESSMENT WAVE YOU ARE WORKING IN.
*Include full list of numeric variables (including new reverse-scored items).
DO IF MISSING(FD4OSTAT).
DO REPEAT x = FQ4OWCCL01 TO FQ4OWCCL59.
RECODE FD4OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.

*STEP 8: STANDARDIZING DECIMAL PLACES (CANNOT INCLUDE TEXT/STRING VARIABLES).
*Making all variables have the same number of decimal places. Ensure that variables include all new reverse-scored variables. Change the number AFTER the decimal place as needed.
FORMATS FQ4OWCCL01 to FQ4OWCCL59 (F8.0).
EXECUTE.

*STEP 9: CREATING VARIABLE LABLES.
*Label all variables. Use the original questionnaire to include the exact text that participants saw. Include the questionnaire name and number at the end of the label.
VARIABLE LABELS  ID 'Participant ID'.
EXECUTE.

VARIABLE LABELS 
FQ4OWCCL01 'Bargained or compromised to get something positive from the situation. [FQ4OWCCL01]'
FQ4OWCCL02 'Counted my blessings. [FQ4OWCCL02]'
FQ4OWCCL03 'Blamed myself. [FQ4OWCCL03]'
FQ4OWCCL04 'Concentrated on something good that could come out of the whole thing. [FQ4OWCCL04]'
FQ4OWCCL05 'Kept feelings to myself. [FQ4OWCCL05]'
FQ4OWCCL06 'Made sure Im responding in a way that doesnt alienate others. [FQ4OWCCL06]'
FQ4OWCCL07 'Figured out who to blame. [FQ4OWCCL07]'
FQ4OWCCL08 'Hoped a miracle would happen. [FQ4OWCCL08]'
FQ4OWCCL09 'Tried to get centered before taking any action. [FQ4OWCCL09]'
FQ4OWCCL10 'Talked to someone about how Im feeling. [FQ4OWCCL10]'
FQ4OWCCL11 'Stood my ground and fought for what Ive wanted. [FQ4OWCCL11]'
FQ4OWCCL12 'Refused to believe that it had happened. [FQ4OWCCL12]'
FQ4OWCCL13 'Treated myself to something really tasty. [FQ4OWCCL13]'
FQ4OWCCL14 'Criticized or lectured myself. [FQ4OWCCL14]'
FQ4OWCCL15 'Took it out on others. [FQ4OWCCL15]'
FQ4OWCCL16 'Came up with a couple of different solutions to my problem. [FQ4OWCCL16]'
FQ4OWCCL17 'Wished I were a stronger person--more optimistic and forceful. [FQ4OWCCL17]'
FQ4OWCCL18 'Accepted my strong feelings, but not let them interfere with other things too much. [FQ4OWCCL18]'
FQ4OWCCL19 'Focused on the good things in my life. [FQ4OWCCL19]'
FQ4OWCCL20 'Wished that I could change the way that I felt. [FQ4OWCCL20]'
FQ4OWCCL21 'Found something beautiful to look at to make me feel better. [FQ4OWCCL21]'
FQ4OWCCL22 'Changed something about myself so that I could deal with the situation better. [FQ4OWCCL22]'
FQ4OWCCL23 'Focused on the good aspects of my life and gave less attention to negative thoughts or feelings. [FQ4OWCCL23]'
FQ4OWCCL24 'Got mad at people or things that caused the problem. [FQ4OWCCL24]'
FQ4OWCCL25 'Felt bad that I couldnt avoid the problem. [FQ4OWCCL25]'
FQ4OWCCL26 'Tried to distract myself by getting active. [FQ4OWCCL26]'
FQ4OWCCL27 'Been aware of what has to be done, So Ive been doubling my efforts and trying harder to make things work. [FQ4OWCCL27]'
FQ4OWCCL28 'Thought that others were unfair to me. [FQ4OWCCL28]'
FQ4OWCCL29 'Soothed myself by surrounding myself with a nice fragrance of some kind. [FQ4OWCCL29]'
FQ4OWCCL30 'Blamed others. [FQ4OWCCL30]'
FQ4OWCCL31 'Listened to or played music that I found relaxing. [FQ4OWCCL31]'
FQ4OWCCL32 'Gone on as if nothing had happened. [FQ4OWCCL32]'
FQ4OWCCL33 'Accepted the next best thing to what I wanted. [FQ4OWCCL33]'
FQ4OWCCL34 'Told myself things could be worse. [FQ4OWCCL34]'
FQ4OWCCL35 'Occupied my mind with something else. [FQ4OWCCL35]'
FQ4OWCCL36 'Talked to someone who could do something concrete about the problem. [FQ4OWCCL36]'
FQ4OWCCL37 'Tried to make myself feel better by eating, drinking, smoking, taking medications, etc. [FQ4OWCCL37]'
FQ4OWCCL38 'Tried not to act too hastily or follow my own hunch. [FQ4OWCCL38]'
FQ4OWCCL39 'Changed something so things would turn out right. [FQ4OWCCL39]'
FQ4OWCCL40 'Pampered myself with something that felt good to the touch (e.g., a bubble bath or a hug). [FQ4OWCCL40]'
FQ4OWCCL41 'Avoided people. [FQ4OWCCL41]'
FQ4OWCCL42 'Thought how much better off I was than others. [FQ4OWCCL42]'
FQ4OWCCL43 'Just took things one step at a time. [FQ4OWCCL43]'
FQ4OWCCL44 'Did something to feel a totally different emotion (like gone to a funny movie). [FQ4OWCCL44]'
FQ4OWCCL45 'Wished the situation would go away or somehow be finished. [FQ4OWCCL45]'
FQ4OWCCL46 'Kept others from knowing how bad things were. [FQ4OWCCL46]'
FQ4OWCCL47 'Focused my energy on helping others. [FQ4OWCCL47]'
FQ4OWCCL48 'Found out what other person was responsible. [FQ4OWCCL48]'
FQ4OWCCL49 'Made sure to take care of my body and stay healthy so that I was less emotionally sensitive. [FQ4OWCCL49]'
FQ4OWCCL50 'Told myself how much I had already accomplished. [FQ4OWCCL50]'
FQ4OWCCL51 'Made sure I could respond in a way that I could still respect myself afterwards. [FQ4OWCCL51]'
FQ4OWCCL52 'Wished that I could change what had happened. [FQ4OWCCL52]'
FQ4OWCCL53 'Made a plan of action and followed it. [FQ4OWCCL53]'
FQ4OWCCL54 'Talked to someone to find out about the situation. [FQ4OWCCL54]'
FQ4OWCCL55 'Avoided my problem. [FQ4OWCCL55]'
FQ4OWCCL56 'Stepped back and tried to see things as they really are. [FQ4OWCCL56]'
FQ4OWCCL57 'Compared myself to others who are less fortunate. [FQ4OWCCL57]'
FQ4OWCCL58 'Increased the number of pleasant things in my life so that I had a more positive outlook. [FQ4OWCCL58]'
FQ4OWCCL59 'Tried not to burn my bridges behind me, but leave things open somewhat. [FQ4OWCCL59]'.
EXECUTE. 

*STEP 10: ADD VALUE LABELS.
*Include missing values like 'Prefer not to Answer' (or something similar) if applicable.
*Include ALL missing value labels (SEE ABOVE FOR FULL LIST).
VALUE LABELS
FQ4OWCCL01 FQ4OWCCL02 FQ4OWCCL03 FQ4OWCCL04 FQ4OWCCL05 FQ4OWCCL06 FQ4OWCCL07 FQ4OWCCL08 FQ4OWCCL09 FQ4OWCCL10
FQ4OWCCL11 FQ4OWCCL12 FQ4OWCCL13 FQ4OWCCL14 FQ4OWCCL15 FQ4OWCCL16 FQ4OWCCL17 FQ4OWCCL18 FQ4OWCCL19 FQ4OWCCL20
FQ4OWCCL21 FQ4OWCCL22 FQ4OWCCL23 FQ4OWCCL24 FQ4OWCCL25 FQ4OWCCL26 FQ4OWCCL27 FQ4OWCCL28 FQ4OWCCL29 FQ4OWCCL30
FQ4OWCCL31 FQ4OWCCL32 FQ4OWCCL33 FQ4OWCCL34 FQ4OWCCL35 FQ4OWCCL36 FQ4OWCCL37 FQ4OWCCL38 FQ4OWCCL39 FQ4OWCCL40
FQ4OWCCL41 FQ4OWCCL42 FQ4OWCCL43 FQ4OWCCL44 FQ4OWCCL45 FQ4OWCCL46 FQ4OWCCL47 FQ4OWCCL48 FQ4OWCCL49 FQ4OWCCL50
FQ4OWCCL51 FQ4OWCCL52 FQ4OWCCL53 FQ4OWCCL54 FQ4OWCCL55 FQ4OWCCL56 FQ4OWCCL57 FQ4OWCCL58 FQ4OWCCL59
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
0 'Never Used (0)'
1 'Rarely Used (1)'
2 'Sometimes Used (2)'
3 'Regularly Used (3)'.  
EXECUTE.

*STEP 11: LABELING MISSING VALUES AS MISSING.
*Recoding all negative numbers as missing.
MISSING VALUES
FQ4OWCCL01 FQ4OWCCL02 FQ4OWCCL03 FQ4OWCCL04 FQ4OWCCL05 FQ4OWCCL06 FQ4OWCCL07 FQ4OWCCL08 FQ4OWCCL09 FQ4OWCCL10
FQ4OWCCL11 FQ4OWCCL12 FQ4OWCCL13 FQ4OWCCL14 FQ4OWCCL15 FQ4OWCCL16 FQ4OWCCL17 FQ4OWCCL18 FQ4OWCCL19 FQ4OWCCL20
FQ4OWCCL21 FQ4OWCCL22 FQ4OWCCL23 FQ4OWCCL24 FQ4OWCCL25 FQ4OWCCL26 FQ4OWCCL27 FQ4OWCCL28 FQ4OWCCL29 FQ4OWCCL30
FQ4OWCCL31 FQ4OWCCL32 FQ4OWCCL33 FQ4OWCCL34 FQ4OWCCL35 FQ4OWCCL36 FQ4OWCCL37 FQ4OWCCL38 FQ4OWCCL39 FQ4OWCCL40
FQ4OWCCL41 FQ4OWCCL42 FQ4OWCCL43 FQ4OWCCL44 FQ4OWCCL45 FQ4OWCCL46 FQ4OWCCL47 FQ4OWCCL48 FQ4OWCCL49 FQ4OWCCL50
FQ4OWCCL51 FQ4OWCCL52 FQ4OWCCL53 FQ4OWCCL54 FQ4OWCCL55 FQ4OWCCL56 FQ4OWCCL57 FQ4OWCCL58 FQ4OWCCL59
    (LO THRU -1).
EXECUTE.

*STEP 12: SAVE CLEANED DATA FILE.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OWCCL_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.

*STEP 13: CHECK FREQUENCIES.
*Checking frequencies of all items before creating constructs.
*Include STAT variable here to be sure all missingness was coded correctly.
FREQUENCIES VARIABLES=FD4OSTAT FQ4OWCCL01 FQ4OWCCL02 FQ4OWCCL03 FQ4OWCCL04 FQ4OWCCL05 FQ4OWCCL06 FQ4OWCCL07 FQ4OWCCL08 FQ4OWCCL09 FQ4OWCCL10
FQ4OWCCL11 FQ4OWCCL12 FQ4OWCCL13 FQ4OWCCL14 FQ4OWCCL15 FQ4OWCCL16 FQ4OWCCL17 FQ4OWCCL18 FQ4OWCCL19 FQ4OWCCL20
FQ4OWCCL21 FQ4OWCCL22 FQ4OWCCL23 FQ4OWCCL24 FQ4OWCCL25 FQ4OWCCL26 FQ4OWCCL27 FQ4OWCCL28 FQ4OWCCL29 FQ4OWCCL30
FQ4OWCCL31 FQ4OWCCL32 FQ4OWCCL33 FQ4OWCCL34 FQ4OWCCL35 FQ4OWCCL36 FQ4OWCCL37 FQ4OWCCL38 FQ4OWCCL39 FQ4OWCCL40
FQ4OWCCL41 FQ4OWCCL42 FQ4OWCCL43 FQ4OWCCL44 FQ4OWCCL45 FQ4OWCCL46 FQ4OWCCL47 FQ4OWCCL48 FQ4OWCCL49 FQ4OWCCL50
FQ4OWCCL51 FQ4OWCCL52 FQ4OWCCL53 FQ4OWCCL54 FQ4OWCCL55 FQ4OWCCL56 FQ4OWCCL57 FQ4OWCCL58 FQ4OWCCL59
  /ORDER=ANALYSIS.

*STEP 14: CHECK DESCRIPTIVES.
*Checking descriptives for all items before creating constructs.
DESCRIPTIVES VARIABLES=FQ4OWCCL01 FQ4OWCCL02 FQ4OWCCL03 FQ4OWCCL04 FQ4OWCCL05 FQ4OWCCL06 FQ4OWCCL07 FQ4OWCCL08 FQ4OWCCL09 FQ4OWCCL10
FQ4OWCCL11 FQ4OWCCL12 FQ4OWCCL13 FQ4OWCCL14 FQ4OWCCL15 FQ4OWCCL16 FQ4OWCCL17 FQ4OWCCL18 FQ4OWCCL19 FQ4OWCCL20
FQ4OWCCL21 FQ4OWCCL22 FQ4OWCCL23 FQ4OWCCL24 FQ4OWCCL25 FQ4OWCCL26 FQ4OWCCL27 FQ4OWCCL28 FQ4OWCCL29 FQ4OWCCL30
FQ4OWCCL31 FQ4OWCCL32 FQ4OWCCL33 FQ4OWCCL34 FQ4OWCCL35 FQ4OWCCL36 FQ4OWCCL37 FQ4OWCCL38 FQ4OWCCL39 FQ4OWCCL40
FQ4OWCCL41 FQ4OWCCL42 FQ4OWCCL43 FQ4OWCCL44 FQ4OWCCL45 FQ4OWCCL46 FQ4OWCCL47 FQ4OWCCL48 FQ4OWCCL49 FQ4OWCCL50
FQ4OWCCL51 FQ4OWCCL52 FQ4OWCCL53 FQ4OWCCL54 FQ4OWCCL55 FQ4OWCCL56 FQ4OWCCL57 FQ4OWCCL58 FQ4OWCCL59
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 15: SAVE CLEANED DATA FILE.
*Sorting the data file by ID and resaving the final file.
*To reorder items, use /KEEP {list all variales in order} -- insert in line after file name.
SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OWCCL_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OWCCL_Cleaned.sav'.
EXECUTE.

*STEP 16: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE
 OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OWCCL_Cleaned.spv'
 LOCK=NO.

* Encoding: UTF-8.
*STEP 0: NOTES
*DBT-Ways of Coping Checklist (DBT-WCCL).
 
*10-01-21(BM): Adapted STEPS 1-16 from A1 Syntax.
*04-12-2022 (BM):Adapted Syntax to Match Updated Template + Pass in Updated Data. 
*04-13-22(AAC): Checked.
*04-18-2022(BM): Double Checked and Fixed Missing Codes.
*04-20-22(AAC): Checked.
*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------.
*STEP 1: OPENING RAW DATA.
*Insert the correct file path and file name. Use syntax to open raw data file.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/DBT Moms R01 Study Time 3 Mother Survey_April 12, 2022_17.38.sav'.

*STEP 2: SAVING QUESTIONNAIRE SPECIFIC RAW DATA. 
*Insert the correct file path and file name. Save this file with only those variables that you need, in the following order; ID, Start Date, Questionnaire Items (i.e., DERS_1 to DERS_36).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OWCCL_Cleaned.sav'
  /KEEP 
  FQ3ID 
  STARTDATE
  FQ3WCCL_1 TO FQ3WCCL_59
  /COMPRESSED.
  EXECUTE.

*STEP 3: OPEN NEW DATA FILE.  
*Insert the correct file path and file name. Open the file you just created and saved so that you are able to clean the data.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OWCCL_Cleaned.sav'.

*STEP 4: TRANSFORM VARIABLES AND SORT IDS ASCENDING ORDER.
*Transforming ID from a string to a numeric variable, change the date format of startdate, and sort IDs in ascending order.
ALTER TYPE FQ3ID (F10.0).
EXECUTE.
FORMATS STARTDATE (adate10).
EXECUTE.
SORT CASES BY FQ3ID(A).
EXECUTE.

*STEP 5: RENAME ‘RAW DATA’ VARIABLES TO ‘CLEANED’ VARIABLES NAMES. 
*Rename all variables so they reflect our naming scheme. ID should always be labeled as 'ID'. Item should be numbers 01-36 or 001-106. 
RENAME VARIABLE (FQ3ID=ID).
EXECUTE.
RENAME VARIABLE (STARTDATE=FQ3OWCCLDATE).
EXECUTE.
RENAME VARIABLE (FQ3WCCL_1 = FQ3OWCCL01) (FQ3WCCL_2 = FQ3OWCCL02) (FQ3WCCL_3 = FQ3OWCCL03) (FQ3WCCL_4 = FQ3OWCCL04)
 (FQ3WCCL_5 = FQ3OWCCL05) (FQ3WCCL_6 = FQ3OWCCL06) (FQ3WCCL_7 = FQ3OWCCL07) (FQ3WCCL_8 = FQ3OWCCL08) (FQ3WCCL_9 = FQ3OWCCL09)
 (FQ3WCCL_10 = FQ3OWCCL10) (FQ3WCCL_11 = FQ3OWCCL11) (FQ3WCCL_12 = FQ3OWCCL12) (FQ3WCCL_13 = FQ3OWCCL13) (FQ3WCCL_14 = FQ3OWCCL14)
 (FQ3WCCL_15 = FQ3OWCCL15) (FQ3WCCL_16 = FQ3OWCCL16) (FQ3WCCL_17 = FQ3OWCCL17) (FQ3WCCL_18 = FQ3OWCCL18) (FQ3WCCL_19 = FQ3OWCCL19)
 (FQ3WCCL_20 = FQ3OWCCL20) (FQ3WCCL_21 = FQ3OWCCL21) (FQ3WCCL_22 = FQ3OWCCL22) (FQ3WCCL_23 = FQ3OWCCL23) (FQ3WCCL_24 = FQ3OWCCL24)
 (FQ3WCCL_25 = FQ3OWCCL25) (FQ3WCCL_26 = FQ3OWCCL26) (FQ3WCCL_27 = FQ3OWCCL27) (FQ3WCCL_28 = FQ3OWCCL28) (FQ3WCCL_29 = FQ3OWCCL29) 
 (FQ3WCCL_30 = FQ3OWCCL30) (FQ3WCCL_31 = FQ3OWCCL31) (FQ3WCCL_32 = FQ3OWCCL32) (FQ3WCCL_33 = FQ3OWCCL33) (FQ3WCCL_34 = FQ3OWCCL34)
 (FQ3WCCL_35 = FQ3OWCCL35) (FQ3WCCL_36 = FQ3OWCCL36) (FQ3WCCL_37 = FQ3OWCCL37) (FQ3WCCL_38 = FQ3OWCCL38) (FQ3WCCL_39 = FQ3OWCCL39)
 (FQ3WCCL_40 = FQ3OWCCL40) (FQ3WCCL_41 = FQ3OWCCL41) (FQ3WCCL_42 = FQ3OWCCL42) (FQ3WCCL_43 = FQ3OWCCL43) (FQ3WCCL_44 = FQ3OWCCL44)
 (FQ3WCCL_45 = FQ3OWCCL45) (FQ3WCCL_46 = FQ3OWCCL46) (FQ3WCCL_47 = FQ3OWCCL47) (FQ3WCCL_48 = FQ3OWCCL48) (FQ3WCCL_49 = FQ3OWCCL49)
 (FQ3WCCL_50 = FQ3OWCCL50) (FQ3WCCL_51 = FQ3OWCCL51) (FQ3WCCL_52 = FQ3OWCCL52) (FQ3WCCL_53 = FQ3OWCCL53) (FQ3WCCL_54 = FQ3OWCCL54)
 (FQ3WCCL_55 = FQ3OWCCL55) (FQ3WCCL_56 = FQ3OWCCL56) (FQ3WCCL_57 = FQ3OWCCL57) (FQ3WCCL_58 = FQ3OWCCL58) (FQ3WCCL_59 = FQ3OWCCL59).
EXECUTE.
*Remember to save your data file.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OWCCL_Cleaned.sav'.
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
/FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OWCCL_Cleaned.sav'
/BY ID
/DROP=
FD0OSTAT FD0ORD
FD1OSTAT FD1OTD FD1ORD FD1ODIFF
FD2OSTAT FD2OTD FD2ORD FD2ODIFF
FD3OTD FD3ODIFF
FD4OSTAT FD4OTD FD4ORD FD4ODIFF
FD4AOSTAT FD4AOTD FD4AORD FD4AODIFF.
SELECT IF f=1.
EXECUTE.
*Comparing REDCap and Qualtrics dates of completion. Be sure to update the date variables used to reflect the accurate RD and questionnaire date.
COMPUTE DATEDIFF = DATEDIFF(FD3ORD,FQ3OWCCLDATE,'days').
EXECUTE.
COUNT DATEDIFF0=DATEDIFF(Lowest thru -1) DATEDIFF(1 thru Highest).
EXECUTE.
FREQUENCIES VARIABLES=DATEDIFF0
  /ORDER=ANALYSIS.
SORT CASES BY DATEDIFF0(D).
*CHECK ALL IDS WITH DISCREPANT DATES TO DETERMINE WHAT IS CORRECT. CONSULT BEFORE MAKING ANY CHANGES TO RAW DATA IN REDCAP OR QUALTRICS.
*INCLUDE NOTES HERE FOR EACH ID THAT WAS DISCREPANT (EXAMPLE BELOW - ADAPT AS NEEDED)
*THE FOLLOWING IDs (91768 and 91133) HAVE A A3 QUALTRICS DATE [FQ3OXXXDATE] THAT DOES NOT MATCH THEIR A3 VISIT DATE [FD3ORD]. 
*THIS WAS INVESTIGATED BY STAFF (BM: 4-11-22) AND VISIT DATE [FD3ORD] WAS CONFIRMED USING MULTIPLE SOURCES.
SORT CASES BY ID(A).
*DROPPING VARIABLES THAT ARE NO LONGER RELEVANT TO FINAL DATA FILE.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OWCCL_Cleaned.sav'
/DROP
FQ3OWCCLDATE
DATEDIFF
DATEDIFF0
f.
EXECUTE.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OWCCL_Cleaned.sav'.
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
**-11 'Participant (parent or child) deceased'                                 /* (Participant (parent or child) deceased) */
**-10 'Prefer not to answer'                                                           /* (Participant selected prefer not to answer) */.

*90841 skipped a question.
DO IF (ID=91768). 
    RECODE
    FQ3OWCCL32
    (SYSMIS=-10).
END IF.
EXECUTE.

*90841 skipped a question.
DO IF (ID=91469). 
    RECODE
    FQ3OWCCL25
    (SYSMIS=-10).
END IF.
EXECUTE.

*90841 skipped a question.
DO IF (ID=90104). 
    RECODE
    FQ3OWCCL23 FQ3OWCCL03
    (SYSMIS=-10).
END IF.
EXECUTE.
    
**STEP 7 (DELETE IF NOT NEEDED): CREATING NEW VARIABLES FOR REVERSED SCORED ITEMS.
**Reverse-Scored Items; see scoring document to determine if there are reverse-scored items. If no reverse-scored items, delete this syntax.
**CHECKED AND NOT NEEDED

*STEP 7A: RECODING SYSMIS (PARTICIPANTS THAT MISSED THE ASSESSMENT).
*This will use the STAT variable to recode all SYSMIS data. CHANGE THE STAT VARIABLE TO MATCH THE ASSESSMENT WAVE YOU ARE WORKING IN.
*Include full list of numeric variables (including new reverse-scored items).
DO IF MISSING(FD3OSTAT).
DO REPEAT x = FQ3OWCCL01 TO FQ3OWCCL59.
RECODE FD3OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.

*STEP 8: STANDARDIZING DECIMAL PLACES (CANNOT INCLUDE TEXT/STRING VARIABLES).
*Making all variables have the same number of decimal places. Ensure that variables include all new reverse-scored variables. Change the number AFTER the decimal place as needed.
FORMATS FQ3OWCCL01 to FQ3OWCCL59 (F8.0).
EXECUTE.

*STEP 9: CREATING VARIABLE LABLES.
*Label all variables. Use the original questionnaire to include the exact text that participants saw. Include the questionnaire name and number at the end of the label.
VARIABLE LABELS  ID 'Participant ID'.
EXECUTE.

VARIABLE LABELS 
FQ3OWCCL01 'Bargained or compromised to get something positive from the situation. [FQ3OWCCL01]'
FQ3OWCCL02 'Counted my blessings. [FQ3OWCCL02]'
FQ3OWCCL03 'Blamed myself. [FQ3OWCCL03]'
FQ3OWCCL04 'Concentrated on something good that could come out of the whole thing. [FQ3OWCCL04]'
FQ3OWCCL05 'Kept feelings to myself. [FQ3OWCCL05]'
FQ3OWCCL06 'Made sure Im responding in a way that doesnt alienate others. [FQ3OWCCL06]'
FQ3OWCCL07 'Figured out who to blame. [FQ3OWCCL07]'
FQ3OWCCL08 'Hoped a miracle would happen. [FQ3OWCCL08]'
FQ3OWCCL09 'Tried to get centered before taking any action. [FQ3OWCCL09]'
FQ3OWCCL10 'Talked to someone about how Im feeling. [FQ3OWCCL10]'
FQ3OWCCL11 'Stood my ground and fought for what Ive wanted. [FQ3OWCCL11]'
FQ3OWCCL12 'Refused to believe that it had happened. [FQ3OWCCL12]'
FQ3OWCCL13 'Treated myself to something really tasty. [FQ3OWCCL13]'
FQ3OWCCL14 'Criticized or lectured myself. [FQ3OWCCL14]'
FQ3OWCCL15 'Took it out on others. [FQ3OWCCL15]'
FQ3OWCCL16 'Came up with a couple of different solutions to my problem. [FQ3OWCCL16]'
FQ3OWCCL17 'Wished I were a stronger person--more optimistic and forceful. [FQ3OWCCL17]'
FQ3OWCCL18 'Accepted my strong feelings, but not let them interfere with other things too much. [FQ3OWCCL18]'
FQ3OWCCL19 'Focused on the good things in my life. [FQ3OWCCL19]'
FQ3OWCCL20 'Wished that I could change the way that I felt. [FQ3OWCCL20]'
FQ3OWCCL21 'Found something beautiful to look at to make me feel better. [FQ3OWCCL21]'
FQ3OWCCL22 'Changed something about myself so that I could deal with the situation better. [FQ3OWCCL22]'
FQ3OWCCL23 'Focused on the good aspects of my life and gave less attention to negative thoughts or feelings. [FQ3OWCCL23]'
FQ3OWCCL24 'Got mad at people or things that caused the problem. [FQ3OWCCL24]'
FQ3OWCCL25 'Felt bad that I couldnt avoid the problem. [FQ3OWCCL25]'
FQ3OWCCL26 'Tried to distract myself by getting active. [FQ3OWCCL26]'
FQ3OWCCL27 'Been aware of what has to be done, So Ive been doubling my efforts and trying harder to make things work. [FQ3OWCCL27]'
FQ3OWCCL28 'Thought that others were unfair to me. [FQ3OWCCL28]'
FQ3OWCCL29 'Soothed myself by surrounding myself with a nice fragrance of some kind. [FQ3OWCCL29]'
FQ3OWCCL30 'Blamed others. [FQ3OWCCL30]'
FQ3OWCCL31 'Listened to or played music that I found relaxing. [FQ3OWCCL31]'
FQ3OWCCL32 'Gone on as if nothing had happened. [FQ3OWCCL32]'
FQ3OWCCL33 'Accepted the next best thing to what I wanted. [FQ3OWCCL33]'
FQ3OWCCL34 'Told myself things could be worse. [FQ3OWCCL34]'
FQ3OWCCL35 'Occupied my mind with something else. [FQ3OWCCL35]'
FQ3OWCCL36 'Talked to someone who could do something concrete about the problem. [FQ3OWCCL36]'
FQ3OWCCL37 'Tried to make myself feel better by eating, drinking, smoking, taking medications, etc. [FQ3OWCCL37]'
FQ3OWCCL38 'Tried not to act too hastily or follow my own hunch. [FQ3OWCCL38]'
FQ3OWCCL39 'Changed something so things would turn out right. [FQ3OWCCL39]'
FQ3OWCCL40 'Pampered myself with something that felt good to the touch (e.g., a bubble bath or a hug). [FQ3OWCCL40]'
FQ3OWCCL41 'Avoided people. [FQ3OWCCL41]'
FQ3OWCCL42 'Thought how much better off I was than others. [FQ3OWCCL42]'
FQ3OWCCL43 'Just took things one step at a time. [FQ3OWCCL43]'
FQ3OWCCL44 'Did something to feel a totally different emotion (like gone to a funny movie). [FQ3OWCCL44]'
FQ3OWCCL45 'Wished the situation would go away or somehow be finished. [FQ3OWCCL45]'
FQ3OWCCL46 'Kept others from knowing how bad things were. [FQ3OWCCL46]'
FQ3OWCCL47 'Focused my energy on helping others. [FQ3OWCCL47]'
FQ3OWCCL48 'Found out what other person was responsible. [FQ3OWCCL48]'
FQ3OWCCL49 'Made sure to take care of my body and stay healthy so that I was less emotionally sensitive. [FQ3OWCCL49]'
FQ3OWCCL50 'Told myself how much I had already accomplished. [FQ3OWCCL50]'
FQ3OWCCL51 'Made sure I could respond in a way that I could still respect myself afterwards. [FQ3OWCCL51]'
FQ3OWCCL52 'Wished that I could change what had happened. [FQ3OWCCL52]'
FQ3OWCCL53 'Made a plan of action and followed it. [FQ3OWCCL53]'
FQ3OWCCL54 'Talked to someone to find out about the situation. [FQ3OWCCL54]'
FQ3OWCCL55 'Avoided my problem. [FQ3OWCCL55]'
FQ3OWCCL56 'Stepped back and tried to see things as they really are. [FQ3OWCCL56]'
FQ3OWCCL57 'Compared myself to others who are less fortunate. [FQ3OWCCL57]'
FQ3OWCCL58 'Increased the number of pleasant things in my life so that I had a more positive outlook. [FQ3OWCCL58]'
FQ3OWCCL59 'Tried not to burn my bridges behind me, but leave things open somewhat. [FQ3OWCCL59]'.
EXECUTE. 

*STEP 10: ADD VALUE LABELS.
*Include missing values like 'Prefer not to Answer' (or something similar) if applicable.
*Include ALL missing value labels (SEE ABOVE FOR FULL LIST).
VALUE LABELS
FQ3OWCCL01 FQ3OWCCL02 FQ3OWCCL03 FQ3OWCCL04 FQ3OWCCL05 FQ3OWCCL06 FQ3OWCCL07 FQ3OWCCL08 FQ3OWCCL09 FQ3OWCCL10
FQ3OWCCL11 FQ3OWCCL12 FQ3OWCCL13 FQ3OWCCL14 FQ3OWCCL15 FQ3OWCCL16 FQ3OWCCL17 FQ3OWCCL18 FQ3OWCCL19 FQ3OWCCL20
FQ3OWCCL21 FQ3OWCCL22 FQ3OWCCL23 FQ3OWCCL24 FQ3OWCCL25 FQ3OWCCL26 FQ3OWCCL27 FQ3OWCCL28 FQ3OWCCL29 FQ3OWCCL30
FQ3OWCCL31 FQ3OWCCL32 FQ3OWCCL33 FQ3OWCCL34 FQ3OWCCL35 FQ3OWCCL36 FQ3OWCCL37 FQ3OWCCL38 FQ3OWCCL39 FQ3OWCCL40
FQ3OWCCL41 FQ3OWCCL42 FQ3OWCCL43 FQ3OWCCL44 FQ3OWCCL45 FQ3OWCCL46 FQ3OWCCL47 FQ3OWCCL48 FQ3OWCCL49 FQ3OWCCL50
FQ3OWCCL51 FQ3OWCCL52 FQ3OWCCL53 FQ3OWCCL54 FQ3OWCCL55 FQ3OWCCL56 FQ3OWCCL57 FQ3OWCCL58 FQ3OWCCL59
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
FQ3OWCCL01 FQ3OWCCL02 FQ3OWCCL03 FQ3OWCCL04 FQ3OWCCL05 FQ3OWCCL06 FQ3OWCCL07 FQ3OWCCL08 FQ3OWCCL09 FQ3OWCCL10
FQ3OWCCL11 FQ3OWCCL12 FQ3OWCCL13 FQ3OWCCL14 FQ3OWCCL15 FQ3OWCCL16 FQ3OWCCL17 FQ3OWCCL18 FQ3OWCCL19 FQ3OWCCL20
FQ3OWCCL21 FQ3OWCCL22 FQ3OWCCL23 FQ3OWCCL24 FQ3OWCCL25 FQ3OWCCL26 FQ3OWCCL27 FQ3OWCCL28 FQ3OWCCL29 FQ3OWCCL30
FQ3OWCCL31 FQ3OWCCL32 FQ3OWCCL33 FQ3OWCCL34 FQ3OWCCL35 FQ3OWCCL36 FQ3OWCCL37 FQ3OWCCL38 FQ3OWCCL39 FQ3OWCCL40
FQ3OWCCL41 FQ3OWCCL42 FQ3OWCCL43 FQ3OWCCL44 FQ3OWCCL45 FQ3OWCCL46 FQ3OWCCL47 FQ3OWCCL48 FQ3OWCCL49 FQ3OWCCL50
FQ3OWCCL51 FQ3OWCCL52 FQ3OWCCL53 FQ3OWCCL54 FQ3OWCCL55 FQ3OWCCL56 FQ3OWCCL57 FQ3OWCCL58 FQ3OWCCL59
    (LO THRU -1).
EXECUTE.

*STEP 12: SAVE CLEANED DATA FILE.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OWCCL_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.

*STEP 13: CHECK FREQUENCIES.
*Checking frequencies of all items before creating constructs.
*Include STAT variable here to be sure all missingness was coded correctly.
FREQUENCIES VARIABLES=FD3OSTAT FQ3OWCCL01 FQ3OWCCL02 FQ3OWCCL03 FQ3OWCCL04 FQ3OWCCL05 FQ3OWCCL06 FQ3OWCCL07 FQ3OWCCL08 FQ3OWCCL09 FQ3OWCCL10
FQ3OWCCL11 FQ3OWCCL12 FQ3OWCCL13 FQ3OWCCL14 FQ3OWCCL15 FQ3OWCCL16 FQ3OWCCL17 FQ3OWCCL18 FQ3OWCCL19 FQ3OWCCL20
FQ3OWCCL21 FQ3OWCCL22 FQ3OWCCL23 FQ3OWCCL24 FQ3OWCCL25 FQ3OWCCL26 FQ3OWCCL27 FQ3OWCCL28 FQ3OWCCL29 FQ3OWCCL30
FQ3OWCCL31 FQ3OWCCL32 FQ3OWCCL33 FQ3OWCCL34 FQ3OWCCL35 FQ3OWCCL36 FQ3OWCCL37 FQ3OWCCL38 FQ3OWCCL39 FQ3OWCCL40
FQ3OWCCL41 FQ3OWCCL42 FQ3OWCCL43 FQ3OWCCL44 FQ3OWCCL45 FQ3OWCCL46 FQ3OWCCL47 FQ3OWCCL48 FQ3OWCCL49 FQ3OWCCL50
FQ3OWCCL51 FQ3OWCCL52 FQ3OWCCL53 FQ3OWCCL54 FQ3OWCCL55 FQ3OWCCL56 FQ3OWCCL57 FQ3OWCCL58 FQ3OWCCL59
  /ORDER=ANALYSIS.

*STEP 14: CHECK DESCRIPTIVES.
*Checking descriptives for all items before creating constructs.
DESCRIPTIVES VARIABLES=FQ3OWCCL01 FQ3OWCCL02 FQ3OWCCL03 FQ3OWCCL04 FQ3OWCCL05 FQ3OWCCL06 FQ3OWCCL07 FQ3OWCCL08 FQ3OWCCL09 FQ3OWCCL10
FQ3OWCCL11 FQ3OWCCL12 FQ3OWCCL13 FQ3OWCCL14 FQ3OWCCL15 FQ3OWCCL16 FQ3OWCCL17 FQ3OWCCL18 FQ3OWCCL19 FQ3OWCCL20
FQ3OWCCL21 FQ3OWCCL22 FQ3OWCCL23 FQ3OWCCL24 FQ3OWCCL25 FQ3OWCCL26 FQ3OWCCL27 FQ3OWCCL28 FQ3OWCCL29 FQ3OWCCL30
FQ3OWCCL31 FQ3OWCCL32 FQ3OWCCL33 FQ3OWCCL34 FQ3OWCCL35 FQ3OWCCL36 FQ3OWCCL37 FQ3OWCCL38 FQ3OWCCL39 FQ3OWCCL40
FQ3OWCCL41 FQ3OWCCL42 FQ3OWCCL43 FQ3OWCCL44 FQ3OWCCL45 FQ3OWCCL46 FQ3OWCCL47 FQ3OWCCL48 FQ3OWCCL49 FQ3OWCCL50
FQ3OWCCL51 FQ3OWCCL52 FQ3OWCCL53 FQ3OWCCL54 FQ3OWCCL55 FQ3OWCCL56 FQ3OWCCL57 FQ3OWCCL58 FQ3OWCCL59
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 15: SAVE CLEANED DATA FILE.
*Sorting the data file by ID and resaving the final file.
*To reorder items, use /KEEP {list all variales in order} -- insert in line after file name.
SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OWCCL_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OWCCL_Cleaned.sav'.
EXECUTE.

*STEP 16: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE
 OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OWCCL_Cleaned.spv'
 LOCK=NO.

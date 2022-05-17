* Encoding: UTF-8.
*STEP 0: NOTES
*DBT-Ways of Coping Checklist (DBT-WCCL).
 
*08-04-21(BM): Completed STEPS 1-16.
*08-22-21(AAC): Small changes to header (Step 0), added -43 to missing codes, added **CHECKED AND NOT NEEDED TO STEP 6
*08-26-21(AAC): Small change to variable label in STEP 9
*11-8-21 (BM): Adapted syntax to match template.
*11-10-21(BM): Updated STEP 6 comment.
*11-10-21(AAC): Checked. Minor changes in comments to reflect template
 *12-13-21 (AAC): Minor change to comments section in STEP 11.

*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------.
*STEP 1: OPENING RAW DATA.
*Insert the correct file path and file name. Use syntax to open raw data file.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/DBT Moms R01 Study Time 1 Mother Survey_November 10, 2021_12.48.sav'.

*STEP 2: SAVING QUESTIONNAIRE SPECIFIC RAW DATA. 
*Insert the correct file path and file name. Save this file with only those variables that you need, in the following order; ID, Start Date, Questionnaire Items (i.e., DERS_1 to DERS_36).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OWCCL_Cleaned.sav'
  /KEEP 
  FQ1ID 
  STARTDATE
  FQ1WCCL_1 TO FQ1WCCL_59
  /COMPRESSED.
  EXECUTE.

*STEP 3: OPEN NEW DATA FILE.  
*Insert the correct file path and file name. Open the file you just created and saved so that you are able to clean the data.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OWCCL_Cleaned.sav'.

*STEP 4: TRANSFORM VARIABLES AND SORT IDS ASCENDING ORDER.
*Transforming ID from a string to a numeric variable, change the date format of startdate, and sort IDs in ascending order.
ALTER TYPE FQ1ID (F10.0).
EXECUTE.
FORMATS STARTDATE (adate10).
EXECUTE.
SORT CASES BY FQ1ID(A).
EXECUTE.

*STEP 5: RENAME ‘RAW DATA’ VARIABLES TO ‘CLEANED’ VARIABLES NAMES. 
*Rename all variables so they reflect our naming scheme. ID should always be labeled as 'ID'. Item should be numbers 01-36 or 001-106. 
RENAME VARIABLE (FQ1ID=ID).
EXECUTE.
RENAME VARIABLE (STARTDATE=FQ1OWCCLDATE).
EXECUTE.
RENAME VARIABLE (FQ1WCCL_1 = FQ1OWCCL01) (FQ1WCCL_2 = FQ1OWCCL02) (FQ1WCCL_3 = FQ1OWCCL03) (FQ1WCCL_4 = FQ1OWCCL04)
 (FQ1WCCL_5 = FQ1OWCCL05) (FQ1WCCL_6 = FQ1OWCCL06) (FQ1WCCL_7 = FQ1OWCCL07) (FQ1WCCL_8 = FQ1OWCCL08) (FQ1WCCL_9 = FQ1OWCCL09)
 (FQ1WCCL_10 = FQ1OWCCL10) (FQ1WCCL_11 = FQ1OWCCL11) (FQ1WCCL_12 = FQ1OWCCL12) (FQ1WCCL_13 = FQ1OWCCL13) (FQ1WCCL_14 = FQ1OWCCL14)
 (FQ1WCCL_15 = FQ1OWCCL15) (FQ1WCCL_16 = FQ1OWCCL16) (FQ1WCCL_17 = FQ1OWCCL17) (FQ1WCCL_18 = FQ1OWCCL18) (FQ1WCCL_19 = FQ1OWCCL19)
 (FQ1WCCL_20 = FQ1OWCCL20) (FQ1WCCL_21 = FQ1OWCCL21) (FQ1WCCL_22 = FQ1OWCCL22) (FQ1WCCL_23 = FQ1OWCCL23) (FQ1WCCL_24 = FQ1OWCCL24)
 (FQ1WCCL_25 = FQ1OWCCL25) (FQ1WCCL_26 = FQ1OWCCL26) (FQ1WCCL_27 = FQ1OWCCL27) (FQ1WCCL_28 = FQ1OWCCL28) (FQ1WCCL_29 = FQ1OWCCL29) 
 (FQ1WCCL_30 = FQ1OWCCL30) (FQ1WCCL_31 = FQ1OWCCL31) (FQ1WCCL_32 = FQ1OWCCL32) (FQ1WCCL_33 = FQ1OWCCL33) (FQ1WCCL_34 = FQ1OWCCL34)
 (FQ1WCCL_35 = FQ1OWCCL35) (FQ1WCCL_36 = FQ1OWCCL36) (FQ1WCCL_37 = FQ1OWCCL37) (FQ1WCCL_38 = FQ1OWCCL38) (FQ1WCCL_39 = FQ1OWCCL39)
 (FQ1WCCL_40 = FQ1OWCCL40) (FQ1WCCL_41 = FQ1OWCCL41) (FQ1WCCL_42 = FQ1OWCCL42) (FQ1WCCL_43 = FQ1OWCCL43) (FQ1WCCL_44 = FQ1OWCCL44)
 (FQ1WCCL_45 = FQ1OWCCL45) (FQ1WCCL_46 = FQ1OWCCL46) (FQ1WCCL_47 = FQ1OWCCL47) (FQ1WCCL_48 = FQ1OWCCL48) (FQ1WCCL_49 = FQ1OWCCL49)
 (FQ1WCCL_50 = FQ1OWCCL50) (FQ1WCCL_51 = FQ1OWCCL51) (FQ1WCCL_52 = FQ1OWCCL52) (FQ1WCCL_53 = FQ1OWCCL53) (FQ1WCCL_54 = FQ1OWCCL54)
 (FQ1WCCL_55 = FQ1OWCCL55) (FQ1WCCL_56 = FQ1OWCCL56) (FQ1WCCL_57 = FQ1OWCCL57) (FQ1WCCL_58 = FQ1OWCCL58) (FQ1WCCL_59 = FQ1OWCCL59).
EXECUTE.
*Remember to save your data file.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OWCCL_Cleaned.sav'.
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
/FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OWCCL_Cleaned.sav'
/BY ID
/DROP=
FD0OSTAT FD0ORD
FD1OTD FD1ODIFF
FD2OSTAT FD2OTD FD2ORD FD2ODIFF
FD3OSTAT FD3OTD FD3ORD FD3ODIFF
FD4OSTAT FD4OTD FD4ORD FD4ODIFF
FD4AOSTAT FD4AOTD FD4AORD FD4AODIFF.
SELECT IF f=1.
EXECUTE.
*Comparing REDCap and Qualtrics dates of completion. Be sure to update the date variables used to reflect the accurate RD and questionnaire date.
COMPUTE DATEDIFF = DATEDIFF(FD1ORD,FQ1OWCCLDATE,'days').
EXECUTE.
COUNT DATEDIFF0=DATEDIFF(Lowest thru -1) DATEDIFF(1 thru Highest).
EXECUTE.
FREQUENCIES VARIABLES=DATEDIFF0
  /ORDER=ANALYSIS.
SORT CASES BY DATEDIFF0(D).
*CHECK ALL IDS WITH DISCREPANT DATES TO DETERMINE WHAT IS CORRECT. CONSULT BEFORE MAKING ANY CHANGES TO RAW DATA IN REDCAP OR QUALTRICS.
*INCLUDE NOTES HERE FOR EACH ID THAT WAS DISCREPANT (EXAMPLE BELOW - ADAPT AS NEEDED)
*THE FOLLOWING IDs (90210, 90331, and 90800) HAVE A A1 QUALTRICS DATE [FQ1OWCCLDATE] THAT DOES NOT MATCH THEIR A1 VISIT DATE [FD1ORD]. 
*THIS WAS INVESTIGATED BY STAFF (BM: 10-29-21) AND VISIT DATE [FD1ORD] WAS CONFIRMED USING MULTIPLE SOURCES.
SORT CASES BY ID(A).
*DROPPING VARIABLES THAT ARE NO LONGER RELEVANT TO FINAL DATA FILE.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OWCCL_Cleaned.sav'
/DROP
FQ1OWCCLDATE
DATEDIFF
DATEDIFF0
f.
EXECUTE.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OWCCL_Cleaned.sav'.
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
    
**STEP 7 (DELETE IF NOT NEEDED): CREATING NEW VARIABLES FOR REVERSED SCORED ITEMS.
**Reverse-Scored Items; see scoring document to determine if there are reverse-scored items. If no reverse-scored items, delete this syntax.
**CHECKED AND NOT NEEDED

*STEP 7A: RECODING SYSMIS (PARTICIPANTS THAT MISSED THE ASSESSMENT).
*This will use the STAT variable to recode all SYSMIS data. CHANGE THE STAT VARIABLE TO MATCH THE ASSESSMENT WAVE YOU ARE WORKING IN.
*Include full list of numeric variables (including new reverse-scored items).
DO IF MISSING(FD1OSTAT).
DO REPEAT x =    FQ1OWCCL01 to FQ1OWCCL59.
RECODE FD1OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.

*STEP 8: STANDARDIZING DECIMAL PLACES (CANNOT INCLUDE TEXT/STRING VARIABLES).
*Making all variables have the same number of decimal places. Ensure that variables include all new reverse-scored variables. Change the number AFTER the decimal place as needed.
FORMATS FQ1OWCCL01 to FQ1OWCCL59 (F8.0).
EXECUTE.

*STEP 9: CREATING VARIABLE LABLES.
*Label all variables. Use the original questionnaire to include the exact text that participants saw. Include the questionnaire name and number at the end of the label.
VARIABLE LABELS  ID 'Participant ID'.
EXECUTE.

VARIABLE LABELS 
FQ1OWCCL01 'Bargained or compromised to get something positive from the situation. [FQ1OWCCL01]'
FQ1OWCCL02 'Counted my blessings. [FQ1OWCCL02]'
FQ1OWCCL03 'Blamed myself. [FQ1OWCCL03]'
FQ1OWCCL04 'Concentrated on something good that could come out of the whole thing. [FQ1OWCCL04]'
FQ1OWCCL05 'Kept feelings to myself. [FQ1OWCCL05]'
FQ1OWCCL06 'Made sure Im responding in a way that doesnt alienate others. [FQ1OWCCL06]'
FQ1OWCCL07 'Figured out who to blame. [FQ1OWCCL07]'
FQ1OWCCL08 'Hoped a miracle would happen. [FQ1OWCCL08]'
FQ1OWCCL09 'Tried to get centered before taking any action. [FQ1OWCCL09]'
FQ1OWCCL10 'Talked to someone about how Im feeling. [FQ1OWCCL10]'
FQ1OWCCL11 'Stood my ground and fought for what Ive wanted. [FQ1OWCCL11]'
FQ1OWCCL12 'Refused to believe that it had happened. [FQ1OWCCL12]'
FQ1OWCCL13 'Treated myself to something really tasty. [FQ1OWCCL13]'
FQ1OWCCL14 'Criticized or lectured myself. [FQ1OWCCL14]'
FQ1OWCCL15 'Took it out on others. [FQ1OWCCL15]'
FQ1OWCCL16 'Came up with a couple of different solutions to my problem. [FQ1OWCCL16]'
FQ1OWCCL17 'Wished I were a stronger person--more optimistic and forceful. [FQ1OWCCL17]'
FQ1OWCCL18 'Accepted my strong feelings, but not let them interfere with other things too much. [FQ1OWCCL18]'
FQ1OWCCL19 'Focused on the good things in my life. [FQ1OWCCL19]'
FQ1OWCCL20 'Wished that I could change the way that I felt. [FQ1OWCCL20]'
FQ1OWCCL21 'Found something beautiful to look at to make me feel better. [FQ1OWCCL21]'
FQ1OWCCL22 'Changed something about myself so that I could deal with the situation better. [FQ1OWCCL22]'
FQ1OWCCL23 'Focused on the good aspects of my life and gave less attention to negative thoughts or feelings. [FQ1OWCCL23]'
FQ1OWCCL24 'Got mad at people or things that caused the problem. [FQ1OWCCL24]'
FQ1OWCCL25 'Felt bad that I couldnt avoid the problem. [FQ1OWCCL25]'
FQ1OWCCL26 'Tried to distract myself by getting active. [FQ1OWCCL26]'
FQ1OWCCL27 'Been aware of what has to be done, So Ive been doubling my efforts and trying harder to make things work. [FQ1OWCCL27]'
FQ1OWCCL28 'Thought that others were unfair to me. [FQ1OWCCL28]'
FQ1OWCCL29 'Soothed myself by surrounding myself with a nice fragrance of some kind. [FQ1OWCCL29]'
FQ1OWCCL30 'Blamed others. [FQ1OWCCL30]'
FQ1OWCCL31 'Listened to or played music that I found relaxing. [FQ1OWCCL31]'
FQ1OWCCL32 'Gone on as if nothing had happened. [FQ1OWCCL32]'
FQ1OWCCL33 'Accepted the next best thing to what I wanted. [FQ1OWCCL33]'
FQ1OWCCL34 'Told myself things could be worse. [FQ1OWCCL34]'
FQ1OWCCL35 'Occupied my mind with something else. [FQ1OWCCL35]'
FQ1OWCCL36 'Talked to someone who could do something concrete about the problem. [FQ1OWCCL36]'
FQ1OWCCL37 'Tried to make myself feel better by eating, drinking, smoking, taking medications, etc. [FQ1OWCCL37]'
FQ1OWCCL38 'Tried not to act too hastily or follow my own hunch. [FQ1OWCCL38]'
FQ1OWCCL39 'Changed something so things would turn out right. [FQ1OWCCL39]'
FQ1OWCCL40 'Pampered myself with something that felt good to the touch (e.g., a bubble bath or a hug). [FQ1OWCCL40]'
FQ1OWCCL41 'Avoided people. [FQ1OWCCL41]'
FQ1OWCCL42 'Thought how much better off I was than others. [FQ1OWCCL42]'
FQ1OWCCL43 'Just took things one step at a time. [FQ1OWCCL43]'
FQ1OWCCL44 'Did something to feel a totally different emotion (like gone to a funny movie). [FQ1OWCCL44]'
FQ1OWCCL45 'Wished the situation would go away or somehow be finished. [FQ1OWCCL45]'
FQ1OWCCL46 'Kept others from knowing how bad things were. [FQ1OWCCL46]'
FQ1OWCCL47 'Focused my energy on helping others. [FQ1OWCCL47]'
FQ1OWCCL48 'Found out what other person was responsible. [FQ1OWCCL48]'
FQ1OWCCL49 'Made sure to take care of my body and stay healthy so that I was less emotionally sensitive. [FQ1OWCCL49]'
FQ1OWCCL50 'Told myself how much I had already accomplished. [FQ1OWCCL50]'
FQ1OWCCL51 'Made sure I could respond in a way that I could still respect myself afterwards. [FQ1OWCCL51]'
FQ1OWCCL52 'Wished that I could change what had happened. [FQ1OWCCL52]'
FQ1OWCCL53 'Made a plan of action and followed it. [FQ1OWCCL53]'
FQ1OWCCL54 'Talked to someone to find out about the situation. [FQ1OWCCL54]'
FQ1OWCCL55 'Avoided my problem. [FQ1OWCCL55]'
FQ1OWCCL56 'Stepped back and tried to see things as they really are. [FQ1OWCCL56]'
FQ1OWCCL57 'Compared myself to others who are less fortunate. [FQ1OWCCL57]'
FQ1OWCCL58 'Increased the number of pleasant things in my life so that I had a more positive outlook. [FQ1OWCCL58]'
FQ1OWCCL59 'Tried not to burn my bridges behind me, but leave things open somewhat. [FQ1OWCCL59]'.
EXECUTE. 

*STEP 10: ADD VALUE LABELS.
*Include missing values like 'Prefer not to Answer' (or something similar) if applicable.
*Include ALL missing value labels (SEE ABOVE FOR FULL LIST).
VALUE LABELS
FQ1OWCCL01 FQ1OWCCL02 FQ1OWCCL03 FQ1OWCCL04 FQ1OWCCL05 FQ1OWCCL06 FQ1OWCCL07 FQ1OWCCL08 FQ1OWCCL09 FQ1OWCCL10
FQ1OWCCL11 FQ1OWCCL12 FQ1OWCCL13 FQ1OWCCL14 FQ1OWCCL15 FQ1OWCCL16 FQ1OWCCL17 FQ1OWCCL18 FQ1OWCCL19 FQ1OWCCL20
FQ1OWCCL21 FQ1OWCCL22 FQ1OWCCL23 FQ1OWCCL24 FQ1OWCCL25 FQ1OWCCL26 FQ1OWCCL27 FQ1OWCCL28 FQ1OWCCL29 FQ1OWCCL30
FQ1OWCCL31 FQ1OWCCL32 FQ1OWCCL33 FQ1OWCCL34 FQ1OWCCL35 FQ1OWCCL36 FQ1OWCCL37 FQ1OWCCL38 FQ1OWCCL39 FQ1OWCCL40
FQ1OWCCL41 FQ1OWCCL42 FQ1OWCCL43 FQ1OWCCL44 FQ1OWCCL45 FQ1OWCCL46 FQ1OWCCL47 FQ1OWCCL48 FQ1OWCCL49 FQ1OWCCL50
FQ1OWCCL51 FQ1OWCCL52 FQ1OWCCL53 FQ1OWCCL54 FQ1OWCCL55 FQ1OWCCL56 FQ1OWCCL57 FQ1OWCCL58 FQ1OWCCL59
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
-10 'Prefer not to answer (-10)'  
0 'Never Used (0)'
1 'Rarely Used (1)'
2 'Sometimes Used (2)'
3 'Regularly Used (3)'.  
EXECUTE.

**STEP 11: LABELING MISSING VALUES AS MISSING.
**Recoding all negative numbers as missing.
MISSING VALUES
FQ1OWCCL01 FQ1OWCCL02 FQ1OWCCL03 FQ1OWCCL04 FQ1OWCCL05 FQ1OWCCL06 FQ1OWCCL07 FQ1OWCCL08 FQ1OWCCL09 FQ1OWCCL10
FQ1OWCCL11 FQ1OWCCL12 FQ1OWCCL13 FQ1OWCCL14 FQ1OWCCL15 FQ1OWCCL16 FQ1OWCCL17 FQ1OWCCL18 FQ1OWCCL19 FQ1OWCCL20
FQ1OWCCL21 FQ1OWCCL22 FQ1OWCCL23 FQ1OWCCL24 FQ1OWCCL25 FQ1OWCCL26 FQ1OWCCL27 FQ1OWCCL28 FQ1OWCCL29 FQ1OWCCL30
FQ1OWCCL31 FQ1OWCCL32 FQ1OWCCL33 FQ1OWCCL34 FQ1OWCCL35 FQ1OWCCL36 FQ1OWCCL37 FQ1OWCCL38 FQ1OWCCL39 FQ1OWCCL40
FQ1OWCCL41 FQ1OWCCL42 FQ1OWCCL43 FQ1OWCCL44 FQ1OWCCL45 FQ1OWCCL46 FQ1OWCCL47 FQ1OWCCL48 FQ1OWCCL49 FQ1OWCCL50
FQ1OWCCL51 FQ1OWCCL52 FQ1OWCCL53 FQ1OWCCL54 FQ1OWCCL55 FQ1OWCCL56 FQ1OWCCL57 FQ1OWCCL58 FQ1OWCCL59
    (LO THRU -1).
EXECUTE.

*STEP 12: SAVE CLEANED DATA FILE.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OWCCL_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.

*STEP 13: CHECK FREQUENCIES.
*Checking frequencies of all items before creating constructs.
*Include STAT variable here to be sure all missingness was coded correctly.
FREQUENCIES VARIABLES=FD1OSTAT FQ1OWCCL01 FQ1OWCCL02 FQ1OWCCL03 FQ1OWCCL04 FQ1OWCCL05 FQ1OWCCL06 FQ1OWCCL07 FQ1OWCCL08 FQ1OWCCL09 FQ1OWCCL10
FQ1OWCCL11 FQ1OWCCL12 FQ1OWCCL13 FQ1OWCCL14 FQ1OWCCL15 FQ1OWCCL16 FQ1OWCCL17 FQ1OWCCL18 FQ1OWCCL19 FQ1OWCCL20
FQ1OWCCL21 FQ1OWCCL22 FQ1OWCCL23 FQ1OWCCL24 FQ1OWCCL25 FQ1OWCCL26 FQ1OWCCL27 FQ1OWCCL28 FQ1OWCCL29 FQ1OWCCL30
FQ1OWCCL31 FQ1OWCCL32 FQ1OWCCL33 FQ1OWCCL34 FQ1OWCCL35 FQ1OWCCL36 FQ1OWCCL37 FQ1OWCCL38 FQ1OWCCL39 FQ1OWCCL40
FQ1OWCCL41 FQ1OWCCL42 FQ1OWCCL43 FQ1OWCCL44 FQ1OWCCL45 FQ1OWCCL46 FQ1OWCCL47 FQ1OWCCL48 FQ1OWCCL49 FQ1OWCCL50
FQ1OWCCL51 FQ1OWCCL52 FQ1OWCCL53 FQ1OWCCL54 FQ1OWCCL55 FQ1OWCCL56 FQ1OWCCL57 FQ1OWCCL58 FQ1OWCCL59
  /ORDER=ANALYSIS.

*STEP 14: CHECK DESCRIPTIVES.
*Checking descriptives for all items before creating constructs.
DESCRIPTIVES VARIABLES=FQ1OWCCL01 FQ1OWCCL02 FQ1OWCCL03 FQ1OWCCL04 FQ1OWCCL05 FQ1OWCCL06 FQ1OWCCL07 FQ1OWCCL08 FQ1OWCCL09 FQ1OWCCL10
FQ1OWCCL11 FQ1OWCCL12 FQ1OWCCL13 FQ1OWCCL14 FQ1OWCCL15 FQ1OWCCL16 FQ1OWCCL17 FQ1OWCCL18 FQ1OWCCL19 FQ1OWCCL20
FQ1OWCCL21 FQ1OWCCL22 FQ1OWCCL23 FQ1OWCCL24 FQ1OWCCL25 FQ1OWCCL26 FQ1OWCCL27 FQ1OWCCL28 FQ1OWCCL29 FQ1OWCCL30
FQ1OWCCL31 FQ1OWCCL32 FQ1OWCCL33 FQ1OWCCL34 FQ1OWCCL35 FQ1OWCCL36 FQ1OWCCL37 FQ1OWCCL38 FQ1OWCCL39 FQ1OWCCL40
FQ1OWCCL41 FQ1OWCCL42 FQ1OWCCL43 FQ1OWCCL44 FQ1OWCCL45 FQ1OWCCL46 FQ1OWCCL47 FQ1OWCCL48 FQ1OWCCL49 FQ1OWCCL50
FQ1OWCCL51 FQ1OWCCL52 FQ1OWCCL53 FQ1OWCCL54 FQ1OWCCL55 FQ1OWCCL56 FQ1OWCCL57 FQ1OWCCL58 FQ1OWCCL59
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 15: SAVE CLEANED DATA FILE.
*Sorting the data file by ID and resaving the final file.
*To reorder items, use /KEEP {list all variales in order} -- insert in line after file name.
SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OWCCL_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.

*STEP 16: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE
 OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OWCCL_Cleaned.spv'
 LOCK=NO.

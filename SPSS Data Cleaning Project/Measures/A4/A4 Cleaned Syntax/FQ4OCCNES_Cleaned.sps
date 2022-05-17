* Encoding: UTF-8.
*STEP 0: NOTES
*COPING WITH CHILDREN'S NEGATIVE EMOTIONS SCALE (CCNES).
 
*09-30-2021 (AZ): Edited syntax to prepare for T4 data.
*10-15-2021 (AZ): Edited file paths to run T4 data.
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
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OCCNES_Cleaned.sav'
  /KEEP 
  FQ4ID 
  STARTDATE
  FQ4CCNES1_1 TO FQ4CCNES12_6
  /COMPRESSED.
  EXECUTE.

*STEP 3: OPEN NEW DATA FILE.  
*Insert the correct file path and file name. Open the file you just created and saved so that you are able to clean the data.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OCCNES_Cleaned.sav'.

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
RENAME VARIABLE (STARTDATE=FQ4OCCNESDATE).
EXECUTE.
RENAME VARIABLE (FQ4CCNES1_1 = FQ4OCCNES01A) (FQ4CCNES1_2 = FQ4OCCNES01B) (FQ4CCNES1_3 = FQ4OCCNES01C) (FQ4CCNES1_4 = FQ4OCCNES01D) (FQ4CCNES1_5 = FQ4OCCNES01E) (FQ4CCNES1_6 = FQ4OCCNES01F).
EXECUTE.
RENAME VARIABLE (FQ4CCNES2_1 = FQ4OCCNES02A) (FQ4CCNES2_2 = FQ4OCCNES02B) (FQ4CCNES2_3 = FQ4OCCNES02C) (FQ4CCNES2_4 = FQ4OCCNES02D) (FQ4CCNES2_5 = FQ4OCCNES02E) (FQ4CCNES2_6 = FQ4OCCNES02F).
EXECUTE.
RENAME VARIABLE (FQ4CCNES3_1 = FQ4OCCNES03A) (FQ4CCNES3_2 = FQ4OCCNES03B) (FQ4CCNES3_3 = FQ4OCCNES03C) (FQ4CCNES3_4 = FQ4OCCNES03D) (FQ4CCNES3_5 = FQ4OCCNES03E) (FQ4CCNES3_6 = FQ4OCCNES03F).
EXECUTE.
RENAME VARIABLE (FQ4CCNES4_1 = FQ4OCCNES04A) (FQ4CCNES4_2 = FQ4OCCNES04B) (FQ4CCNES4_3 = FQ4OCCNES04C) (FQ4CCNES4_4 = FQ4OCCNES04D) (FQ4CCNES4_5 = FQ4OCCNES04E) (FQ4CCNES4_6 = FQ4OCCNES04F).
EXECUTE.
RENAME VARIABLE (FQ4CCNES5_1 = FQ4OCCNES05A) (FQ4CCNES5_2 = FQ4OCCNES05B) (FQ4CCNES5_3 = FQ4OCCNES05C) (FQ4CCNES5_4 = FQ4OCCNES05D) (FQ4CCNES5_5 = FQ4OCCNES05E) (FQ4CCNES5_6 = FQ4OCCNES05F).
EXECUTE.
RENAME VARIABLE (FQ4CCNES6_1 = FQ4OCCNES06A) (FQ4CCNES6_2 = FQ4OCCNES06B) (FQ4CCNES6_3 = FQ4OCCNES06C) (FQ4CCNES6_4 = FQ4OCCNES06D) (FQ4CCNES6_5 = FQ4OCCNES06E) (FQ4CCNES6_6 = FQ4OCCNES06F).
EXECUTE.
RENAME VARIABLE (FQ4CCNES7_1 = FQ4OCCNES07A) (FQ4CCNES7_2 = FQ4OCCNES07B) (FQ4CCNES7_3 = FQ4OCCNES07C) (FQ4CCNES7_4 = FQ4OCCNES07D) (FQ4CCNES7_5 = FQ4OCCNES07E) (FQ4CCNES7_6 = FQ4OCCNES07F).
EXECUTE.
RENAME VARIABLE (FQ4CCNES8_1 = FQ4OCCNES08A) (FQ4CCNES8_2 = FQ4OCCNES08B) (FQ4CCNES8_3 = FQ4OCCNES08C) (FQ4CCNES8_4 = FQ4OCCNES08D) (FQ4CCNES8_5 = FQ4OCCNES08E) (FQ4CCNES8_6 = FQ4OCCNES08F).
EXECUTE.
RENAME VARIABLE (FQ4CCNES9_1 = FQ4OCCNES09A) (FQ4CCNES9_2 = FQ4OCCNES09B) (FQ4CCNES9_3 = FQ4OCCNES09C) (FQ4CCNES9_4 = FQ4OCCNES09D) (FQ4CCNES9_5 = FQ4OCCNES09E) (FQ4CCNES9_6 = FQ4OCCNES09F).
EXECUTE.
RENAME VARIABLE (FQ4CCNES10_1 = FQ4OCCNES10A) (FQ4CCNES10_2 = FQ4OCCNES10B) (FQ4CCNES10_3 = FQ4OCCNES10C) (FQ4CCNES10_4 = FQ4OCCNES10D) (FQ4CCNES10_5 = FQ4OCCNES10E) (FQ4CCNES10_6 = FQ4OCCNES10F).
EXECUTE.
RENAME VARIABLE (FQ4CCNES11_1 = FQ4OCCNES11A) (FQ4CCNES11_2 = FQ4OCCNES11B) (FQ4CCNES11_3 = FQ4OCCNES11C) (FQ4CCNES11_4 = FQ4OCCNES11D) (FQ4CCNES11_5 = FQ4OCCNES11E) (FQ4CCNES11_6 = FQ4OCCNES11F).
EXECUTE.
RENAME VARIABLE (FQ4CCNES12_1 = FQ4OCCNES12A) (FQ4CCNES12_2 = FQ4OCCNES12B) (FQ4CCNES12_3 = FQ4OCCNES12C) (FQ4CCNES12_4 = FQ4OCCNES12D) (FQ4CCNES12_5 = FQ4OCCNES12E) (FQ4CCNES12_6 = FQ4OCCNES12F).
EXECUTE.
*Remember to save your data file.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OCCNES_Cleaned.sav'.
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
/FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OCCNES_Cleaned.sav'
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
COMPUTE DATEDIFF = DATEDIFF(FD4ORD,FQ4OCCNESDATE,'days').
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
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OCCNES_Cleaned.sav'
/DROP
FQ4OCCNESDATE
DATEDIFF
DATEDIFF0
f.
EXECUTE.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OCCNES_Cleaned.sav'.
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
*CHECKED AND NOT NEEDED.
    
**STEP 7 (DELETE IF NOT NEEDED): CREATING NEW VARIABLES FOR REVERSED SCORED ITEMS.
**Reverse-Scored Items; see scoring document to determine if there are reverse-scored items. If no reverse-scored items, delete this syntax.
RECODE FQ4OCCNES02A (1=7) (2=6) (3=5) (4=4) (5=3) (6=2) (7=1) (-10=-10) INTO FQ4OCCNES02AR.
EXECUTE.
RECODE FQ4OCCNES07C (1=7) (2=6) (3=5) (4=4) (5=3) (6=2) (7=1) (-10=-10) INTO FQ4OCCNES07CR.
EXECUTE.
RECODE FQ4OCCNES08C (1=7) (2=6) (3=5) (4=4) (5=3) (6=2) (7=1) (-10=-10) INTO FQ4OCCNES08CR.
EXECUTE.
RECODE FQ4OCCNES10A (1=7) (2=6) (3=5) (4=4) (5=3) (6=2) (7=1) (-10=-10) INTO FQ4OCCNES10AR.
EXECUTE.

*90250 skipped a question.
DO IF (ID=90250). 
    RECODE
    FQ4OCCNES02B TO FQ4OCCNES03F
    FQ4OCCNES04C TO FQ4OCCNES06A
    FQ4OCCNES07A TO FQ4OCCNES11F
    FQ4OCCNES07CR TO FQ4OCCNES10AR
    (SYSMIS=-10).
END IF.
EXECUTE.

*91155 skipped a question.
DO IF (ID=91155). 
    RECODE
    FQ4OCCNES04A TO FQ4OCCNES04F
    FQ4OCCNES12A TO FQ4OCCNES12F
    (SYSMIS=-10).
END IF.
EXECUTE.

*90104 skipped a question.
DO IF (ID=90104). 
    RECODE
    FQ4OCCNES10AR FQ4OCCNES10A
    (SYSMIS=-10).
END IF.
EXECUTE.

*91069 skipped a question.
DO IF (ID=91069). 
    RECODE
    FQ4OCCNES08CR FQ4OCCNES08C FQ4OCCNES06E
    (SYSMIS=-10).
END IF.
EXECUTE.

*90841 skipped a question.
DO IF (ID=90841). 
    RECODE
    FQ4OCCNES05E FQ4OCCNES03F
    (SYSMIS=-10).
END IF.
EXECUTE.

*90724 skipped a question.
DO IF (ID=90724). 
    RECODE
    FQ4OCCNES05F
    (SYSMIS=-10).
END IF.
EXECUTE.

*STEP 7A: RECODING SYSMIS (PARTICIPANTS THAT MISSED THE ASSESSMENT).
*This will use the STAT variable to recode all SYSMIS data. CHANGE THE STAT VARIABLE TO MATCH THE ASSESSMENT WAVE YOU ARE WORKING IN.
*Include full list of numeric variables (including new reverse-scored items).
DO IF MISSING(FD4OSTAT).
DO REPEAT x = FQ4OCCNES01A TO FQ4OCCNES10AR.
RECODE FD4OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.

*STEP 8: STANDARDIZING DECIMAL PLACES (CANNOT INCLUDE TEXT/STRING VARIABLES).
*Making all variables have the same number of decimal places. Ensure that variables include all new reverse-scored variables. Change the number AFTER the decimal place as needed.
FORMATS FQ4OCCNES01A to FQ4OCCNES10AR (F8.0).
EXECUTE.

*STEP 9: CREATING VARIABLE LABLES.
*Label all variables. Use the original questionnaire to include the exact text that participants saw. Include the questionnaire name and number at the end of the label.
VARIABLE LABELS  ID 'Participant ID'.
EXECUTE.

VARIABLE LABELS 
FQ4OCCNES01A 'Angry because cant go to friends birthday party, I would send my child to his/her room to cool off [FQ4OCCNES01A]'
FQ4OCCNES01B 'Angry because cant go to friends birthday party, I would get angry at my child [FQ4OCCNES01B]'
FQ4OCCNES01C 'Angry because cant go to friends birthday party, I would help my child think about ways that he/she can still be with friends [FQ4OCCNES01C]'
FQ4OCCNES01D 'Angry because cant go to friends birthday party, I would tell my child not to make a big deal out of missing the party [FQ4OCCNES01D]'
FQ4OCCNES01E 'Angry because cant go to friends birthday party, I would encourage my child to express his/her feelings of anger and frustration [FQ4OCCNES01E]'
FQ4OCCNES01F 'Angry because cant go to friends birthday party, I would soothe my child and do something fun with him/her to make him/her feel better about missing the party [FQ4OCCNES01F]'
FQ4OCCNES02A 'Falls off his/her bike and breaks it and gets upset, I would remain calm and not let myself get anxious [FQ4OCCNES02A]'
FQ4OCCNES02B 'Falls off his/her bike and breaks it and gets upset, I would comfort my child and try to get him/her to forget about the accident [FQ4OCCNES02B]'
FQ4OCCNES02C 'Falls off his/her bike and breaks it and gets upset, I would tell my child that he/she is overreacting [FQ4OCCNES02C]'
FQ4OCCNES02D 'Falls off his/her bike and breaks it and gets upset, I would help my child figure out how to get the bike fixed [FQ4OCCNES02D]'
FQ4OCCNES02E 'Falls off his/her bike and breaks it and gets upset, I would tell my child its OK to cry [FQ4OCCNES02E]'
FQ4OCCNES02F 'Falls off his/her bike and breaks it and gets upset, I would tell my child to stop crying or he/she wont be allowed to ride his/her bike anytime soon [FQ4OCCNES02F]'
FQ4OCCNES03A 'Loses some prized possession and reacts with tears, I would get upset with him/her for being so careless and then crying about it [FQ4OCCNES03A]'
FQ4OCCNES03B 'Loses some prized possession and reacts with tears, I would tell my child that he/she is overreacting [FQ4OCCNES03B]'
FQ4OCCNES03C 'Loses some prized possession and reacts with tears, I would help my child think of places he/she hasnt looked yet [FQ4OCCNES03C]'
FQ4OCCNES03D 'Loses some prized possession and reacts with tears, I would distract my child by talking about happy things [FQ4OCCNES03D]'
FQ4OCCNES03E 'Loses some prized possession and reacts with tears, I would tell him/her its OK to cry when you feel unhappy [FQ4OCCNES03E]'
FQ4OCCNES03F 'Loses some prized possession and reacts with tears, I would tell him/her thats what happens when youre not careful [FQ4OCCNES03F]'
FQ4OCCNES04A 'Afraid of injections and becomes shaky and teary while waiting for a shot, I would tell him/her to shape up or he/she wont be allowed to do something he/she likes to do [FQ4OCCNES04A]'
FQ4OCCNES04B 'Afraid of injections and becomes shaky and teary while waiting for a shot, I would encourage my child to talk about his/her fears [FQ4OCCNES04B]'
FQ4OCCNES04C 'Afraid of injections and becomes shaky and teary while waiting for a shot, I would tell my child not to make a big deal of the shot [FQ4OCCNES04C]'
FQ4OCCNES04D 'Afraid of injections and becomes shaky and teary while waiting for a shot, I would tell him/her not to embarass us by crying [FQ4OCCNES04D]'
FQ4OCCNES04E 'Afraid of injections and becomes shaky and teary while waiting for a shot, I would comfort him/her before and after the shot [FQ4OCCNES04E]'
FQ4OCCNES04F 'Afraid of injections and becomes shaky and teary while waiting for a shot, I would talk to my child about ways to make it hurt less [FQ4OCCNES04F]'
FQ4OCCNES05A 'Going to a friends house and becomes nervous and upset because I cant stay there with him/her, I would distract my child by talking about all the fun he/she will have with his/her friend [FQ4OCCNES05A]'
FQ4OCCNES05B 'Going to a friends house and becomes nervous and upset because I cant stay there with him/her, I would help my child think of things that he/she could do so that being at the friends house without me wasnt scary [FQ4OCCNES05B]'
FQ4OCCNES05C 'Going to a friends house and becomes nervous and upset because I cant stay there with him/her, I would tell my child to quit overreacting and being a baby [FQ4OCCNES05C]'
FQ4OCCNES05D 'Going to a friends house and becomes nervous and upset because I cant stay there with him/her, I would tell my child that if he/she doesnt stop that he/she wont be allowed to go out anymore [FQ4OCCNES05D]'
FQ4OCCNES05E 'Going to a friends house and becomes nervous and upset because I cant stay there with him/her, I would feel upset and uncomfortable because of my childs reactions [FQ4OCCNES05E]'
FQ4OCCNES05F 'Going to a friends house and becomes nervous and upset because I cant stay there with him/her, I would encourage my child to talk about his/her nervous feelings [FQ4OCCNES05F]'
FQ4OCCNES06A 'Participating in a group activity with friends and makes a mistake and is embarrassed and on the verge of tears, I would comfort my child and try to make him/her feel better [FQ4OCCNES06A]'
FQ4OCCNES06B 'Participating in a group activity with friends and makes a mistake and is embarrassed and on the verge of tears, I would tell my child that he/she is overreacting [FQ4OCCNES06B]'
FQ4OCCNES06C 'Participating in a group activity with friends and makes a mistake and is embarrassed and on the verge of tears, I would feel uncomfortable and embarassed myself [FQ4OCCNES06C]'
FQ4OCCNES06D 'Participating in a group activity with friends and makes a mistake and is embarrassed and on the verge of tears, I would tell my child to straighten up or well go home right away [FQ4OCCNES06D]'
FQ4OCCNES06E 'Participating in a group activity with friends and makes a mistake and is embarrassed and on the verge of tears, I would encourage my child to talk about his/her feelings of embarrassment [FQ4OCCNES06E]'
FQ4OCCNES06F 'Participating in a group activity with friends and makes a mistake and is embarrassed and on the verge of tears, I would tell my child that Ill help him/her practice so that he/she can do better next time [FQ4OCCNES06F]'
FQ4OCCNES07A 'About to appear in a recital or sports activity and becomes visibly nervous about people watching, I would help my child think of things that he/she could do to get ready for his/her turn [FQ4OCCNES07A]'
FQ4OCCNES07B 'About to appear in a recital or sports activity and becomes visibly nervous about people watching, I would suggest that my child think about something relaxing so that his/her nervousness will go away [FQ4OCCNES07B]'
FQ4OCCNES07C 'About to appear in a recital or sports activity and becomes visibly nervous about people watching, I would remain calm and not get nervous myself [FQ4OCCNES07C]'
FQ4OCCNES07D 'About to appear in a recital or sports activity and becomes visibly nervous about people watching, I would tell my child that he/she is being a baby about it [FQ4OCCNES07D]'
FQ4OCCNES07E 'About to appear in a recital or sports activity and becomes visibly nervous about people watching, I would tell my child that if he/she doesnt calm down, well have to leave and go home right away [FQ4OCCNES07E]'
FQ4OCCNES07F 'About to appear in a recital or sports activity and becomes visibly nervous about people watching, I would encourage my child to talk about his/her nervous feelings [FQ4OCCNES07F]'
FQ4OCCNES08A 'Receives an undesirable birthday gift from a friend and looks disappointed,even annoyed,after opening it in the presence of the friend, I would encourage my child to express his/her disappointed feelings [FQ4OCCNES08A]'
FQ4OCCNES08B 'Receives an undesirable birthday gift from a friend and looks disappointed,even annoyed,after opening it in the presence of the friend, I would tell my child that the present can be exchanged for something the child wants [FQ4OCCNES08B]'
FQ4OCCNES08C 'Receives an undesirable birthday gift from a friend and looks disappointed,even annoyed,after opening it in the presence of the friend, I would not be annoyed with my child for being rude [FQ4OCCNES08C]'
FQ4OCCNES08D 'Receives an undesirable birthday gift from a friend and looks disappointed,even annoyed,after opening it in the presence of the friend, I would tell my child that he/she is overreacting [FQ4OCCNES08D]'
FQ4OCCNES08E 'Receives an undesirable birthday gift from a friend and looks disappointed,even annoyed,after opening it in the presence of the friend, I would scold my child for being insensitive to the friends feelings [FQ4OCCNES08E]'
FQ4OCCNES08F 'Receives an undesirable birthday gift from a friend and looks disappointed,even annoyed,after opening it in the presence of the friend, I would try to get my child to feel better by doing something fun [FQ4OCCNES08F]'
FQ4OCCNES09A 'Panicky and cant go to sleep after watching a scary TV show, I would encourage my child to talk about what scared him/her [FQ4OCCNES09A]'
FQ4OCCNES09B 'Panicky and cant go to sleep after watching a scary TV show, I would get upset with him/her for being silly [FQ4OCCNES09B]'
FQ4OCCNES09C 'Panicky and cant go to sleep after watching a scary TV show, I would tell my child that he/she is overreacting [FQ4OCCNES09C]'
FQ4OCCNES09D 'Panicky and cant go to sleep after watching a scary TV show, I would help my child think of something to do so that he/she can get to sleep [FQ4OCCNES09D]'
FQ4OCCNES09E 'Panicky and cant go to sleep after watching a scary TV show, I would tell him/her to go to bed or he/she wont be allowed to watch any more TV [FQ4OCCNES09E]'
FQ4OCCNES09F 'Panicky and cant go to sleep after watching a scary TV show, I would do something fun with my child to help him/her forget about what scared him/her [FQ4OCCNES09F]'
FQ4OCCNES10A 'At a park and appears on the verge of tears because the other children are mean and wont let him/her play with them, I would not get upset myself [FQ4OCCNES10A]'
FQ4OCCNES10B 'At a park and appears on the verge of tears because the other children are mean and wont let him/her play with them, I would tell my child that if he/she starts crying then well have to go home right away [FQ4OCCNES10B]'
FQ4OCCNES10C 'At a park and appears on the verge of tears because the other children are mean and wont let him/her play with them, I would tell my child its OK to cry when he/she feels bad [FQ4OCCNES10C]'
FQ4OCCNES10D 'At a park and appears on the verge of tears because the other children are mean and wont let him/her play with them, I would comfort my child and try to get him/her to think about something happy [FQ4OCCNES10D]'
FQ4OCCNES10E 'At a park and appears on the verge of tears because the other children are mean and wont let him/her play with them, I would help my child think of something else to do [FQ4OCCNES10E]'
FQ4OCCNES10F 'At a park and appears on the verge of tears because the other children are mean and wont let him/her play with them, I would tell my child that he/she will feel better soon [FQ4OCCNES10F]'
FQ4OCCNES11A 'Playing with other children and one of them calls him/her names, and my child then begins to tremble and become tearful, I would tell my child not to make a big deal out of it [FQ4OCCNES11A]'
FQ4OCCNES11B 'Playing with other children and one of them calls him/her names, and my child then begins to tremble and become tearful, I would feel upset myself [FQ4OCCNES11B]'
FQ4OCCNES11C 'Playing with other children and one of them calls him/her names, and my child then begins to tremble and become tearful, I would tell my child to behave or well have to go home right away [FQ4OCCNES11C]'
FQ4OCCNES11D 'Playing with other children and one of them calls him/her names, and my child then begins to tremble and become tearful, I would help my child think of constructive things to do when other children tease him/her [FQ4OCCNES11D]'
FQ4OCCNES11E 'Playing with other children and one of them calls him/her names, and my child then begins to tremble and become tearful, I would comfort him/her and play a game to take his/her mind off the upsetting event [FQ4OCCNES11E]'
FQ4OCCNES11F 'Playing with other children and one of them calls him/her names, and my child then begins to tremble and become tearful, I would encourage him/her to talk about how it hurts to be teased [FQ4OCCNES11F]'
FQ4OCCNES12A 'Shy and scared around strangers and consistently becomes teary and wants to stay in his/her bedroom when family friends visit, I would help my child think of things to do that would make meeting my friends less scary [FQ4OCCNES12A]'
FQ4OCCNES12B 'Shy and scared around strangers and consistently becomes teary and wants to stay in his/her bedroom when family friends visit, I would tell my child that it is OK to feel nervous [FQ4OCCNES12B]'
FQ4OCCNES12C 'Shy and scared around strangers and consistently becomes teary and wants to stay in his/her bedroom when family friends visit, I would try to make my child happy by talking about the fun things we can do with our friends [FQ4OCCNES12C]'
FQ4OCCNES12D 'Shy and scared around strangers and consistently becomes teary and wants to stay in his/her bedroom when family friends visit, I would feel upset and uncomfortable because of my childs reactions [FQ4OCCNES12D]'
FQ4OCCNES12E 'Shy and scared around strangers and consistently becomes teary and wants to stay in his/her bedroom when family friends visit, I would tell my child that he/she must stay in the living room and visit with our friends [FQ4OCCNES12E]'
FQ4OCCNES12F 'Shy and scared around strangers and consistently becomes teary and wants to stay in his/her bedroom when family friends visit, I would tell my child that he/she is being a baby [FQ4OCCNES12F]'
FQ4OCCNES02AR 'Falls off his/her bike and breaks it and gets upset, I would remain calm and not let myself get anxious [FQ4OCCNES02AR]'
FQ4OCCNES07CR 'About to appear in a recital or sports activity and becomes visibly nervous about people watching, I would remain calm and not get nervous myself [FQ4OCCNES07CR]'
FQ4OCCNES08CR 'Receives an undesirable birthday gift from a friend and looks disappointed,even annoyed,after opening it in the presence of the friend, I would not be annoyed with my child for being rude [FQ4OCCNES08CR]'
FQ4OCCNES10AR 'At a park and appears on the verge of tears because the other children are mean and wont let him/her play with them, I would not get upset myself [FQ4OCCNES10AR]'.
EXECUTE. 

*STEP 10: ADD VALUE LABELS.
*Include missing values like 'Prefer not to Answer' (or something similar) if applicable.
*Include ALL missing value labels (SEE ABOVE FOR FULL LIST).
VALUE LABELS
FQ4OCCNES01A FQ4OCCNES01B FQ4OCCNES01C FQ4OCCNES01D FQ4OCCNES01E FQ4OCCNES01F
FQ4OCCNES02A FQ4OCCNES02B FQ4OCCNES02C FQ4OCCNES02D FQ4OCCNES02E FQ4OCCNES02F 
FQ4OCCNES03A FQ4OCCNES03B FQ4OCCNES03C FQ4OCCNES03D FQ4OCCNES03E FQ4OCCNES03F
FQ4OCCNES04A FQ4OCCNES04B FQ4OCCNES04C FQ4OCCNES04D FQ4OCCNES04E FQ4OCCNES04F 
FQ4OCCNES05A FQ4OCCNES05B FQ4OCCNES05C FQ4OCCNES05D FQ4OCCNES05E FQ4OCCNES05F
FQ4OCCNES06A FQ4OCCNES06B FQ4OCCNES06C FQ4OCCNES06D FQ4OCCNES06E FQ4OCCNES06F
FQ4OCCNES07A FQ4OCCNES07B FQ4OCCNES07C FQ4OCCNES07D FQ4OCCNES07E FQ4OCCNES07F
FQ4OCCNES08A FQ4OCCNES08B FQ4OCCNES08C FQ4OCCNES08D FQ4OCCNES08E FQ4OCCNES08F
FQ4OCCNES09A FQ4OCCNES09B FQ4OCCNES09C FQ4OCCNES09D FQ4OCCNES09E FQ4OCCNES09F
FQ4OCCNES10A FQ4OCCNES10B FQ4OCCNES10C FQ4OCCNES10D FQ4OCCNES10E FQ4OCCNES10F 
FQ4OCCNES11A FQ4OCCNES11B FQ4OCCNES11C FQ4OCCNES11D FQ4OCCNES11E FQ4OCCNES11F
FQ4OCCNES12A FQ4OCCNES12B FQ4OCCNES12C FQ4OCCNES12D FQ4OCCNES12E FQ4OCCNES12F 
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
1 '1-Very Unlikely'
2 '2'
3 '3'
4 '4-Medium Likelihood'
5 '5'
6 '6'
7 '7-Very Likely'.
EXECUTE.

VALUE LABELS
FQ4OCCNES02AR FQ4OCCNES07CR FQ4OCCNES08CR FQ4OCCNES10AR
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
1 '7-Very Likely'
2 '6'
3 '5'
4 '4-Medium'
5 '3'
6 '2'
7 '1-Very Unlikely'.
EXECUTE.

*STEP 11: LABELING MISSING VALUES AS MISSING.
*Recoding all negative numbers as missing.
MISSING VALUES
    FQ4OCCNES01A FQ4OCCNES01B FQ4OCCNES01C FQ4OCCNES01D FQ4OCCNES01E FQ4OCCNES01F
    FQ4OCCNES02A FQ4OCCNES02B FQ4OCCNES02C FQ4OCCNES02D FQ4OCCNES02E FQ4OCCNES02F 
    FQ4OCCNES03A FQ4OCCNES03B FQ4OCCNES03C FQ4OCCNES03D FQ4OCCNES03E FQ4OCCNES03F
    FQ4OCCNES04A FQ4OCCNES04B FQ4OCCNES04C FQ4OCCNES04D FQ4OCCNES04E FQ4OCCNES04F 
    FQ4OCCNES05A FQ4OCCNES05B FQ4OCCNES05C FQ4OCCNES05D FQ4OCCNES05E FQ4OCCNES05F
    FQ4OCCNES06A FQ4OCCNES06B FQ4OCCNES06C FQ4OCCNES06D FQ4OCCNES06E FQ4OCCNES06F
    FQ4OCCNES07A FQ4OCCNES07B FQ4OCCNES07C FQ4OCCNES07D FQ4OCCNES07E FQ4OCCNES07F
    FQ4OCCNES08A FQ4OCCNES08B FQ4OCCNES08C FQ4OCCNES08D FQ4OCCNES08E FQ4OCCNES08F
    FQ4OCCNES09A FQ4OCCNES09B FQ4OCCNES09C FQ4OCCNES09D FQ4OCCNES09E FQ4OCCNES09F
    FQ4OCCNES10A FQ4OCCNES10B FQ4OCCNES10C FQ4OCCNES10D FQ4OCCNES10E FQ4OCCNES10F 
    FQ4OCCNES11A FQ4OCCNES11B FQ4OCCNES11C FQ4OCCNES11D FQ4OCCNES11E FQ4OCCNES11F
    FQ4OCCNES12A FQ4OCCNES12B FQ4OCCNES12C FQ4OCCNES12D FQ4OCCNES12E FQ4OCCNES12F 
    (LO THRU -1). 
EXECUTE.

MISSING VALUES
    FQ4OCCNES02AR FQ4OCCNES07CR FQ4OCCNES08CR FQ4OCCNES10AR
    (LO THRU -1).
EXECUTE.

*STEP 12: SAVE CLEANED DATA FILE.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OCCNES_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.

*STEP 13: CHECK FREQUENCIES.
*Checking frequencies of all items before creating constructs.
*Include STAT variable here to be sure all missingness was coded correctly.
FREQUENCIES VARIABLES=FD4OSTAT FQ4OCCNES01A FQ4OCCNES01B FQ4OCCNES01C FQ4OCCNES01D FQ4OCCNES01E FQ4OCCNES01F
FQ4OCCNES02A FQ4OCCNES02B FQ4OCCNES02C FQ4OCCNES02D FQ4OCCNES02E FQ4OCCNES02F 
FQ4OCCNES03A FQ4OCCNES03B FQ4OCCNES03C FQ4OCCNES03D FQ4OCCNES03E FQ4OCCNES03F
FQ4OCCNES04A FQ4OCCNES04B FQ4OCCNES04C FQ4OCCNES04D FQ4OCCNES04E FQ4OCCNES04F 
FQ4OCCNES05A FQ4OCCNES05B FQ4OCCNES05C FQ4OCCNES05D FQ4OCCNES05E FQ4OCCNES05F
FQ4OCCNES06A FQ4OCCNES06B FQ4OCCNES06C FQ4OCCNES06D FQ4OCCNES06E FQ4OCCNES06F
FQ4OCCNES07A FQ4OCCNES07B FQ4OCCNES07C FQ4OCCNES07D FQ4OCCNES07E FQ4OCCNES07F
FQ4OCCNES08A FQ4OCCNES08B FQ4OCCNES08C FQ4OCCNES08D FQ4OCCNES08E FQ4OCCNES08F
FQ4OCCNES09A FQ4OCCNES09B FQ4OCCNES09C FQ4OCCNES09D FQ4OCCNES09E FQ4OCCNES09F
FQ4OCCNES10A FQ4OCCNES10B FQ4OCCNES10C FQ4OCCNES10D FQ4OCCNES10E FQ4OCCNES10F 
FQ4OCCNES11A FQ4OCCNES11B FQ4OCCNES11C FQ4OCCNES11D FQ4OCCNES11E FQ4OCCNES11F
FQ4OCCNES12A FQ4OCCNES12B FQ4OCCNES12C FQ4OCCNES12D FQ4OCCNES12E FQ4OCCNES12F 
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=
    FD4OSTAT
    FQ4OCCNES02A FQ4OCCNES02AR 
    FQ4OCCNES07C FQ4OCCNES07CR 
    FQ4OCCNES08C FQ4OCCNES08CR 
    FQ4OCCNES10A FQ4OCCNES10AR
  /ORDER=ANALYSIS.

*STEP 14: CHECK DESCRIPTIVES.
*Checking descriptives for all items before creating constructs.
DESCRIPTIVES VARIABLES=FQ4OCCNES01A FQ4OCCNES01B FQ4OCCNES01C FQ4OCCNES01D FQ4OCCNES01E FQ4OCCNES01F
FQ4OCCNES02A FQ4OCCNES02B FQ4OCCNES02C FQ4OCCNES02D FQ4OCCNES02E FQ4OCCNES02F 
FQ4OCCNES03A FQ4OCCNES03B FQ4OCCNES03C FQ4OCCNES03D FQ4OCCNES03E FQ4OCCNES03F
FQ4OCCNES04A FQ4OCCNES04B FQ4OCCNES04C FQ4OCCNES04D FQ4OCCNES04E FQ4OCCNES04F 
FQ4OCCNES05A FQ4OCCNES05B FQ4OCCNES05C FQ4OCCNES05D FQ4OCCNES05E FQ4OCCNES05F
FQ4OCCNES06A FQ4OCCNES06B FQ4OCCNES06C FQ4OCCNES06D FQ4OCCNES06E FQ4OCCNES06F
FQ4OCCNES07A FQ4OCCNES07B FQ4OCCNES07C FQ4OCCNES07D FQ4OCCNES07E FQ4OCCNES07F
FQ4OCCNES08A FQ4OCCNES08B FQ4OCCNES08C FQ4OCCNES08D FQ4OCCNES08E FQ4OCCNES08F
FQ4OCCNES09A FQ4OCCNES09B FQ4OCCNES09C FQ4OCCNES09D FQ4OCCNES09E FQ4OCCNES09F
FQ4OCCNES10A FQ4OCCNES10B FQ4OCCNES10C FQ4OCCNES10D FQ4OCCNES10E FQ4OCCNES10F 
FQ4OCCNES11A FQ4OCCNES11B FQ4OCCNES11C FQ4OCCNES11D FQ4OCCNES11E FQ4OCCNES11F
FQ4OCCNES12A FQ4OCCNES12B FQ4OCCNES12C FQ4OCCNES12D FQ4OCCNES12E FQ4OCCNES12F 
  /STATISTICS=MEAN STDDEV MIN MAX.

DESCRIPTIVES VARIABLES=
    FQ4OCCNES02A FQ4OCCNES02AR 
    FQ4OCCNES07C FQ4OCCNES07CR 
    FQ4OCCNES08C FQ4OCCNES08CR 
    FQ4OCCNES10A FQ4OCCNES10AR
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 15: SAVE CLEANED DATA FILE.
*Sorting the data file by ID and resaving the final file.
*To reorder items, use /KEEP {list all variables in order} -- insert in line after file name.
SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OCCNES_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OCCNES_Cleaned.sav'.
EXECUTE.

*STEP 16: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE
 OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OCCNES_Cleaned.spv'
 LOCK=NO.


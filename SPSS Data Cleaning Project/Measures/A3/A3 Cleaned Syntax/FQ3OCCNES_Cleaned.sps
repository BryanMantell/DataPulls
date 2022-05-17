* Encoding: UTF-8.
*STEP 0: NOTES
*COPING WITH CHILDREN'S NEGATIVE EMOTIONS SCALE (CCNES).
 
*09-30-2021 (AZ): Edited syntax to prepare for T3 data.
*10-11-2021 (AZ): Edited file paths to run T3 data; Edited step 6 to say (8=7) because the values were coded for 8 to equal 7 - Very Likely.
*10-13-2021 (AZ): Edited Step 6 to include SYSMIS to code for blank spaces in data. 
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
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OCCNES_Cleaned.sav'
  /KEEP 
  FQ3ID 
  STARTDATE
  FQ3CCNES1_1 TO FQ3CCNES12_6
  /COMPRESSED.
  EXECUTE.

*STEP 3: OPEN NEW DATA FILE.  
*Insert the correct file path and file name. Open the file you just created and saved so that you are able to clean the data.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OCCNES_Cleaned.sav'.

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
RENAME VARIABLE (STARTDATE=FQ3OCCNESDATE).
EXECUTE.
RENAME VARIABLE (FQ3CCNES1_1 = FQ3OCCNES01A) (FQ3CCNES1_2 = FQ3OCCNES01B) (FQ3CCNES1_3 = FQ3OCCNES01C) (FQ3CCNES1_4 = FQ3OCCNES01D) (FQ3CCNES1_5 = FQ3OCCNES01E) (FQ3CCNES1_6 = FQ3OCCNES01F).
EXECUTE.
RENAME VARIABLE (FQ3CCNES2_1 = FQ3OCCNES02A) (FQ3CCNES2_2 = FQ3OCCNES02B) (FQ3CCNES2_3 = FQ3OCCNES02C) (FQ3CCNES2_4 = FQ3OCCNES02D) (FQ3CCNES2_5 = FQ3OCCNES02E) (FQ3CCNES2_6 = FQ3OCCNES02F).
EXECUTE.
RENAME VARIABLE (FQ3CCNES3_1 = FQ3OCCNES03A) (FQ3CCNES3_2 = FQ3OCCNES03B) (FQ3CCNES3_3 = FQ3OCCNES03C) (FQ3CCNES3_4 = FQ3OCCNES03D) (FQ3CCNES3_5 = FQ3OCCNES03E) (FQ3CCNES3_6 = FQ3OCCNES03F).
EXECUTE.
RENAME VARIABLE (FQ3CCNES4_1 = FQ3OCCNES04A) (FQ3CCNES4_2 = FQ3OCCNES04B) (FQ3CCNES4_3 = FQ3OCCNES04C) (FQ3CCNES4_4 = FQ3OCCNES04D) (FQ3CCNES4_5 = FQ3OCCNES04E) (FQ3CCNES4_6 = FQ3OCCNES04F).
EXECUTE.
RENAME VARIABLE (FQ3CCNES5_1 = FQ3OCCNES05A) (FQ3CCNES5_2 = FQ3OCCNES05B) (FQ3CCNES5_3 = FQ3OCCNES05C) (FQ3CCNES5_4 = FQ3OCCNES05D) (FQ3CCNES5_5 = FQ3OCCNES05E) (FQ3CCNES5_6 = FQ3OCCNES05F).
EXECUTE.
RENAME VARIABLE (FQ3CCNES6_1 = FQ3OCCNES06A) (FQ3CCNES6_2 = FQ3OCCNES06B) (FQ3CCNES6_3 = FQ3OCCNES06C) (FQ3CCNES6_4 = FQ3OCCNES06D) (FQ3CCNES6_5 = FQ3OCCNES06E) (FQ3CCNES6_6 = FQ3OCCNES06F).
EXECUTE.
RENAME VARIABLE (FQ3CCNES7_1 = FQ3OCCNES07A) (FQ3CCNES7_2 = FQ3OCCNES07B) (FQ3CCNES7_3 = FQ3OCCNES07C) (FQ3CCNES7_4 = FQ3OCCNES07D) (FQ3CCNES7_5 = FQ3OCCNES07E) (FQ3CCNES7_6 = FQ3OCCNES07F).
EXECUTE.
RENAME VARIABLE (FQ3CCNES8_1 = FQ3OCCNES08A) (FQ3CCNES8_2 = FQ3OCCNES08B) (FQ3CCNES8_3 = FQ3OCCNES08C) (FQ3CCNES8_4 = FQ3OCCNES08D) (FQ3CCNES8_5 = FQ3OCCNES08E) (FQ3CCNES8_6 = FQ3OCCNES08F).
EXECUTE.
RENAME VARIABLE (FQ3CCNES9_1 = FQ3OCCNES09A) (FQ3CCNES9_2 = FQ3OCCNES09B) (FQ3CCNES9_3 = FQ3OCCNES09C) (FQ3CCNES9_4 = FQ3OCCNES09D) (FQ3CCNES9_5 = FQ3OCCNES09E) (FQ3CCNES9_6 = FQ3OCCNES09F).
EXECUTE.
RENAME VARIABLE (FQ3CCNES10_1 = FQ3OCCNES10A) (FQ3CCNES10_2 = FQ3OCCNES10B) (FQ3CCNES10_3 = FQ3OCCNES10C) (FQ3CCNES10_4 = FQ3OCCNES10D) (FQ3CCNES10_5 = FQ3OCCNES10E) (FQ3CCNES10_6 = FQ3OCCNES10F).
EXECUTE.
RENAME VARIABLE (FQ3CCNES11_1 = FQ3OCCNES11A) (FQ3CCNES11_2 = FQ3OCCNES11B) (FQ3CCNES11_3 = FQ3OCCNES11C) (FQ3CCNES11_4 = FQ3OCCNES11D) (FQ3CCNES11_5 = FQ3OCCNES11E) (FQ3CCNES11_6 = FQ3OCCNES11F).
EXECUTE.
RENAME VARIABLE (FQ3CCNES12_1 = FQ3OCCNES12A) (FQ3CCNES12_2 = FQ3OCCNES12B) (FQ3CCNES12_3 = FQ3OCCNES12C) (FQ3CCNES12_4 = FQ3OCCNES12D) (FQ3CCNES12_5 = FQ3OCCNES12E) (FQ3CCNES12_6 = FQ3OCCNES12F).
EXECUTE.
*Remember to save your data file.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OCCNES_Cleaned.sav'.
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
/FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OCCNES_Cleaned.sav'
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
COMPUTE DATEDIFF = DATEDIFF(FD3ORD,FQ3OCCNESDATE,'days').
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
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OCCNES_Cleaned.sav'
/DROP
FQ3OCCNESDATE
DATEDIFF
DATEDIFF0
f.
EXECUTE.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OCCNES_Cleaned.sav'.
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
RECODE FQ3OCCNES02A (1=7) (2=6) (3=5) (4=4) (5=3) (6=2) (7=1) (-10=-10) INTO FQ3OCCNES02AR.
EXECUTE.
RECODE FQ3OCCNES07C (1=7) (2=6) (3=5) (4=4) (5=3) (6=2) (7=1) (-10=-10) INTO FQ3OCCNES07CR.
EXECUTE.
RECODE FQ3OCCNES08C (1=7) (2=6) (3=5) (4=4) (5=3) (6=2) (7=1) (-10=-10) INTO FQ3OCCNES08CR.
EXECUTE.
RECODE FQ3OCCNES10A (1=7) (2=6) (3=5) (4=4) (5=3) (6=2) (7=1) (-10=-10) INTO FQ3OCCNES10AR.
EXECUTE.

*STEP 7A: RECODING SYSMIS (PARTICIPANTS THAT MISSED THE ASSESSMENT).
*This will use the STAT variable to recode all SYSMIS data. CHANGE THE STAT VARIABLE TO MATCH THE ASSESSMENT WAVE YOU ARE WORKING IN.
*Include full list of numeric variables (including new reverse-scored items).
DO IF MISSING(FD3OSTAT).
DO REPEAT x = FQ3OCCNES01A TO FQ3OCCNES10AR.
RECODE FD3OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.

*90841 skipped a question.
DO IF (ID=90841). 
    RECODE
    FQ3OCCNES07CR FQ3OCCNES07C
    (SYSMIS=-10).
END IF.
EXECUTE.

*91995 skipped a question.
DO IF (ID=91995). 
    RECODE
    FQ3OCCNES09F
    (SYSMIS=-10).
END IF.
EXECUTE.

*90443 skipped a question.
DO IF (ID=90443). 
    RECODE
    FQ3OCCNES05E
    (SYSMIS=-10).
END IF.
EXECUTE.

*90417 skipped a question.
DO IF (ID=90417). 
    RECODE
    FQ3OCCNES04B
    (SYSMIS=-10).
END IF.
EXECUTE.

*STEP 8: STANDARDIZING DECIMAL PLACES (CANNOT INCLUDE TEXT/STRING VARIABLES).
*Making all variables have the same number of decimal places. Ensure that variables include all new reverse-scored variables. Change the number AFTER the decimal place as needed.
FORMATS FQ3OCCNES01A to FQ3OCCNES10AR (F8.0).
EXECUTE.

*STEP 9: CREATING VARIABLE LABLES.
*Label all variables. Use the original questionnaire to include the exact text that participants saw. Include the questionnaire name and number at the end of the label.
VARIABLE LABELS  ID 'Participant ID'.
EXECUTE.

VARIABLE LABELS 
FQ3OCCNES01A 'Angry because cant go to friends birthday party, I would send my child to his/her room to cool off [FQ3OCCNES01A]'
FQ3OCCNES01B 'Angry because cant go to friends birthday party, I would get angry at my child [FQ3OCCNES01B]'
FQ3OCCNES01C 'Angry because cant go to friends birthday party, I would help my child think about ways that he/she can still be with friends [FQ3OCCNES01C]'
FQ3OCCNES01D 'Angry because cant go to friends birthday party, I would tell my child not to make a big deal out of missing the party [FQ3OCCNES01D]'
FQ3OCCNES01E 'Angry because cant go to friends birthday party, I would encourage my child to express his/her feelings of anger and frustration [FQ3OCCNES01E]'
FQ3OCCNES01F 'Angry because cant go to friends birthday party, I would soothe my child and do something fun with him/her to make him/her feel better about missing the party [FQ3OCCNES01F]'
FQ3OCCNES02A 'Falls off his/her bike and breaks it and gets upset, I would remain calm and not let myself get anxious [FQ3OCCNES02A]'
FQ3OCCNES02B 'Falls off his/her bike and breaks it and gets upset, I would comfort my child and try to get him/her to forget about the accident [FQ3OCCNES02B]'
FQ3OCCNES02C 'Falls off his/her bike and breaks it and gets upset, I would tell my child that he/she is overreacting [FQ3OCCNES02C]'
FQ3OCCNES02D 'Falls off his/her bike and breaks it and gets upset, I would help my child figure out how to get the bike fixed [FQ3OCCNES02D]'
FQ3OCCNES02E 'Falls off his/her bike and breaks it and gets upset, I would tell my child its OK to cry [FQ3OCCNES02E]'
FQ3OCCNES02F 'Falls off his/her bike and breaks it and gets upset, I would tell my child to stop crying or he/she wont be allowed to ride his/her bike anytime soon [FQ3OCCNES02F]'
FQ3OCCNES03A 'Loses some prized possession and reacts with tears, I would get upset with him/her for being so careless and then crying about it [FQ3OCCNES03A]'
FQ3OCCNES03B 'Loses some prized possession and reacts with tears, I would tell my child that he/she is overreacting [FQ3OCCNES03B]'
FQ3OCCNES03C 'Loses some prized possession and reacts with tears, I would help my child think of places he/she hasnt looked yet [FQ3OCCNES03C]'
FQ3OCCNES03D 'Loses some prized possession and reacts with tears, I would distract my child by talking about happy things [FQ3OCCNES03D]'
FQ3OCCNES03E 'Loses some prized possession and reacts with tears, I would tell him/her its OK to cry when you feel unhappy [FQ3OCCNES03E]'
FQ3OCCNES03F 'Loses some prized possession and reacts with tears, I would tell him/her thats what happens when youre not careful [FQ3OCCNES03F]'
FQ3OCCNES04A 'Afraid of injections and becomes shaky and teary while waiting for a shot, I would tell him/her to shape up or he/she wont be allowed to do something he/she likes to do [FQ3OCCNES04A]'
FQ3OCCNES04B 'Afraid of injections and becomes shaky and teary while waiting for a shot, I would encourage my child to talk about his/her fears [FQ3OCCNES04B]'
FQ3OCCNES04C 'Afraid of injections and becomes shaky and teary while waiting for a shot, I would tell my child not to make a big deal of the shot [FQ3OCCNES04C]'
FQ3OCCNES04D 'Afraid of injections and becomes shaky and teary while waiting for a shot, I would tell him/her not to embarass us by crying [FQ3OCCNES04D]'
FQ3OCCNES04E 'Afraid of injections and becomes shaky and teary while waiting for a shot, I would comfort him/her before and after the shot [FQ3OCCNES04E]'
FQ3OCCNES04F 'Afraid of injections and becomes shaky and teary while waiting for a shot, I would talk to my child about ways to make it hurt less [FQ3OCCNES04F]'
FQ3OCCNES05A 'Going to a friends house and becomes nervous and upset because I cant stay there with him/her, I would distract my child by talking about all the fun he/she will have with his/her friend [FQ3OCCNES05A]'
FQ3OCCNES05B 'Going to a friends house and becomes nervous and upset because I cant stay there with him/her, I would help my child think of things that he/she could do so that being at the friends house without me wasnt scary [FQ3OCCNES05B]'
FQ3OCCNES05C 'Going to a friends house and becomes nervous and upset because I cant stay there with him/her, I would tell my child to quit overreacting and being a baby [FQ3OCCNES05C]'
FQ3OCCNES05D 'Going to a friends house and becomes nervous and upset because I cant stay there with him/her, I would tell my child that if he/she doesnt stop that he/she wont be allowed to go out anymore [FQ3OCCNES05D]'
FQ3OCCNES05E 'Going to a friends house and becomes nervous and upset because I cant stay there with him/her, I would feel upset and uncomfortable because of my childs reactions [FQ3OCCNES05E]'
FQ3OCCNES05F 'Going to a friends house and becomes nervous and upset because I cant stay there with him/her, I would encourage my child to talk about his/her nervous feelings [FQ3OCCNES05F]'
FQ3OCCNES06A 'Participating in a group activity with friends and makes a mistake and is embarrassed and on the verge of tears, I would comfort my child and try to make him/her feel better [FQ3OCCNES06A]'
FQ3OCCNES06B 'Participating in a group activity with friends and makes a mistake and is embarrassed and on the verge of tears, I would tell my child that he/she is overreacting [FQ3OCCNES06B]'
FQ3OCCNES06C 'Participating in a group activity with friends and makes a mistake and is embarrassed and on the verge of tears, I would feel uncomfortable and embarassed myself [FQ3OCCNES06C]'
FQ3OCCNES06D 'Participating in a group activity with friends and makes a mistake and is embarrassed and on the verge of tears, I would tell my child to straighten up or well go home right away [FQ3OCCNES06D]'
FQ3OCCNES06E 'Participating in a group activity with friends and makes a mistake and is embarrassed and on the verge of tears, I would encourage my child to talk about his/her feelings of embarrassment [FQ3OCCNES06E]'
FQ3OCCNES06F 'Participating in a group activity with friends and makes a mistake and is embarrassed and on the verge of tears, I would tell my child that Ill help him/her practice so that he/she can do better next time [FQ3OCCNES06F]'
FQ3OCCNES07A 'About to appear in a recital or sports activity and becomes visibly nervous about people watching, I would help my child think of things that he/she could do to get ready for his/her turn [FQ3OCCNES07A]'
FQ3OCCNES07B 'About to appear in a recital or sports activity and becomes visibly nervous about people watching, I would suggest that my child think about something relaxing so that his/her nervousness will go away [FQ3OCCNES07B]'
FQ3OCCNES07C 'About to appear in a recital or sports activity and becomes visibly nervous about people watching, I would remain calm and not get nervous myself [FQ3OCCNES07C]'
FQ3OCCNES07D 'About to appear in a recital or sports activity and becomes visibly nervous about people watching, I would tell my child that he/she is being a baby about it [FQ3OCCNES07D]'
FQ3OCCNES07E 'About to appear in a recital or sports activity and becomes visibly nervous about people watching, I would tell my child that if he/she doesnt calm down, well have to leave and go home right away [FQ3OCCNES07E]'
FQ3OCCNES07F 'About to appear in a recital or sports activity and becomes visibly nervous about people watching, I would encourage my child to talk about his/her nervous feelings [FQ3OCCNES07F]'
FQ3OCCNES08A 'Receives an undesirable birthday gift from a friend and looks disappointed,even annoyed,after opening it in the presence of the friend, I would encourage my child to express his/her disappointed feelings [FQ3OCCNES08A]'
FQ3OCCNES08B 'Receives an undesirable birthday gift from a friend and looks disappointed,even annoyed,after opening it in the presence of the friend, I would tell my child that the present can be exchanged for something the child wants [FQ3OCCNES08B]'
FQ3OCCNES08C 'Receives an undesirable birthday gift from a friend and looks disappointed,even annoyed,after opening it in the presence of the friend, I would not be annoyed with my child for being rude [FQ3OCCNES08C]'
FQ3OCCNES08D 'Receives an undesirable birthday gift from a friend and looks disappointed,even annoyed,after opening it in the presence of the friend, I would tell my child that he/she is overreacting [FQ3OCCNES08D]'
FQ3OCCNES08E 'Receives an undesirable birthday gift from a friend and looks disappointed,even annoyed,after opening it in the presence of the friend, I would scold my child for being insensitive to the friends feelings [FQ3OCCNES08E]'
FQ3OCCNES08F 'Receives an undesirable birthday gift from a friend and looks disappointed,even annoyed,after opening it in the presence of the friend, I would try to get my child to feel better by doing something fun [FQ3OCCNES08F]'
FQ3OCCNES09A 'Panicky and cant go to sleep after watching a scary TV show, I would encourage my child to talk about what scared him/her [FQ3OCCNES09A]'
FQ3OCCNES09B 'Panicky and cant go to sleep after watching a scary TV show, I would get upset with him/her for being silly [FQ3OCCNES09B]'
FQ3OCCNES09C 'Panicky and cant go to sleep after watching a scary TV show, I would tell my child that he/she is overreacting [FQ3OCCNES09C]'
FQ3OCCNES09D 'Panicky and cant go to sleep after watching a scary TV show, I would help my child think of something to do so that he/she can get to sleep [FQ3OCCNES09D]'
FQ3OCCNES09E 'Panicky and cant go to sleep after watching a scary TV show, I would tell him/her to go to bed or he/she wont be allowed to watch any more TV [FQ3OCCNES09E]'
FQ3OCCNES09F 'Panicky and cant go to sleep after watching a scary TV show, I would do something fun with my child to help him/her forget about what scared him/her [FQ3OCCNES09F]'
FQ3OCCNES10A 'At a park and appears on the verge of tears because the other children are mean and wont let him/her play with them, I would not get upset myself [FQ3OCCNES10A]'
FQ3OCCNES10B 'At a park and appears on the verge of tears because the other children are mean and wont let him/her play with them, I would tell my child that if he/she starts crying then well have to go home right away [FQ3OCCNES10B]'
FQ3OCCNES10C 'At a park and appears on the verge of tears because the other children are mean and wont let him/her play with them, I would tell my child its OK to cry when he/she feels bad [FQ3OCCNES10C]'
FQ3OCCNES10D 'At a park and appears on the verge of tears because the other children are mean and wont let him/her play with them, I would comfort my child and try to get him/her to think about something happy [FQ3OCCNES10D]'
FQ3OCCNES10E 'At a park and appears on the verge of tears because the other children are mean and wont let him/her play with them, I would help my child think of something else to do [FQ3OCCNES10E]'
FQ3OCCNES10F 'At a park and appears on the verge of tears because the other children are mean and wont let him/her play with them, I would tell my child that he/she will feel better soon [FQ3OCCNES10F]'
FQ3OCCNES11A 'Playing with other children and one of them calls him/her names, and my child then begins to tremble and become tearful, I would tell my child not to make a big deal out of it [FQ3OCCNES11A]'
FQ3OCCNES11B 'Playing with other children and one of them calls him/her names, and my child then begins to tremble and become tearful, I would feel upset myself [FQ3OCCNES11B]'
FQ3OCCNES11C 'Playing with other children and one of them calls him/her names, and my child then begins to tremble and become tearful, I would tell my child to behave or well have to go home right away [FQ3OCCNES11C]'
FQ3OCCNES11D 'Playing with other children and one of them calls him/her names, and my child then begins to tremble and become tearful, I would help my child think of constructive things to do when other children tease him/her [FQ3OCCNES11D]'
FQ3OCCNES11E 'Playing with other children and one of them calls him/her names, and my child then begins to tremble and become tearful, I would comfort him/her and play a game to take his/her mind off the upsetting event [FQ3OCCNES11E]'
FQ3OCCNES11F 'Playing with other children and one of them calls him/her names, and my child then begins to tremble and become tearful, I would encourage him/her to talk about how it hurts to be teased [FQ3OCCNES11F]'
FQ3OCCNES12A 'Shy and scared around strangers and consistently becomes teary and wants to stay in his/her bedroom when family friends visit, I would help my child think of things to do that would make meeting my friends less scary [FQ3OCCNES12A]'
FQ3OCCNES12B 'Shy and scared around strangers and consistently becomes teary and wants to stay in his/her bedroom when family friends visit, I would tell my child that it is OK to feel nervous [FQ3OCCNES12B]'
FQ3OCCNES12C 'Shy and scared around strangers and consistently becomes teary and wants to stay in his/her bedroom when family friends visit, I would try to make my child happy by talking about the fun things we can do with our friends [FQ3OCCNES12C]'
FQ3OCCNES12D 'Shy and scared around strangers and consistently becomes teary and wants to stay in his/her bedroom when family friends visit, I would feel upset and uncomfortable because of my childs reactions [FQ3OCCNES12D]'
FQ3OCCNES12E 'Shy and scared around strangers and consistently becomes teary and wants to stay in his/her bedroom when family friends visit, I would tell my child that he/she must stay in the living room and visit with our friends [FQ3OCCNES12E]'
FQ3OCCNES12F 'Shy and scared around strangers and consistently becomes teary and wants to stay in his/her bedroom when family friends visit, I would tell my child that he/she is being a baby [FQ3OCCNES12F]'
FQ3OCCNES02AR 'Falls off his/her bike and breaks it and gets upset, I would remain calm and not let myself get anxious [FQ3OCCNES02AR]'
FQ3OCCNES07CR 'About to appear in a recital or sports activity and becomes visibly nervous about people watching, I would remain calm and not get nervous myself [FQ3OCCNES07CR]'
FQ3OCCNES08CR 'Receives an undesirable birthday gift from a friend and looks disappointed,even annoyed,after opening it in the presence of the friend, I would not be annoyed with my child for being rude [FQ3OCCNES08CR]'
FQ3OCCNES10AR 'At a park and appears on the verge of tears because the other children are mean and wont let him/her play with them, I would not get upset myself [FQ3OCCNES10AR]'.
EXECUTE. 

*STEP 10: ADD VALUE LABELS.
*Include missing values like 'Prefer not to Answer' (or something similar) if applicable.
*Include ALL missing value labels (SEE ABOVE FOR FULL LIST).
VALUE LABELS
FQ3OCCNES01A FQ3OCCNES01B FQ3OCCNES01C FQ3OCCNES01D FQ3OCCNES01E FQ3OCCNES01F
FQ3OCCNES02A FQ3OCCNES02B FQ3OCCNES02C FQ3OCCNES02D FQ3OCCNES02E FQ3OCCNES02F 
FQ3OCCNES03A FQ3OCCNES03B FQ3OCCNES03C FQ3OCCNES03D FQ3OCCNES03E FQ3OCCNES03F
FQ3OCCNES04A FQ3OCCNES04B FQ3OCCNES04C FQ3OCCNES04D FQ3OCCNES04E FQ3OCCNES04F 
FQ3OCCNES05A FQ3OCCNES05B FQ3OCCNES05C FQ3OCCNES05D FQ3OCCNES05E FQ3OCCNES05F
FQ3OCCNES06A FQ3OCCNES06B FQ3OCCNES06C FQ3OCCNES06D FQ3OCCNES06E FQ3OCCNES06F
FQ3OCCNES07A FQ3OCCNES07B FQ3OCCNES07C FQ3OCCNES07D FQ3OCCNES07E FQ3OCCNES07F
FQ3OCCNES08A FQ3OCCNES08B FQ3OCCNES08C FQ3OCCNES08D FQ3OCCNES08E FQ3OCCNES08F
FQ3OCCNES09A FQ3OCCNES09B FQ3OCCNES09C FQ3OCCNES09D FQ3OCCNES09E FQ3OCCNES09F
FQ3OCCNES10A FQ3OCCNES10B FQ3OCCNES10C FQ3OCCNES10D FQ3OCCNES10E FQ3OCCNES10F 
FQ3OCCNES11A FQ3OCCNES11B FQ3OCCNES11C FQ3OCCNES11D FQ3OCCNES11E FQ3OCCNES11F
FQ3OCCNES12A FQ3OCCNES12B FQ3OCCNES12C FQ3OCCNES12D FQ3OCCNES12E FQ3OCCNES12F 
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
FQ3OCCNES02AR FQ3OCCNES07CR FQ3OCCNES08CR FQ3OCCNES10AR
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
    FQ3OCCNES01A FQ3OCCNES01B FQ3OCCNES01C FQ3OCCNES01D FQ3OCCNES01E FQ3OCCNES01F
    FQ3OCCNES02A FQ3OCCNES02B FQ3OCCNES02C FQ3OCCNES02D FQ3OCCNES02E FQ3OCCNES02F 
    FQ3OCCNES03A FQ3OCCNES03B FQ3OCCNES03C FQ3OCCNES03D FQ3OCCNES03E FQ3OCCNES03F
    FQ3OCCNES04A FQ3OCCNES04B FQ3OCCNES04C FQ3OCCNES04D FQ3OCCNES04E FQ3OCCNES04F 
    FQ3OCCNES05A FQ3OCCNES05B FQ3OCCNES05C FQ3OCCNES05D FQ3OCCNES05E FQ3OCCNES05F
    FQ3OCCNES06A FQ3OCCNES06B FQ3OCCNES06C FQ3OCCNES06D FQ3OCCNES06E FQ3OCCNES06F
    FQ3OCCNES07A FQ3OCCNES07B FQ3OCCNES07C FQ3OCCNES07D FQ3OCCNES07E FQ3OCCNES07F
    FQ3OCCNES08A FQ3OCCNES08B FQ3OCCNES08C FQ3OCCNES08D FQ3OCCNES08E FQ3OCCNES08F
    FQ3OCCNES09A FQ3OCCNES09B FQ3OCCNES09C FQ3OCCNES09D FQ3OCCNES09E FQ3OCCNES09F
    FQ3OCCNES10A FQ3OCCNES10B FQ3OCCNES10C FQ3OCCNES10D FQ3OCCNES10E FQ3OCCNES10F 
    FQ3OCCNES11A FQ3OCCNES11B FQ3OCCNES11C FQ3OCCNES11D FQ3OCCNES11E FQ3OCCNES11F
    FQ3OCCNES12A FQ3OCCNES12B FQ3OCCNES12C FQ3OCCNES12D FQ3OCCNES12E FQ3OCCNES12F 
    (LO THRU -1). 
EXECUTE.

MISSING VALUES
    FQ3OCCNES02AR FQ3OCCNES07CR FQ3OCCNES08CR FQ3OCCNES10AR
    (LO THRU -1).
EXECUTE.

*STEP 12: SAVE CLEANED DATA FILE.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OCCNES_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.

*STEP 13: CHECK FREQUENCIES.
*Checking frequencies of all items before creating constructs.
*Include STAT variable here to be sure all missingness was coded correctly.
FREQUENCIES VARIABLES=FD3OSTAT FQ3OCCNES01A FQ3OCCNES01B FQ3OCCNES01C FQ3OCCNES01D FQ3OCCNES01E FQ3OCCNES01F
FQ3OCCNES02A FQ3OCCNES02B FQ3OCCNES02C FQ3OCCNES02D FQ3OCCNES02E FQ3OCCNES02F 
FQ3OCCNES03A FQ3OCCNES03B FQ3OCCNES03C FQ3OCCNES03D FQ3OCCNES03E FQ3OCCNES03F
FQ3OCCNES04A FQ3OCCNES04B FQ3OCCNES04C FQ3OCCNES04D FQ3OCCNES04E FQ3OCCNES04F 
FQ3OCCNES05A FQ3OCCNES05B FQ3OCCNES05C FQ3OCCNES05D FQ3OCCNES05E FQ3OCCNES05F
FQ3OCCNES06A FQ3OCCNES06B FQ3OCCNES06C FQ3OCCNES06D FQ3OCCNES06E FQ3OCCNES06F
FQ3OCCNES07A FQ3OCCNES07B FQ3OCCNES07C FQ3OCCNES07D FQ3OCCNES07E FQ3OCCNES07F
FQ3OCCNES08A FQ3OCCNES08B FQ3OCCNES08C FQ3OCCNES08D FQ3OCCNES08E FQ3OCCNES08F
FQ3OCCNES09A FQ3OCCNES09B FQ3OCCNES09C FQ3OCCNES09D FQ3OCCNES09E FQ3OCCNES09F
FQ3OCCNES10A FQ3OCCNES10B FQ3OCCNES10C FQ3OCCNES10D FQ3OCCNES10E FQ3OCCNES10F 
FQ3OCCNES11A FQ3OCCNES11B FQ3OCCNES11C FQ3OCCNES11D FQ3OCCNES11E FQ3OCCNES11F
FQ3OCCNES12A FQ3OCCNES12B FQ3OCCNES12C FQ3OCCNES12D FQ3OCCNES12E FQ3OCCNES12F 
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=
    FD3OSTAT
    FQ3OCCNES02A FQ3OCCNES02AR 
    FQ3OCCNES07C FQ3OCCNES07CR 
    FQ3OCCNES08C FQ3OCCNES08CR 
    FQ3OCCNES10A FQ3OCCNES10AR
  /ORDER=ANALYSIS.

*STEP 14: CHECK DESCRIPTIVES.
*Checking descriptives for all items before creating constructs.
DESCRIPTIVES VARIABLES=FQ3OCCNES01A FQ3OCCNES01B FQ3OCCNES01C FQ3OCCNES01D FQ3OCCNES01E FQ3OCCNES01F
FQ3OCCNES02A FQ3OCCNES02B FQ3OCCNES02C FQ3OCCNES02D FQ3OCCNES02E FQ3OCCNES02F 
FQ3OCCNES03A FQ3OCCNES03B FQ3OCCNES03C FQ3OCCNES03D FQ3OCCNES03E FQ3OCCNES03F
FQ3OCCNES04A FQ3OCCNES04B FQ3OCCNES04C FQ3OCCNES04D FQ3OCCNES04E FQ3OCCNES04F 
FQ3OCCNES05A FQ3OCCNES05B FQ3OCCNES05C FQ3OCCNES05D FQ3OCCNES05E FQ3OCCNES05F
FQ3OCCNES06A FQ3OCCNES06B FQ3OCCNES06C FQ3OCCNES06D FQ3OCCNES06E FQ3OCCNES06F
FQ3OCCNES07A FQ3OCCNES07B FQ3OCCNES07C FQ3OCCNES07D FQ3OCCNES07E FQ3OCCNES07F
FQ3OCCNES08A FQ3OCCNES08B FQ3OCCNES08C FQ3OCCNES08D FQ3OCCNES08E FQ3OCCNES08F
FQ3OCCNES09A FQ3OCCNES09B FQ3OCCNES09C FQ3OCCNES09D FQ3OCCNES09E FQ3OCCNES09F
FQ3OCCNES10A FQ3OCCNES10B FQ3OCCNES10C FQ3OCCNES10D FQ3OCCNES10E FQ3OCCNES10F 
FQ3OCCNES11A FQ3OCCNES11B FQ3OCCNES11C FQ3OCCNES11D FQ3OCCNES11E FQ3OCCNES11F
FQ3OCCNES12A FQ3OCCNES12B FQ3OCCNES12C FQ3OCCNES12D FQ3OCCNES12E FQ3OCCNES12F 
  /STATISTICS=MEAN STDDEV MIN MAX.

DESCRIPTIVES VARIABLES=
    FQ3OCCNES02A FQ3OCCNES02AR 
    FQ3OCCNES07C FQ3OCCNES07CR 
    FQ3OCCNES08C FQ3OCCNES08CR 
    FQ3OCCNES10A FQ3OCCNES10AR
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 15: SAVE CLEANED DATA FILE.
*Sorting the data file by ID and resaving the final file.
*To reorder items, use /KEEP {list all variables in order} -- insert in line after file name.
SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OCCNES_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OCCNES_Cleaned.sav'.
EXECUTE.

*STEP 16: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE
 OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OCCNES_Cleaned.spv'
 LOCK=NO.


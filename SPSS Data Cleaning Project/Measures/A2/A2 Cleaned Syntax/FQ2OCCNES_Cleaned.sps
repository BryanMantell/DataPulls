* Encoding: UTF-8.
*STEP 0: NOTES
*COPING WITH CHILDREN'S NEGATIVE EMOTIONS SCALE (CCNES).
 
*07-26-21(JL): Adapting template for CCNES.
*07-29-21(JL): Edited syntax for STEP 10.
*08-24-21(AZ): Adapted for UO
*09-01-21(AZ): Edited STEPS 6, 7, and 10 to separate prefer not to answer options in question 10; 
Edited STEPS 6, 7, and 10 back to not separating prefer not to answer options after documenting numbers
*11-10-21(AZ): Edited syntax to include new Steps (end of 5d, 5A, 7A, 10b, 11, 13ab, 15da)
*11-10-21(AAC): Checked. Added comment from BM for date discrepancies in 5A. Updated full list of missing codes in STEP 6.
*11-19-21(AZ): Edited and ran syntax for T2.
*12-06-21(AZ): Edited file path to new raw data file and ran syntax for T2. 
*1-13-22(BM): Checked and Edited comment in STEP 5A.
*1-20-22(AAC): CHECKED. Updated notes in STEP 11 and STEP 13 to match template. 
*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------.
*STEP 1: OPENING RAW DATA.
*Insert the correct file path and file name. Use syntax to open raw data file.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/DBT Moms R01 Study Time 2 Mother Survey_December 3, 2021_13.49.sav'.

*STEP 2: SAVING QUESTIONNAIRE SPECIFIC RAW DATA. 
*Insert the correct file path and file name. Save this file with only those variables that you need, in the following order; ID, Start Date, Questionnaire Items (i.e., DERS_1 to DERS_36).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OCCNES_Cleaned.sav'
  /KEEP 
  FQ2ID 
  STARTDATE
  FQ2CCNES1_1 TO FQ2CCNES12_6
  /COMPRESSED.
  EXECUTE.

*STEP 3: OPEN NEW DATA FILE.  
*Insert the correct file path and file name. Open the file you just created and saved so that you are able to clean the data.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OCCNES_Cleaned.sav'.

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
RENAME VARIABLE (STARTDATE=FQ2OCCNESDATE).
EXECUTE.
RENAME VARIABLE (FQ2CCNES1_1 = FQ2OCCNES01A) (FQ2CCNES1_2 = FQ2OCCNES01B) (FQ2CCNES1_3 = FQ2OCCNES01C) (FQ2CCNES1_4 = FQ2OCCNES01D) (FQ2CCNES1_5 = FQ2OCCNES01E) (FQ2CCNES1_6 = FQ2OCCNES01F).
EXECUTE.
RENAME VARIABLE (FQ2CCNES2_1 = FQ2OCCNES02A) (FQ2CCNES2_2 = FQ2OCCNES02B) (FQ2CCNES2_3 = FQ2OCCNES02C) (FQ2CCNES2_4 = FQ2OCCNES02D) (FQ2CCNES2_5 = FQ2OCCNES02E) (FQ2CCNES2_6 = FQ2OCCNES02F).
EXECUTE.
RENAME VARIABLE (FQ2CCNES3_1 = FQ2OCCNES03A) (FQ2CCNES3_2 = FQ2OCCNES03B) (FQ2CCNES3_3 = FQ2OCCNES03C) (FQ2CCNES3_4 = FQ2OCCNES03D) (FQ2CCNES3_5 = FQ2OCCNES03E) (FQ2CCNES3_6 = FQ2OCCNES03F).
EXECUTE.
RENAME VARIABLE (FQ2CCNES4_1 = FQ2OCCNES04A) (FQ2CCNES4_2 = FQ2OCCNES04B) (FQ2CCNES4_3 = FQ2OCCNES04C) (FQ2CCNES4_4 = FQ2OCCNES04D) (FQ2CCNES4_5 = FQ2OCCNES04E) (FQ2CCNES4_6 = FQ2OCCNES04F).
EXECUTE.
RENAME VARIABLE (FQ2CCNES5_1 = FQ2OCCNES05A) (FQ2CCNES5_2 = FQ2OCCNES05B) (FQ2CCNES5_3 = FQ2OCCNES05C) (FQ2CCNES5_4 = FQ2OCCNES05D) (FQ2CCNES5_5 = FQ2OCCNES05E) (FQ2CCNES5_6 = FQ2OCCNES05F).
EXECUTE.
RENAME VARIABLE (FQ2CCNES6_1 = FQ2OCCNES06A) (FQ2CCNES6_2 = FQ2OCCNES06B) (FQ2CCNES6_3 = FQ2OCCNES06C) (FQ2CCNES6_4 = FQ2OCCNES06D) (FQ2CCNES6_5 = FQ2OCCNES06E) (FQ2CCNES6_6 = FQ2OCCNES06F).
EXECUTE.
RENAME VARIABLE (FQ2CCNES7_1 = FQ2OCCNES07A) (FQ2CCNES7_2 = FQ2OCCNES07B) (FQ2CCNES7_3 = FQ2OCCNES07C) (FQ2CCNES7_4 = FQ2OCCNES07D) (FQ2CCNES7_5 = FQ2OCCNES07E) (FQ2CCNES7_6 = FQ2OCCNES07F).
EXECUTE.
RENAME VARIABLE (FQ2CCNES8_1 = FQ2OCCNES08A) (FQ2CCNES8_2 = FQ2OCCNES08B) (FQ2CCNES8_3 = FQ2OCCNES08C) (FQ2CCNES8_4 = FQ2OCCNES08D) (FQ2CCNES8_5 = FQ2OCCNES08E) (FQ2CCNES8_6 = FQ2OCCNES08F).
EXECUTE.
RENAME VARIABLE (FQ2CCNES9_1 = FQ2OCCNES09A) (FQ2CCNES9_2 = FQ2OCCNES09B) (FQ2CCNES9_3 = FQ2OCCNES09C) (FQ2CCNES9_4 = FQ2OCCNES09D) (FQ2CCNES9_5 = FQ2OCCNES09E) (FQ2CCNES9_6 = FQ2OCCNES09F).
EXECUTE.
RENAME VARIABLE (FQ2CCNES10_1 = FQ2OCCNES10A) (FQ2CCNES10_2 = FQ2OCCNES10B) (FQ2CCNES10_3 = FQ2OCCNES10C) (FQ2CCNES10_4 = FQ2OCCNES10D) (FQ2CCNES10_5 = FQ2OCCNES10E) (FQ2CCNES10_6 = FQ2OCCNES10F).
EXECUTE.
RENAME VARIABLE (FQ2CCNES11_1 = FQ2OCCNES11A) (FQ2CCNES11_2 = FQ2OCCNES11B) (FQ2CCNES11_3 = FQ2OCCNES11C) (FQ2CCNES11_4 = FQ2OCCNES11D) (FQ2CCNES11_5 = FQ2OCCNES11E) (FQ2CCNES11_6 = FQ2OCCNES11F).
EXECUTE.
RENAME VARIABLE (FQ2CCNES12_1 = FQ2OCCNES12A) (FQ2CCNES12_2 = FQ2OCCNES12B) (FQ2CCNES12_3 = FQ2OCCNES12C) (FQ2CCNES12_4 = FQ2OCCNES12D) (FQ2CCNES12_5 = FQ2OCCNES12E) (FQ2CCNES12_6 = FQ2OCCNES12F).
EXECUTE.
*Remember to save your data file.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OCCNES_Cleaned.sav'.
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
/FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OCCNES_Cleaned.sav'
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
COMPUTE DATEDIFF = DATEDIFF(FD2ORD,FQ2OCCNESDATE,'days').
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
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OCCNES_Cleaned.sav'
/DROP
FQ2OCCNESDATE
DATEDIFF
DATEDIFF0
f.
EXECUTE.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OCCNES_Cleaned.sav'.
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
**-11 'Participant (parent or child) deceased'                                 /* (Participant (parent or child) deceased) */
**-10 'Prefer not to answer'                                                           /* (Participant selected prefer not to answer) */.
*CHECKED AND NOT NEEDED.
    
**STEP 7 (DELETE IF NOT NEEDED): CREATING NEW VARIABLES FOR REVERSED SCORED ITEMS.
**Reverse-Scored Items; see scoring document to determine if there are reverse-scored items. If no reverse-scored items, delete this syntax.
RECODE FQ2OCCNES02A (1=7) (2=6) (3=5) (4=4) (5=3) (6=2) (7=1) (-10=-10) INTO FQ2OCCNES02AR.
EXECUTE.
RECODE FQ2OCCNES07C (1=7) (2=6) (3=5) (4=4) (5=3) (6=2) (7=1) (-10=-10) INTO FQ2OCCNES07CR.
EXECUTE.
RECODE FQ2OCCNES08C (1=7) (2=6) (3=5) (4=4) (5=3) (6=2) (7=1) (-10=-10) INTO FQ2OCCNES08CR.
EXECUTE.
RECODE FQ2OCCNES10A (1=7) (2=6) (3=5) (4=4) (5=3) (6=2) (7=1) (-10=-10) INTO FQ2OCCNES10AR.
EXECUTE.

*STEP 7A: RECODING SYSMIS (PARTICIPANTS THAT MISSED THE ASSESSMENT).
*This will use the STAT variable to recode all SYSMIS data. CHANGE THE STAT VARIABLE TO MATCH THE ASSESSMENT WAVE YOU ARE WORKING IN.
*Include full list of numeric variables (including new reverse-scored items).
DO IF MISSING(FD2OSTAT).
DO REPEAT x = FQ2OCCNES01A TO FQ2OCCNES10AR.
RECODE FD2OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.

*STEP 8: STANDARDIZING DECIMAL PLACES (CANNOT INCLUDE TEXT/STRING VARIABLES).
*Making all variables have the same number of decimal places. Ensure that variables include all new reverse-scored variables. Change the number AFTER the decimal place as needed.
FORMATS FQ2OCCNES01A to FQ2OCCNES10AR (F8.0).
EXECUTE.

*STEP 9: CREATING VARIABLE LABLES.
*Label all variables. Use the original questionnaire to include the exact text that participants saw. Include the questionnaire name and number at the end of the label.
VARIABLE LABELS  ID 'Participant ID'.
EXECUTE.

VARIABLE LABELS 
FQ2OCCNES01A 'Angry because cant go to friends birthday party, I would send my child to his/her room to cool off [FQ2OCCNES01A]'
FQ2OCCNES01B 'Angry because cant go to friends birthday party, I would get angry at my child [FQ2OCCNES01B]'
FQ2OCCNES01C 'Angry because cant go to friends birthday party, I would help my child think about ways that he/she can still be with friends [FQ2OCCNES01C]'
FQ2OCCNES01D 'Angry because cant go to friends birthday party, I would tell my child not to make a big deal out of missing the party [FQ2OCCNES01D]'
FQ2OCCNES01E 'Angry because cant go to friends birthday party, I would encourage my child to express his/her feelings of anger and frustration [FQ2OCCNES01E]'
FQ2OCCNES01F 'Angry because cant go to friends birthday party, I would soothe my child and do something fun with him/her to make him/her feel better about missing the party [FQ2OCCNES01F]'
FQ2OCCNES02A 'Falls off his/her bike and breaks it and gets upset, I would remain calm and not let myself get anxious [FQ2OCCNES02A]'
FQ2OCCNES02B 'Falls off his/her bike and breaks it and gets upset, I would comfort my child and try to get him/her to forget about the accident [FQ2OCCNES02B]'
FQ2OCCNES02C 'Falls off his/her bike and breaks it and gets upset, I would tell my child that he/she is overreacting [FQ2OCCNES02C]'
FQ2OCCNES02D 'Falls off his/her bike and breaks it and gets upset, I would help my child figure out how to get the bike fixed [FQ2OCCNES02D]'
FQ2OCCNES02E 'Falls off his/her bike and breaks it and gets upset, I would tell my child its OK to cry [FQ2OCCNES02E]'
FQ2OCCNES02F 'Falls off his/her bike and breaks it and gets upset, I would tell my child to stop crying or he/she wont be allowed to ride his/her bike anytime soon [FQ2OCCNES02F]'
FQ2OCCNES03A 'Loses some prized possession and reacts with tears, I would get upset with him/her for being so careless and then crying about it [FQ2OCCNES03A]'
FQ2OCCNES03B 'Loses some prized possession and reacts with tears, I would tell my child that he/she is overreacting [FQ2OCCNES03B]'
FQ2OCCNES03C 'Loses some prized possession and reacts with tears, I would help my child think of places he/she hasnt looked yet [FQ2OCCNES03C]'
FQ2OCCNES03D 'Loses some prized possession and reacts with tears, I would distract my child by talking about happy things [FQ2OCCNES03D]'
FQ2OCCNES03E 'Loses some prized possession and reacts with tears, I would tell him/her its OK to cry when you feel unhappy [FQ2OCCNES03E]'
FQ2OCCNES03F 'Loses some prized possession and reacts with tears, I would tell him/her thats what happens when youre not careful [FQ2OCCNES03F]'
FQ2OCCNES04A 'Afraid of injections and becomes shaky and teary while waiting for a shot, I would tell him/her to shape up or he/she wont be allowed to do something he/she likes to do [FQ2OCCNES04A]'
FQ2OCCNES04B 'Afraid of injections and becomes shaky and teary while waiting for a shot, I would encourage my child to talk about his/her fears [FQ2OCCNES04B]'
FQ2OCCNES04C 'Afraid of injections and becomes shaky and teary while waiting for a shot, I would tell my child not to make a big deal of the shot [FQ2OCCNES04C]'
FQ2OCCNES04D 'Afraid of injections and becomes shaky and teary while waiting for a shot, I would tell him/her not to embarass us by crying [FQ2OCCNES04D]'
FQ2OCCNES04E 'Afraid of injections and becomes shaky and teary while waiting for a shot, I would comfort him/her before and after the shot [FQ2OCCNES04E]'
FQ2OCCNES04F 'Afraid of injections and becomes shaky and teary while waiting for a shot, I would talk to my child about ways to make it hurt less [FQ2OCCNES04F]'
FQ2OCCNES05A 'Going to a friends house and becomes nervous and upset because I cant stay there with him/her, I would distract my child by talking about all the fun he/she will have with his/her friend [FQ2OCCNES05A]'
FQ2OCCNES05B 'Going to a friends house and becomes nervous and upset because I cant stay there with him/her, I would help my child think of things that he/she could do so that being at the friends house without me wasnt scary [FQ2OCCNES05B]'
FQ2OCCNES05C 'Going to a friends house and becomes nervous and upset because I cant stay there with him/her, I would tell my child to quit overreacting and being a baby [FQ2OCCNES05C]'
FQ2OCCNES05D 'Going to a friends house and becomes nervous and upset because I cant stay there with him/her, I would tell my child that if he/she doesnt stop that he/she wont be allowed to go out anymore [FQ2OCCNES05D]'
FQ2OCCNES05E 'Going to a friends house and becomes nervous and upset because I cant stay there with him/her, I would feel upset and uncomfortable because of my childs reactions [FQ2OCCNES05E]'
FQ2OCCNES05F 'Going to a friends house and becomes nervous and upset because I cant stay there with him/her, I would encourage my child to talk about his/her nervous feelings [FQ2OCCNES05F]'
FQ2OCCNES06A 'Participating in a group activity with friends and makes a mistake and is embarrassed and on the verge of tears, I would comfort my child and try to make him/her feel better [FQ2OCCNES06A]'
FQ2OCCNES06B 'Participating in a group activity with friends and makes a mistake and is embarrassed and on the verge of tears, I would tell my child that he/she is overreacting [FQ2OCCNES06B]'
FQ2OCCNES06C 'Participating in a group activity with friends and makes a mistake and is embarrassed and on the verge of tears, I would feel uncomfortable and embarassed myself [FQ2OCCNES06C]'
FQ2OCCNES06D 'Participating in a group activity with friends and makes a mistake and is embarrassed and on the verge of tears, I would tell my child to straighten up or well go home right away [FQ2OCCNES06D]'
FQ2OCCNES06E 'Participating in a group activity with friends and makes a mistake and is embarrassed and on the verge of tears, I would encourage my child to talk about his/her feelings of embarrassment [FQ2OCCNES06E]'
FQ2OCCNES06F 'Participating in a group activity with friends and makes a mistake and is embarrassed and on the verge of tears, I would tell my child that Ill help him/her practice so that he/she can do better next time [FQ2OCCNES06F]'
FQ2OCCNES07A 'About to appear in a recital or sports activity and becomes visibly nervous about people watching, I would help my child think of things that he/she could do to get ready for his/her turn [FQ2OCCNES07A]'
FQ2OCCNES07B 'About to appear in a recital or sports activity and becomes visibly nervous about people watching, I would suggest that my child think about something relaxing so that his/her nervousness will go away [FQ2OCCNES07B]'
FQ2OCCNES07C 'About to appear in a recital or sports activity and becomes visibly nervous about people watching, I would remain calm and not get nervous myself [FQ2OCCNES07C]'
FQ2OCCNES07D 'About to appear in a recital or sports activity and becomes visibly nervous about people watching, I would tell my child that he/she is being a baby about it [FQ2OCCNES07D]'
FQ2OCCNES07E 'About to appear in a recital or sports activity and becomes visibly nervous about people watching, I would tell my child that if he/she doesnt calm down, well have to leave and go home right away [FQ2OCCNES07E]'
FQ2OCCNES07F 'About to appear in a recital or sports activity and becomes visibly nervous about people watching, I would encourage my child to talk about his/her nervous feelings [FQ2OCCNES07F]'
FQ2OCCNES08A 'Receives an undesirable birthday gift from a friend and looks disappointed,even annoyed,after opening it in the presence of the friend, I would encourage my child to express his/her disappointed feelings [FQ2OCCNES08A]'
FQ2OCCNES08B 'Receives an undesirable birthday gift from a friend and looks disappointed,even annoyed,after opening it in the presence of the friend, I would tell my child that the present can be exchanged for something the child wants [FQ2OCCNES08B]'
FQ2OCCNES08C 'Receives an undesirable birthday gift from a friend and looks disappointed,even annoyed,after opening it in the presence of the friend, I would not be annoyed with my child for being rude [FQ2OCCNES08C]'
FQ2OCCNES08D 'Receives an undesirable birthday gift from a friend and looks disappointed,even annoyed,after opening it in the presence of the friend, I would tell my child that he/she is overreacting [FQ2OCCNES08D]'
FQ2OCCNES08E 'Receives an undesirable birthday gift from a friend and looks disappointed,even annoyed,after opening it in the presence of the friend, I would scold my child for being insensitive to the friends feelings [FQ2OCCNES08E]'
FQ2OCCNES08F 'Receives an undesirable birthday gift from a friend and looks disappointed,even annoyed,after opening it in the presence of the friend, I would try to get my child to feel better by doing something fun [FQ2OCCNES08F]'
FQ2OCCNES09A 'Panicky and cant go to sleep after watching a scary TV show, I would encourage my child to talk about what scared him/her [FQ2OCCNES09A]'
FQ2OCCNES09B 'Panicky and cant go to sleep after watching a scary TV show, I would get upset with him/her for being silly [FQ2OCCNES09B]'
FQ2OCCNES09C 'Panicky and cant go to sleep after watching a scary TV show, I would tell my child that he/she is overreacting [FQ2OCCNES09C]'
FQ2OCCNES09D 'Panicky and cant go to sleep after watching a scary TV show, I would help my child think of something to do so that he/she can get to sleep [FQ2OCCNES09D]'
FQ2OCCNES09E 'Panicky and cant go to sleep after watching a scary TV show, I would tell him/her to go to bed or he/she wont be allowed to watch any more TV [FQ2OCCNES09E]'
FQ2OCCNES09F 'Panicky and cant go to sleep after watching a scary TV show, I would do something fun with my child to help him/her forget about what scared him/her [FQ2OCCNES09F]'
FQ2OCCNES10A 'At a park and appears on the verge of tears because the other children are mean and wont let him/her play with them, I would not get upset myself [FQ2OCCNES10A]'
FQ2OCCNES10B 'At a park and appears on the verge of tears because the other children are mean and wont let him/her play with them, I would tell my child that if he/she starts crying then well have to go home right away [FQ2OCCNES10B]'
FQ2OCCNES10C 'At a park and appears on the verge of tears because the other children are mean and wont let him/her play with them, I would tell my child its OK to cry when he/she feels bad [FQ2OCCNES10C]'
FQ2OCCNES10D 'At a park and appears on the verge of tears because the other children are mean and wont let him/her play with them, I would comfort my child and try to get him/her to think about something happy [FQ2OCCNES10D]'
FQ2OCCNES10E 'At a park and appears on the verge of tears because the other children are mean and wont let him/her play with them, I would help my child think of something else to do [FQ2OCCNES10E]'
FQ2OCCNES10F 'At a park and appears on the verge of tears because the other children are mean and wont let him/her play with them, I would tell my child that he/she will feel better soon [FQ2OCCNES10F]'
FQ2OCCNES11A 'Playing with other children and one of them calls him/her names, and my child then begins to tremble and become tearful, I would tell my child not to make a big deal out of it [FQ2OCCNES11A]'
FQ2OCCNES11B 'Playing with other children and one of them calls him/her names, and my child then begins to tremble and become tearful, I would feel upset myself [FQ2OCCNES11B]'
FQ2OCCNES11C 'Playing with other children and one of them calls him/her names, and my child then begins to tremble and become tearful, I would tell my child to behave or well have to go home right away [FQ2OCCNES11C]'
FQ2OCCNES11D 'Playing with other children and one of them calls him/her names, and my child then begins to tremble and become tearful, I would help my child think of constructive things to do when other children tease him/her [FQ2OCCNES11D]'
FQ2OCCNES11E 'Playing with other children and one of them calls him/her names, and my child then begins to tremble and become tearful, I would comfort him/her and play a game to take his/her mind off the upsetting event [FQ2OCCNES11E]'
FQ2OCCNES11F 'Playing with other children and one of them calls him/her names, and my child then begins to tremble and become tearful, I would encourage him/her to talk about how it hurts to be teased [FQ2OCCNES11F]'
FQ2OCCNES12A 'Shy and scared around strangers and consistently becomes teary and wants to stay in his/her bedroom when family friends visit, I would help my child think of things to do that would make meeting my friends less scary [FQ2OCCNES12A]'
FQ2OCCNES12B 'Shy and scared around strangers and consistently becomes teary and wants to stay in his/her bedroom when family friends visit, I would tell my child that it is OK to feel nervous [FQ2OCCNES12B]'
FQ2OCCNES12C 'Shy and scared around strangers and consistently becomes teary and wants to stay in his/her bedroom when family friends visit, I would try to make my child happy by talking about the fun things we can do with our friends [FQ2OCCNES12C]'
FQ2OCCNES12D 'Shy and scared around strangers and consistently becomes teary and wants to stay in his/her bedroom when family friends visit, I would feel upset and uncomfortable because of my childs reactions [FQ2OCCNES12D]'
FQ2OCCNES12E 'Shy and scared around strangers and consistently becomes teary and wants to stay in his/her bedroom when family friends visit, I would tell my child that he/she must stay in the living room and visit with our friends [FQ2OCCNES12E]'
FQ2OCCNES12F 'Shy and scared around strangers and consistently becomes teary and wants to stay in his/her bedroom when family friends visit, I would tell my child that he/she is being a baby [FQ2OCCNES12F]'
FQ2OCCNES02AR 'Falls off his/her bike and breaks it and gets upset, I would remain calm and not let myself get anxious [FQ2OCCNES02AR]'
FQ2OCCNES07CR 'About to appear in a recital or sports activity and becomes visibly nervous about people watching, I would remain calm and not get nervous myself [FQ2OCCNES07CR]'
FQ2OCCNES08CR 'Receives an undesirable birthday gift from a friend and looks disappointed,even annoyed,after opening it in the presence of the friend, I would not be annoyed with my child for being rude [FQ2OCCNES08CR]'
FQ2OCCNES10AR 'At a park and appears on the verge of tears because the other children are mean and wont let him/her play with them, I would not get upset myself [FQ2OCCNES10AR]'.
EXECUTE. 

*STEP 10: ADD VALUE LABELS.
*Include missing values like 'Prefer not to Answer' (or something similar) if applicable.
*Include ALL missing value labels (SEE ABOVE FOR FULL LIST).
VALUE LABELS
FQ2OCCNES01A FQ2OCCNES01B FQ2OCCNES01C FQ2OCCNES01D FQ2OCCNES01E FQ2OCCNES01F
FQ2OCCNES02A FQ2OCCNES02B FQ2OCCNES02C FQ2OCCNES02D FQ2OCCNES02E FQ2OCCNES02F 
FQ2OCCNES03A FQ2OCCNES03B FQ2OCCNES03C FQ2OCCNES03D FQ2OCCNES03E FQ2OCCNES03F
FQ2OCCNES04A FQ2OCCNES04B FQ2OCCNES04C FQ2OCCNES04D FQ2OCCNES04E FQ2OCCNES04F 
FQ2OCCNES05A FQ2OCCNES05B FQ2OCCNES05C FQ2OCCNES05D FQ2OCCNES05E FQ2OCCNES05F
FQ2OCCNES06A FQ2OCCNES06B FQ2OCCNES06C FQ2OCCNES06D FQ2OCCNES06E FQ2OCCNES06F
FQ2OCCNES07A FQ2OCCNES07B FQ2OCCNES07C FQ2OCCNES07D FQ2OCCNES07E FQ2OCCNES07F
FQ2OCCNES08A FQ2OCCNES08B FQ2OCCNES08C FQ2OCCNES08D FQ2OCCNES08E FQ2OCCNES08F
FQ2OCCNES09A FQ2OCCNES09B FQ2OCCNES09C FQ2OCCNES09D FQ2OCCNES09E FQ2OCCNES09F
FQ2OCCNES10A FQ2OCCNES10B FQ2OCCNES10C FQ2OCCNES10D FQ2OCCNES10E FQ2OCCNES10F 
FQ2OCCNES11A FQ2OCCNES11B FQ2OCCNES11C FQ2OCCNES11D FQ2OCCNES11E FQ2OCCNES11F
FQ2OCCNES12A FQ2OCCNES12B FQ2OCCNES12C FQ2OCCNES12D FQ2OCCNES12E FQ2OCCNES12F 
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
1 '1-Very Unlikely'
2 '2'
3 '3'
4 '4-Medium Likelihood'
5 '5'
6 '6'
7 '7-Very Likely'.
EXECUTE.

VALUE LABELS
FQ2OCCNES02AR FQ2OCCNES07CR FQ2OCCNES08CR FQ2OCCNES10AR
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
    FQ2OCCNES01A FQ2OCCNES01B FQ2OCCNES01C FQ2OCCNES01D FQ2OCCNES01E FQ2OCCNES01F
    FQ2OCCNES02A FQ2OCCNES02B FQ2OCCNES02C FQ2OCCNES02D FQ2OCCNES02E FQ2OCCNES02F 
    FQ2OCCNES03A FQ2OCCNES03B FQ2OCCNES03C FQ2OCCNES03D FQ2OCCNES03E FQ2OCCNES03F
    FQ2OCCNES04A FQ2OCCNES04B FQ2OCCNES04C FQ2OCCNES04D FQ2OCCNES04E FQ2OCCNES04F 
    FQ2OCCNES05A FQ2OCCNES05B FQ2OCCNES05C FQ2OCCNES05D FQ2OCCNES05E FQ2OCCNES05F
    FQ2OCCNES06A FQ2OCCNES06B FQ2OCCNES06C FQ2OCCNES06D FQ2OCCNES06E FQ2OCCNES06F
    FQ2OCCNES07A FQ2OCCNES07B FQ2OCCNES07C FQ2OCCNES07D FQ2OCCNES07E FQ2OCCNES07F
    FQ2OCCNES08A FQ2OCCNES08B FQ2OCCNES08C FQ2OCCNES08D FQ2OCCNES08E FQ2OCCNES08F
    FQ2OCCNES09A FQ2OCCNES09B FQ2OCCNES09C FQ2OCCNES09D FQ2OCCNES09E FQ2OCCNES09F
    FQ2OCCNES10A FQ2OCCNES10B FQ2OCCNES10C FQ2OCCNES10D FQ2OCCNES10E FQ2OCCNES10F 
    FQ2OCCNES11A FQ2OCCNES11B FQ2OCCNES11C FQ2OCCNES11D FQ2OCCNES11E FQ2OCCNES11F
    FQ2OCCNES12A FQ2OCCNES12B FQ2OCCNES12C FQ2OCCNES12D FQ2OCCNES12E FQ2OCCNES12F 
    (LO THRU -1). 
EXECUTE.

MISSING VALUES
    FQ2OCCNES02AR FQ2OCCNES07CR FQ2OCCNES08CR FQ2OCCNES10AR
    (LO THRU -1).
EXECUTE.

*STEP 12: SAVE CLEANED DATA FILE.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OCCNES_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.

*STEP 13: CHECK FREQUENCIES.
*Checking frequencies of all items before creating constructs.
*Include STAT variable here to be sure all missingness was coded correctly.
FREQUENCIES VARIABLES=FD2OSTAT FQ2OCCNES01A FQ2OCCNES01B FQ2OCCNES01C FQ2OCCNES01D FQ2OCCNES01E FQ2OCCNES01F
FQ2OCCNES02A FQ2OCCNES02B FQ2OCCNES02C FQ2OCCNES02D FQ2OCCNES02E FQ2OCCNES02F 
FQ2OCCNES03A FQ2OCCNES03B FQ2OCCNES03C FQ2OCCNES03D FQ2OCCNES03E FQ2OCCNES03F
FQ2OCCNES04A FQ2OCCNES04B FQ2OCCNES04C FQ2OCCNES04D FQ2OCCNES04E FQ2OCCNES04F 
FQ2OCCNES05A FQ2OCCNES05B FQ2OCCNES05C FQ2OCCNES05D FQ2OCCNES05E FQ2OCCNES05F
FQ2OCCNES06A FQ2OCCNES06B FQ2OCCNES06C FQ2OCCNES06D FQ2OCCNES06E FQ2OCCNES06F
FQ2OCCNES07A FQ2OCCNES07B FQ2OCCNES07C FQ2OCCNES07D FQ2OCCNES07E FQ2OCCNES07F
FQ2OCCNES08A FQ2OCCNES08B FQ2OCCNES08C FQ2OCCNES08D FQ2OCCNES08E FQ2OCCNES08F
FQ2OCCNES09A FQ2OCCNES09B FQ2OCCNES09C FQ2OCCNES09D FQ2OCCNES09E FQ2OCCNES09F
FQ2OCCNES10A FQ2OCCNES10B FQ2OCCNES10C FQ2OCCNES10D FQ2OCCNES10E FQ2OCCNES10F 
FQ2OCCNES11A FQ2OCCNES11B FQ2OCCNES11C FQ2OCCNES11D FQ2OCCNES11E FQ2OCCNES11F
FQ2OCCNES12A FQ2OCCNES12B FQ2OCCNES12C FQ2OCCNES12D FQ2OCCNES12E FQ2OCCNES12F 
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=
    FD2OSTAT
    FQ2OCCNES02A FQ2OCCNES02AR 
    FQ2OCCNES07C FQ2OCCNES07CR 
    FQ2OCCNES08C FQ2OCCNES08CR 
    FQ2OCCNES10A FQ2OCCNES10AR
  /ORDER=ANALYSIS.

*STEP 14: CHECK DESCRIPTIVES.
*Checking descriptives for all items before creating constructs.
DESCRIPTIVES VARIABLES=FQ2OCCNES01A FQ2OCCNES01B FQ2OCCNES01C FQ2OCCNES01D FQ2OCCNES01E FQ2OCCNES01F
FQ2OCCNES02A FQ2OCCNES02B FQ2OCCNES02C FQ2OCCNES02D FQ2OCCNES02E FQ2OCCNES02F 
FQ2OCCNES03A FQ2OCCNES03B FQ2OCCNES03C FQ2OCCNES03D FQ2OCCNES03E FQ2OCCNES03F
FQ2OCCNES04A FQ2OCCNES04B FQ2OCCNES04C FQ2OCCNES04D FQ2OCCNES04E FQ2OCCNES04F 
FQ2OCCNES05A FQ2OCCNES05B FQ2OCCNES05C FQ2OCCNES05D FQ2OCCNES05E FQ2OCCNES05F
FQ2OCCNES06A FQ2OCCNES06B FQ2OCCNES06C FQ2OCCNES06D FQ2OCCNES06E FQ2OCCNES06F
FQ2OCCNES07A FQ2OCCNES07B FQ2OCCNES07C FQ2OCCNES07D FQ2OCCNES07E FQ2OCCNES07F
FQ2OCCNES08A FQ2OCCNES08B FQ2OCCNES08C FQ2OCCNES08D FQ2OCCNES08E FQ2OCCNES08F
FQ2OCCNES09A FQ2OCCNES09B FQ2OCCNES09C FQ2OCCNES09D FQ2OCCNES09E FQ2OCCNES09F
FQ2OCCNES10A FQ2OCCNES10B FQ2OCCNES10C FQ2OCCNES10D FQ2OCCNES10E FQ2OCCNES10F 
FQ2OCCNES11A FQ2OCCNES11B FQ2OCCNES11C FQ2OCCNES11D FQ2OCCNES11E FQ2OCCNES11F
FQ2OCCNES12A FQ2OCCNES12B FQ2OCCNES12C FQ2OCCNES12D FQ2OCCNES12E FQ2OCCNES12F 
  /STATISTICS=MEAN STDDEV MIN MAX.

DESCRIPTIVES VARIABLES=
    FQ2OCCNES02A FQ2OCCNES02AR 
    FQ2OCCNES07C FQ2OCCNES07CR 
    FQ2OCCNES08C FQ2OCCNES08CR 
    FQ2OCCNES10A FQ2OCCNES10AR
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 15: SAVE CLEANED DATA FILE.
*Sorting the data file by ID and resaving the final file.
*To reorder items, use /KEEP {list all variables in order} -- insert in line after file name.
SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OCCNES_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OCCNES_Cleaned.sav'.
EXECUTE.

*STEP 16: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE
 OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OCCNES_Cleaned.spv'
 LOCK=NO.

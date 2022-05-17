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
*12-13-21(AAC): Minor change to notes section of STEP 11 and STEP 12
*-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------.
*STEP 1: OPENING RAW DATA.
*Insert the correct file path and file name. Use syntax to open raw data file.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/DBT Moms R01 Study Time 1 Mother Survey_November 10, 2021_12.48.sav'.

*STEP 2: SAVING QUESTIONNAIRE SPECIFIC RAW DATA. 
*Insert the correct file path and file name. Save this file with only those variables that you need, in the following order; ID, Start Date, Questionnaire Items (i.e., DERS_1 to DERS_36).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OCCNES_Cleaned.sav'
  /KEEP 
  FQ1ID 
  STARTDATE
  FQ1CCNES1_1 TO FQ1CCNES12_6
  /COMPRESSED.
  EXECUTE.

*STEP 3: OPEN NEW DATA FILE.  
*Insert the correct file path and file name. Open the file you just created and saved so that you are able to clean the data.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OCCNES_Cleaned.sav'.

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
RENAME VARIABLE (STARTDATE=FQ1OCCNESDATE).
EXECUTE.
RENAME VARIABLE (FQ1CCNES1_1 = FQ1OCCNES01A) (FQ1CCNES1_2 = FQ1OCCNES01B) (FQ1CCNES1_3 = FQ1OCCNES01C) (FQ1CCNES1_4 = FQ1OCCNES01D) (FQ1CCNES1_5 = FQ1OCCNES01E) (FQ1CCNES1_6 = FQ1OCCNES01F).
EXECUTE.
RENAME VARIABLE (FQ1CCNES2_1 = FQ1OCCNES02A) (FQ1CCNES2_2 = FQ1OCCNES02B) (FQ1CCNES2_3 = FQ1OCCNES02C) (FQ1CCNES2_4 = FQ1OCCNES02D) (FQ1CCNES2_5 = FQ1OCCNES02E) (FQ1CCNES2_6 = FQ1OCCNES02F).
EXECUTE.
RENAME VARIABLE (FQ1CCNES3_1 = FQ1OCCNES03A) (FQ1CCNES3_2 = FQ1OCCNES03B) (FQ1CCNES3_3 = FQ1OCCNES03C) (FQ1CCNES3_4 = FQ1OCCNES03D) (FQ1CCNES3_5 = FQ1OCCNES03E) (FQ1CCNES3_6 = FQ1OCCNES03F).
EXECUTE.
RENAME VARIABLE (FQ1CCNES4_1 = FQ1OCCNES04A) (FQ1CCNES4_2 = FQ1OCCNES04B) (FQ1CCNES4_3 = FQ1OCCNES04C) (FQ1CCNES4_4 = FQ1OCCNES04D) (FQ1CCNES4_5 = FQ1OCCNES04E) (FQ1CCNES4_6 = FQ1OCCNES04F).
EXECUTE.
RENAME VARIABLE (FQ1CCNES5_1 = FQ1OCCNES05A) (FQ1CCNES5_2 = FQ1OCCNES05B) (FQ1CCNES5_3 = FQ1OCCNES05C) (FQ1CCNES5_4 = FQ1OCCNES05D) (FQ1CCNES5_5 = FQ1OCCNES05E) (FQ1CCNES5_6 = FQ1OCCNES05F).
EXECUTE.
RENAME VARIABLE (FQ1CCNES6_1 = FQ1OCCNES06A) (FQ1CCNES6_2 = FQ1OCCNES06B) (FQ1CCNES6_3 = FQ1OCCNES06C) (FQ1CCNES6_4 = FQ1OCCNES06D) (FQ1CCNES6_5 = FQ1OCCNES06E) (FQ1CCNES6_6 = FQ1OCCNES06F).
EXECUTE.
RENAME VARIABLE (FQ1CCNES7_1 = FQ1OCCNES07A) (FQ1CCNES7_2 = FQ1OCCNES07B) (FQ1CCNES7_3 = FQ1OCCNES07C) (FQ1CCNES7_4 = FQ1OCCNES07D) (FQ1CCNES7_5 = FQ1OCCNES07E) (FQ1CCNES7_6 = FQ1OCCNES07F).
EXECUTE.
RENAME VARIABLE (FQ1CCNES8_1 = FQ1OCCNES08A) (FQ1CCNES8_2 = FQ1OCCNES08B) (FQ1CCNES8_3 = FQ1OCCNES08C) (FQ1CCNES8_4 = FQ1OCCNES08D) (FQ1CCNES8_5 = FQ1OCCNES08E) (FQ1CCNES8_6 = FQ1OCCNES08F).
EXECUTE.
RENAME VARIABLE (FQ1CCNES9_1 = FQ1OCCNES09A) (FQ1CCNES9_2 = FQ1OCCNES09B) (FQ1CCNES9_3 = FQ1OCCNES09C) (FQ1CCNES9_4 = FQ1OCCNES09D) (FQ1CCNES9_5 = FQ1OCCNES09E) (FQ1CCNES9_6 = FQ1OCCNES09F).
EXECUTE.
RENAME VARIABLE (FQ1CCNES10_1 = FQ1OCCNES10A) (FQ1CCNES10_2 = FQ1OCCNES10B) (FQ1CCNES10_3 = FQ1OCCNES10C) (FQ1CCNES10_4 = FQ1OCCNES10D) (FQ1CCNES10_5 = FQ1OCCNES10E) (FQ1CCNES10_6 = FQ1OCCNES10F).
EXECUTE.
RENAME VARIABLE (FQ1CCNES11_1 = FQ1OCCNES11A) (FQ1CCNES11_2 = FQ1OCCNES11B) (FQ1CCNES11_3 = FQ1OCCNES11C) (FQ1CCNES11_4 = FQ1OCCNES11D) (FQ1CCNES11_5 = FQ1OCCNES11E) (FQ1CCNES11_6 = FQ1OCCNES11F).
EXECUTE.
RENAME VARIABLE (FQ1CCNES12_1 = FQ1OCCNES12A) (FQ1CCNES12_2 = FQ1OCCNES12B) (FQ1CCNES12_3 = FQ1OCCNES12C) (FQ1CCNES12_4 = FQ1OCCNES12D) (FQ1CCNES12_5 = FQ1OCCNES12E) (FQ1CCNES12_6 = FQ1OCCNES12F).
EXECUTE.
*Remember to save your data file.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OCCNES_Cleaned.sav'.
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
/FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OCCNES_Cleaned.sav'
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
COMPUTE DATEDIFF = DATEDIFF(FD1ORD,FQ1OCCNESDATE,'days').
EXECUTE.
COUNT DATEDIFF0=DATEDIFF(Lowest thru -1) DATEDIFF(1 thru Highest).
EXECUTE.
FREQUENCIES VARIABLES=DATEDIFF0
  /ORDER=ANALYSIS.
SORT CASES BY DATEDIFF0(D).
*CHECK ALL IDS WITH DISCREPANT DATES TO DETERMINE WHAT IS CORRECT. CONSULT BEFORE MAKING ANY CHANGES TO RAW DATA IN REDCAP OR QUALTRICS.
*INCLUDE NOTES HERE FOR EACH ID THAT WAS DISCREPANT (EXAMPLE BELOW - ADAPT AS NEEDED)
*THE FOLLOWING IDs (90210, 90331, and 90800) HAVE A A1 QUALTRICS DATE [FQ1OCCNESDATE] THAT DOES NOT MATCH THEIR A1 VISIT DATE [FD1ORD].
*THIS WAS INVESTIGATED BY STAFF (BM: 10-29-21) AND VISIT DATE [FD1ORD] WAS CONFIRMED USING MULTIPLE SOURCES.
SORT CASES BY ID(A).
*DROPPING VARIABLES THAT ARE NO LONGER RELEVANT TO FINAL DATA FILE.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OCCNES_Cleaned.sav'
/DROP
FQ1OCCNESDATE
DATEDIFF
DATEDIFF0
f.
EXECUTE.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OCCNES_Cleaned.sav'.
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
RECODE FQ1OCCNES01A to FQ1OCCNES12F
    (8=-10).
EXECUTE.    
    
**STEP 7 (DELETE IF NOT NEEDED): CREATING NEW VARIABLES FOR REVERSED SCORED ITEMS.
**Reverse-Scored Items; see scoring document to determine if there are reverse-scored items. If no reverse-scored items, delete this syntax.
RECODE FQ1OCCNES02A (1=7) (2=6) (3=5) (4=4) (5=3) (6=2) (7=1) (-10=-10) INTO FQ1OCCNES02AR.
EXECUTE.
RECODE FQ1OCCNES07C (1=7) (2=6) (3=5) (4=4) (5=3) (6=2) (7=1) (-10=-10) INTO FQ1OCCNES07CR.
EXECUTE.
RECODE FQ1OCCNES08C (1=7) (2=6) (3=5) (4=4) (5=3) (6=2) (7=1) (-10=-10) INTO FQ1OCCNES08CR.
EXECUTE.
RECODE FQ1OCCNES10A (1=7) (2=6) (3=5) (4=4) (5=3) (6=2) (7=1) (-10=-10) INTO FQ1OCCNES10AR.
EXECUTE.

*STEP 7A: RECODING SYSMIS (PARTICIPANTS THAT MISSED THE ASSESSMENT).
*This will use the STAT variable to recode all SYSMIS data. CHANGE THE STAT VARIABLE TO MATCH THE ASSESSMENT WAVE YOU ARE WORKING IN.
*Include full list of numeric variables (including new reverse-scored items).
DO IF MISSING(FD1OSTAT).
DO REPEAT x = FQ1OCCNES01A TO FQ1OCCNES10AR.
RECODE FD1OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.

*STEP 8: STANDARDIZING DECIMAL PLACES (CANNOT INCLUDE TEXT/STRING VARIABLES).
*Making all variables have the same number of decimal places. Ensure that variables include all new reverse-scored variables. Change the number AFTER the decimal place as needed.
FORMATS FQ1OCCNES01A to FQ1OCCNES10AR (F8.0).
EXECUTE.

*STEP 9: CREATING VARIABLE LABLES.
*Label all variables. Use the original questionnaire to include the exact text that participants saw. Include the questionnaire name and number at the end of the label.
VARIABLE LABELS  ID 'Participant ID'.
EXECUTE.

VARIABLE LABELS 
FQ1OCCNES01A 'Angry because cant go to friends birthday party, I would send my child to his/her room to cool off [FQ1OCCNES01A]'
FQ1OCCNES01B 'Angry because cant go to friends birthday party, I would get angry at my child [FQ1OCCNES01B]'
FQ1OCCNES01C 'Angry because cant go to friends birthday party, I would help my child think about ways that he/she can still be with friends [FQ1OCCNES01C]'
FQ1OCCNES01D 'Angry because cant go to friends birthday party, I would tell my child not to make a big deal out of missing the party [FQ1OCCNES01D]'
FQ1OCCNES01E 'Angry because cant go to friends birthday party, I would encourage my child to express his/her feelings of anger and frustration [FQ1OCCNES01E]'
FQ1OCCNES01F 'Angry because cant go to friends birthday party, I would soothe my child and do something fun with him/her to make him/her feel better about missing the party [FQ1OCCNES01F]'
FQ1OCCNES02A 'Falls off his/her bike and breaks it and gets upset, I would remain calm and not let myself get anxious [FQ1OCCNES02A]'
FQ1OCCNES02B 'Falls off his/her bike and breaks it and gets upset, I would comfort my child and try to get him/her to forget about the accident [FQ1OCCNES02B]'
FQ1OCCNES02C 'Falls off his/her bike and breaks it and gets upset, I would tell my child that he/she is overreacting [FQ1OCCNES02C]'
FQ1OCCNES02D 'Falls off his/her bike and breaks it and gets upset, I would help my child figure out how to get the bike fixed [FQ1OCCNES02D]'
FQ1OCCNES02E 'Falls off his/her bike and breaks it and gets upset, I would tell my child its OK to cry [FQ1OCCNES02E]'
FQ1OCCNES02F 'Falls off his/her bike and breaks it and gets upset, I would tell my child to stop crying or he/she wont be allowed to ride his/her bike anytime soon [FQ1OCCNES02F]'
FQ1OCCNES03A 'Loses some prized possession and reacts with tears, I would get upset with him/her for being so careless and then crying about it [FQ1OCCNES03A]'
FQ1OCCNES03B 'Loses some prized possession and reacts with tears, I would tell my child that he/she is overreacting [FQ1OCCNES03B]'
FQ1OCCNES03C 'Loses some prized possession and reacts with tears, I would help my child think of places he/she hasnt looked yet [FQ1OCCNES03C]'
FQ1OCCNES03D 'Loses some prized possession and reacts with tears, I would distract my child by talking about happy things [FQ1OCCNES03D]'
FQ1OCCNES03E 'Loses some prized possession and reacts with tears, I would tell him/her its OK to cry when you feel unhappy [FQ1OCCNES03E]'
FQ1OCCNES03F 'Loses some prized possession and reacts with tears, I would tell him/her thats what happens when youre not careful [FQ1OCCNES03F]'
FQ1OCCNES04A 'Afraid of injections and becomes shaky and teary while waiting for a shot, I would tell him/her to shape up or he/she wont be allowed to do something he/she likes to do [FQ1OCCNES04A]'
FQ1OCCNES04B 'Afraid of injections and becomes shaky and teary while waiting for a shot, I would encourage my child to talk about his/her fears [FQ1OCCNES04B]'
FQ1OCCNES04C 'Afraid of injections and becomes shaky and teary while waiting for a shot, I would tell my child not to make a big deal of the shot [FQ1OCCNES04C]'
FQ1OCCNES04D 'Afraid of injections and becomes shaky and teary while waiting for a shot, I would tell him/her not to embarass us by crying [FQ1OCCNES04D]'
FQ1OCCNES04E 'Afraid of injections and becomes shaky and teary while waiting for a shot, I would comfort him/her before and after the shot [FQ1OCCNES04E]'
FQ1OCCNES04F 'Afraid of injections and becomes shaky and teary while waiting for a shot, I would talk to my child about ways to make it hurt less [FQ1OCCNES04F]'
FQ1OCCNES05A 'Going to a friends house and becomes nervous and upset because I cant stay there with him/her, I would distract my child by talking about all the fun he/she will have with his/her friend [FQ1OCCNES05A]'
FQ1OCCNES05B 'Going to a friends house and becomes nervous and upset because I cant stay there with him/her, I would help my child think of things that he/she could do so that being at the friends house without me wasnt scary [FQ1OCCNES05B]'
FQ1OCCNES05C 'Going to a friends house and becomes nervous and upset because I cant stay there with him/her, I would tell my child to quit overreacting and being a baby [FQ1OCCNES05C]'
FQ1OCCNES05D 'Going to a friends house and becomes nervous and upset because I cant stay there with him/her, I would tell my child that if he/she doesnt stop that he/she wont be allowed to go out anymore [FQ1OCCNES05D]'
FQ1OCCNES05E 'Going to a friends house and becomes nervous and upset because I cant stay there with him/her, I would feel upset and uncomfortable because of my childs reactions [FQ1OCCNES05E]'
FQ1OCCNES05F 'Going to a friends house and becomes nervous and upset because I cant stay there with him/her, I would encourage my child to talk about his/her nervous feelings [FQ1OCCNES05F]'
FQ1OCCNES06A 'Participating in a group activity with friends and makes a mistake and is embarrassed and on the verge of tears, I would comfort my child and try to make him/her feel better [FQ1OCCNES06A]'
FQ1OCCNES06B 'Participating in a group activity with friends and makes a mistake and is embarrassed and on the verge of tears, I would tell my child that he/she is overreacting [FQ1OCCNES06B]'
FQ1OCCNES06C 'Participating in a group activity with friends and makes a mistake and is embarrassed and on the verge of tears, I would feel uncomfortable and embarassed myself [FQ1OCCNES06C]'
FQ1OCCNES06D 'Participating in a group activity with friends and makes a mistake and is embarrassed and on the verge of tears, I would tell my child to straighten up or well go home right away [FQ1OCCNES06D]'
FQ1OCCNES06E 'Participating in a group activity with friends and makes a mistake and is embarrassed and on the verge of tears, I would encourage my child to talk about his/her feelings of embarrassment [FQ1OCCNES06E]'
FQ1OCCNES06F 'Participating in a group activity with friends and makes a mistake and is embarrassed and on the verge of tears, I would tell my child that Ill help him/her practice so that he/she can do better next time [FQ1OCCNES06F]'
FQ1OCCNES07A 'About to appear in a recital or sports activity and becomes visibly nervous about people watching, I would help my child think of things that he/she could do to get ready for his/her turn [FQ1OCCNES07A]'
FQ1OCCNES07B 'About to appear in a recital or sports activity and becomes visibly nervous about people watching, I would suggest that my child think about something relaxing so that his/her nervousness will go away [FQ1OCCNES07B]'
FQ1OCCNES07C 'About to appear in a recital or sports activity and becomes visibly nervous about people watching, I would remain calm and not get nervous myself [FQ1OCCNES07C]'
FQ1OCCNES07D 'About to appear in a recital or sports activity and becomes visibly nervous about people watching, I would tell my child that he/she is being a baby about it [FQ1OCCNES07D]'
FQ1OCCNES07E 'About to appear in a recital or sports activity and becomes visibly nervous about people watching, I would tell my child that if he/she doesnt calm down, well have to leave and go home right away [FQ1OCCNES07E]'
FQ1OCCNES07F 'About to appear in a recital or sports activity and becomes visibly nervous about people watching, I would encourage my child to talk about his/her nervous feelings [FQ1OCCNES07F]'
FQ1OCCNES08A 'Receives an undesirable birthday gift from a friend and looks disappointed,even annoyed,after opening it in the presence of the friend, I would encourage my child to express his/her disappointed feelings [FQ1OCCNES08A]'
FQ1OCCNES08B 'Receives an undesirable birthday gift from a friend and looks disappointed,even annoyed,after opening it in the presence of the friend, I would tell my child that the present can be exchanged for something the child wants [FQ1OCCNES08B]'
FQ1OCCNES08C 'Receives an undesirable birthday gift from a friend and looks disappointed,even annoyed,after opening it in the presence of the friend, I would not be annoyed with my child for being rude [FQ1OCCNES08C]'
FQ1OCCNES08D 'Receives an undesirable birthday gift from a friend and looks disappointed,even annoyed,after opening it in the presence of the friend, I would tell my child that he/she is overreacting [FQ1OCCNES08D]'
FQ1OCCNES08E 'Receives an undesirable birthday gift from a friend and looks disappointed,even annoyed,after opening it in the presence of the friend, I would scold my child for being insensitive to the friends feelings [FQ1OCCNES08E]'
FQ1OCCNES08F 'Receives an undesirable birthday gift from a friend and looks disappointed,even annoyed,after opening it in the presence of the friend, I would try to get my child to feel better by doing something fun [FQ1OCCNES08F]'
FQ1OCCNES09A 'Panicky and cant go to sleep after watching a scary TV show, I would encourage my child to talk about what scared him/her [FQ1OCCNES09A]'
FQ1OCCNES09B 'Panicky and cant go to sleep after watching a scary TV show, I would get upset with him/her for being silly [FQ1OCCNES09B]'
FQ1OCCNES09C 'Panicky and cant go to sleep after watching a scary TV show, I would tell my child that he/she is overreacting [FQ1OCCNES09C]'
FQ1OCCNES09D 'Panicky and cant go to sleep after watching a scary TV show, I would help my child think of something to do so that he/she can get to sleep [FQ1OCCNES09D]'
FQ1OCCNES09E 'Panicky and cant go to sleep after watching a scary TV show, I would tell him/her to go to bed or he/she wont be allowed to watch any more TV [FQ1OCCNES09E]'
FQ1OCCNES09F 'Panicky and cant go to sleep after watching a scary TV show, I would do something fun with my child to help him/her forget about what scared him/her [FQ1OCCNES09F]'
FQ1OCCNES10A 'At a park and appears on the verge of tears because the other children are mean and wont let him/her play with them, I would not get upset myself [FQ1OCCNES10A]'
FQ1OCCNES10B 'At a park and appears on the verge of tears because the other children are mean and wont let him/her play with them, I would tell my child that if he/she starts crying then well have to go home right away [FQ1OCCNES10B]'
FQ1OCCNES10C 'At a park and appears on the verge of tears because the other children are mean and wont let him/her play with them, I would tell my child its OK to cry when he/she feels bad [FQ1OCCNES10C]'
FQ1OCCNES10D 'At a park and appears on the verge of tears because the other children are mean and wont let him/her play with them, I would comfort my child and try to get him/her to think about something happy [FQ1OCCNES10D]'
FQ1OCCNES10E 'At a park and appears on the verge of tears because the other children are mean and wont let him/her play with them, I would help my child think of something else to do [FQ1OCCNES10E]'
FQ1OCCNES10F 'At a park and appears on the verge of tears because the other children are mean and wont let him/her play with them, I would tell my child that he/she will feel better soon [FQ1OCCNES10F]'
FQ1OCCNES11A 'Playing with other children and one of them calls him/her names, and my child then begins to tremble and become tearful, I would tell my child not to make a big deal out of it [FQ1OCCNES11A]'
FQ1OCCNES11B 'Playing with other children and one of them calls him/her names, and my child then begins to tremble and become tearful, I would feel upset myself [FQ1OCCNES11B]'
FQ1OCCNES11C 'Playing with other children and one of them calls him/her names, and my child then begins to tremble and become tearful, I would tell my child to behave or well have to go home right away [FQ1OCCNES11C]'
FQ1OCCNES11D 'Playing with other children and one of them calls him/her names, and my child then begins to tremble and become tearful, I would help my child think of constructive things to do when other children tease him/her [FQ1OCCNES11D]'
FQ1OCCNES11E 'Playing with other children and one of them calls him/her names, and my child then begins to tremble and become tearful, I would comfort him/her and play a game to take his/her mind off the upsetting event [FQ1OCCNES11E]'
FQ1OCCNES11F 'Playing with other children and one of them calls him/her names, and my child then begins to tremble and become tearful, I would encourage him/her to talk about how it hurts to be teased [FQ1OCCNES11F]'
FQ1OCCNES12A 'Shy and scared around strangers and consistently becomes teary and wants to stay in his/her bedroom when family friends visit, I would help my child think of things to do that would make meeting my friends less scary [FQ1OCCNES12A]'
FQ1OCCNES12B 'Shy and scared around strangers and consistently becomes teary and wants to stay in his/her bedroom when family friends visit, I would tell my child that it is OK to feel nervous [FQ1OCCNES12B]'
FQ1OCCNES12C 'Shy and scared around strangers and consistently becomes teary and wants to stay in his/her bedroom when family friends visit, I would try to make my child happy by talking about the fun things we can do with our friends [FQ1OCCNES12C]'
FQ1OCCNES12D 'Shy and scared around strangers and consistently becomes teary and wants to stay in his/her bedroom when family friends visit, I would feel upset and uncomfortable because of my childs reactions [FQ1OCCNES12D]'
FQ1OCCNES12E 'Shy and scared around strangers and consistently becomes teary and wants to stay in his/her bedroom when family friends visit, I would tell my child that he/she must stay in the living room and visit with our friends [FQ1OCCNES12E]'
FQ1OCCNES12F 'Shy and scared around strangers and consistently becomes teary and wants to stay in his/her bedroom when family friends visit, I would tell my child that he/she is being a baby [FQ1OCCNES12F]'
FQ1OCCNES02AR 'Falls off his/her bike and breaks it and gets upset, I would remain calm and not let myself get anxious [FQ1OCCNES02AR]'
FQ1OCCNES07CR 'About to appear in a recital or sports activity and becomes visibly nervous about people watching, I would remain calm and not get nervous myself [FQ1OCCNES07CR]'
FQ1OCCNES08CR 'Receives an undesirable birthday gift from a friend and looks disappointed,even annoyed,after opening it in the presence of the friend, I would not be annoyed with my child for being rude [FQ1OCCNES08CR]'
FQ1OCCNES10AR 'At a park and appears on the verge of tears because the other children are mean and wont let him/her play with them, I would not get upset myself [FQ1OCCNES10AR]'.
EXECUTE. 

*STEP 10: ADD VALUE LABELS.
*Include missing values like 'Prefer not to Answer' (or something similar) if applicable.
*Include ALL missing value labels (SEE ABOVE FOR FULL LIST).
VALUE LABELS
FQ1OCCNES01A FQ1OCCNES01B FQ1OCCNES01C FQ1OCCNES01D FQ1OCCNES01E FQ1OCCNES01F
FQ1OCCNES02A FQ1OCCNES02B FQ1OCCNES02C FQ1OCCNES02D FQ1OCCNES02E FQ1OCCNES02F 
FQ1OCCNES03A FQ1OCCNES03B FQ1OCCNES03C FQ1OCCNES03D FQ1OCCNES03E FQ1OCCNES03F
FQ1OCCNES04A FQ1OCCNES04B FQ1OCCNES04C FQ1OCCNES04D FQ1OCCNES04E FQ1OCCNES04F 
FQ1OCCNES05A FQ1OCCNES05B FQ1OCCNES05C FQ1OCCNES05D FQ1OCCNES05E FQ1OCCNES05F
FQ1OCCNES06A FQ1OCCNES06B FQ1OCCNES06C FQ1OCCNES06D FQ1OCCNES06E FQ1OCCNES06F
FQ1OCCNES07A FQ1OCCNES07B FQ1OCCNES07C FQ1OCCNES07D FQ1OCCNES07E FQ1OCCNES07F
FQ1OCCNES08A FQ1OCCNES08B FQ1OCCNES08C FQ1OCCNES08D FQ1OCCNES08E FQ1OCCNES08F
FQ1OCCNES09A FQ1OCCNES09B FQ1OCCNES09C FQ1OCCNES09D FQ1OCCNES09E FQ1OCCNES09F
FQ1OCCNES10A FQ1OCCNES10B FQ1OCCNES10C FQ1OCCNES10D FQ1OCCNES10E FQ1OCCNES10F 
FQ1OCCNES11A FQ1OCCNES11B FQ1OCCNES11C FQ1OCCNES11D FQ1OCCNES11E FQ1OCCNES11F
FQ1OCCNES12A FQ1OCCNES12B FQ1OCCNES12C FQ1OCCNES12D FQ1OCCNES12E FQ1OCCNES12F 
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
1 '1-Very Unlikely'
2 '2'
3 '3'
4 '4-Medium Likelihood'
5 '5'
6 '6'
7 '7-Very Likely'.
EXECUTE.

VALUE LABELS
FQ1OCCNES02AR FQ1OCCNES07CR FQ1OCCNES08CR FQ1OCCNES10AR
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
1 '7-Very Likely'
2 '6'
3 '5'
4 '4-Medium'
5 '3'
6 '2'
7 '1-Very Unlikely'.
EXECUTE.

**STEP 11: LABELING MISSING VALUES AS MISSING.
**Recoding all negative numbers as missing.
MISSING VALUES
    FQ1OCCNES01A FQ1OCCNES01B FQ1OCCNES01C FQ1OCCNES01D FQ1OCCNES01E FQ1OCCNES01F
    FQ1OCCNES02A FQ1OCCNES02B FQ1OCCNES02C FQ1OCCNES02D FQ1OCCNES02E FQ1OCCNES02F 
    FQ1OCCNES03A FQ1OCCNES03B FQ1OCCNES03C FQ1OCCNES03D FQ1OCCNES03E FQ1OCCNES03F
    FQ1OCCNES04A FQ1OCCNES04B FQ1OCCNES04C FQ1OCCNES04D FQ1OCCNES04E FQ1OCCNES04F 
    FQ1OCCNES05A FQ1OCCNES05B FQ1OCCNES05C FQ1OCCNES05D FQ1OCCNES05E FQ1OCCNES05F
    FQ1OCCNES06A FQ1OCCNES06B FQ1OCCNES06C FQ1OCCNES06D FQ1OCCNES06E FQ1OCCNES06F
    FQ1OCCNES07A FQ1OCCNES07B FQ1OCCNES07C FQ1OCCNES07D FQ1OCCNES07E FQ1OCCNES07F
    FQ1OCCNES08A FQ1OCCNES08B FQ1OCCNES08C FQ1OCCNES08D FQ1OCCNES08E FQ1OCCNES08F
    FQ1OCCNES09A FQ1OCCNES09B FQ1OCCNES09C FQ1OCCNES09D FQ1OCCNES09E FQ1OCCNES09F
    FQ1OCCNES10A FQ1OCCNES10B FQ1OCCNES10C FQ1OCCNES10D FQ1OCCNES10E FQ1OCCNES10F 
    FQ1OCCNES11A FQ1OCCNES11B FQ1OCCNES11C FQ1OCCNES11D FQ1OCCNES11E FQ1OCCNES11F
    FQ1OCCNES12A FQ1OCCNES12B FQ1OCCNES12C FQ1OCCNES12D FQ1OCCNES12E FQ1OCCNES12F 
    (LO THRU -1). 
EXECUTE.

MISSING VALUES
    FQ1OCCNES02AR FQ1OCCNES07CR FQ1OCCNES08CR FQ1OCCNES10AR
    (LO THRU -1).
EXECUTE.

*STEP 12: SAVE CLEANED DATA FILE.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OCCNES_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.

*STEP 13: CHECK FREQUENCIES.
*Checking frequencies of all items before creating constructs.
*Include STAT variable here to be sure all missingness was coded correctly.
FREQUENCIES VARIABLES=FD1OSTAT FQ1OCCNES01A FQ1OCCNES01B FQ1OCCNES01C FQ1OCCNES01D FQ1OCCNES01E FQ1OCCNES01F
FQ1OCCNES02A FQ1OCCNES02B FQ1OCCNES02C FQ1OCCNES02D FQ1OCCNES02E FQ1OCCNES02F 
FQ1OCCNES03A FQ1OCCNES03B FQ1OCCNES03C FQ1OCCNES03D FQ1OCCNES03E FQ1OCCNES03F
FQ1OCCNES04A FQ1OCCNES04B FQ1OCCNES04C FQ1OCCNES04D FQ1OCCNES04E FQ1OCCNES04F 
FQ1OCCNES05A FQ1OCCNES05B FQ1OCCNES05C FQ1OCCNES05D FQ1OCCNES05E FQ1OCCNES05F
FQ1OCCNES06A FQ1OCCNES06B FQ1OCCNES06C FQ1OCCNES06D FQ1OCCNES06E FQ1OCCNES06F
FQ1OCCNES07A FQ1OCCNES07B FQ1OCCNES07C FQ1OCCNES07D FQ1OCCNES07E FQ1OCCNES07F
FQ1OCCNES08A FQ1OCCNES08B FQ1OCCNES08C FQ1OCCNES08D FQ1OCCNES08E FQ1OCCNES08F
FQ1OCCNES09A FQ1OCCNES09B FQ1OCCNES09C FQ1OCCNES09D FQ1OCCNES09E FQ1OCCNES09F
FQ1OCCNES10A FQ1OCCNES10B FQ1OCCNES10C FQ1OCCNES10D FQ1OCCNES10E FQ1OCCNES10F 
FQ1OCCNES11A FQ1OCCNES11B FQ1OCCNES11C FQ1OCCNES11D FQ1OCCNES11E FQ1OCCNES11F
FQ1OCCNES12A FQ1OCCNES12B FQ1OCCNES12C FQ1OCCNES12D FQ1OCCNES12E FQ1OCCNES12F 
  /ORDER=ANALYSIS.

FREQUENCIES VARIABLES=
    FD1OSTAT
    FQ1OCCNES02A FQ1OCCNES02AR 
    FQ1OCCNES07C FQ1OCCNES07CR 
    FQ1OCCNES08C FQ1OCCNES08CR 
    FQ1OCCNES10A FQ1OCCNES10AR
  /ORDER=ANALYSIS.

*STEP 14: CHECK DESCRIPTIVES.
*Checking descriptives for all items before creating constructs.
DESCRIPTIVES VARIABLES=FQ1OCCNES01A FQ1OCCNES01B FQ1OCCNES01C FQ1OCCNES01D FQ1OCCNES01E FQ1OCCNES01F
FQ1OCCNES02A FQ1OCCNES02B FQ1OCCNES02C FQ1OCCNES02D FQ1OCCNES02E FQ1OCCNES02F 
FQ1OCCNES03A FQ1OCCNES03B FQ1OCCNES03C FQ1OCCNES03D FQ1OCCNES03E FQ1OCCNES03F
FQ1OCCNES04A FQ1OCCNES04B FQ1OCCNES04C FQ1OCCNES04D FQ1OCCNES04E FQ1OCCNES04F 
FQ1OCCNES05A FQ1OCCNES05B FQ1OCCNES05C FQ1OCCNES05D FQ1OCCNES05E FQ1OCCNES05F
FQ1OCCNES06A FQ1OCCNES06B FQ1OCCNES06C FQ1OCCNES06D FQ1OCCNES06E FQ1OCCNES06F
FQ1OCCNES07A FQ1OCCNES07B FQ1OCCNES07C FQ1OCCNES07D FQ1OCCNES07E FQ1OCCNES07F
FQ1OCCNES08A FQ1OCCNES08B FQ1OCCNES08C FQ1OCCNES08D FQ1OCCNES08E FQ1OCCNES08F
FQ1OCCNES09A FQ1OCCNES09B FQ1OCCNES09C FQ1OCCNES09D FQ1OCCNES09E FQ1OCCNES09F
FQ1OCCNES10A FQ1OCCNES10B FQ1OCCNES10C FQ1OCCNES10D FQ1OCCNES10E FQ1OCCNES10F 
FQ1OCCNES11A FQ1OCCNES11B FQ1OCCNES11C FQ1OCCNES11D FQ1OCCNES11E FQ1OCCNES11F
FQ1OCCNES12A FQ1OCCNES12B FQ1OCCNES12C FQ1OCCNES12D FQ1OCCNES12E FQ1OCCNES12F 
  /STATISTICS=MEAN STDDEV MIN MAX.

DESCRIPTIVES VARIABLES=
    FQ1OCCNES02A FQ1OCCNES02AR 
    FQ1OCCNES07C FQ1OCCNES07CR 
    FQ1OCCNES08C FQ1OCCNES08CR 
    FQ1OCCNES10A FQ1OCCNES10AR
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 15: SAVE CLEANED DATA FILE.
*Sorting the data file by ID and resaving the final file.
*To reorder items, use /KEEP {list all variables in order} -- insert in line after file name.
SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OCCNES_Cleaned.sav'
  /COMPRESSED.
  EXECUTE.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OCCNES_Cleaned.sav'.
EXECUTE.

*STEP 16: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE
 OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OCCNES_Cleaned.spv'
 LOCK=NO.

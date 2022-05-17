* Encoding: UTF-8.
*STEP 0: NOTES.
*PRESCHOOL AND KINDERGARTEN BEHAVIOR SCALE (PKBS).
*CREATED THE FOLLOWING SUBSCALES & RAN APLHAS; LIST SUBSCALES BELOW.
*Total score (TOT).
*Social Cooperation (SC).
*Social Interaction (SI).
*Social Independence (SIN).

*4-20-22(BM): Adapted syntax for A4.
*04-21-22(AAC): Checked.
*------------------------------------------------------------------------------.
*STEP 1: OPENING CLEANED DATA.
*Insert the correct file path and file name. Use syntax to open cleaned data file.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OPKBS_Cleaned.sav'.

*STEP 2: SAVING CLEANED DATA AS A CONSTRUCT FILE. 
*Insert the correct file path and file name.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OPKBS_Constructs.sav'
  /COMPRESSED.

*STEP 3: DESCRIPTIVE STATISTICS (1. FREQ AND 2. CORR) FOR RAW VARIABLES (TOTAL SCORE 1ST, THEN SUBSCALES).
*When running this step note any additional missingness (any other codes) that are not accounted for in the STAT variable. These missing codes (and corresponding IDs) will need to be 
incorporated in STEP 8 below.
FREQ VARS=FQ4OPKBS01, FQ4OPKBS02, FQ4OPKBS03, FQ4OPKBS04, FQ4OPKBS05, FQ4OPKBS06, FQ4OPKBS07, FQ4OPKBS08, FQ4OPKBS09, 
    FQ4OPKBS10, FQ4OPKBS11, FQ4OPKBS12, FQ4OPKBS13, FQ4OPKBS14, FQ4OPKBS15, FQ4OPKBS16, FQ4OPKBS17, FQ4OPKBS18, FQ4OPKBS19,
    FQ4OPKBS20, FQ4OPKBS21, FQ4OPKBS22, FQ4OPKBS23, FQ4OPKBS24, FQ4OPKBS25, FQ4OPKBS26, FQ4OPKBS27, FQ4OPKBS28,
    FQ4OPKBS29, FQ4OPKBS30, FQ4OPKBS31, FQ4OPKBS32, FQ4OPKBS33, FQ4OPKBS34.
*PKBS Total Score.
CORR VARS=FQ4OPKBS01, FQ4OPKBS02, FQ4OPKBS03, FQ4OPKBS05, FQ4OPKBS06, FQ4OPKBS07, FQ4OPKBS08, FQ4OPKBS09, 
    FQ4OPKBS10, FQ4OPKBS11, FQ4OPKBS12, FQ4OPKBS13, FQ4OPKBS14, FQ4OPKBS15, FQ4OPKBS16, FQ4OPKBS17, FQ4OPKBS18, FQ4OPKBS19,
    FQ4OPKBS20, FQ4OPKBS21, FQ4OPKBS22, FQ4OPKBS23, FQ4OPKBS24, FQ4OPKBS25, FQ4OPKBS26, FQ4OPKBS27, FQ4OPKBS28,
    FQ4OPKBS29, FQ4OPKBS30, FQ4OPKBS31, FQ4OPKBS32, FQ4OPKBS33, FQ4OPKBS34.
*Social Cooperation (SC).
CORR VARS=FQ4OPKBS02, FQ4OPKBS07, FQ4OPKBS10, FQ4OPKBS12, FQ4OPKBS16, FQ4OPKBS22, FQ4OPKBS23, FQ4OPKBS25, FQ4OPKBS28, FQ4OPKBS29, FQ4OPKBS30, FQ4OPKBS32.
*Social Interaction (SI).
CORR VARS=FQ4OPKBS05, FQ4OPKBS14, FQ4OPKBS15, FQ4OPKBS17, FQ4OPKBS19, FQ4OPKBS20, FQ4OPKBS21, FQ4OPKBS24, FQ4OPKBS27, FQ4OPKBS33, FQ4OPKBS34.
*Social Independence (SIN).
CORR VARS=FQ4OPKBS01, FQ4OPKBS03, FQ4OPKBS06, FQ4OPKBS08, FQ4OPKBS09, FQ4OPKBS11, FQ4OPKBS13, FQ4OPKBS18, FQ4OPKBS26, FQ4OPKBS31.

*STEP 4: RECODING MISSING VALUES.
RECODE FQ4OPKBS01 TO FQ4OPKBS34 (MISSING=-9999).
EXECUTE.
    
*STEP 5: RELIABILITY STATISTICS (TOTAL SCORE 1st, FOLLOWED BY SUBSCALES).
*PKBS Total Score (33 items; n=69; alpha=.904).
REL VARS=FQ4OPKBS01, FQ4OPKBS02, FQ4OPKBS03, FQ4OPKBS05, FQ4OPKBS06, FQ4OPKBS07, FQ4OPKBS08, FQ4OPKBS09, 
    FQ4OPKBS10, FQ4OPKBS11, FQ4OPKBS12, FQ4OPKBS13, FQ4OPKBS14, FQ4OPKBS15, FQ4OPKBS16, FQ4OPKBS17, FQ4OPKBS18, FQ4OPKBS19,
    FQ4OPKBS20, FQ4OPKBS21, FQ4OPKBS22, FQ4OPKBS23, FQ4OPKBS24, FQ4OPKBS25, FQ4OPKBS26, FQ4OPKBS27, FQ4OPKBS28,
    FQ4OPKBS29, FQ4OPKBS30, FQ4OPKBS31, FQ4OPKBS32, FQ4OPKBS33, FQ4OPKBS34
/SCALE(All)= ALL.
*Social Cooperation (SC) (12 items; n=72; alpha=.895).
REL VARS=FQ4OPKBS02, FQ4OPKBS07, FQ4OPKBS10, FQ4OPKBS12, FQ4OPKBS16, FQ4OPKBS22, FQ4OPKBS23, FQ4OPKBS25, FQ4OPKBS28, FQ4OPKBS29, FQ4OPKBS30, FQ4OPKBS32
/SCALE(All)= ALL.
*Social Interaction (SI) (11 items; n=72; alpha=.787).
REL VARS=FQ4OPKBS05, FQ4OPKBS14, FQ4OPKBS15, FQ4OPKBS17, FQ4OPKBS19, FQ4OPKBS20, FQ4OPKBS21, FQ4OPKBS24, FQ4OPKBS27, FQ4OPKBS33, FQ4OPKBS34
/SCALE(All)= ALL.
*Social Independence (SIN) (10 items; n=69; alpha=.730).
REL VARS=FQ4OPKBS01, FQ4OPKBS03, FQ4OPKBS06, FQ4OPKBS08, FQ4OPKBS09, FQ4OPKBS11, FQ4OPKBS13, FQ4OPKBS18, FQ4OPKBS26, FQ4OPKBS31
/SCALE(All)= ALL.

*STEP 6: COUNTING MISSING DATA (JUST SUBSCALES), THEN RECODING TO 0 TO AVOID NEGATIVE EFFECTS ON CONSTRUCTS.
*Social Cooperation (SC).
COUNT MISSSC=FQ4OPKBS02, FQ4OPKBS07, FQ4OPKBS10, FQ4OPKBS12, FQ4OPKBS16, FQ4OPKBS22, FQ4OPKBS23, FQ4OPKBS25, FQ4OPKBS28, FQ4OPKBS29, FQ4OPKBS30, FQ4OPKBS32 (-9999).
*Social Interaction (SI).
COUNT MISSSI=FQ4OPKBS05, FQ4OPKBS14, FQ4OPKBS15, FQ4OPKBS17, FQ4OPKBS19, FQ4OPKBS20, FQ4OPKBS21, FQ4OPKBS24, FQ4OPKBS27, FQ4OPKBS33, FQ4OPKBS34 (-9999).
*Social Independence (SIN).
COUNT MISSSIN=FQ4OPKBS01, FQ4OPKBS03, FQ4OPKBS04, FQ4OPKBS06, FQ4OPKBS08, FQ4OPKBS09, FQ4OPKBS11, FQ4OPKBS13, FQ4OPKBS18, FQ4OPKBS26, FQ4OPKBS31 (-9999).

RECODE FQ4OPKBS01 TO FQ4OPKBS34 (-9999=0).
EXECUTE.

*STEP 7: CREATE TOTAL AND SUBSCALES SCORES  (CHECK THAT REVERSE-SCORED ITEMS INCLUDED).
*Note each subscale name and calculate missingness allowed.
*CREATING TOTAL SCORE.
*Total Score (34 items) -- USE MISSINGNESS FOR EACH SUBSCALE as a cut-off point.
COMPUTE FQ4OPKBSTOT=-9999.
EXECUTE.
IF (MISSSC < 3.96  AND MISSSI < 3.63 AND MISSSIN < 3.63) FQ4OPKBSTOT=RND(((FQ4OPKBS01 + FQ4OPKBS02 + FQ4OPKBS03 + FQ4OPKBS04 + FQ4OPKBS05 + FQ4OPKBS06 + FQ4OPKBS07 + FQ4OPKBS08 + FQ4OPKBS09 + 
    FQ4OPKBS10 + FQ4OPKBS11 + FQ4OPKBS12 + FQ4OPKBS13 + FQ4OPKBS14 + FQ4OPKBS15 + FQ4OPKBS16 + FQ4OPKBS17 + FQ4OPKBS18 + FQ4OPKBS19 +
    FQ4OPKBS20 + FQ4OPKBS21 + FQ4OPKBS22 + FQ4OPKBS23 + FQ4OPKBS24 + FQ4OPKBS25 + FQ4OPKBS26 + FQ4OPKBS27 + FQ4OPKBS28 +
    FQ4OPKBS29 + FQ4OPKBS30 + FQ4OPKBS31 + FQ4OPKBS32 + FQ4OPKBS33 + FQ4OPKBS34)/(34-MISSSC-MISSSI-MISSSIN))*34).
EXECUTE.
*CREATING ALL SUBSCALES (CHECK THAT REVERSE-SCORED ITEMS INCLUDED).
*Social Cooperation (SC) (12 items) -- 66.7% (i.e., if MISS is less than or equal to 3.96) as a cut-off point.
COMPUTE FQ4OPKBSSC=-9999.
EXECUTE.
IF (MISSSC < 3.96) FQ4OPKBSSC=RND(((FQ4OPKBS02 + FQ4OPKBS07 + FQ4OPKBS10 + FQ4OPKBS12 + FQ4OPKBS16 + FQ4OPKBS22 + FQ4OPKBS23 + FQ4OPKBS25 + FQ4OPKBS28 + FQ4OPKBS29 + FQ4OPKBS30 + FQ4OPKBS32)/(12-MISSSC))*12).
EXECUTE.
*Social Interaction (SI) (11 items) --  66.7% (i.e., if MISS is less than or equal to 3.63) as a cut-off point.
COMPUTE FQ4OPKBSSI=-9999.
EXECUTE.
IF (MISSSI < 3.63) FQ4OPKBSSI=RND(((FQ4OPKBS05 + FQ4OPKBS14 + FQ4OPKBS15 + FQ4OPKBS17 + FQ4OPKBS19 + FQ4OPKBS20 + FQ4OPKBS21 + FQ4OPKBS24 + FQ4OPKBS27 + FQ4OPKBS33 + FQ4OPKBS34)/(11-MISSSI))*11).
EXECUTE.   
*Social Independence (SIN) (11 items) -- 66.7% (i.e., if MISS is less than or equal to 3.63) as a cut-off point.
COMPUTE FQ4OPKBSSIN=-9999.
IF (MISSSIN < 3.63) FQ4OPKBSSIN=RND(((FQ4OPKBS01 + FQ4OPKBS03 + FQ4OPKBS04 + FQ4OPKBS06 + FQ4OPKBS08 + FQ4OPKBS09 + FQ4OPKBS11 + FQ4OPKBS13 + FQ4OPKBS18 + FQ4OPKBS26 + FQ4OPKBS31)/(11-MISSSIN))*11).
EXECUTE.    

*PKBS Total T Score (TOTT).
COMPUTE FQ4OPKBSTOTT=-9999.
EXECUTE.

IF (FQ4OPKBSTOT<30) FQ4OPKBSTOTT=52. 
IF (FQ4OPKBSTOT=30) FQ4OPKBSTOTT=52.
IF (FQ4OPKBSTOT=31) FQ4OPKBSTOTT=53.
IF (FQ4OPKBSTOT=32) FQ4OPKBSTOTT=54.
IF (FQ4OPKBSTOT=33) FQ4OPKBSTOTT=55.
IF (FQ4OPKBSTOT=34) FQ4OPKBSTOTT=56.
IF (FQ4OPKBSTOT=35) FQ4OPKBSTOTT=57.
IF (FQ4OPKBSTOT=36) FQ4OPKBSTOTT=58.
IF (FQ4OPKBSTOT=37) FQ4OPKBSTOTT=59.
IF (FQ4OPKBSTOT=38) FQ4OPKBSTOTT=60.
IF (FQ4OPKBSTOT=39) FQ4OPKBSTOTT=61.
IF (FQ4OPKBSTOT=40) FQ4OPKBSTOTT=62.
IF (FQ4OPKBSTOT=41) FQ4OPKBSTOTT=63.
IF (FQ4OPKBSTOT=42) FQ4OPKBSTOTT=64.
IF (FQ4OPKBSTOT=43) FQ4OPKBSTOTT=65.
IF (FQ4OPKBSTOT=44) FQ4OPKBSTOTT=66. 
IF (FQ4OPKBSTOT=45) FQ4OPKBSTOTT=67.
IF (FQ4OPKBSTOT=46) FQ4OPKBSTOTT=68.
IF (FQ4OPKBSTOT=47) FQ4OPKBSTOTT=69.
IF (FQ4OPKBSTOT=48) FQ4OPKBSTOTT=70.
IF (FQ4OPKBSTOT=49) FQ4OPKBSTOTT=71.
IF (FQ4OPKBSTOT=50) FQ4OPKBSTOTT=72.
IF (FQ4OPKBSTOT=51) FQ4OPKBSTOTT=73.
IF (FQ4OPKBSTOT=52) FQ4OPKBSTOTT=74.
IF (FQ4OPKBSTOT=53) FQ4OPKBSTOTT=75.
IF (FQ4OPKBSTOT=54) FQ4OPKBSTOTT=76.
IF (FQ4OPKBSTOT=55) FQ4OPKBSTOTT=77.
IF (FQ4OPKBSTOT=56) FQ4OPKBSTOTT=78.
IF (FQ4OPKBSTOT=57) FQ4OPKBSTOTT=79.
IF (FQ4OPKBSTOT=58) FQ4OPKBSTOTT=80.
IF (FQ4OPKBSTOT=59) FQ4OPKBSTOTT=81. 
IF (FQ4OPKBSTOT=60) FQ4OPKBSTOTT=82.
IF (FQ4OPKBSTOT=61) FQ4OPKBSTOTT=83.
IF (FQ4OPKBSTOT=62) FQ4OPKBSTOTT=84.
IF (FQ4OPKBSTOT=63) FQ4OPKBSTOTT=85.
IF (FQ4OPKBSTOT=64) FQ4OPKBSTOTT=86.
IF (FQ4OPKBSTOT=65) FQ4OPKBSTOTT=87. 
IF (FQ4OPKBSTOT=66) FQ4OPKBSTOTT=88.
IF (FQ4OPKBSTOT=67) FQ4OPKBSTOTT=89.
IF (FQ4OPKBSTOT=68) FQ4OPKBSTOTT=90.
IF (FQ4OPKBSTOT=69) FQ4OPKBSTOTT=91.
IF (FQ4OPKBSTOT=70) FQ4OPKBSTOTT=92.
IF (FQ4OPKBSTOT=71) FQ4OPKBSTOTT=93.
IF (FQ4OPKBSTOT=72) FQ4OPKBSTOTT=94.
IF (FQ4OPKBSTOT=73) FQ4OPKBSTOTT=95.
IF (FQ4OPKBSTOT=74) FQ4OPKBSTOTT=96.
IF (FQ4OPKBSTOT=75) FQ4OPKBSTOTT=97.
IF (FQ4OPKBSTOT=76) FQ4OPKBSTOTT=98.
IF (FQ4OPKBSTOT=77) FQ4OPKBSTOTT=99.
IF (FQ4OPKBSTOT=78) FQ4OPKBSTOTT=100.
IF (FQ4OPKBSTOT=79) FQ4OPKBSTOTT=101.
IF (FQ4OPKBSTOT=80) FQ4OPKBSTOTT=102. 
IF (FQ4OPKBSTOT=81) FQ4OPKBSTOTT=103.
IF (FQ4OPKBSTOT=82) FQ4OPKBSTOTT=103.
IF (FQ4OPKBSTOT=83) FQ4OPKBSTOTT=104.
IF (FQ4OPKBSTOT=84) FQ4OPKBSTOTT=105.
IF (FQ4OPKBSTOT=85) FQ4OPKBSTOTT=106.
IF (FQ4OPKBSTOT=86) FQ4OPKBSTOTT=107.
IF (FQ4OPKBSTOT=87) FQ4OPKBSTOTT=108.
IF (FQ4OPKBSTOT=88) FQ4OPKBSTOTT=109.
IF (FQ4OPKBSTOT=89) FQ4OPKBSTOTT=110.
IF (FQ4OPKBSTOT=90) FQ4OPKBSTOTT=111.
IF (FQ4OPKBSTOT=91) FQ4OPKBSTOTT=112.
IF (FQ4OPKBSTOT=92) FQ4OPKBSTOTT=113.
IF (FQ4OPKBSTOT=93) FQ4OPKBSTOTT=114.
IF (FQ4OPKBSTOT=94) FQ4OPKBSTOTT=115.
IF (FQ4OPKBSTOT=95) FQ4OPKBSTOTT=116. 
IF (FQ4OPKBSTOT=96) FQ4OPKBSTOTT=117.
IF (FQ4OPKBSTOT=97) FQ4OPKBSTOTT=118.
IF (FQ4OPKBSTOT=98) FQ4OPKBSTOTT=119.
IF (FQ4OPKBSTOT=99) FQ4OPKBSTOTT=120.
IF (FQ4OPKBSTOT=100) FQ4OPKBSTOTT=121.
IF (FQ4OPKBSTOT=101) FQ4OPKBSTOTT=122.
IF (FQ4OPKBSTOT=102) FQ4OPKBSTOTT=123.
    EXECUTE. 

*PKBS Total Percentile Rank (TOTP).
COMPUTE FQ4OPKBSTOTP=-9999.
EXECUTE.

IF (FQ4OPKBSTOT<35) FQ4OPKBSTOTP=1. 
IF (FQ4OPKBSTOT=35) FQ4OPKBSTOTP=2.
IF (FQ4OPKBSTOT=36) FQ4OPKBSTOTP=2.
IF (FQ4OPKBSTOT=37) FQ4OPKBSTOTP=2.
IF (FQ4OPKBSTOT=38) FQ4OPKBSTOTP=2.
IF (FQ4OPKBSTOT=39) FQ4OPKBSTOTP=2.
IF (FQ4OPKBSTOT=40) FQ4OPKBSTOTP=2.
IF (FQ4OPKBSTOT=41) FQ4OPKBSTOTP=3.
IF (FQ4OPKBSTOT=42) FQ4OPKBSTOTP=3.
IF (FQ4OPKBSTOT=43) FQ4OPKBSTOTP=3.
IF (FQ4OPKBSTOT=44) FQ4OPKBSTOTP=3. 
IF (FQ4OPKBSTOT=45) FQ4OPKBSTOTP=3.
IF (FQ4OPKBSTOT=46) FQ4OPKBSTOTP=4.
IF (FQ4OPKBSTOT=47) FQ4OPKBSTOTP=5.
IF (FQ4OPKBSTOT=48) FQ4OPKBSTOTP=5.
IF (FQ4OPKBSTOT=49) FQ4OPKBSTOTP=5.
IF (FQ4OPKBSTOT=50) FQ4OPKBSTOTP=6.
IF (FQ4OPKBSTOT=51) FQ4OPKBSTOTP=6.
IF (FQ4OPKBSTOT=52) FQ4OPKBSTOTP=7.
IF (FQ4OPKBSTOT=53) FQ4OPKBSTOTP=7.
IF (FQ4OPKBSTOT=54) FQ4OPKBSTOTP=8.
IF (FQ4OPKBSTOT=55) FQ4OPKBSTOTP=8.
IF (FQ4OPKBSTOT=56) FQ4OPKBSTOTP=9.
IF (FQ4OPKBSTOT=57) FQ4OPKBSTOTP=10.
IF (FQ4OPKBSTOT=58) FQ4OPKBSTOTP=11.
IF (FQ4OPKBSTOT=59) FQ4OPKBSTOTP=12. 
IF (FQ4OPKBSTOT=60) FQ4OPKBSTOTP=12.
IF (FQ4OPKBSTOT=61) FQ4OPKBSTOTP=13.
IF (FQ4OPKBSTOT=62) FQ4OPKBSTOTP=14.
IF (FQ4OPKBSTOT=63) FQ4OPKBSTOTP=15.
IF (FQ4OPKBSTOT=64) FQ4OPKBSTOTP=16.
IF (FQ4OPKBSTOT=65) FQ4OPKBSTOTP=18. 
IF (FQ4OPKBSTOT=66) FQ4OPKBSTOTP=19.
IF (FQ4OPKBSTOT=67) FQ4OPKBSTOTP=20.
IF (FQ4OPKBSTOT=68) FQ4OPKBSTOTP=21.
IF (FQ4OPKBSTOT=69) FQ4OPKBSTOTP=23.
IF (FQ4OPKBSTOT=70) FQ4OPKBSTOTP=25.
IF (FQ4OPKBSTOT=71) FQ4OPKBSTOTP=27.
IF (FQ4OPKBSTOT=72) FQ4OPKBSTOTP=28.
IF (FQ4OPKBSTOT=73) FQ4OPKBSTOTP=30.
IF (FQ4OPKBSTOT=74) FQ4OPKBSTOTP=32.
IF (FQ4OPKBSTOT=75) FQ4OPKBSTOTP=35.
IF (FQ4OPKBSTOT=76) FQ4OPKBSTOTP=37.
IF (FQ4OPKBSTOT=77) FQ4OPKBSTOTP=40.
IF (FQ4OPKBSTOT=78) FQ4OPKBSTOTP=44.
IF (FQ4OPKBSTOT=79) FQ4OPKBSTOTP=47.
IF (FQ4OPKBSTOT=80) FQ4OPKBSTOTP=49. 
IF (FQ4OPKBSTOT=81) FQ4OPKBSTOTP=51.
IF (FQ4OPKBSTOT=82) FQ4OPKBSTOTP=51.
IF (FQ4OPKBSTOT=83) FQ4OPKBSTOTP=57.
IF (FQ4OPKBSTOT=84) FQ4OPKBSTOTP=61.
IF (FQ4OPKBSTOT=85) FQ4OPKBSTOTP=64.
IF (FQ4OPKBSTOT=86) FQ4OPKBSTOTP=67.
IF (FQ4OPKBSTOT=87) FQ4OPKBSTOTP=70.
IF (FQ4OPKBSTOT=88) FQ4OPKBSTOTP=72.
IF (FQ4OPKBSTOT=89) FQ4OPKBSTOTP=76.
IF (FQ4OPKBSTOT=90) FQ4OPKBSTOTP=79.
IF (FQ4OPKBSTOT=91) FQ4OPKBSTOTP=81.
IF (FQ4OPKBSTOT=92) FQ4OPKBSTOTP=84.
IF (FQ4OPKBSTOT=93) FQ4OPKBSTOTP=86.
IF (FQ4OPKBSTOT=94) FQ4OPKBSTOTP=88.
IF (FQ4OPKBSTOT=95) FQ4OPKBSTOTP=89. 
IF (FQ4OPKBSTOT=96) FQ4OPKBSTOTP=91.
IF (FQ4OPKBSTOT=97) FQ4OPKBSTOTP=94.
IF (FQ4OPKBSTOT=98) FQ4OPKBSTOTP=95.
IF (FQ4OPKBSTOT=99) FQ4OPKBSTOTP=97.
IF (FQ4OPKBSTOT=100) FQ4OPKBSTOTP=97.
IF (FQ4OPKBSTOT=101) FQ4OPKBSTOTP=98.
IF (FQ4OPKBSTOT=102) FQ4OPKBSTOTP=99.
    EXECUTE. 

*PKBS Social Cooperation Functional Level (SCFL)
    1=Significant Deficit, 2=Moderate Deficit, 3=Average, 4=High Functioning.
COMPUTE FQ4OPKBSSCFL=-9999.
EXECUTE.
IF (FQ4OPKBSSC GE 0 AND FQ4OPKBSSC LE 15) FQ4OPKBSSCFL=1.
IF (FQ4OPKBSSC GE 16 AND FQ4OPKBSSC LE 23) FQ4OPKBSSCFL=2.
IF (FQ4OPKBSSC GE 24 AND FQ4OPKBSSC LE 33) FQ4OPKBSSCFL=3.
IF (FQ4OPKBSSC GE 34 AND FQ4OPKBSSC LE 36) FQ4OPKBSSCFL=4.
    EXECUTE.
*PKBS Social Interaction Functional Level (SIFL)
    1=Significant Deficit, 2=Moderate Deficit, 3=Average, 4=High Functioning.
COMPUTE FQ4OPKBSSIFL=-9999.
EXECUTE.
IF (FQ4OPKBSSI GE 0 AND FQ4OPKBSSI LE 10) FQ4OPKBSSIFL=1.
IF (FQ4OPKBSSI GE 11 AND FQ4OPKBSSI LE 19) FQ4OPKBSSIFL=2.
IF (FQ4OPKBSSI GE 20 AND FQ4OPKBSSI LE 28) FQ4OPKBSSIFL=3.
IF (FQ4OPKBSSI GE 29 AND FQ4OPKBSSI LE 33) FQ4OPKBSSIFL=4.
    EXECUTE.
*PKBS Social Independence Functional Level (SINFL)
    1=Significant Deficit, 2=Moderate Deficit, 3=Average, 4=High Functioning.
COMPUTE FQ4OPKBSSINFL=-9999.
EXECUTE.
IF (FQ4OPKBSSIN GE 0 AND FQ4OPKBSSIN LE 17) FQ4OPKBSSINFL=1.
IF (FQ4OPKBSSIN GE 18 AND FQ4OPKBSSIN LE 22) FQ4OPKBSSINFL=2.
IF (FQ4OPKBSSIN GE 23 AND FQ4OPKBSSIN LE 30) FQ4OPKBSSINFL=3.
IF (FQ4OPKBSSIN GE 31 AND FQ4OPKBSSIN LE 33) FQ4OPKBSSINFL=4.
    EXECUTE.

*STEP 8: RECODING -9999 VALUES TO MISSING VALUES USING THE STAT VARIABLE & LABELING VALUES AS MISSING.
**All missingness should be checked and labeled correctly here (EXAMPLE BELOW). 
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
DO IF MISSING(FD4OSTAT).
DO REPEAT x = FQ4OPKBSTOT TO FQ4OPKBSSINFL.
RECODE FD4OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.
*Checking frequenices for constructs to look at missingness. 
FREQUENCIES VARIABLES=FD4OSTAT FQ4OPKBSTOT FQ4OPKBSSC FQ4OPKBSSI FQ4OPKBSSIN FQ4OPKBSTOTT FQ4OPKBSTOTP FQ4OPKBSSCFL FQ4OPKBSSIFL FQ4OPKBSSINFL
  /ORDER=ANALYSIS.
*If there IS missingness that was not accounted for in the STAT variable (for example in DERSAC, participants who indicated they did not have an additional caregiver should be coded as -44
Each construct needs to be coded by ID here. If there IS NO additional missingess not accounted for, delete only this section of syntax and write **CHECKED AND NOT NEEDED.
**CHECKED AND NOT NEEDED
*At this point, the only remaining missingness should represent when participant did not answer a sufficient number of questions, assuming STAT variable was correctly coded for this measure -- CHECK THIS! 
*The following syntax will recode this remaining missingness for each new construct.
IF (FQ4OPKBSTOT=-9999) FQ4OPKBSTOT=-43.
EXECUTE.  
IF (FQ4OPKBSSC=-9999) FQ4OPKBSSC=-43.
EXECUTE.  
IF (FQ4OPKBSSI=-9999) FQ4OPKBSSI=-43.
EXECUTE.  
IF (FQ4OPKBSSIN=-9999) FQ4OPKBSSIN=-43.
EXECUTE.  
IF (FQ4OPKBSTOTT=-9999) FQ4OPKBSTOTT=-43.
EXECUTE. 
IF (FQ4OPKBSTOTP=-9999) FQ4OPKBSTOTP=-43.
EXECUTE. 
IF (FQ4OPKBSSCFL=-9999) FQ4OPKBSSCFL=-43.
EXECUTE. 
IF (FQ4OPKBSSIFL=-9999) FQ4OPKBSSIFL=-43.
EXECUTE. 
IF (FQ4OPKBSSINFL=-9999) FQ4OPKBSSINFL=-43.
EXECUTE. 

MISSING VALUES
   FQ4OPKBSTOT FQ4OPKBSSC FQ4OPKBSSI FQ4OPKBSSIN FQ4OPKBSTOTT FQ4OPKBSTOTP FQ4OPKBSSCFL FQ4OPKBSSIFL FQ4OPKBSSINFL
    (LO THRU -1).
EXECUTE.

*STEP 9: LABELING CONSTRUCTS.
VARIABLE LABELS
FQ4OPKBSTOT 'PKBS Total Score [FQ4OPKBSTOT]'
FQ4OPKBSSC 'PKBS Social Cooperation [FQ4OPKBSSC]'
FQ4OPKBSSI 'PKBS Social Interaction [FQ4OPKBSSI]'
FQ4OPKBSSIN 'PKBS Social Independence [FQ4OPKBSSIN]'
FQ4OPKBSTOTT 'PKBS Total T Score [FQ4OPKBSTOTT]'
FQ4OPKBSTOTP 'PKBS Total Percentile Rank [FQ4OPKBSTOTP]'
FQ4OPKBSSCFL'PKBS Social Cooperation Functional Level [FQ4OPKBSSCFL]'
FQ4OPKBSSIFL'PKBS Social Interaction Functional Level [FQ4OPKBSSIFL]'
FQ4OPKBSSINFL'PKBS Social Independence Functional Level [FQ4OPKBSSINFL]'.
EXECUTE.

*STEP 9A: ADD VALUE LABELS.
*Include ALL missing value labels (SEE STEP 8 FOR FULL LIST). 
*Be sure to also include value labels for any constructs that need labels (e.g., 0 'No', 1 'Yes'). Summed or averaged scores do NOT need value labels.
VALUE LABELS
   FQ4OPKBSTOT FQ4OPKBSSC FQ4OPKBSSI FQ4OPKBSSIN FQ4OPKBSTOTT FQ4OPKBSTOTP FQ4OPKBSSCFL FQ4OPKBSSIFL FQ4OPKBSSINFL
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
-10 'Prefer not to Answer (-10)'.
EXECUTE. 

VALUE LABELS
    FQ4OPKBSSCFL FQ4OPKBSSIFL FQ4OPKBSSINFL
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
-10 'Prefer not to Answer (-10)'
1 'Significant Deficit'
2 'Moderate Deficit'
3 'Average'
4 'High Functioning'.
EXECUTE. 


*STEP 10: CHECK FREQUENCIES.
*Checking frequencies of all constructs.
FREQUENCIES VARIABLES=FD4OSTAT FQ4OPKBSTOT FQ4OPKBSSC FQ4OPKBSSI FQ4OPKBSSIN FQ4OPKBSTOTT FQ4OPKBSTOTP FQ4OPKBSSCFL FQ4OPKBSSIFL FQ4OPKBSSINFL
  /ORDER=ANALYSIS.

*STEP 11: CHECK DESCRIPTIVES.
*Checking descriptives for all constructs.
DESCRIPTIVES VARIABLES=FQ4OPKBSTOT FQ4OPKBSSC FQ4OPKBSSI FQ4OPKBSSIN FQ4OPKBSTOTT FQ4OPKBSTOTP FQ4OPKBSSCFL FQ4OPKBSSIFL FQ4OPKBSSINFL
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 12: SAVE CLEANED DATA FILE.
*First, sorting the data file by ID and resaving the final file.
*Using /KEEP command to keep ONLY ID + RD + the constructs that were created. 
SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OPKBS_Constructs.sav'
  /KEEP ID FD4ORD FQ4OPKBSTOT FQ4OPKBSSC FQ4OPKBSSI FQ4OPKBSSIN FQ4OPKBSTOTT FQ4OPKBSTOTP FQ4OPKBSSCFL FQ4OPKBSSIFL FQ4OPKBSSINFL
  /COMPRESSED.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OPKBS_Constructs.sav'.
EXECUTE.

*STEP 13: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE 
 OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ4OPKBS_Constructs.spv'
LOCK=NO.


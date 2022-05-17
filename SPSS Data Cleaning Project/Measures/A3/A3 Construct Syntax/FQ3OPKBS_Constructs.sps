* Encoding: UTF-8.
*STEP 0: NOTES.
*PRESCHOOL AND KINDERGARTEN BEHAVIOR SCALE (PKBS).
*CREATED THE FOLLOWING SUBSCALES & RAN APLHAS; LIST SUBSCALES BELOW.
*Total score (TOT).
*Social Cooperation (SC).
*Social Interaction (SI).
*Social Independence (SIN).

*4-19-22(BM): Adapted syntax for A3.
*04-21-22(AAC): Checked.
*------------------------------------------------------------------------------.
*STEP 1: OPENING CLEANED DATA.
*Insert the correct file path and file name. Use syntax to open cleaned data file.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OPKBS_Cleaned.sav'.

*STEP 2: SAVING CLEANED DATA AS A CONSTRUCT FILE. 
*Insert the correct file path and file name.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OPKBS_Constructs.sav'
  /COMPRESSED.

*STEP 3: DESCRIPTIVE STATISTICS (1. FREQ AND 2. CORR) FOR RAW VARIABLES (TOTAL SCORE 1ST, THEN SUBSCALES).
*When running this step note any additional missingness (any other codes) that are not accounted for in the STAT variable. These missing codes (and corresponding IDs) will need to be 
incorporated in STEP 8 below.
FREQ VARS=FQ3OPKBS01, FQ3OPKBS02, FQ3OPKBS03, FQ3OPKBS04, FQ3OPKBS05, FQ3OPKBS06, FQ3OPKBS07, FQ3OPKBS08, FQ3OPKBS09, 
    FQ3OPKBS10, FQ3OPKBS11, FQ3OPKBS12, FQ3OPKBS13, FQ3OPKBS14, FQ3OPKBS15, FQ3OPKBS16, FQ3OPKBS17, FQ3OPKBS18, FQ3OPKBS19,
    FQ3OPKBS20, FQ3OPKBS21, FQ3OPKBS22, FQ3OPKBS23, FQ3OPKBS24, FQ3OPKBS25, FQ3OPKBS26, FQ3OPKBS27, FQ3OPKBS28,
    FQ3OPKBS29, FQ3OPKBS30, FQ3OPKBS31, FQ3OPKBS32, FQ3OPKBS33, FQ3OPKBS34.
*PKBS Total Score.
CORR VARS=FQ3OPKBS01, FQ3OPKBS02, FQ3OPKBS03, FQ3OPKBS05, FQ3OPKBS06, FQ3OPKBS07, FQ3OPKBS08, FQ3OPKBS09, 
    FQ3OPKBS10, FQ3OPKBS11, FQ3OPKBS12, FQ3OPKBS13, FQ3OPKBS14, FQ3OPKBS15, FQ3OPKBS16, FQ3OPKBS17, FQ3OPKBS18, FQ3OPKBS19,
    FQ3OPKBS20, FQ3OPKBS21, FQ3OPKBS22, FQ3OPKBS23, FQ3OPKBS24, FQ3OPKBS25, FQ3OPKBS26, FQ3OPKBS27, FQ3OPKBS28,
    FQ3OPKBS29, FQ3OPKBS30, FQ3OPKBS31, FQ3OPKBS32, FQ3OPKBS33, FQ3OPKBS34.
*Social Cooperation (SC).
CORR VARS=FQ3OPKBS02, FQ3OPKBS07, FQ3OPKBS10, FQ3OPKBS12, FQ3OPKBS16, FQ3OPKBS22, FQ3OPKBS23, FQ3OPKBS25, FQ3OPKBS28, FQ3OPKBS29, FQ3OPKBS30, FQ3OPKBS32.
*Social Interaction (SI).
CORR VARS=FQ3OPKBS05, FQ3OPKBS14, FQ3OPKBS15, FQ3OPKBS17, FQ3OPKBS19, FQ3OPKBS20, FQ3OPKBS21, FQ3OPKBS24, FQ3OPKBS27, FQ3OPKBS33, FQ3OPKBS34.
*Social Independence (SIN).
CORR VARS=FQ3OPKBS01, FQ3OPKBS03, FQ3OPKBS06, FQ3OPKBS08, FQ3OPKBS09, FQ3OPKBS11, FQ3OPKBS13, FQ3OPKBS18, FQ3OPKBS26, FQ3OPKBS31.

*STEP 4: RECODING MISSING VALUES.
RECODE FQ3OPKBS01 TO FQ3OPKBS34 (MISSING=-9999).
EXECUTE.
    
*STEP 5: RELIABILITY STATISTICS (TOTAL SCORE 1st, FOLLOWED BY SUBSCALES).
*PKBS Total Score (33 items; n=52; alpha=.916).
REL VARS=FQ3OPKBS01, FQ3OPKBS02, FQ3OPKBS03, FQ3OPKBS05, FQ3OPKBS06, FQ3OPKBS07, FQ3OPKBS08, FQ3OPKBS09, 
    FQ3OPKBS10, FQ3OPKBS11, FQ3OPKBS12, FQ3OPKBS13, FQ3OPKBS14, FQ3OPKBS15, FQ3OPKBS16, FQ3OPKBS17, FQ3OPKBS18, FQ3OPKBS19,
    FQ3OPKBS20, FQ3OPKBS21, FQ3OPKBS22, FQ3OPKBS23, FQ3OPKBS24, FQ3OPKBS25, FQ3OPKBS26, FQ3OPKBS27, FQ3OPKBS28,
    FQ3OPKBS29, FQ3OPKBS30, FQ3OPKBS31, FQ3OPKBS32, FQ3OPKBS33, FQ3OPKBS34
/SCALE(All)= ALL.
*Social Cooperation (SC) (12 items; n=53; alpha=.842).
REL VARS=FQ3OPKBS02, FQ3OPKBS07, FQ3OPKBS10, FQ3OPKBS12, FQ3OPKBS16, FQ3OPKBS22, FQ3OPKBS23, FQ3OPKBS25, FQ3OPKBS28, FQ3OPKBS29, FQ3OPKBS30, FQ3OPKBS32
/SCALE(All)= ALL.
*Social Interaction (SI) (11 items; n=54; alpha=.868).
REL VARS=FQ3OPKBS05, FQ3OPKBS14, FQ3OPKBS15, FQ3OPKBS17, FQ3OPKBS19, FQ3OPKBS20, FQ3OPKBS21, FQ3OPKBS24, FQ3OPKBS27, FQ3OPKBS33, FQ3OPKBS34
/SCALE(All)= ALL.
*Social Independence (SIN) (10 items; n=53; alpha=.742).
REL VARS=FQ3OPKBS01, FQ3OPKBS03, FQ3OPKBS06, FQ3OPKBS08, FQ3OPKBS09, FQ3OPKBS11, FQ3OPKBS13, FQ3OPKBS18, FQ3OPKBS26, FQ3OPKBS31
/SCALE(All)= ALL.

*STEP 6: COUNTING MISSING DATA (JUST SUBSCALES), THEN RECODING TO 0 TO AVOID NEGATIVE EFFECTS ON CONSTRUCTS.
*Social Cooperation (SC).
COUNT MISSSC=FQ3OPKBS02, FQ3OPKBS07, FQ3OPKBS10, FQ3OPKBS12, FQ3OPKBS16, FQ3OPKBS22, FQ3OPKBS23, FQ3OPKBS25, FQ3OPKBS28, FQ3OPKBS29, FQ3OPKBS30, FQ3OPKBS32 (-9999).
*Social Interaction (SI).
COUNT MISSSI=FQ3OPKBS05, FQ3OPKBS14, FQ3OPKBS15, FQ3OPKBS17, FQ3OPKBS19, FQ3OPKBS20, FQ3OPKBS21, FQ3OPKBS24, FQ3OPKBS27, FQ3OPKBS33, FQ3OPKBS34 (-9999).
*Social Independence (SIN).
COUNT MISSSIN=FQ3OPKBS01, FQ3OPKBS03, FQ3OPKBS04, FQ3OPKBS06, FQ3OPKBS08, FQ3OPKBS09, FQ3OPKBS11, FQ3OPKBS13, FQ3OPKBS18, FQ3OPKBS26, FQ3OPKBS31 (-9999).

RECODE FQ3OPKBS01 TO FQ3OPKBS34 (-9999=0).
EXECUTE.

*STEP 7: CREATE TOTAL AND SUBSCALES SCORES  (CHECK THAT REVERSE-SCORED ITEMS INCLUDED).
*Note each subscale name and calculate missingness allowed.
*CREATING TOTAL SCORE.
*Total Score (34 items) -- USE MISSINGNESS FOR EACH SUBSCALE as a cut-off point.
COMPUTE FQ3OPKBSTOT=-9999.
EXECUTE.
IF (MISSSC < 3.96  AND MISSSI < 3.63 AND MISSSIN < 3.63) FQ3OPKBSTOT=RND(((FQ3OPKBS01 + FQ3OPKBS02 + FQ3OPKBS03 + FQ3OPKBS04 + FQ3OPKBS05 + FQ3OPKBS06 + FQ3OPKBS07 + FQ3OPKBS08 + FQ3OPKBS09 + 
    FQ3OPKBS10 + FQ3OPKBS11 + FQ3OPKBS12 + FQ3OPKBS13 + FQ3OPKBS14 + FQ3OPKBS15 + FQ3OPKBS16 + FQ3OPKBS17 + FQ3OPKBS18 + FQ3OPKBS19 +
    FQ3OPKBS20 + FQ3OPKBS21 + FQ3OPKBS22 + FQ3OPKBS23 + FQ3OPKBS24 + FQ3OPKBS25 + FQ3OPKBS26 + FQ3OPKBS27 + FQ3OPKBS28 +
    FQ3OPKBS29 + FQ3OPKBS30 + FQ3OPKBS31 + FQ3OPKBS32 + FQ3OPKBS33 + FQ3OPKBS34)/(34-MISSSC-MISSSI-MISSSIN))*34).
EXECUTE.
*CREATING ALL SUBSCALES (CHECK THAT REVERSE-SCORED ITEMS INCLUDED).
*Social Cooperation (SC) (12 items) -- 66.7% (i.e., if MISS is less than or equal to 3.96) as a cut-off point.
COMPUTE FQ3OPKBSSC=-9999.
EXECUTE.
IF (MISSSC < 3.96) FQ3OPKBSSC=RND(((FQ3OPKBS02 + FQ3OPKBS07 + FQ3OPKBS10 + FQ3OPKBS12 + FQ3OPKBS16 + FQ3OPKBS22 + FQ3OPKBS23 + FQ3OPKBS25 + FQ3OPKBS28 + FQ3OPKBS29 + FQ3OPKBS30 + FQ3OPKBS32)/(12-MISSSC))*12).
EXECUTE.
*Social Interaction (SI) (11 items) --  66.7% (i.e., if MISS is less than or equal to 3.63) as a cut-off point.
COMPUTE FQ3OPKBSSI=-9999.
EXECUTE.
IF (MISSSI < 3.63) FQ3OPKBSSI=RND(((FQ3OPKBS05 + FQ3OPKBS14 + FQ3OPKBS15 + FQ3OPKBS17 + FQ3OPKBS19 + FQ3OPKBS20 + FQ3OPKBS21 + FQ3OPKBS24 + FQ3OPKBS27 + FQ3OPKBS33 + FQ3OPKBS34)/(11-MISSSI))*11).
EXECUTE.   
*Social Independence (SIN) (11 items) -- 66.7% (i.e., if MISS is less than or equal to 3.63) as a cut-off point.
COMPUTE FQ3OPKBSSIN=-9999.
IF (MISSSIN < 3.63) FQ3OPKBSSIN=RND(((FQ3OPKBS01 + FQ3OPKBS03 + FQ3OPKBS04 + FQ3OPKBS06 + FQ3OPKBS08 + FQ3OPKBS09 + FQ3OPKBS11 + FQ3OPKBS13 + FQ3OPKBS18 + FQ3OPKBS26 + FQ3OPKBS31)/(11-MISSSIN))*11).
EXECUTE.    

*PKBS Total T Score (TOTT).
COMPUTE FQ3OPKBSTOTT=-9999.
EXECUTE.

IF (FQ3OPKBSTOT<30) FQ3OPKBSTOTT=52. 
IF (FQ3OPKBSTOT=30) FQ3OPKBSTOTT=52.
IF (FQ3OPKBSTOT=31) FQ3OPKBSTOTT=53.
IF (FQ3OPKBSTOT=32) FQ3OPKBSTOTT=54.
IF (FQ3OPKBSTOT=33) FQ3OPKBSTOTT=55.
IF (FQ3OPKBSTOT=34) FQ3OPKBSTOTT=56.
IF (FQ3OPKBSTOT=35) FQ3OPKBSTOTT=57.
IF (FQ3OPKBSTOT=36) FQ3OPKBSTOTT=58.
IF (FQ3OPKBSTOT=37) FQ3OPKBSTOTT=59.
IF (FQ3OPKBSTOT=38) FQ3OPKBSTOTT=60.
IF (FQ3OPKBSTOT=39) FQ3OPKBSTOTT=61.
IF (FQ3OPKBSTOT=40) FQ3OPKBSTOTT=62.
IF (FQ3OPKBSTOT=41) FQ3OPKBSTOTT=63.
IF (FQ3OPKBSTOT=42) FQ3OPKBSTOTT=64.
IF (FQ3OPKBSTOT=43) FQ3OPKBSTOTT=65.
IF (FQ3OPKBSTOT=44) FQ3OPKBSTOTT=66. 
IF (FQ3OPKBSTOT=45) FQ3OPKBSTOTT=67.
IF (FQ3OPKBSTOT=46) FQ3OPKBSTOTT=68.
IF (FQ3OPKBSTOT=47) FQ3OPKBSTOTT=69.
IF (FQ3OPKBSTOT=48) FQ3OPKBSTOTT=70.
IF (FQ3OPKBSTOT=49) FQ3OPKBSTOTT=71.
IF (FQ3OPKBSTOT=50) FQ3OPKBSTOTT=72.
IF (FQ3OPKBSTOT=51) FQ3OPKBSTOTT=73.
IF (FQ3OPKBSTOT=52) FQ3OPKBSTOTT=74.
IF (FQ3OPKBSTOT=53) FQ3OPKBSTOTT=75.
IF (FQ3OPKBSTOT=54) FQ3OPKBSTOTT=76.
IF (FQ3OPKBSTOT=55) FQ3OPKBSTOTT=77.
IF (FQ3OPKBSTOT=56) FQ3OPKBSTOTT=78.
IF (FQ3OPKBSTOT=57) FQ3OPKBSTOTT=79.
IF (FQ3OPKBSTOT=58) FQ3OPKBSTOTT=80.
IF (FQ3OPKBSTOT=59) FQ3OPKBSTOTT=81. 
IF (FQ3OPKBSTOT=60) FQ3OPKBSTOTT=82.
IF (FQ3OPKBSTOT=61) FQ3OPKBSTOTT=83.
IF (FQ3OPKBSTOT=62) FQ3OPKBSTOTT=84.
IF (FQ3OPKBSTOT=63) FQ3OPKBSTOTT=85.
IF (FQ3OPKBSTOT=64) FQ3OPKBSTOTT=86.
IF (FQ3OPKBSTOT=65) FQ3OPKBSTOTT=87. 
IF (FQ3OPKBSTOT=66) FQ3OPKBSTOTT=88.
IF (FQ3OPKBSTOT=67) FQ3OPKBSTOTT=89.
IF (FQ3OPKBSTOT=68) FQ3OPKBSTOTT=90.
IF (FQ3OPKBSTOT=69) FQ3OPKBSTOTT=91.
IF (FQ3OPKBSTOT=70) FQ3OPKBSTOTT=92.
IF (FQ3OPKBSTOT=71) FQ3OPKBSTOTT=93.
IF (FQ3OPKBSTOT=72) FQ3OPKBSTOTT=94.
IF (FQ3OPKBSTOT=73) FQ3OPKBSTOTT=95.
IF (FQ3OPKBSTOT=74) FQ3OPKBSTOTT=96.
IF (FQ3OPKBSTOT=75) FQ3OPKBSTOTT=97.
IF (FQ3OPKBSTOT=76) FQ3OPKBSTOTT=98.
IF (FQ3OPKBSTOT=77) FQ3OPKBSTOTT=99.
IF (FQ3OPKBSTOT=78) FQ3OPKBSTOTT=100.
IF (FQ3OPKBSTOT=79) FQ3OPKBSTOTT=101.
IF (FQ3OPKBSTOT=80) FQ3OPKBSTOTT=102. 
IF (FQ3OPKBSTOT=81) FQ3OPKBSTOTT=103.
IF (FQ3OPKBSTOT=82) FQ3OPKBSTOTT=103.
IF (FQ3OPKBSTOT=83) FQ3OPKBSTOTT=104.
IF (FQ3OPKBSTOT=84) FQ3OPKBSTOTT=105.
IF (FQ3OPKBSTOT=85) FQ3OPKBSTOTT=106.
IF (FQ3OPKBSTOT=86) FQ3OPKBSTOTT=107.
IF (FQ3OPKBSTOT=87) FQ3OPKBSTOTT=108.
IF (FQ3OPKBSTOT=88) FQ3OPKBSTOTT=109.
IF (FQ3OPKBSTOT=89) FQ3OPKBSTOTT=110.
IF (FQ3OPKBSTOT=90) FQ3OPKBSTOTT=111.
IF (FQ3OPKBSTOT=91) FQ3OPKBSTOTT=112.
IF (FQ3OPKBSTOT=92) FQ3OPKBSTOTT=113.
IF (FQ3OPKBSTOT=93) FQ3OPKBSTOTT=114.
IF (FQ3OPKBSTOT=94) FQ3OPKBSTOTT=115.
IF (FQ3OPKBSTOT=95) FQ3OPKBSTOTT=116. 
IF (FQ3OPKBSTOT=96) FQ3OPKBSTOTT=117.
IF (FQ3OPKBSTOT=97) FQ3OPKBSTOTT=118.
IF (FQ3OPKBSTOT=98) FQ3OPKBSTOTT=119.
IF (FQ3OPKBSTOT=99) FQ3OPKBSTOTT=120.
IF (FQ3OPKBSTOT=100) FQ3OPKBSTOTT=121.
IF (FQ3OPKBSTOT=101) FQ3OPKBSTOTT=122.
IF (FQ3OPKBSTOT=102) FQ3OPKBSTOTT=123.
    EXECUTE. 

*PKBS Total Percentile Rank (TOTP).
COMPUTE FQ3OPKBSTOTP=-9999.
EXECUTE.

IF (FQ3OPKBSTOT<35) FQ3OPKBSTOTP=1. 
IF (FQ3OPKBSTOT=35) FQ3OPKBSTOTP=2.
IF (FQ3OPKBSTOT=36) FQ3OPKBSTOTP=2.
IF (FQ3OPKBSTOT=37) FQ3OPKBSTOTP=2.
IF (FQ3OPKBSTOT=38) FQ3OPKBSTOTP=2.
IF (FQ3OPKBSTOT=39) FQ3OPKBSTOTP=2.
IF (FQ3OPKBSTOT=40) FQ3OPKBSTOTP=2.
IF (FQ3OPKBSTOT=41) FQ3OPKBSTOTP=3.
IF (FQ3OPKBSTOT=42) FQ3OPKBSTOTP=3.
IF (FQ3OPKBSTOT=43) FQ3OPKBSTOTP=3.
IF (FQ3OPKBSTOT=44) FQ3OPKBSTOTP=3. 
IF (FQ3OPKBSTOT=45) FQ3OPKBSTOTP=3.
IF (FQ3OPKBSTOT=46) FQ3OPKBSTOTP=4.
IF (FQ3OPKBSTOT=47) FQ3OPKBSTOTP=5.
IF (FQ3OPKBSTOT=48) FQ3OPKBSTOTP=5.
IF (FQ3OPKBSTOT=49) FQ3OPKBSTOTP=5.
IF (FQ3OPKBSTOT=50) FQ3OPKBSTOTP=6.
IF (FQ3OPKBSTOT=51) FQ3OPKBSTOTP=6.
IF (FQ3OPKBSTOT=52) FQ3OPKBSTOTP=7.
IF (FQ3OPKBSTOT=53) FQ3OPKBSTOTP=7.
IF (FQ3OPKBSTOT=54) FQ3OPKBSTOTP=8.
IF (FQ3OPKBSTOT=55) FQ3OPKBSTOTP=8.
IF (FQ3OPKBSTOT=56) FQ3OPKBSTOTP=9.
IF (FQ3OPKBSTOT=57) FQ3OPKBSTOTP=10.
IF (FQ3OPKBSTOT=58) FQ3OPKBSTOTP=11.
IF (FQ3OPKBSTOT=59) FQ3OPKBSTOTP=12. 
IF (FQ3OPKBSTOT=60) FQ3OPKBSTOTP=12.
IF (FQ3OPKBSTOT=61) FQ3OPKBSTOTP=13.
IF (FQ3OPKBSTOT=62) FQ3OPKBSTOTP=14.
IF (FQ3OPKBSTOT=63) FQ3OPKBSTOTP=15.
IF (FQ3OPKBSTOT=64) FQ3OPKBSTOTP=16.
IF (FQ3OPKBSTOT=65) FQ3OPKBSTOTP=18. 
IF (FQ3OPKBSTOT=66) FQ3OPKBSTOTP=19.
IF (FQ3OPKBSTOT=67) FQ3OPKBSTOTP=20.
IF (FQ3OPKBSTOT=68) FQ3OPKBSTOTP=21.
IF (FQ3OPKBSTOT=69) FQ3OPKBSTOTP=23.
IF (FQ3OPKBSTOT=70) FQ3OPKBSTOTP=25.
IF (FQ3OPKBSTOT=71) FQ3OPKBSTOTP=27.
IF (FQ3OPKBSTOT=72) FQ3OPKBSTOTP=28.
IF (FQ3OPKBSTOT=73) FQ3OPKBSTOTP=30.
IF (FQ3OPKBSTOT=74) FQ3OPKBSTOTP=32.
IF (FQ3OPKBSTOT=75) FQ3OPKBSTOTP=35.
IF (FQ3OPKBSTOT=76) FQ3OPKBSTOTP=37.
IF (FQ3OPKBSTOT=77) FQ3OPKBSTOTP=40.
IF (FQ3OPKBSTOT=78) FQ3OPKBSTOTP=44.
IF (FQ3OPKBSTOT=79) FQ3OPKBSTOTP=47.
IF (FQ3OPKBSTOT=80) FQ3OPKBSTOTP=49. 
IF (FQ3OPKBSTOT=81) FQ3OPKBSTOTP=51.
IF (FQ3OPKBSTOT=82) FQ3OPKBSTOTP=51.
IF (FQ3OPKBSTOT=83) FQ3OPKBSTOTP=57.
IF (FQ3OPKBSTOT=84) FQ3OPKBSTOTP=61.
IF (FQ3OPKBSTOT=85) FQ3OPKBSTOTP=64.
IF (FQ3OPKBSTOT=86) FQ3OPKBSTOTP=67.
IF (FQ3OPKBSTOT=87) FQ3OPKBSTOTP=70.
IF (FQ3OPKBSTOT=88) FQ3OPKBSTOTP=72.
IF (FQ3OPKBSTOT=89) FQ3OPKBSTOTP=76.
IF (FQ3OPKBSTOT=90) FQ3OPKBSTOTP=79.
IF (FQ3OPKBSTOT=91) FQ3OPKBSTOTP=81.
IF (FQ3OPKBSTOT=92) FQ3OPKBSTOTP=84.
IF (FQ3OPKBSTOT=93) FQ3OPKBSTOTP=86.
IF (FQ3OPKBSTOT=94) FQ3OPKBSTOTP=88.
IF (FQ3OPKBSTOT=95) FQ3OPKBSTOTP=89. 
IF (FQ3OPKBSTOT=96) FQ3OPKBSTOTP=91.
IF (FQ3OPKBSTOT=97) FQ3OPKBSTOTP=94.
IF (FQ3OPKBSTOT=98) FQ3OPKBSTOTP=95.
IF (FQ3OPKBSTOT=99) FQ3OPKBSTOTP=97.
IF (FQ3OPKBSTOT=100) FQ3OPKBSTOTP=97.
IF (FQ3OPKBSTOT=101) FQ3OPKBSTOTP=98.
IF (FQ3OPKBSTOT=102) FQ3OPKBSTOTP=99.
    EXECUTE. 

*PKBS Social Cooperation Functional Level (SCFL)
    1=Significant Deficit, 2=Moderate Deficit, 3=Average, 4=High Functioning.
COMPUTE FQ3OPKBSSCFL=-9999.
EXECUTE.
IF (FQ3OPKBSSC GE 0 AND FQ3OPKBSSC LE 15) FQ3OPKBSSCFL=1.
IF (FQ3OPKBSSC GE 16 AND FQ3OPKBSSC LE 23) FQ3OPKBSSCFL=2.
IF (FQ3OPKBSSC GE 24 AND FQ3OPKBSSC LE 33) FQ3OPKBSSCFL=3.
IF (FQ3OPKBSSC GE 34 AND FQ3OPKBSSC LE 36) FQ3OPKBSSCFL=4.
    EXECUTE.
*PKBS Social Interaction Functional Level (SIFL)
    1=Significant Deficit, 2=Moderate Deficit, 3=Average, 4=High Functioning.
COMPUTE FQ3OPKBSSIFL=-9999.
EXECUTE.
IF (FQ3OPKBSSI GE 0 AND FQ3OPKBSSI LE 10) FQ3OPKBSSIFL=1.
IF (FQ3OPKBSSI GE 11 AND FQ3OPKBSSI LE 19) FQ3OPKBSSIFL=2.
IF (FQ3OPKBSSI GE 20 AND FQ3OPKBSSI LE 28) FQ3OPKBSSIFL=3.
IF (FQ3OPKBSSI GE 29 AND FQ3OPKBSSI LE 33) FQ3OPKBSSIFL=4.
    EXECUTE.
*PKBS Social Independence Functional Level (SINFL)
    1=Significant Deficit, 2=Moderate Deficit, 3=Average, 4=High Functioning.
COMPUTE FQ3OPKBSSINFL=-9999.
EXECUTE.
IF (FQ3OPKBSSIN GE 0 AND FQ3OPKBSSIN LE 17) FQ3OPKBSSINFL=1.
IF (FQ3OPKBSSIN GE 18 AND FQ3OPKBSSIN LE 22) FQ3OPKBSSINFL=2.
IF (FQ3OPKBSSIN GE 23 AND FQ3OPKBSSIN LE 30) FQ3OPKBSSINFL=3.
IF (FQ3OPKBSSIN GE 31 AND FQ3OPKBSSIN LE 33) FQ3OPKBSSINFL=4.
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
DO IF MISSING(FD3OSTAT).
DO REPEAT x = FQ3OPKBSTOT TO FQ3OPKBSSINFL.
RECODE FD3OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.
*Checking frequenices for constructs to look at missingness. 
FREQUENCIES VARIABLES=FD3OSTAT FQ3OPKBSTOT FQ3OPKBSSC FQ3OPKBSSI FQ3OPKBSSIN FQ3OPKBSTOTT FQ3OPKBSTOTP FQ3OPKBSSCFL FQ3OPKBSSIFL FQ3OPKBSSINFL
  /ORDER=ANALYSIS.
*If there IS missingness that was not accounted for in the STAT variable (for example in DERSAC, participants who indicated they did not have an additional caregiver should be coded as -44
Each construct needs to be coded by ID here. If there IS NO additional missingess not accounted for, delete only this section of syntax and write **CHECKED AND NOT NEEDED.
**CHECKED AND NOT NEEDED
*At this point, the only remaining missingness should represent when participant did not answer a sufficient number of questions, assuming STAT variable was correctly coded for this measure -- CHECK THIS! 
*The following syntax will recode this remaining missingness for each new construct.
IF (FQ3OPKBSTOT=-9999) FQ3OPKBSTOT=-43.
EXECUTE.  
IF (FQ3OPKBSSC=-9999) FQ3OPKBSSC=-43.
EXECUTE.  
IF (FQ3OPKBSSI=-9999) FQ3OPKBSSI=-43.
EXECUTE.  
IF (FQ3OPKBSSIN=-9999) FQ3OPKBSSIN=-43.
EXECUTE.  
IF (FQ3OPKBSTOTT=-9999) FQ3OPKBSTOTT=-43.
EXECUTE. 
IF (FQ3OPKBSTOTP=-9999) FQ3OPKBSTOTP=-43.
EXECUTE. 
IF (FQ3OPKBSSCFL=-9999) FQ3OPKBSSCFL=-43.
EXECUTE. 
IF (FQ3OPKBSSIFL=-9999) FQ3OPKBSSIFL=-43.
EXECUTE. 
IF (FQ3OPKBSSINFL=-9999) FQ3OPKBSSINFL=-43.
EXECUTE. 

MISSING VALUES
   FQ3OPKBSTOT FQ3OPKBSSC FQ3OPKBSSI FQ3OPKBSSIN FQ3OPKBSTOTT FQ3OPKBSTOTP FQ3OPKBSSCFL FQ3OPKBSSIFL FQ3OPKBSSINFL
    (LO THRU -1).
EXECUTE.

*STEP 9: LABELING CONSTRUCTS.
VARIABLE LABELS
FQ3OPKBSTOT 'PKBS Total Score [FQ3OPKBSTOT]'
FQ3OPKBSSC 'PKBS Social Cooperation [FQ3OPKBSSC]'
FQ3OPKBSSI 'PKBS Social Interaction [FQ3OPKBSSI]'
FQ3OPKBSSIN 'PKBS Social Independence [FQ3OPKBSSIN]'
FQ3OPKBSTOTT 'PKBS Total T Score [FQ3OPKBSTOTT]'
FQ3OPKBSTOTP 'PKBS Total Percentile Rank [FQ3OPKBSTOTP]'
FQ3OPKBSSCFL'PKBS Social Cooperation Functional Level [FQ3OPKBSSCFL]'
FQ3OPKBSSIFL'PKBS Social Interaction Functional Level [FQ3OPKBSSIFL]'
FQ3OPKBSSINFL'PKBS Social Independence Functional Level [FQ3OPKBSSINFL]'.
EXECUTE.

*STEP 9A: ADD VALUE LABELS.
*Include ALL missing value labels (SEE STEP 8 FOR FULL LIST). 
*Be sure to also include value labels for any constructs that need labels (e.g., 0 'No', 1 'Yes'). Summed or averaged scores do NOT need value labels.
VALUE LABELS
   FQ3OPKBSTOT FQ3OPKBSSC FQ3OPKBSSI FQ3OPKBSSIN FQ3OPKBSTOTT FQ3OPKBSTOTP FQ3OPKBSSCFL FQ3OPKBSSIFL FQ3OPKBSSINFL
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
    FQ3OPKBSSCFL FQ3OPKBSSIFL FQ3OPKBSSINFL
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
FREQUENCIES VARIABLES=FD3OSTAT FQ3OPKBSTOT FQ3OPKBSSC FQ3OPKBSSI FQ3OPKBSSIN FQ3OPKBSTOTT FQ3OPKBSTOTP FQ3OPKBSSCFL FQ3OPKBSSIFL FQ3OPKBSSINFL
  /ORDER=ANALYSIS.

*STEP 11: CHECK DESCRIPTIVES.
*Checking descriptives for all constructs.
DESCRIPTIVES VARIABLES=FQ3OPKBSTOT FQ3OPKBSSC FQ3OPKBSSI FQ3OPKBSSIN FQ3OPKBSTOTT FQ3OPKBSTOTP FQ3OPKBSSCFL FQ3OPKBSSIFL FQ3OPKBSSINFL
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 12: SAVE CLEANED DATA FILE.
*First, sorting the data file by ID and resaving the final file.
*Using /KEEP command to keep ONLY ID + RD + the constructs that were created. 
SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OPKBS_Constructs.sav'
  /KEEP ID FD3ORD FQ3OPKBSTOT FQ3OPKBSSC FQ3OPKBSSI FQ3OPKBSSIN FQ3OPKBSTOTT FQ3OPKBSTOTP FQ3OPKBSSCFL FQ3OPKBSSIFL FQ3OPKBSSINFL
  /COMPRESSED.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OPKBS_Constructs.sav'.
EXECUTE.

*STEP 13: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE 
 OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ3OPKBS_Constructs.spv'
LOCK=NO.


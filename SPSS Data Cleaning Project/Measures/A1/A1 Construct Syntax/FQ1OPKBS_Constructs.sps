* Encoding: UTF-8.
*STEP 0: NOTES.
*PRESCHOOL AND KINDERGARTEN BEHAVIOR SCALE (PKBS).
*CREATED THE FOLLOWING SUBSCALES & RAN APLHAS; LIST SUBSCALES BELOW.
*Total score (TOT).
*Social Cooperation (SC).
*Social Interaction (SI).
*Social Independence (SIN).

*1-18-22(BM): Adapted syntax for UO DERS. Completed STEPS 1-13.
*1-21-22(BM): Added T Scores.
*1-25-22(BM): Added remaining T Scores + small fixes.
*2-07-22(BM): Added functional levels for subscales and percentile for total.
*2-08-22(BM): Added Item 4.
*2-09-22(AAC): CHECKED. 
*------------------------------------------------------------------------------.
*STEP 1: OPENING CLEANED DATA.
*Insert the correct file path and file name. Use syntax to open cleaned data file.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OPKBS_Cleaned.sav'.

*STEP 2: SAVING CLEANED DATA AS A CONSTRUCT FILE. 
*Insert the correct file path and file name.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OPKBS_Constructs.sav'
  /COMPRESSED.

*STEP 3: DESCRIPTIVE STATISTICS (1. FREQ AND 2. CORR) FOR RAW VARIABLES (TOTAL SCORE 1ST, THEN SUBSCALES).
*When running this step note any additional missingness (any other codes) that are not accounted for in the STAT variable. These missing codes (and corresponding IDs) will need to be 
incorporated in STEP 8 below.
FREQ VARS=FQ1OPKBS01, FQ1OPKBS02, FQ1OPKBS03, FQ1OPKBS04, FQ1OPKBS05, FQ1OPKBS06, FQ1OPKBS07, FQ1OPKBS08, FQ1OPKBS09, 
    FQ1OPKBS10, FQ1OPKBS11, FQ1OPKBS12, FQ1OPKBS13, FQ1OPKBS14, FQ1OPKBS15, FQ1OPKBS16, FQ1OPKBS17, FQ1OPKBS18, FQ1OPKBS19,
    FQ1OPKBS20, FQ1OPKBS21, FQ1OPKBS22, FQ1OPKBS23, FQ1OPKBS24, FQ1OPKBS25, FQ1OPKBS26, FQ1OPKBS27, FQ1OPKBS28,
    FQ1OPKBS29, FQ1OPKBS30, FQ1OPKBS31, FQ1OPKBS32, FQ1OPKBS33, FQ1OPKBS34.
*PKBS Total Score.
CORR VARS=FQ1OPKBS01, FQ1OPKBS02, FQ1OPKBS03, FQ1OPKBS05, FQ1OPKBS06, FQ1OPKBS07, FQ1OPKBS08, FQ1OPKBS09, 
    FQ1OPKBS10, FQ1OPKBS11, FQ1OPKBS12, FQ1OPKBS13, FQ1OPKBS14, FQ1OPKBS15, FQ1OPKBS16, FQ1OPKBS17, FQ1OPKBS18, FQ1OPKBS19,
    FQ1OPKBS20, FQ1OPKBS21, FQ1OPKBS22, FQ1OPKBS23, FQ1OPKBS24, FQ1OPKBS25, FQ1OPKBS26, FQ1OPKBS27, FQ1OPKBS28,
    FQ1OPKBS29, FQ1OPKBS30, FQ1OPKBS31, FQ1OPKBS32, FQ1OPKBS33, FQ1OPKBS34.
*Social Cooperation (SC).
CORR VARS=FQ1OPKBS02, FQ1OPKBS07, FQ1OPKBS10, FQ1OPKBS12, FQ1OPKBS16, FQ1OPKBS22, FQ1OPKBS23, FQ1OPKBS25, FQ1OPKBS28, FQ1OPKBS29, FQ1OPKBS30, FQ1OPKBS32.
*Social Interaction (SI).
CORR VARS=FQ1OPKBS05, FQ1OPKBS14, FQ1OPKBS15, FQ1OPKBS17, FQ1OPKBS19, FQ1OPKBS20, FQ1OPKBS21, FQ1OPKBS24, FQ1OPKBS27, FQ1OPKBS33, FQ1OPKBS34.
*Social Independence (SIN).
CORR VARS=FQ1OPKBS01, FQ1OPKBS03, FQ1OPKBS06, FQ1OPKBS08, FQ1OPKBS09, FQ1OPKBS11, FQ1OPKBS13, FQ1OPKBS18, FQ1OPKBS26, FQ1OPKBS31.

*STEP 4: RECODING MISSING VALUES.
RECODE FQ1OPKBS01 TO FQ1OPKBS34 (MISSING=-9999).
EXECUTE.
    
*STEP 5: RELIABILITY STATISTICS (TOTAL SCORE 1st, FOLLOWED BY SUBSCALES).
*PKBS Total Score (33 items; n=73; alpha=.887).
REL VARS=FQ1OPKBS01, FQ1OPKBS02, FQ1OPKBS03, FQ1OPKBS05, FQ1OPKBS06, FQ1OPKBS07, FQ1OPKBS08, FQ1OPKBS09, 
    FQ1OPKBS10, FQ1OPKBS11, FQ1OPKBS12, FQ1OPKBS13, FQ1OPKBS14, FQ1OPKBS15, FQ1OPKBS16, FQ1OPKBS17, FQ1OPKBS18, FQ1OPKBS19,
    FQ1OPKBS20, FQ1OPKBS21, FQ1OPKBS22, FQ1OPKBS23, FQ1OPKBS24, FQ1OPKBS25, FQ1OPKBS26, FQ1OPKBS27, FQ1OPKBS28,
    FQ1OPKBS29, FQ1OPKBS30, FQ1OPKBS31, FQ1OPKBS32, FQ1OPKBS33, FQ1OPKBS34
/SCALE(All)= ALL.
*Social Cooperation (SC) (12 items; n=80; alpha=.816).
REL VARS=FQ1OPKBS02, FQ1OPKBS07, FQ1OPKBS10, FQ1OPKBS12, FQ1OPKBS16, FQ1OPKBS22, FQ1OPKBS23, FQ1OPKBS25, FQ1OPKBS28, FQ1OPKBS29, FQ1OPKBS30, FQ1OPKBS32
/SCALE(All)= ALL.
*Social Interaction (SI) (11 items; n=73; alpha=.797).
REL VARS=FQ1OPKBS05, FQ1OPKBS14, FQ1OPKBS15, FQ1OPKBS17, FQ1OPKBS19, FQ1OPKBS20, FQ1OPKBS21, FQ1OPKBS24, FQ1OPKBS27, FQ1OPKBS33, FQ1OPKBS34
/SCALE(All)= ALL.
*Social Independence (SIN) (10 items; n=79; alpha=.749).
REL VARS=FQ1OPKBS01, FQ1OPKBS03, FQ1OPKBS06, FQ1OPKBS08, FQ1OPKBS09, FQ1OPKBS11, FQ1OPKBS13, FQ1OPKBS18, FQ1OPKBS26, FQ1OPKBS31
/SCALE(All)= ALL.

*STEP 6: COUNTING MISSING DATA (JUST SUBSCALES), THEN RECODING TO 0 TO AVOID NEGATIVE EFFECTS ON CONSTRUCTS.
*Social Cooperation (SC).
COUNT MISSSC=FQ1OPKBS02, FQ1OPKBS07, FQ1OPKBS10, FQ1OPKBS12, FQ1OPKBS16, FQ1OPKBS22, FQ1OPKBS23, FQ1OPKBS25, FQ1OPKBS28, FQ1OPKBS29, FQ1OPKBS30, FQ1OPKBS32 (-9999).
*Social Interaction (SI).
COUNT MISSSI=FQ1OPKBS05, FQ1OPKBS14, FQ1OPKBS15, FQ1OPKBS17, FQ1OPKBS19, FQ1OPKBS20, FQ1OPKBS21, FQ1OPKBS24, FQ1OPKBS27, FQ1OPKBS33, FQ1OPKBS34 (-9999).
*Social Independence (SIN).
COUNT MISSSIN=FQ1OPKBS01, FQ1OPKBS03, FQ1OPKBS04, FQ1OPKBS06, FQ1OPKBS08, FQ1OPKBS09, FQ1OPKBS11, FQ1OPKBS13, FQ1OPKBS18, FQ1OPKBS26, FQ1OPKBS31 (-9999).

RECODE FQ1OPKBS01 TO FQ1OPKBS34 (-9999=0).
EXECUTE.

*STEP 7: CREATE TOTAL AND SUBSCALES SCORES  (CHECK THAT REVERSE-SCORED ITEMS INCLUDED).
*Note each subscale name and calculate missingness allowed.
*CREATING TOTAL SCORE.
*Total Score (34 items) -- USE MISSINGNESS FOR EACH SUBSCALE as a cut-off point.
COMPUTE FQ1OPKBSTOT=-9999.
EXECUTE.
IF (MISSSC < 3.96  AND MISSSI < 3.63 AND MISSSIN < 3.63) FQ1OPKBSTOT=RND(((FQ1OPKBS01 + FQ1OPKBS02 + FQ1OPKBS03 + FQ1OPKBS04 + FQ1OPKBS05 + FQ1OPKBS06 + FQ1OPKBS07 + FQ1OPKBS08 + FQ1OPKBS09 + 
    FQ1OPKBS10 + FQ1OPKBS11 + FQ1OPKBS12 + FQ1OPKBS13 + FQ1OPKBS14 + FQ1OPKBS15 + FQ1OPKBS16 + FQ1OPKBS17 + FQ1OPKBS18 + FQ1OPKBS19 +
    FQ1OPKBS20 + FQ1OPKBS21 + FQ1OPKBS22 + FQ1OPKBS23 + FQ1OPKBS24 + FQ1OPKBS25 + FQ1OPKBS26 + FQ1OPKBS27 + FQ1OPKBS28 +
    FQ1OPKBS29 + FQ1OPKBS30 + FQ1OPKBS31 + FQ1OPKBS32 + FQ1OPKBS33 + FQ1OPKBS34)/(34-MISSSC-MISSSI-MISSSIN))*34).
EXECUTE.
*CREATING ALL SUBSCALES (CHECK THAT REVERSE-SCORED ITEMS INCLUDED).
*Social Cooperation (SC) (12 items) -- 66.7% (i.e., if MISS is less than or equal to 3.96) as a cut-off point.
COMPUTE FQ1OPKBSSC=-9999.
EXECUTE.
IF (MISSSC < 3.96) FQ1OPKBSSC=RND(((FQ1OPKBS02 + FQ1OPKBS07 + FQ1OPKBS10 + FQ1OPKBS12 + FQ1OPKBS16 + FQ1OPKBS22 + FQ1OPKBS23 + FQ1OPKBS25 + FQ1OPKBS28 + FQ1OPKBS29 + FQ1OPKBS30 + FQ1OPKBS32)/(12-MISSSC))*12).
EXECUTE.
*Social Interaction (SI) (11 items) --  66.7% (i.e., if MISS is less than or equal to 3.63) as a cut-off point.
COMPUTE FQ1OPKBSSI=-9999.
EXECUTE.
IF (MISSSI < 3.63) FQ1OPKBSSI=RND(((FQ1OPKBS05 + FQ1OPKBS14 + FQ1OPKBS15 + FQ1OPKBS17 + FQ1OPKBS19 + FQ1OPKBS20 + FQ1OPKBS21 + FQ1OPKBS24 + FQ1OPKBS27 + FQ1OPKBS33 + FQ1OPKBS34)/(11-MISSSI))*11).
EXECUTE.   
*Social Independence (SIN) (11 items) -- 66.7% (i.e., if MISS is less than or equal to 3.63) as a cut-off point.
COMPUTE FQ1OPKBSSIN=-9999.
IF (MISSSIN < 3.63) FQ1OPKBSSIN=RND(((FQ1OPKBS01 + FQ1OPKBS03 + FQ1OPKBS04 + FQ1OPKBS06 + FQ1OPKBS08 + FQ1OPKBS09 + FQ1OPKBS11 + FQ1OPKBS13 + FQ1OPKBS18 + FQ1OPKBS26 + FQ1OPKBS31)/(11-MISSSIN))*11).
EXECUTE.    

*PKBS Total T Score (TOTT).
COMPUTE FQ1OPKBSTOTT=-9999.
EXECUTE.

IF (FQ1OPKBSTOT<30) FQ1OPKBSTOTT=52. 
IF (FQ1OPKBSTOT=30) FQ1OPKBSTOTT=52.
IF (FQ1OPKBSTOT=31) FQ1OPKBSTOTT=53.
IF (FQ1OPKBSTOT=32) FQ1OPKBSTOTT=54.
IF (FQ1OPKBSTOT=33) FQ1OPKBSTOTT=55.
IF (FQ1OPKBSTOT=34) FQ1OPKBSTOTT=56.
IF (FQ1OPKBSTOT=35) FQ1OPKBSTOTT=57.
IF (FQ1OPKBSTOT=36) FQ1OPKBSTOTT=58.
IF (FQ1OPKBSTOT=37) FQ1OPKBSTOTT=59.
IF (FQ1OPKBSTOT=38) FQ1OPKBSTOTT=60.
IF (FQ1OPKBSTOT=39) FQ1OPKBSTOTT=61.
IF (FQ1OPKBSTOT=40) FQ1OPKBSTOTT=62.
IF (FQ1OPKBSTOT=41) FQ1OPKBSTOTT=63.
IF (FQ1OPKBSTOT=42) FQ1OPKBSTOTT=64.
IF (FQ1OPKBSTOT=43) FQ1OPKBSTOTT=65.
IF (FQ1OPKBSTOT=44) FQ1OPKBSTOTT=66. 
IF (FQ1OPKBSTOT=45) FQ1OPKBSTOTT=67.
IF (FQ1OPKBSTOT=46) FQ1OPKBSTOTT=68.
IF (FQ1OPKBSTOT=47) FQ1OPKBSTOTT=69.
IF (FQ1OPKBSTOT=48) FQ1OPKBSTOTT=70.
IF (FQ1OPKBSTOT=49) FQ1OPKBSTOTT=71.
IF (FQ1OPKBSTOT=50) FQ1OPKBSTOTT=72.
IF (FQ1OPKBSTOT=51) FQ1OPKBSTOTT=73.
IF (FQ1OPKBSTOT=52) FQ1OPKBSTOTT=74.
IF (FQ1OPKBSTOT=53) FQ1OPKBSTOTT=75.
IF (FQ1OPKBSTOT=54) FQ1OPKBSTOTT=76.
IF (FQ1OPKBSTOT=55) FQ1OPKBSTOTT=77.
IF (FQ1OPKBSTOT=56) FQ1OPKBSTOTT=78.
IF (FQ1OPKBSTOT=57) FQ1OPKBSTOTT=79.
IF (FQ1OPKBSTOT=58) FQ1OPKBSTOTT=80.
IF (FQ1OPKBSTOT=59) FQ1OPKBSTOTT=81. 
IF (FQ1OPKBSTOT=60) FQ1OPKBSTOTT=82.
IF (FQ1OPKBSTOT=61) FQ1OPKBSTOTT=83.
IF (FQ1OPKBSTOT=62) FQ1OPKBSTOTT=84.
IF (FQ1OPKBSTOT=63) FQ1OPKBSTOTT=85.
IF (FQ1OPKBSTOT=64) FQ1OPKBSTOTT=86.
IF (FQ1OPKBSTOT=65) FQ1OPKBSTOTT=87. 
IF (FQ1OPKBSTOT=66) FQ1OPKBSTOTT=88.
IF (FQ1OPKBSTOT=67) FQ1OPKBSTOTT=89.
IF (FQ1OPKBSTOT=68) FQ1OPKBSTOTT=90.
IF (FQ1OPKBSTOT=69) FQ1OPKBSTOTT=91.
IF (FQ1OPKBSTOT=70) FQ1OPKBSTOTT=92.
IF (FQ1OPKBSTOT=71) FQ1OPKBSTOTT=93.
IF (FQ1OPKBSTOT=72) FQ1OPKBSTOTT=94.
IF (FQ1OPKBSTOT=73) FQ1OPKBSTOTT=95.
IF (FQ1OPKBSTOT=74) FQ1OPKBSTOTT=96.
IF (FQ1OPKBSTOT=75) FQ1OPKBSTOTT=97.
IF (FQ1OPKBSTOT=76) FQ1OPKBSTOTT=98.
IF (FQ1OPKBSTOT=77) FQ1OPKBSTOTT=99.
IF (FQ1OPKBSTOT=78) FQ1OPKBSTOTT=100.
IF (FQ1OPKBSTOT=79) FQ1OPKBSTOTT=101.
IF (FQ1OPKBSTOT=80) FQ1OPKBSTOTT=102. 
IF (FQ1OPKBSTOT=81) FQ1OPKBSTOTT=103.
IF (FQ1OPKBSTOT=82) FQ1OPKBSTOTT=103.
IF (FQ1OPKBSTOT=83) FQ1OPKBSTOTT=104.
IF (FQ1OPKBSTOT=84) FQ1OPKBSTOTT=105.
IF (FQ1OPKBSTOT=85) FQ1OPKBSTOTT=106.
IF (FQ1OPKBSTOT=86) FQ1OPKBSTOTT=107.
IF (FQ1OPKBSTOT=87) FQ1OPKBSTOTT=108.
IF (FQ1OPKBSTOT=88) FQ1OPKBSTOTT=109.
IF (FQ1OPKBSTOT=89) FQ1OPKBSTOTT=110.
IF (FQ1OPKBSTOT=90) FQ1OPKBSTOTT=111.
IF (FQ1OPKBSTOT=91) FQ1OPKBSTOTT=112.
IF (FQ1OPKBSTOT=92) FQ1OPKBSTOTT=113.
IF (FQ1OPKBSTOT=93) FQ1OPKBSTOTT=114.
IF (FQ1OPKBSTOT=94) FQ1OPKBSTOTT=115.
IF (FQ1OPKBSTOT=95) FQ1OPKBSTOTT=116. 
IF (FQ1OPKBSTOT=96) FQ1OPKBSTOTT=117.
IF (FQ1OPKBSTOT=97) FQ1OPKBSTOTT=118.
IF (FQ1OPKBSTOT=98) FQ1OPKBSTOTT=119.
IF (FQ1OPKBSTOT=99) FQ1OPKBSTOTT=120.
IF (FQ1OPKBSTOT=100) FQ1OPKBSTOTT=121.
IF (FQ1OPKBSTOT=101) FQ1OPKBSTOTT=122.
IF (FQ1OPKBSTOT=102) FQ1OPKBSTOTT=123.
    EXECUTE. 

*PKBS Total Percentile Rank (TOTP).
COMPUTE FQ1OPKBSTOTP=-9999.
EXECUTE.

IF (FQ1OPKBSTOT<35) FQ1OPKBSTOTP=1. 
IF (FQ1OPKBSTOT=35) FQ1OPKBSTOTP=2.
IF (FQ1OPKBSTOT=36) FQ1OPKBSTOTP=2.
IF (FQ1OPKBSTOT=37) FQ1OPKBSTOTP=2.
IF (FQ1OPKBSTOT=38) FQ1OPKBSTOTP=2.
IF (FQ1OPKBSTOT=39) FQ1OPKBSTOTP=2.
IF (FQ1OPKBSTOT=40) FQ1OPKBSTOTP=2.
IF (FQ1OPKBSTOT=41) FQ1OPKBSTOTP=3.
IF (FQ1OPKBSTOT=42) FQ1OPKBSTOTP=3.
IF (FQ1OPKBSTOT=43) FQ1OPKBSTOTP=3.
IF (FQ1OPKBSTOT=44) FQ1OPKBSTOTP=3. 
IF (FQ1OPKBSTOT=45) FQ1OPKBSTOTP=3.
IF (FQ1OPKBSTOT=46) FQ1OPKBSTOTP=4.
IF (FQ1OPKBSTOT=47) FQ1OPKBSTOTP=5.
IF (FQ1OPKBSTOT=48) FQ1OPKBSTOTP=5.
IF (FQ1OPKBSTOT=49) FQ1OPKBSTOTP=5.
IF (FQ1OPKBSTOT=50) FQ1OPKBSTOTP=6.
IF (FQ1OPKBSTOT=51) FQ1OPKBSTOTP=6.
IF (FQ1OPKBSTOT=52) FQ1OPKBSTOTP=7.
IF (FQ1OPKBSTOT=53) FQ1OPKBSTOTP=7.
IF (FQ1OPKBSTOT=54) FQ1OPKBSTOTP=8.
IF (FQ1OPKBSTOT=55) FQ1OPKBSTOTP=8.
IF (FQ1OPKBSTOT=56) FQ1OPKBSTOTP=9.
IF (FQ1OPKBSTOT=57) FQ1OPKBSTOTP=10.
IF (FQ1OPKBSTOT=58) FQ1OPKBSTOTP=11.
IF (FQ1OPKBSTOT=59) FQ1OPKBSTOTP=12. 
IF (FQ1OPKBSTOT=60) FQ1OPKBSTOTP=12.
IF (FQ1OPKBSTOT=61) FQ1OPKBSTOTP=13.
IF (FQ1OPKBSTOT=62) FQ1OPKBSTOTP=14.
IF (FQ1OPKBSTOT=63) FQ1OPKBSTOTP=15.
IF (FQ1OPKBSTOT=64) FQ1OPKBSTOTP=16.
IF (FQ1OPKBSTOT=65) FQ1OPKBSTOTP=18. 
IF (FQ1OPKBSTOT=66) FQ1OPKBSTOTP=19.
IF (FQ1OPKBSTOT=67) FQ1OPKBSTOTP=20.
IF (FQ1OPKBSTOT=68) FQ1OPKBSTOTP=21.
IF (FQ1OPKBSTOT=69) FQ1OPKBSTOTP=23.
IF (FQ1OPKBSTOT=70) FQ1OPKBSTOTP=25.
IF (FQ1OPKBSTOT=71) FQ1OPKBSTOTP=27.
IF (FQ1OPKBSTOT=72) FQ1OPKBSTOTP=28.
IF (FQ1OPKBSTOT=73) FQ1OPKBSTOTP=30.
IF (FQ1OPKBSTOT=74) FQ1OPKBSTOTP=32.
IF (FQ1OPKBSTOT=75) FQ1OPKBSTOTP=35.
IF (FQ1OPKBSTOT=76) FQ1OPKBSTOTP=37.
IF (FQ1OPKBSTOT=77) FQ1OPKBSTOTP=40.
IF (FQ1OPKBSTOT=78) FQ1OPKBSTOTP=44.
IF (FQ1OPKBSTOT=79) FQ1OPKBSTOTP=47.
IF (FQ1OPKBSTOT=80) FQ1OPKBSTOTP=49. 
IF (FQ1OPKBSTOT=81) FQ1OPKBSTOTP=51.
IF (FQ1OPKBSTOT=82) FQ1OPKBSTOTP=51.
IF (FQ1OPKBSTOT=83) FQ1OPKBSTOTP=57.
IF (FQ1OPKBSTOT=84) FQ1OPKBSTOTP=61.
IF (FQ1OPKBSTOT=85) FQ1OPKBSTOTP=64.
IF (FQ1OPKBSTOT=86) FQ1OPKBSTOTP=67.
IF (FQ1OPKBSTOT=87) FQ1OPKBSTOTP=70.
IF (FQ1OPKBSTOT=88) FQ1OPKBSTOTP=72.
IF (FQ1OPKBSTOT=89) FQ1OPKBSTOTP=76.
IF (FQ1OPKBSTOT=90) FQ1OPKBSTOTP=79.
IF (FQ1OPKBSTOT=91) FQ1OPKBSTOTP=81.
IF (FQ1OPKBSTOT=92) FQ1OPKBSTOTP=84.
IF (FQ1OPKBSTOT=93) FQ1OPKBSTOTP=86.
IF (FQ1OPKBSTOT=94) FQ1OPKBSTOTP=88.
IF (FQ1OPKBSTOT=95) FQ1OPKBSTOTP=89. 
IF (FQ1OPKBSTOT=96) FQ1OPKBSTOTP=91.
IF (FQ1OPKBSTOT=97) FQ1OPKBSTOTP=94.
IF (FQ1OPKBSTOT=98) FQ1OPKBSTOTP=95.
IF (FQ1OPKBSTOT=99) FQ1OPKBSTOTP=97.
IF (FQ1OPKBSTOT=100) FQ1OPKBSTOTP=97.
IF (FQ1OPKBSTOT=101) FQ1OPKBSTOTP=98.
IF (FQ1OPKBSTOT=102) FQ1OPKBSTOTP=99.
    EXECUTE. 

*PKBS Social Cooperation Functional Level (SCFL)
    1=Significant Deficit, 2=Moderate Deficit, 3=Average, 4=High Functioning.
COMPUTE FQ1OPKBSSCFL=-9999.
EXECUTE.
IF (FQ1OPKBSSC GE 0 AND FQ1OPKBSSC LE 15) FQ1OPKBSSCFL=1.
IF (FQ1OPKBSSC GE 16 AND FQ1OPKBSSC LE 23) FQ1OPKBSSCFL=2.
IF (FQ1OPKBSSC GE 24 AND FQ1OPKBSSC LE 33) FQ1OPKBSSCFL=3.
IF (FQ1OPKBSSC GE 34 AND FQ1OPKBSSC LE 36) FQ1OPKBSSCFL=4.
    EXECUTE.
*PKBS Social Interaction Functional Level (SIFL)
    1=Significant Deficit, 2=Moderate Deficit, 3=Average, 4=High Functioning.
COMPUTE FQ1OPKBSSIFL=-9999.
EXECUTE.
IF (FQ1OPKBSSI GE 0 AND FQ1OPKBSSI LE 10) FQ1OPKBSSIFL=1.
IF (FQ1OPKBSSI GE 11 AND FQ1OPKBSSI LE 19) FQ1OPKBSSIFL=2.
IF (FQ1OPKBSSI GE 20 AND FQ1OPKBSSI LE 28) FQ1OPKBSSIFL=3.
IF (FQ1OPKBSSI GE 29 AND FQ1OPKBSSI LE 33) FQ1OPKBSSIFL=4.
    EXECUTE.
*PKBS Social Independence Functional Level (SINFL)
    1=Significant Deficit, 2=Moderate Deficit, 3=Average, 4=High Functioning.
COMPUTE FQ1OPKBSSINFL=-9999.
EXECUTE.
IF (FQ1OPKBSSIN GE 0 AND FQ1OPKBSSIN LE 17) FQ1OPKBSSINFL=1.
IF (FQ1OPKBSSIN GE 18 AND FQ1OPKBSSIN LE 22) FQ1OPKBSSINFL=2.
IF (FQ1OPKBSSIN GE 23 AND FQ1OPKBSSIN LE 30) FQ1OPKBSSINFL=3.
IF (FQ1OPKBSSIN GE 31 AND FQ1OPKBSSIN LE 33) FQ1OPKBSSINFL=4.
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
**-12 'Pariticipant refused follow-up'                                             /* (Participant refused follow-up) */     
**-11 'Participant (child) deceased'                                                /* (Participant (child) deceased) */
**-10 'Prefer not to answer'                                                           /* (Participant selected prefer not to answer) */.
DO IF MISSING(FD1OSTAT).
DO REPEAT x = FQ1OPKBSTOT TO FQ1OPKBSSINFL.
RECODE FD1OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.
*Checking frequenices for constructs to look at missingness. 
FREQUENCIES VARIABLES=FD1OSTAT FQ1OPKBSTOT FQ1OPKBSSC FQ1OPKBSSI FQ1OPKBSSIN FQ1OPKBSTOTT FQ1OPKBSTOTP FQ1OPKBSSCFL FQ1OPKBSSIFL FQ1OPKBSSINFL
  /ORDER=ANALYSIS.
*If there IS missingness that was not accounted for in the STAT variable (for example in DERSAC, participants who indicated they did not have an additional caregiver should be coded as -44
Each construct needs to be coded by ID here. If there IS NO additional missingess not accounted for, delete only this section of syntax and write **CHECKED AND NOT NEEDED.
**CHECKED AND NOT NEEDED
*At this point, the only remaining missingness should represent when participant did not answer a sufficient number of questions, assuming STAT variable was correctly coded for this measure -- CHECK THIS! 
*The following syntax will recode this remaining missingness for each new construct.
IF (FQ1OPKBSTOT=-9999) FQ1OPKBSTOT=-43.
EXECUTE.  
IF (FQ1OPKBSSC=-9999) FQ1OPKBSSC=-43.
EXECUTE.  
IF (FQ1OPKBSSI=-9999) FQ1OPKBSSI=-43.
EXECUTE.  
IF (FQ1OPKBSSIN=-9999) FQ1OPKBSSIN=-43.
EXECUTE.  
IF (FQ1OPKBSTOTT=-9999) FQ1OPKBSTOTT=-43.
EXECUTE. 
IF (FQ1OPKBSTOTP=-9999) FQ1OPKBSTOTP=-43.
EXECUTE. 
IF (FQ1OPKBSSCFL=-9999) FQ1OPKBSSCFL=-43.
EXECUTE. 
IF (FQ1OPKBSSIFL=-9999) FQ1OPKBSSIFL=-43.
EXECUTE. 
IF (FQ1OPKBSSINFL=-9999) FQ1OPKBSSINFL=-43.
EXECUTE. 

MISSING VALUES
   FQ1OPKBSTOT FQ1OPKBSSC FQ1OPKBSSI FQ1OPKBSSIN FQ1OPKBSTOTT FQ1OPKBSTOTP FQ1OPKBSSCFL FQ1OPKBSSIFL FQ1OPKBSSINFL
    (LO THRU -1).
EXECUTE.

*STEP 9: LABELING CONSTRUCTS.
VARIABLE LABELS
FQ1OPKBSTOT 'PKBS Total Score [FQ1OPKBSTOT]'
FQ1OPKBSSC 'PKBS Social Cooperation [FQ1OPKBSSC]'
FQ1OPKBSSI 'PKBS Social Interaction [FQ1OPKBSSI]'
FQ1OPKBSSIN 'PKBS Social Independence [FQ1OPKBSSIN]'
FQ1OPKBSTOTT 'PKBS Total T Score [FQ1OPKBSTOTT]'
FQ1OPKBSTOTP 'PKBS Total Percentile Rank [FQ1OPKBSTOTP]'
FQ1OPKBSSCFL'PKBS Social Cooperation Functional Level [FQ1OPKBSSCFL]'
FQ1OPKBSSIFL'PKBS Social Interaction Functional Level [FQ1OPKBSSIFL]'
FQ1OPKBSSINFL'PKBS Social Independence Functional Level [FQ1OPKBSSINFL]'.
EXECUTE.

*STEP 9A: ADD VALUE LABELS.
*Include ALL missing value labels (SEE STEP 8 FOR FULL LIST). 
*Be sure to also include value labels for any constructs that need labels (e.g., 0 'No', 1 'Yes'). Summed or averaged scores do NOT need value labels.
VALUE LABELS
   FQ1OPKBSTOT FQ1OPKBSSC FQ1OPKBSSI FQ1OPKBSSIN FQ1OPKBSTOTT FQ1OPKBSTOTP FQ1OPKBSSCFL FQ1OPKBSSIFL FQ1OPKBSSINFL
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
-10 'Prefer not to Answer (-10)'.
EXECUTE. 

VALUE LABELS
    FQ1OPKBSSCFL FQ1OPKBSSIFL FQ1OPKBSSINFL
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
-10 'Prefer not to Answer (-10)'
1 'Significant Deficit'
2 'Moderate Deficit'
3 'Average'
4 'High Functioning'.
EXECUTE. 


*STEP 10: CHECK FREQUENCIES.
*Checking frequencies of all constructs.
FREQUENCIES VARIABLES=FD1OSTAT FQ1OPKBSTOT FQ1OPKBSSC FQ1OPKBSSI FQ1OPKBSSIN FQ1OPKBSTOTT FQ1OPKBSTOTP FQ1OPKBSSCFL FQ1OPKBSSIFL FQ1OPKBSSINFL
  /ORDER=ANALYSIS.

*STEP 11: CHECK DESCRIPTIVES.
*Checking descriptives for all constructs.
DESCRIPTIVES VARIABLES=FQ1OPKBSTOT FQ1OPKBSSC FQ1OPKBSSI FQ1OPKBSSIN FQ1OPKBSTOTT FQ1OPKBSTOTP FQ1OPKBSSCFL FQ1OPKBSSIFL FQ1OPKBSSINFL
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 12: SAVE CLEANED DATA FILE.
*First, sorting the data file by ID and resaving the final file.
*Using /KEEP command to keep ONLY ID + RD + the constructs that were created. 
SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OPKBS_Constructs.sav'
  /KEEP ID FD1ORD FQ1OPKBSTOT FQ1OPKBSSC FQ1OPKBSSI FQ1OPKBSSIN FQ1OPKBSTOTT FQ1OPKBSTOTP FQ1OPKBSSCFL FQ1OPKBSSIFL FQ1OPKBSSINFL
  /COMPRESSED.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OPKBS_Constructs.sav'.
EXECUTE.

*STEP 13: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE 
 OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ1OPKBS_Constructs.spv'
LOCK=NO.


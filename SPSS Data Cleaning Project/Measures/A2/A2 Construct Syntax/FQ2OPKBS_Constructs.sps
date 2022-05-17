* Encoding: UTF-8.
*STEP 0: NOTES.
*PRESCHOOL AND KINDERGARTEN BEHAVIOR SCALE (PKBS).
*CREATED THE FOLLOWING SUBSCALES & RAN APLHAS; LIST SUBSCALES BELOW.
*Total score (TOT).
*Social Cooperation (SC).
*Social Interaction (SI).
*Social Independence (SIN).

*03-09-22(BM): Adapted Syntax for A2.
*03-09-22(AAC): Checked. Added alphas to syntax.
*------------------------------------------------------------------------------.
*STEP 1: OPENING CLEANED DATA.
*Insert the correct file path and file name. Use syntax to open cleaned data file.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OPKBS_Cleaned.sav'.

*STEP 2: SAVING CLEANED DATA AS A CONSTRUCT FILE. 
*Insert the correct file path and file name.
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OPKBS_Constructs.sav'
  /COMPRESSED.

*STEP 3: DESCRIPTIVE STATISTICS (1. FREQ AND 2. CORR) FOR RAW VARIABLES (TOTAL SCORE 1ST, THEN SUBSCALES).
*When running this step note any additional missingness (any other codes) that are not accounted for in the STAT variable. These missing codes (and corresponding IDs) will need to be 
incorporated in STEP 8 below.
FREQ VARS=FQ2OPKBS01, FQ2OPKBS02, FQ2OPKBS03, FQ2OPKBS04, FQ2OPKBS05, FQ2OPKBS06, FQ2OPKBS07, FQ2OPKBS08, FQ2OPKBS09, 
    FQ2OPKBS10, FQ2OPKBS11, FQ2OPKBS12, FQ2OPKBS13, FQ2OPKBS14, FQ2OPKBS15, FQ2OPKBS16, FQ2OPKBS17, FQ2OPKBS18, FQ2OPKBS19,
    FQ2OPKBS20, FQ2OPKBS21, FQ2OPKBS22, FQ2OPKBS23, FQ2OPKBS24, FQ2OPKBS25, FQ2OPKBS26, FQ2OPKBS27, FQ2OPKBS28,
    FQ2OPKBS29, FQ2OPKBS30, FQ2OPKBS31, FQ2OPKBS32, FQ2OPKBS33, FQ2OPKBS34.
*PKBS Total Score.
CORR VARS=FQ2OPKBS01, FQ2OPKBS02, FQ2OPKBS03, FQ2OPKBS05, FQ2OPKBS06, FQ2OPKBS07, FQ2OPKBS08, FQ2OPKBS09, 
    FQ2OPKBS10, FQ2OPKBS11, FQ2OPKBS12, FQ2OPKBS13, FQ2OPKBS14, FQ2OPKBS15, FQ2OPKBS16, FQ2OPKBS17, FQ2OPKBS18, FQ2OPKBS19,
    FQ2OPKBS20, FQ2OPKBS21, FQ2OPKBS22, FQ2OPKBS23, FQ2OPKBS24, FQ2OPKBS25, FQ2OPKBS26, FQ2OPKBS27, FQ2OPKBS28,
    FQ2OPKBS29, FQ2OPKBS30, FQ2OPKBS31, FQ2OPKBS32, FQ2OPKBS33, FQ2OPKBS34.
*Social Cooperation (SC).
CORR VARS=FQ2OPKBS02, FQ2OPKBS07, FQ2OPKBS10, FQ2OPKBS12, FQ2OPKBS16, FQ2OPKBS22, FQ2OPKBS23, FQ2OPKBS25, FQ2OPKBS28, FQ2OPKBS29, FQ2OPKBS30, FQ2OPKBS32.
*Social Interaction (SI).
CORR VARS=FQ2OPKBS05, FQ2OPKBS14, FQ2OPKBS15, FQ2OPKBS17, FQ2OPKBS19, FQ2OPKBS20, FQ2OPKBS21, FQ2OPKBS24, FQ2OPKBS27, FQ2OPKBS33, FQ2OPKBS34.
*Social Independence (SIN).
CORR VARS=FQ2OPKBS01, FQ2OPKBS03, FQ2OPKBS06, FQ2OPKBS08, FQ2OPKBS09, FQ2OPKBS11, FQ2OPKBS13, FQ2OPKBS18, FQ2OPKBS26, FQ2OPKBS31.

*STEP 4: RECODING MISSING VALUES.
RECODE FQ2OPKBS01 TO FQ2OPKBS34 (MISSING=-9999).
EXECUTE.
    
*STEP 5: RELIABILITY STATISTICS (TOTAL SCORE 1st, FOLLOWED BY SUBSCALES).
*PKBS Total Score (33 items; n=57; alpha=.890).
REL VARS=FQ2OPKBS01, FQ2OPKBS02, FQ2OPKBS03, FQ2OPKBS05, FQ2OPKBS06, FQ2OPKBS07, FQ2OPKBS08, FQ2OPKBS09, 
    FQ2OPKBS10, FQ2OPKBS11, FQ2OPKBS12, FQ2OPKBS13, FQ2OPKBS14, FQ2OPKBS15, FQ2OPKBS16, FQ2OPKBS17, FQ2OPKBS18, FQ2OPKBS19,
    FQ2OPKBS20, FQ2OPKBS21, FQ2OPKBS22, FQ2OPKBS23, FQ2OPKBS24, FQ2OPKBS25, FQ2OPKBS26, FQ2OPKBS27, FQ2OPKBS28,
    FQ2OPKBS29, FQ2OPKBS30, FQ2OPKBS31, FQ2OPKBS32, FQ2OPKBS33, FQ2OPKBS34
/SCALE(All)= ALL.
*Social Cooperation (SC) (12 items; n=63; alpha=.853).
REL VARS=FQ2OPKBS02, FQ2OPKBS07, FQ2OPKBS10, FQ2OPKBS12, FQ2OPKBS16, FQ2OPKBS22, FQ2OPKBS23, FQ2OPKBS25, FQ2OPKBS28, FQ2OPKBS29, FQ2OPKBS30, FQ2OPKBS32
/SCALE(All)= ALL.
*Social Interaction (SI) (11 items; n=57; alpha=.785).
REL VARS=FQ2OPKBS05, FQ2OPKBS14, FQ2OPKBS15, FQ2OPKBS17, FQ2OPKBS19, FQ2OPKBS20, FQ2OPKBS21, FQ2OPKBS24, FQ2OPKBS27, FQ2OPKBS33, FQ2OPKBS34
/SCALE(All)= ALL.
*Social Independence (SIN) (10 items; n=62; alpha=.713).
REL VARS=FQ2OPKBS01, FQ2OPKBS03, FQ2OPKBS06, FQ2OPKBS08, FQ2OPKBS09, FQ2OPKBS11, FQ2OPKBS13, FQ2OPKBS18, FQ2OPKBS26, FQ2OPKBS31
/SCALE(All)= ALL.

*STEP 6: COUNTING MISSING DATA (JUST SUBSCALES), THEN RECODING TO 0 TO AVOID NEGATIVE EFFECTS ON CONSTRUCTS.
*Social Cooperation (SC).
COUNT MISSSC=FQ2OPKBS02, FQ2OPKBS07, FQ2OPKBS10, FQ2OPKBS12, FQ2OPKBS16, FQ2OPKBS22, FQ2OPKBS23, FQ2OPKBS25, FQ2OPKBS28, FQ2OPKBS29, FQ2OPKBS30, FQ2OPKBS32 (-9999).
*Social Interaction (SI).
COUNT MISSSI=FQ2OPKBS05, FQ2OPKBS14, FQ2OPKBS15, FQ2OPKBS17, FQ2OPKBS19, FQ2OPKBS20, FQ2OPKBS21, FQ2OPKBS24, FQ2OPKBS27, FQ2OPKBS33, FQ2OPKBS34 (-9999).
*Social Independence (SIN).
COUNT MISSSIN=FQ2OPKBS01, FQ2OPKBS03, FQ2OPKBS04, FQ2OPKBS06, FQ2OPKBS08, FQ2OPKBS09, FQ2OPKBS11, FQ2OPKBS13, FQ2OPKBS18, FQ2OPKBS26, FQ2OPKBS31 (-9999).

RECODE FQ2OPKBS01 TO FQ2OPKBS34 (-9999=0).
EXECUTE.

*STEP 7: CREATE TOTAL AND SUBSCALES SCORES  (CHECK THAT REVERSE-SCORED ITEMS INCLUDED).
*Note each subscale name and calculate missingness allowed.
*CREATING TOTAL SCORE.
*Total Score (34 items) -- USE MISSINGNESS FOR EACH SUBSCALE as a cut-off point.
COMPUTE FQ2OPKBSTOT=-9999.
EXECUTE.
IF (MISSSC < 3.96  AND MISSSI < 3.63 AND MISSSIN < 3.63) FQ2OPKBSTOT=RND(((FQ2OPKBS01 + FQ2OPKBS02 + FQ2OPKBS03 + FQ2OPKBS04 + FQ2OPKBS05 + FQ2OPKBS06 + FQ2OPKBS07 + FQ2OPKBS08 + FQ2OPKBS09 + 
    FQ2OPKBS10 + FQ2OPKBS11 + FQ2OPKBS12 + FQ2OPKBS13 + FQ2OPKBS14 + FQ2OPKBS15 + FQ2OPKBS16 + FQ2OPKBS17 + FQ2OPKBS18 + FQ2OPKBS19 +
    FQ2OPKBS20 + FQ2OPKBS21 + FQ2OPKBS22 + FQ2OPKBS23 + FQ2OPKBS24 + FQ2OPKBS25 + FQ2OPKBS26 + FQ2OPKBS27 + FQ2OPKBS28 +
    FQ2OPKBS29 + FQ2OPKBS30 + FQ2OPKBS31 + FQ2OPKBS32 + FQ2OPKBS33 + FQ2OPKBS34)/(34-MISSSC-MISSSI-MISSSIN))*34).
EXECUTE.
*CREATING ALL SUBSCALES (CHECK THAT REVERSE-SCORED ITEMS INCLUDED).
*Social Cooperation (SC) (12 items) -- 66.7% (i.e., if MISS is less than or equal to 3.96) as a cut-off point.
COMPUTE FQ2OPKBSSC=-9999.
EXECUTE.
IF (MISSSC < 3.96) FQ2OPKBSSC=RND(((FQ2OPKBS02 + FQ2OPKBS07 + FQ2OPKBS10 + FQ2OPKBS12 + FQ2OPKBS16 + FQ2OPKBS22 + FQ2OPKBS23 + FQ2OPKBS25 + FQ2OPKBS28 + FQ2OPKBS29 + FQ2OPKBS30 + FQ2OPKBS32)/(12-MISSSC))*12).
EXECUTE.
*Social Interaction (SI) (11 items) --  66.7% (i.e., if MISS is less than or equal to 3.63) as a cut-off point.
COMPUTE FQ2OPKBSSI=-9999.
EXECUTE.
IF (MISSSI < 3.63) FQ2OPKBSSI=RND(((FQ2OPKBS05 + FQ2OPKBS14 + FQ2OPKBS15 + FQ2OPKBS17 + FQ2OPKBS19 + FQ2OPKBS20 + FQ2OPKBS21 + FQ2OPKBS24 + FQ2OPKBS27 + FQ2OPKBS33 + FQ2OPKBS34)/(11-MISSSI))*11).
EXECUTE.   
*Social Independence (SIN) (11 items) -- 66.7% (i.e., if MISS is less than or equal to 3.63) as a cut-off point.
COMPUTE FQ2OPKBSSIN=-9999.
IF (MISSSIN < 3.63) FQ2OPKBSSIN=RND(((FQ2OPKBS01 + FQ2OPKBS03 + FQ2OPKBS04 + FQ2OPKBS06 + FQ2OPKBS08 + FQ2OPKBS09 + FQ2OPKBS11 + FQ2OPKBS13 + FQ2OPKBS18 + FQ2OPKBS26 + FQ2OPKBS31)/(11-MISSSIN))*11).
EXECUTE.    

*PKBS Total T Score (TOTT).
COMPUTE FQ2OPKBSTOTT=-9999.
EXECUTE.

IF (FQ2OPKBSTOT<30) FQ2OPKBSTOTT=52. 
IF (FQ2OPKBSTOT=30) FQ2OPKBSTOTT=52.
IF (FQ2OPKBSTOT=31) FQ2OPKBSTOTT=53.
IF (FQ2OPKBSTOT=32) FQ2OPKBSTOTT=54.
IF (FQ2OPKBSTOT=33) FQ2OPKBSTOTT=55.
IF (FQ2OPKBSTOT=34) FQ2OPKBSTOTT=56.
IF (FQ2OPKBSTOT=35) FQ2OPKBSTOTT=57.
IF (FQ2OPKBSTOT=36) FQ2OPKBSTOTT=58.
IF (FQ2OPKBSTOT=37) FQ2OPKBSTOTT=59.
IF (FQ2OPKBSTOT=38) FQ2OPKBSTOTT=60.
IF (FQ2OPKBSTOT=39) FQ2OPKBSTOTT=61.
IF (FQ2OPKBSTOT=40) FQ2OPKBSTOTT=62.
IF (FQ2OPKBSTOT=41) FQ2OPKBSTOTT=63.
IF (FQ2OPKBSTOT=42) FQ2OPKBSTOTT=64.
IF (FQ2OPKBSTOT=43) FQ2OPKBSTOTT=65.
IF (FQ2OPKBSTOT=44) FQ2OPKBSTOTT=66. 
IF (FQ2OPKBSTOT=45) FQ2OPKBSTOTT=67.
IF (FQ2OPKBSTOT=46) FQ2OPKBSTOTT=68.
IF (FQ2OPKBSTOT=47) FQ2OPKBSTOTT=69.
IF (FQ2OPKBSTOT=48) FQ2OPKBSTOTT=70.
IF (FQ2OPKBSTOT=49) FQ2OPKBSTOTT=71.
IF (FQ2OPKBSTOT=50) FQ2OPKBSTOTT=72.
IF (FQ2OPKBSTOT=51) FQ2OPKBSTOTT=73.
IF (FQ2OPKBSTOT=52) FQ2OPKBSTOTT=74.
IF (FQ2OPKBSTOT=53) FQ2OPKBSTOTT=75.
IF (FQ2OPKBSTOT=54) FQ2OPKBSTOTT=76.
IF (FQ2OPKBSTOT=55) FQ2OPKBSTOTT=77.
IF (FQ2OPKBSTOT=56) FQ2OPKBSTOTT=78.
IF (FQ2OPKBSTOT=57) FQ2OPKBSTOTT=79.
IF (FQ2OPKBSTOT=58) FQ2OPKBSTOTT=80.
IF (FQ2OPKBSTOT=59) FQ2OPKBSTOTT=81. 
IF (FQ2OPKBSTOT=60) FQ2OPKBSTOTT=82.
IF (FQ2OPKBSTOT=61) FQ2OPKBSTOTT=83.
IF (FQ2OPKBSTOT=62) FQ2OPKBSTOTT=84.
IF (FQ2OPKBSTOT=63) FQ2OPKBSTOTT=85.
IF (FQ2OPKBSTOT=64) FQ2OPKBSTOTT=86.
IF (FQ2OPKBSTOT=65) FQ2OPKBSTOTT=87. 
IF (FQ2OPKBSTOT=66) FQ2OPKBSTOTT=88.
IF (FQ2OPKBSTOT=67) FQ2OPKBSTOTT=89.
IF (FQ2OPKBSTOT=68) FQ2OPKBSTOTT=90.
IF (FQ2OPKBSTOT=69) FQ2OPKBSTOTT=91.
IF (FQ2OPKBSTOT=70) FQ2OPKBSTOTT=92.
IF (FQ2OPKBSTOT=71) FQ2OPKBSTOTT=93.
IF (FQ2OPKBSTOT=72) FQ2OPKBSTOTT=94.
IF (FQ2OPKBSTOT=73) FQ2OPKBSTOTT=95.
IF (FQ2OPKBSTOT=74) FQ2OPKBSTOTT=96.
IF (FQ2OPKBSTOT=75) FQ2OPKBSTOTT=97.
IF (FQ2OPKBSTOT=76) FQ2OPKBSTOTT=98.
IF (FQ2OPKBSTOT=77) FQ2OPKBSTOTT=99.
IF (FQ2OPKBSTOT=78) FQ2OPKBSTOTT=100.
IF (FQ2OPKBSTOT=79) FQ2OPKBSTOTT=101.
IF (FQ2OPKBSTOT=80) FQ2OPKBSTOTT=102. 
IF (FQ2OPKBSTOT=81) FQ2OPKBSTOTT=103.
IF (FQ2OPKBSTOT=82) FQ2OPKBSTOTT=103.
IF (FQ2OPKBSTOT=83) FQ2OPKBSTOTT=104.
IF (FQ2OPKBSTOT=84) FQ2OPKBSTOTT=105.
IF (FQ2OPKBSTOT=85) FQ2OPKBSTOTT=106.
IF (FQ2OPKBSTOT=86) FQ2OPKBSTOTT=107.
IF (FQ2OPKBSTOT=87) FQ2OPKBSTOTT=108.
IF (FQ2OPKBSTOT=88) FQ2OPKBSTOTT=109.
IF (FQ2OPKBSTOT=89) FQ2OPKBSTOTT=110.
IF (FQ2OPKBSTOT=90) FQ2OPKBSTOTT=111.
IF (FQ2OPKBSTOT=91) FQ2OPKBSTOTT=112.
IF (FQ2OPKBSTOT=92) FQ2OPKBSTOTT=113.
IF (FQ2OPKBSTOT=93) FQ2OPKBSTOTT=114.
IF (FQ2OPKBSTOT=94) FQ2OPKBSTOTT=115.
IF (FQ2OPKBSTOT=95) FQ2OPKBSTOTT=116. 
IF (FQ2OPKBSTOT=96) FQ2OPKBSTOTT=117.
IF (FQ2OPKBSTOT=97) FQ2OPKBSTOTT=118.
IF (FQ2OPKBSTOT=98) FQ2OPKBSTOTT=119.
IF (FQ2OPKBSTOT=99) FQ2OPKBSTOTT=120.
IF (FQ2OPKBSTOT=100) FQ2OPKBSTOTT=121.
IF (FQ2OPKBSTOT=101) FQ2OPKBSTOTT=122.
IF (FQ2OPKBSTOT=102) FQ2OPKBSTOTT=123.
    EXECUTE. 

*PKBS Total Percentile Rank (TOTP).
COMPUTE FQ2OPKBSTOTP=-9999.
EXECUTE.

IF (FQ2OPKBSTOT<35) FQ2OPKBSTOTP=1. 
IF (FQ2OPKBSTOT=35) FQ2OPKBSTOTP=2.
IF (FQ2OPKBSTOT=36) FQ2OPKBSTOTP=2.
IF (FQ2OPKBSTOT=37) FQ2OPKBSTOTP=2.
IF (FQ2OPKBSTOT=38) FQ2OPKBSTOTP=2.
IF (FQ2OPKBSTOT=39) FQ2OPKBSTOTP=2.
IF (FQ2OPKBSTOT=40) FQ2OPKBSTOTP=2.
IF (FQ2OPKBSTOT=41) FQ2OPKBSTOTP=3.
IF (FQ2OPKBSTOT=42) FQ2OPKBSTOTP=3.
IF (FQ2OPKBSTOT=43) FQ2OPKBSTOTP=3.
IF (FQ2OPKBSTOT=44) FQ2OPKBSTOTP=3. 
IF (FQ2OPKBSTOT=45) FQ2OPKBSTOTP=3.
IF (FQ2OPKBSTOT=46) FQ2OPKBSTOTP=4.
IF (FQ2OPKBSTOT=47) FQ2OPKBSTOTP=5.
IF (FQ2OPKBSTOT=48) FQ2OPKBSTOTP=5.
IF (FQ2OPKBSTOT=49) FQ2OPKBSTOTP=5.
IF (FQ2OPKBSTOT=50) FQ2OPKBSTOTP=6.
IF (FQ2OPKBSTOT=51) FQ2OPKBSTOTP=6.
IF (FQ2OPKBSTOT=52) FQ2OPKBSTOTP=7.
IF (FQ2OPKBSTOT=53) FQ2OPKBSTOTP=7.
IF (FQ2OPKBSTOT=54) FQ2OPKBSTOTP=8.
IF (FQ2OPKBSTOT=55) FQ2OPKBSTOTP=8.
IF (FQ2OPKBSTOT=56) FQ2OPKBSTOTP=9.
IF (FQ2OPKBSTOT=57) FQ2OPKBSTOTP=10.
IF (FQ2OPKBSTOT=58) FQ2OPKBSTOTP=11.
IF (FQ2OPKBSTOT=59) FQ2OPKBSTOTP=12. 
IF (FQ2OPKBSTOT=60) FQ2OPKBSTOTP=12.
IF (FQ2OPKBSTOT=61) FQ2OPKBSTOTP=13.
IF (FQ2OPKBSTOT=62) FQ2OPKBSTOTP=14.
IF (FQ2OPKBSTOT=63) FQ2OPKBSTOTP=15.
IF (FQ2OPKBSTOT=64) FQ2OPKBSTOTP=16.
IF (FQ2OPKBSTOT=65) FQ2OPKBSTOTP=18. 
IF (FQ2OPKBSTOT=66) FQ2OPKBSTOTP=19.
IF (FQ2OPKBSTOT=67) FQ2OPKBSTOTP=20.
IF (FQ2OPKBSTOT=68) FQ2OPKBSTOTP=21.
IF (FQ2OPKBSTOT=69) FQ2OPKBSTOTP=23.
IF (FQ2OPKBSTOT=70) FQ2OPKBSTOTP=25.
IF (FQ2OPKBSTOT=71) FQ2OPKBSTOTP=27.
IF (FQ2OPKBSTOT=72) FQ2OPKBSTOTP=28.
IF (FQ2OPKBSTOT=73) FQ2OPKBSTOTP=30.
IF (FQ2OPKBSTOT=74) FQ2OPKBSTOTP=32.
IF (FQ2OPKBSTOT=75) FQ2OPKBSTOTP=35.
IF (FQ2OPKBSTOT=76) FQ2OPKBSTOTP=37.
IF (FQ2OPKBSTOT=77) FQ2OPKBSTOTP=40.
IF (FQ2OPKBSTOT=78) FQ2OPKBSTOTP=44.
IF (FQ2OPKBSTOT=79) FQ2OPKBSTOTP=47.
IF (FQ2OPKBSTOT=80) FQ2OPKBSTOTP=49. 
IF (FQ2OPKBSTOT=81) FQ2OPKBSTOTP=51.
IF (FQ2OPKBSTOT=82) FQ2OPKBSTOTP=51.
IF (FQ2OPKBSTOT=83) FQ2OPKBSTOTP=57.
IF (FQ2OPKBSTOT=84) FQ2OPKBSTOTP=61.
IF (FQ2OPKBSTOT=85) FQ2OPKBSTOTP=64.
IF (FQ2OPKBSTOT=86) FQ2OPKBSTOTP=67.
IF (FQ2OPKBSTOT=87) FQ2OPKBSTOTP=70.
IF (FQ2OPKBSTOT=88) FQ2OPKBSTOTP=72.
IF (FQ2OPKBSTOT=89) FQ2OPKBSTOTP=76.
IF (FQ2OPKBSTOT=90) FQ2OPKBSTOTP=79.
IF (FQ2OPKBSTOT=91) FQ2OPKBSTOTP=81.
IF (FQ2OPKBSTOT=92) FQ2OPKBSTOTP=84.
IF (FQ2OPKBSTOT=93) FQ2OPKBSTOTP=86.
IF (FQ2OPKBSTOT=94) FQ2OPKBSTOTP=88.
IF (FQ2OPKBSTOT=95) FQ2OPKBSTOTP=89. 
IF (FQ2OPKBSTOT=96) FQ2OPKBSTOTP=91.
IF (FQ2OPKBSTOT=97) FQ2OPKBSTOTP=94.
IF (FQ2OPKBSTOT=98) FQ2OPKBSTOTP=95.
IF (FQ2OPKBSTOT=99) FQ2OPKBSTOTP=97.
IF (FQ2OPKBSTOT=100) FQ2OPKBSTOTP=97.
IF (FQ2OPKBSTOT=101) FQ2OPKBSTOTP=98.
IF (FQ2OPKBSTOT=102) FQ2OPKBSTOTP=99.
    EXECUTE. 

*PKBS Social Cooperation Functional Level (SCFL)
    1=Significant Deficit, 2=Moderate Deficit, 3=Average, 4=High Functioning.
COMPUTE FQ2OPKBSSCFL=-9999.
EXECUTE.
IF (FQ2OPKBSSC GE 0 AND FQ2OPKBSSC LE 15) FQ2OPKBSSCFL=1.
IF (FQ2OPKBSSC GE 16 AND FQ2OPKBSSC LE 23) FQ2OPKBSSCFL=2.
IF (FQ2OPKBSSC GE 24 AND FQ2OPKBSSC LE 33) FQ2OPKBSSCFL=3.
IF (FQ2OPKBSSC GE 34 AND FQ2OPKBSSC LE 36) FQ2OPKBSSCFL=4.
    EXECUTE.
*PKBS Social Interaction Functional Level (SIFL)
    1=Significant Deficit, 2=Moderate Deficit, 3=Average, 4=High Functioning.
COMPUTE FQ2OPKBSSIFL=-9999.
EXECUTE.
IF (FQ2OPKBSSI GE 0 AND FQ2OPKBSSI LE 10) FQ2OPKBSSIFL=1.
IF (FQ2OPKBSSI GE 11 AND FQ2OPKBSSI LE 19) FQ2OPKBSSIFL=2.
IF (FQ2OPKBSSI GE 20 AND FQ2OPKBSSI LE 28) FQ2OPKBSSIFL=3.
IF (FQ2OPKBSSI GE 29 AND FQ2OPKBSSI LE 33) FQ2OPKBSSIFL=4.
    EXECUTE.
*PKBS Social Independence Functional Level (SINFL)
    1=Significant Deficit, 2=Moderate Deficit, 3=Average, 4=High Functioning.
COMPUTE FQ2OPKBSSINFL=-9999.
EXECUTE.
IF (FQ2OPKBSSIN GE 0 AND FQ2OPKBSSIN LE 17) FQ2OPKBSSINFL=1.
IF (FQ2OPKBSSIN GE 18 AND FQ2OPKBSSIN LE 22) FQ2OPKBSSINFL=2.
IF (FQ2OPKBSSIN GE 23 AND FQ2OPKBSSIN LE 30) FQ2OPKBSSINFL=3.
IF (FQ2OPKBSSIN GE 31 AND FQ2OPKBSSIN LE 33) FQ2OPKBSSINFL=4.
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
**-11 'Participant (parent or child) deceased'                                                /* (Participant (child) deceased) */
**-10 'Prefer not to answer'                                                           /* (Participant selected prefer not to answer) */.
DO IF MISSING(FD2OSTAT).
DO REPEAT x = FQ2OPKBSTOT TO FQ2OPKBSSINFL.
RECODE FD2OSTAT (ELSE=COPY) INTO x.
END REPEAT.
END IF.
EXECUTE.
*Checking frequenices for constructs to look at missingness. 
FREQUENCIES VARIABLES=FD2OSTAT FQ2OPKBSTOT FQ2OPKBSSC FQ2OPKBSSI FQ2OPKBSSIN FQ2OPKBSTOTT FQ2OPKBSTOTP FQ2OPKBSSCFL FQ2OPKBSSIFL FQ2OPKBSSINFL
  /ORDER=ANALYSIS.
*If there IS missingness that was not accounted for in the STAT variable (for example in DERSAC, participants who indicated they did not have an additional caregiver should be coded as -44
Each construct needs to be coded by ID here. If there IS NO additional missingess not accounted for, delete only this section of syntax and write **CHECKED AND NOT NEEDED.
**CHECKED AND NOT NEEDED
*At this point, the only remaining missingness should represent when participant did not answer a sufficient number of questions, assuming STAT variable was correctly coded for this measure -- CHECK THIS! 
*The following syntax will recode this remaining missingness for each new construct.
IF (FQ2OPKBSTOT=-9999) FQ2OPKBSTOT=-43.
EXECUTE.  
IF (FQ2OPKBSSC=-9999) FQ2OPKBSSC=-43.
EXECUTE.  
IF (FQ2OPKBSSI=-9999) FQ2OPKBSSI=-43.
EXECUTE.  
IF (FQ2OPKBSSIN=-9999) FQ2OPKBSSIN=-43.
EXECUTE.  
IF (FQ2OPKBSTOTT=-9999) FQ2OPKBSTOTT=-43.
EXECUTE. 
IF (FQ2OPKBSTOTP=-9999) FQ2OPKBSTOTP=-43.
EXECUTE. 
IF (FQ2OPKBSSCFL=-9999) FQ2OPKBSSCFL=-43.
EXECUTE. 
IF (FQ2OPKBSSIFL=-9999) FQ2OPKBSSIFL=-43.
EXECUTE. 
IF (FQ2OPKBSSINFL=-9999) FQ2OPKBSSINFL=-43.
EXECUTE. 

MISSING VALUES
   FQ2OPKBSTOT FQ2OPKBSSC FQ2OPKBSSI FQ2OPKBSSIN FQ2OPKBSTOTT FQ2OPKBSTOTP FQ2OPKBSSCFL FQ2OPKBSSIFL FQ2OPKBSSINFL
    (LO THRU -1).
EXECUTE.

*STEP 9: LABELING CONSTRUCTS.
VARIABLE LABELS
FQ2OPKBSTOT 'PKBS Total Score [FQ2OPKBSTOT]'
FQ2OPKBSSC 'PKBS Social Cooperation [FQ2OPKBSSC]'
FQ2OPKBSSI 'PKBS Social Interaction [FQ2OPKBSSI]'
FQ2OPKBSSIN 'PKBS Social Independence [FQ2OPKBSSIN]'
FQ2OPKBSTOTT 'PKBS Total T Score [FQ2OPKBSTOTT]'
FQ2OPKBSTOTP 'PKBS Total Percentile Rank [FQ2OPKBSTOTP]'
FQ2OPKBSSCFL'PKBS Social Cooperation Functional Level [FQ2OPKBSSCFL]'
FQ2OPKBSSIFL'PKBS Social Interaction Functional Level [FQ2OPKBSSIFL]'
FQ2OPKBSSINFL'PKBS Social Independence Functional Level [FQ2OPKBSSINFL]'.
EXECUTE.

*STEP 9A: ADD VALUE LABELS.
*Include ALL missing value labels (SEE STEP 8 FOR FULL LIST). 
*Be sure to also include value labels for any constructs that need labels (e.g., 0 'No', 1 'Yes'). Summed or averaged scores do NOT need value labels.
VALUE LABELS
   FQ2OPKBSTOT FQ2OPKBSSC FQ2OPKBSSI FQ2OPKBSSIN FQ2OPKBSTOTT FQ2OPKBSTOTP FQ2OPKBSSCFL FQ2OPKBSSIFL FQ2OPKBSSINFL
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
-11 'Participant (parent or chil) deceased (-11)'                              
-10 'Prefer not to Answer (-10)'.
EXECUTE. 

VALUE LABELS
    FQ2OPKBSSCFL FQ2OPKBSSIFL FQ2OPKBSSINFL
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
-10 'Prefer not to Answer (-10)'
1 'Significant Deficit'
2 'Moderate Deficit'
3 'Average'
4 'High Functioning'.
EXECUTE. 


*STEP 10: CHECK FREQUENCIES.
*Checking frequencies of all constructs.
FREQUENCIES VARIABLES=FD2OSTAT FQ2OPKBSTOT FQ2OPKBSSC FQ2OPKBSSI FQ2OPKBSSIN FQ2OPKBSTOTT FQ2OPKBSTOTP FQ2OPKBSSCFL FQ2OPKBSSIFL FQ2OPKBSSINFL
  /ORDER=ANALYSIS.

*STEP 11: CHECK DESCRIPTIVES.
*Checking descriptives for all constructs.
DESCRIPTIVES VARIABLES=FQ2OPKBSTOT FQ2OPKBSSC FQ2OPKBSSI FQ2OPKBSSIN FQ2OPKBSTOTT FQ2OPKBSTOTP FQ2OPKBSSCFL FQ2OPKBSSIFL FQ2OPKBSSINFL
  /STATISTICS=MEAN STDDEV MIN MAX.

*STEP 12: SAVE CLEANED DATA FILE.
*First, sorting the data file by ID and resaving the final file.
*Using /KEEP command to keep ONLY ID + RD + the constructs that were created. 
SORT CASES BY ID(A).
SAVE OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OPKBS_Constructs.sav'
  /KEEP ID FD2ORD FQ2OPKBSTOT FQ2OPKBSSC FQ2OPKBSSI FQ2OPKBSSIN FQ2OPKBSTOTT FQ2OPKBSTOTP FQ2OPKBSSCFL FQ2OPKBSSIFL FQ2OPKBSSINFL
  /COMPRESSED.
GET
  FILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OPKBS_Constructs.sav'.
EXECUTE.

*STEP 13: SAVE OUTPUT FILE.
*Be sure that you have a 'clean' output file. Re-run syntax once you are sure there are no errors and save with frequencies and descriptives.
OUTPUT SAVE 
 OUTFILE='/Users/alexisadams-clark/Desktop/DBT Moms data management/FQ2OPKBS_Constructs.spv'
LOCK=NO.


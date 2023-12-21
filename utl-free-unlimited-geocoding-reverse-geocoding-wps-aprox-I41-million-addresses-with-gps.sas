%let pgm=utl-free-unlimited-geocoding-reverse-geocoding-wps-aprox-I41-million-addresses-with-gps;

Free unlimited geocoding reverse geocoding wps aprox I41 million addresses with gps;

github
http://tinyurl.com/45rsxfwr
https://github.com/rogerjdeangelis/utl-free-unlimited-geocoding-reverse-geocoding-wps-aprox-I41-million-addresses-with-gps

Download csv, unzip and convert csv to wps table with 141 million US addresses (1.07gb gzipped win10 1,159,132,788 bytes)
  https://1drv.ms/u/s!AovFHZtMPA-7gh25NUe6pg0OW68k?e=kfZLOe
Since the file is an self extracting(exe) 7-zip file, you may wand to download using incognito
One version of the csv may have lat and lon reversed?

  SOLUTIONS

      1 wps free geocoding (address to geocode)
      2 wps free reverse geocoding (geocode to address)

geocoding repos
https://github.com/rogerjdeangelis?tab=repositories&q=geocode&type=&language=&sort=

I really would like to get hold of open source version of detail 'google' map files,
probably not big data (ie single file over 1TB).

/*                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

/*----                                                                   ----*/
/*---- Note I have run the code in https://tinyurl.com/yck8yu68          ----*/
/*---- which converts                                                    ----*/
/*----                                                                   ----*/
/*---- 21 Steeplechase Lane Asbury New Jersey 08802                      ----*/
/*---- 1 Wall Street Manhattan New York City, NY 10005                   ----*/
/*----                                                                   ----*/
/*---- to matchcodes                                                     ----*/
/*----                                                                   ----*/
/*---- 21STEEPLECHASELN08802                                             ----*/
/*---- 1WALLST10005                                                      ----*/
/*----                                                                   ----*/

options validvarname=upcase;
libname adr "m:/adr/opn";
data sd1.have;
 length zip4 $4.;
 input;
 adr=_infile_;
 matchcode = upcase(compress(_infile_,' '));
 zip4=substr(scan(adr,-1,' '),1,4);
cards4;
21 Steeplechase LN 08802
1 Wall St 10005
;;;;
run;quit;

/********************************************************************************************************************************/
/*                                                                                                                              */
/* You need to create a match code from these original address                                                                  */
/*                                                                                                                              */
/* 21 Steeplechase Lane Asbury New Jersey 08802                                                                                 */
/* 1 Wall Street Manhattan New York City, NY 10005                                                                              */
/*                                                                                                                              */
/* see this repo for directions                                                                                                 */
/* https://tinyurl.com/yck8yu68                                                                                                 */
/* https://github.com/rogerjdeangelis/utl-given-a-list-of-messy-addresses-geocode-and-reverse-geocode-using-us-address-database */
/*                                                                                                                              */
/* Output from https://tinyurl.com/yck8yu68                                                                                     */
/*                                                                                                                              */
/* You do not need city or state and you have to convert Street to ST                                                           */
/* Use the abreviation dictionaries in https://tinyurl.com/yck8yu68                                                             */
/*                                                                                                                              */
/* 21 Steeplechase Lane Asbury New Jersey 08802                                                                                 */
/* becomes match code (drop city, state and conver lane to LN                                                                   */
/* matchcode 21STEEPLECHASELN08802                                                                                              */
/*                                                                                                                              */
/*  _                   _                                                                                                       */
/* (_)_ __  _ __  _   _| |_ ___                                                                                                 */
/* | | `_ \| `_ \| | | | __/ __|                                                                                                */
/* | | | | | |_) | |_| | |_\__ \                                                                                                */
/* |_|_| |_| .__/ \__,_|\__|___/                                                                                                */
/*         |_|                                                                                                                  */
/*                                                                                                                              */
/*  SD1.HAVE                                                                                                                    */
/*                                                                                                                              */
/*  ZIP4    ADR                         MATCHCODE                                                                               */
/*                                                                                                                              */
/*  0880    21 Steeplechase LN 08802    21STEEPLECHASELN08802                                                                   */
/*  1000    1 Wall St 10005             1WALLST10005                                                                            */
/*                                                                                                                              */
/*                                                                                                                              */
/*  DATABASE (from download 141,882,890 observations)                                                                           */
/*                                                                                                                              */
/*  ADR.ADR_010ADRLONLATSRT total obs=141,882,890                                                                               */
/*                                                                                                                              */
/*  MATCHCODE                         ZIP4    STATE    ADR                                     AVGLAT      AVGLON               */
/*                                                                                                                              */
/*  184BELLEST00002                   0000     IA      184 BELLE ST 00002                      -92.299    42.4518               */
/*  2HALBROOK                         0000     TX      2 HALBROOK                              -95.880    32.6956               */
/*  4518CHARMDR00001                  0000     IA      4518 CHARM DR 00001                     -92.415    42.4473               */
/*  1481WROSEBUDRD00063               0006     MT      1481 W ROSEBUD RD 00063                -109.637    45.2817               */
/*  10005AVE00083                     0008     NY      1000 5 AVE 00083                        -73.963    40.7784               */
/*  10086STTRANSVERSE00083            0008     NY      100 86 ST TRANSVERSE 00083              -73.964    40.7834               */
/*  10097STTRANSVERSE00083            0008     NY      100 97 ST TRANSVERSE 00083              -73.961    40.7889               */
/*  10502CENTRALPKNEAR5AVE00083       0008     NY      10502 CENTRAL PKNEAR 5 AVE 00083        -73.953    40.7942               */
/*  10651EDR00083                     0008     NY      10651 E DR 00083                        -73.955    40.7961               */
/*  11097STTRANSVERSE00083            0008     NY      110 97 ST TRANSVERSE 00083              -73.961    40.7889               */
/*                                                                                                                              */
/*  INDEX ZIP4                                                                                                                  */
/*                                                                                                                              */
/*                                                                                                                              */
/********************************************************************************************************************************/

/*
 _ __  _ __ ___   ___ ___ ___  ___ ___
| `_ \| `__/ _ \ / __/ __/ _ \/ __/ __|
| |_) | | | (_) | (_| (_|  __/\__ \__ \
| .__/|_|  \___/ \___\___\___||___/___/
|_|
*/

%utl_submit_wps64x('
libname adr "m:/adr/opn";
libname sd1 "d:/sd1";
options validvarname=any;
proc sql;
   create
      table sd1.adr_010matScr as
   select
      fro_adr
     ,too_adr
     ,r.avglon
     ,r.avglat
     ,min(score)  as min_score
   from
      (
      select
         l.adr                   as fro_adr
        ,r.adr                   as too_adr
        ,compged(compress(l.matchcode),compress(r.matchcode)) as score
      from
         sd1.have as l left join adr.adr_010adrLonLatSrt as r
      on
              compged(l.matchcode,r.matchcode) le 1000
         and  l.zip4 = r.zip4
      )
  group
     by fro_adr
  having
     score = min(score)
  order
     by fro_adr, score
;quit;
proc print data=sd1.adr_010matScr;
run;quit;
');

/**************************************************************************************************************************/
/*                                                                                                                        */
/* Note we now have the geocode and an exact match                                                                        */
/*                                                                                                                        */
/* The WPS System                                                 This is what I want                                     */
/*                                                                ==================                                      */
/* Obs            fro_adr                     too_adr             AVGLON      AVGLAT     min_score                        */
/*                                                                                                                        */
/*  1     1 Wall St 10005             1 WALL ST 10005             40.7073    -74.0119        0                            */
/*  2     21 Steeplechase LN 08802    21 STEEPLECHASE LN 08802    40.7082    -75.0034        0                            */
/*                                                                                                                        */
/*  From the internet  1 WALL ST 10005                                                                                    */
/*                                                                                                                        */
/*  40.7075      -74.0116                                                                                                 */
/*  40.704330516 -74.006999972                                                                                            */
/*  40.706005    -74.008827                                                                                               */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*___                                                                                         _
|___ \  __      ___ __  ___   _ __ _____   _____ _ __ ___  ___  __ _  ___  ___   ___ ___   __| | ___
  __) | \ \ /\ / / `_ \/ __| | `__/ _ \ \ / / _ \ `__/ __|/ _ \/ _` |/ _ \/ _ \ / __/ _ \ / _` |/ _ \
 / __/   \ V  V /| |_) \__ \ | | |  __/\ V /  __/ |  \__ \  __/ (_| |  __/ (_) | (_| (_) | (_| |  __/
|_____|   \_/\_/ | .__/|___/ |_|  \___| \_/ \___|_|  |___/\___|\__, |\___|\___/ \___\___/ \__,_|\___|
                 |_|                                           |___/

*/


/*----                                                                   ----*/
/*---- create simple index (intlatlon) on the 141 million                ----*/
/*---- length intlatlon $5;                                              ----*/
/*---- input lat lon;                                                    ----*/
/*---- intlon=put(abs(lon),z3.);                                         ----*/
/*---- intlat=put(abs(lat),z2.);                                         ----*/
/*----                                                                   ----*/
/*---- INTLATLON=CATS(INTLAT,INTLON);                                    ----*/
/*----                                                                   ----*/
/*---- maybe create a second small 141 million table sorted on intlatlon ----*/
/*----                                                                   ----*/


options validvarname=upcase;
libname sd1 "d:/sd1";
data sd1.havGps;
length intlatlon $5;
input lat lon;
intlon=put(abs(lon),z3.);
intlat=put(abs(lat),z2.);
intlatlon=cats(intlat,intlon);
keep lat lon intlatlon
cards4;
40.7073 -74.0119
;;;;
run;quit


%utl_submit_wps64x('
libname adr "m:/adr/opn";
libname sd1 "d:/sd1";
options validvarname=any;
proc sql;
   create
      table sd1.adr_010rev as
      select
         *
        ,abs(abs(l.lat) - abs(r.avglat))  as diflat
      from
         sd1.havGps as l, adr.adr_010adrLonLatSrt as r
      where
         abs(abs(l.lat) - abs(r.avglat))<.0001 and abs(abs(l.lon) - abs(r.avglon)) < .0001
         and  l.intlatlon = r.intlatnon
;quit;
proc print data=sd1.adr_010rev;
run;quit;

/**************************************************************************************************************************/
/*                                                                                                                        */
/*  1 WALL STREET IS AT THE INTERSECTION BROADWAY AND 80TH ST              This is what I want                            */
/*                                                                         ===================                            */
/*  INTLATLON      LAT         LON    ZIP4       MATCHCODE        STATE           ADR                                     */
/*                                                                                                                        */
/*    41074      40.7073    -74.0119  1000    1WALLST10005         NY      1 WALL ST 10005                                */
/*    41074      40.7073    -74.0119  1000    80BROADWAY10005      NY      80 BROADWAY 10005                              */
/*                                                                                                                        */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/

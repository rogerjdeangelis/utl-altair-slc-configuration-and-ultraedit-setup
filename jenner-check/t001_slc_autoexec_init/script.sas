/* -------------------------------------------------------------------------
   Derived from the autoexec _init_ block documented in
   utl-altair-slc-configuration-and-ultraedit-setup.sas
   (Section I.4 "Create c:/wpsoto/autoexec.sas").

   These are the exact session options from the repo's SLC autoexec.  The
   small demonstration below shows the configured VALIDVARNAME=UPCASE and the
   custom FORMCHAR taking effect in a listing.
   ------------------------------------------------------------------------- */

ods _all_ close;
ods listing;
options ls=255 ps=65
 nofmterr nocenter
 nodate nonumber
 noquotelenmax
 validvarname=upcase
 compress=no
 FORMCHAR='|----|+|---+=|-/\<>*'
;
run;quit;

/* demonstration data (self-contained, from sashelp) */
data class;
  set sashelp.class(obs=6);
run;

/* VALIDVARNAME=UPCASE => column names print upper-cased;
   the custom FORMCHAR draws the table rules */
proc print data=class;
run;

proc means data=class n mean;
  var height weight;
run;

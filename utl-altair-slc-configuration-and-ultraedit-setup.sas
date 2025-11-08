%let pgm=utl-altair-slc-configuration-and-ultraedit-setup;

%stop_submission

Altair SLC configuration and UltraEdit setup

Too long to post here, see github

github
https://github.com/rogerjdeangelis/utl-altair-slc-configuration-and-ultraedit-setup

ALTAIR CONFIGURATIONS
SLC & ULTRAEDIT

Prepared by: Roger DeAngelis
System: Windows 11 64-bit
Date: November 2025

TABLE OF CONTENTS

I. SLC Configuration (Windows 11 64-bit)

 1. Create Environment Variable
 2. Create Folder Structures
 3. Key Files and Configuration Edits
 4. Create Autoexec File

II. UltraEdit Configuration (Windows 11 64-bit)

 1. Installation and Licensing
 2. Preparing Required Files
 3. Setting Up Run Command
 4. Multi-Panel Tiling Layout
 5. Automatic File Refresh
 6. Layout and Workspace Management
 7. Keyboard Shortcuts
 8. Running Programs

III. Sample Reproducible Problems


I SLC CONFIGUARATION WIN 11 64bit

  1 Create environment variable

      a. In the win 11 search box type
         type 'environment variables'

      b  select 'edit environment variables'

      c  user variables > select edit add

      d  enter this  in variable anf value fields
         VARIABLE              VALUE

         ALTAIRSLC_CONFIG      C:\wpscfg\altairslc_local.cfg

      e  refresh environment variable
         open commad window
         enter
         refreshenv

      f  check the environment variable
         open a dos commad window (cmd.exe)
         enter
         echo %ALTAIRSLC_CONFIG%

   2 Create folder structures

      a  c:/slc/
          current.sas for frozen left panel in ultraedit
          current.log for froozen center panel in ultra edit
          current.lst for frozen right panel in ultra edit

      b  c:/wpsoto    for autocall macros  (l%utlfkil() to delete files and autoexec.sas

      c  c:/wpscfg for config file

      d  d:/wpswrk for work directory

   3  Key files

      a  COPY C:\Program Files\Altair\SLC\2026\altairslc.cfg
         To
         C:\wpscfg\altairslc_local.cfg

      b  Edt C:\wpscfg\altairslc_local.cfg user config file given by the environment variable ALTAIRSLC_CONFIG

        -WORK 'd:\wpswrk'
        -set SASAUTOS ('!wpshome\sasmacro' 'c:/wpsoto')
        -SASAUTOS (SASAUTOS)
        -AUTOEXEC 'c:/wpsoto/autoexec.sas'
        -SASUSER 'd:/wpsusr'

    4  Create c:/wpsoto/autoexec.sas

       ;;;;  /*--- because of a bug in the how the slc handle the autoexec ---*/
       run;quit;

       %let _init_= %str(
       ods _all_ close;
       ods listing;
       options ls=255 ps=65
        nofmterr nocenter
        nodate nonumber
        noquotelenmax
        validvarname=upcase
        compress=no
        FORMCHAR='|----|+|---+=|-/\<>*')
       ;
       run;quit;


II  ULTRAEDIT CONFIGUARATION WIN 11 64bit

    1 Download and install Ultraedit. I installed the free 7 day trial and later purchased a
      $99 yearly subscription.
      If you install the free 7 day trial you can later activate using just the license
      key in the verification email.
      https://www.ultraedit.com/catalog-product/ultraedit-sub/

    2 You should already have these files from above. It is ok if they are empty.

      c:/slc/current.sas
      c:/slc/currentlog
      c:/slc/current.lst

    3 Open ultraedit

      Click on advanced tab in upper right

      Click on this box

      +---------+
      | Run     |
      | WINDOWS |
      | PROGRAM |
      +---------+

      Click on menu item

      Run Wimdows command

      In the command box type

      cmd /c start /B wps %f -log "%p%n.log" -print "%p%n.lst"

      In the working directory box
      Type

      c:/slc

      I chose handle Outputs as ANSI

   4 In upper left click on File

      Click on open

      go to c:/slc

      Hold down the control key and
      select

      current.sas
      currentlog
      current.lst

      or select one at a time

5 You should see

     +--------------------+-------------------+--------------------+
     | c:\slc\current.sas | c:\slc\currentlog | c:\slc\current.lst |
     +--------------------+-------------------+--------------------+

6    Click on Window ( it is next to Advanced in upper right )

     Click on enable Tiling (very important)

     Click on Cascade & Tile

     Click on Tile Vertical

7    You should see

     /**********************************************************************************/
     /*    C:\slc\current.lst     |     c:\slc\current.sas    |    c:\slc\current.log  */
     /*                           |                           |                        */
     /*                           |                           |                        */
     /*                           |                           |                        */
     /*                           |                           |                        */
     /*                           |                           |                        */
     /*                           |                           |                        */
     /*                           |                           |                        */
     /*                           |                           |                        */
     /*                           |                           |                        */
     /*                           |                           |                        */
     /*                           |                           |                        */
     /*                           |                           |                        */
     /*                           |                           |                        */
     /*                           |                           |                        */
     /**********************************************************************************/

8    You can easily rearrange the panels, just drag and drop

9    Set automatic refresing of log and list

     click on advanced in upper right

     click on the gear settings (not backup settings)

     scroll down to file handling > file change detection > automatic update file changes

10   save layout and workspace (only need to do this once or when you change lyaouts or workspace)

     click on layout (again)

     click on

      +---------+
      | LAYOUTS |
      +---------+

     click on

      manage layouts

    click on first item

     Balanced Save [22.04.25]

     A box will pop up

     In the name box give a name for your layout (mylayout)

     click on save

     Next time you open UE you will have mylayout.
     You can have mutiple layouts

9    Save your workspces and layouts

     Go to Advanced > backup settings >selct a directory to save and click on backup

10   Close UE
     in the very top task bar click on yellow circle with ue text and close

11   When you open UE you should see


9   To eliminate mouse actions and run your program using two key mappings

      Go to advanced > setings > key mapping

      Look for 'run window program'
      shoupld see
      'existing key' (should be empty)

      type this in existing key box

      Hold down the alt key and add the '1'
      The result should look like 'alt + 1'

      close settings

10   How to run your program

     You need a two key mapping

     Hold alt key down and hit 1
     when run box opend
     Hold down alt key and hit R



III  SAMPLE SLC REPRODUCIBLE PROBLEMS

  ALL OF THESE HAVE ARE IN ROGER GITHUB

  https://github.com/rogerjdeangelis/

   utl-monarch-and-altair-personal-slc-creating-and-converting-pdf-tables-to-text
   utl-RE-Altair-Personal-slc-Monarch-Learning-Series_2023-Exercise_6-Sales---Inventory-Analysis
   utl-RE-altair-personal-slc-scan-line-after-string-O1-then-extract-number-after-E1-on-next-line
   utl-add-group-sums-to-each-record-in-a-group-along-with-inuput-row-altair-personal-slc
   utl-adding-a-column-to-excelsheet-using-personal-altair-slc
   utl-altair-monarch-and-personal-altair-slc-compute-business-days-between-two-dates
   utl-altair-monarch-and-personal-slc-reading-and-writing-dbf-files
   utl-altair-monarch-and-personal-slc-using-ocr-to-extract-text-from-images-tesseract
   utl-altair-personal-slc-accessing-postgresql-read-write-access-meta-data
   utl-altair-personal-slc-add-a-columm-called-date-containing-the-last-day-of-the-previous-month
   utl-altair-personal-slc-comparing-two-excel-workbook-sheets
   utl-altair-personal-slc-concatenating-rows-by-id-using-datasteps-and-workaround-for-sqlite-bug
   utl-altair-personal-slc-constrained-linear-regression-to-reduce-penalties-for-over-under-estimates
   utl-altair-personal-slc-create-sas-dataset-without-sas-from-any-language-with-a-cli
   utl-altair-personal-slc-creating-and-analyzing-tables-created-from-multiple-pdf-and-excel-files
   utl-altair-personal-slc-digitize-images-and-output-points-to-excel
   utl-altair-personal-slc-disabling-precode-html-destination-and-adding-help-datasets-metadata
   utl-altair-personal-slc-exercise-42-inventory-report-analysis
   utl-altair-personal-slc-exploded-text-using-workaround-to-submit-r-python-inside-slc-macro
   utl-altair-personal-slc-extracting-summary-statistics-from-a-complex-invoice-text-file
   utl-altair-personal-slc-identify-centroids-of-clusters-and-plot-convex-hull
   utl-altair-personal-slc-issue-importing-excel-sheet-where-column-names-are-in-the-third-row
   utl-altair-personal-slc-monarch-exercise-39-bank-statement-analysis
   utl-altair-personal-slc-monarch-exercise_26-meditech-detail-trial-balance-vs-transactions
   utl-altair-personal-slc-odbc-connections-to-and-from-ms-sql-server-with-and-without-passthru
   utl-altair-personal-slc-odbc-connections-to-and-from-mysql-with-and-without-passthru
   utl-altair-personal-slc-odbc-sqlite-read-write-access-meta-data
   utl-altair-personal-slc-optimum-lamda-for-box-cox-regression
   utl-altair-personal-slc-parsing-colon-separated-words-in-a-complex-realestate-report
   utl-altair-personal-slc-pca-principle-component-analysis
   utl-altair-personal-slc-postgresql-passthru-select-first-ob-by-group-ordered-by-specific-variables
   utl-altair-personal-slc-powerfull-text-file-parsing-using-slc-input-statement
   utl-altair-personal-slc-select-records-in-transaction-worksheet-that-are-not-in-master-worksheet
   utl-altair-personal-slc-selecting-the-sum-of-expenses-by-week-for-current-year
   utl-altair-personal-slc-staistical-visualizations-of-altair-dxf-file-and-render-as-pdf
   utl-altair-personal-slc-sum-open-and-closing-balances-by-account
   utl-altair-personal-slc-sumpy-closed-form-solutions-for-a-solid-rotating-disk
   utl-altair-personal-slc-usng-an-excel-database-to-analyze-healthcare-labor-costs
   utl-altair-slc-convert-pdf-tables-to-excel-sheets
   utl-altair-slc-monarch-exercise3-composers-analysis
   utl-altair-slc-reading-and-writing-OpenDocument-spreadsheets-using-r-and-python
   utl-altair-slc-to-fill-gaps-in-proc-sql-select-third-place-in-the-daily-double-r-python-solutions
   utl-altair-slc-ultraedit-a-better-IDE-than-eclipse-maybe
   utl-annotate-points-on-a-map-using-the-personal-edition-of-the-altair-slc
   utl-automating-excel-data-preperation-monarch-and-altair-percsonal-slc
   utl-calling-python-from-personal-altair-slc-and-integrating-python-with-sql
   utl-calling-r-from-personal-altair-slc-and-integrating-r-with-sql
   utl-converting-sas-formats-sas7bcats-to-altair-personal-slc-formats-wpccat
   utl-directing-output-to-a-listing-window-when-using-the-personal-altair-slc-
   utl-dropping-down-to-powershell-from-personal-altair-slc
   utl-generating-complete-case-when-logic-for-decision-trees-using-altair-personal-slc
   utl-how-to-create-a-sas-dataset-from-python-panda-dataframe-using-the-personal-altair-slc
   utl-how-to-create-a-sas-dataset-from-r-dataframe-using-the-personal-altair-slc
   utl-monarch-altair-personal-slc-combine-two-tables-in-one-excel-sheet
   utl-monarch-altair-personal-slc-inserting-smart-line-breaks-in-a-long-block-of-text
   utl-monarch-and-altair-personal-slc-convert-many-pdf-files-with-tables-to-excel-workbooks-by-date
   utl-monarch-and-altair-personal-slc-create-excel-report-with-subtotals-and-grand-total
   utl-monarch-and-altair-personal-slc-import-excel-sheet-with-many-tabs
   utl-monarch-and-altair-personal-slc-pivot-long-transpose
   utl-monarch-and-altair-personal-slc-reading-and-writing-google-sheets
   utl-monarch-and-personal-altair-slc-odbc-appending-rows-to-an-existing-excel-sheet
   utl-monarch-and-personal-altair-slc-reading-excel-pivot-tables
   utl-monarch-and-personal-slc-appending-all-sheets-to-first-sheet-Excel97-2003-workbooks
   utl-odbc-passthrough-to-sqlite-file-database-fails-with-the-altair-personal-slc
   utl-personal-altair-slc-convert-sas-datastep-to-slc-sql-odbc-r-python
   utl-personal-altair-slc-with-matlab-sympy-and-r-finite-element-cold-plate-heat-transfer
   utl-post-weekend-and-holiday-sales-to-the-next-business-weekday-using-personal-altair-slc
   utl-psuedo-batch-personal-altair-slc-and-calling-slc-from-python-and-r
   utl-sqllite-odbc-driver-works-with-r-and-with-personal-altair-slc
   utl-workaround-for-the-altair-personal-slc-sqlite-passthru-and-python-bugs

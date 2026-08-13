    Configuration and UltraEdit setup
     
    Too long to post, see github
    https://github.com/rogerjdeangelis/utl-chapter-I-configuration-and-ultraedit-setup-for-sas-compatible-systems

    CONFIGURATIONS
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


      SLC CONFIGUARATION WIN 11 64bit

      1 Create environment variable

          a. In the win 11 search box type
             type 'environment variables'

          b  select 'edit environment variables'

          c  user variables > select edit add

          d  enter this  in variable anf value fields
             VARIABLE              VALUE

             ALTAIRSLC_CONFIG      C:\wpscfg\altairslc_local.cfg

          e  refresh environment variable
             open command window
             enter
             refreshenv
             if refreshenv fails, open task manager cnt-alt-delete and restart windows explorer
             refreshenv worked in win 10, but failled after I instlled win 11?

          f  check the environment variable,
             open a DOS command window (cmd.exe)
             enter
             echo %ALTAIRSLC_CONFIG%

       2 Create folder structures

          a  c:/slc/
              current.sas for frozen left panel in ultraedit
              current.log for froozen center panel in ultra edit
              current.lst for frozen right panel in ultra edit

          b  c:/wpsoto    for autocall macros

          c  c:/wpscfg for config file

          d  d:/wpswrk for temporary work directory

          e  d:/wpswrkx for permanent work directory

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


           ods _all_ close;
           ods listing;
           options ls=255 ps=65
            nofmterr nocenter
            nodate nonumber
            noquotelenma
            compress=no
            FORMCHAR='|----|+|---+=|-/\<>*')
           ;
           run;

           libname workx "d:/wpswrkx"; /*--- save workspace for subsequent submissons ---*/


    IV  ULTRAEDIT CONFIGURATION WIN 11 64bit      edit the system environment variables

      0    Locate wps.exe

           May be at
           C\Program Files\Altair\SLC\2025\bin

           In the win 11 search box enter

           advanced system properties
           select enviorment variable in system properties
           in system variables
           highlisgt path
           then new
           and add
           C\Program Files\Altair\SLC\2025\bin
           ok and apply(if present)
           ok again

           Check path
           refreshenv
           open a cmd window
           echo %PATH%

           If this fails
           open task manager (cntl-alt-delete)
           restart windows explorer
           open a NEW command window (cmd.exe)
           echo %PATH%

        1 Download and install Ultraedit. I installed the free 7 day trial and later purchased a
          $99 yearly subscription.
          If you install the free 7 day trial you can later activate using just the license
          key in the verification email.
          https://www.ultraedit.com/catalog-product/ultraedit-sub/

        2 You should already have these files from above. It is ok if they are empty.

          c:/slc/current.sas
          c:/slc/currentlog
          c:/slc/current.lst

        2.5 Better way to run program (only alt-f1)
          Single action to run your Jenner Alalytics or Altair SLC programs

          How to press 'alt-f1' multikey to run you jenner analytics programu(or sas or altair slc)

          Go to advanced > tool configuration. It is the 'hammer icon' and select configuration.
          Fill in

          Menu Item Name::
          jnr

          Command Line: (you can add other options)
          cmd /c start /B C:\Progra~1\Jenner\jenner.exe %f -log "%p%n.log" -print "%p%n.lst" -work "d:/wpswrk"

          Working directory:
          c:/slc

          apply then ok

          This is what I could not figure out earlier.

          Menu Item Name 'jnr' is mapped to 'User Tool 1' in advanced > settings (the gear icon).
          Go to advanced > settings (the gear icon)  > toolbar/menu > key mappings
          Select 'User tool 1'
          Existing Keys: (press alt-1)
          alt-f1

        3 Open ultraedit (deprecated use 2.5 run program using alt-f1 abd alt-r)

          Click on advanced tab in upper right

          Click on this box

          +---------+
          | Run     |
          | WINDOWS |
          | PROGRAM |
          +---------+

          Click on menu item

          Run Windows command

          In the command box type

          cmd /c start /B wps %f -log "%p%n.log" -print "%p%n.lst"

          In the working directory box
          Type

          c:/slc

          I chose handle Outputs as ANSI

          To eliminate mouse actions and run your program using two key mappings

          Go to advanced > setings > key mapping

          Look for 'run window program'
          shoupld see
          'existing key' (should be empty)

          type this in existing key box

          Hold down the alt key and add the '1'
          The result should look like 'alt + 1'

          close settings

          alt-f1 abd alt-r  will run your program

    10   How to run your program

         You need a two key mapping

         Hold alt key down and hit 1
         when run box opend
         Hold down alt key and hit R


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

    11    Save your workspces and layouts

         Go to Advanced > backup settings >selct a directory to save and click on backup

    12   Close UE
         in the very top task bar click on yellow circle with ue text and close


    13    Deprecated, use 2.5
          To eliminate mouse actions and run your program using two key mappings

          Go to advanced > setings > key mapping

          Look for 'run window program'
          shoupld see
          'existing key' (should be empty)

          type this in existing key box

          Hold down the alt key and add the '1'
          The result should look like 'alt + 1'

          close settings

          How to run your program

          You need a two key mapping

          Hold alt key down and hit 1
          when run box opend
          Hold down alt key and hit R
          
     V Versioning in UltrEdit
     UltraEdit has a built-in Version Backup feature that can keep a numbered copy each time you save. 
     It is convenient for local, single-file history; use Git if you need commits, diffs, branches, and shared history.

     Enable version backups
     1 Open Advanced → Configuration (in newer layouts this may be Advanced → Settings).

     2 Go to File Handling → Backup.

     3 Under Version backup, enable On save.

     4 Set a filename format that includes $c, the sequential version counter.

     5 Set Maximum number of backups—use -1 for no limit.  

     You should see in the current working directory

     type hotkey ctrl-s and you should see

     c:/slc

     program.sas
     program(0).sas
  
     In you versioning c:/ver directory you should
  
     program.sasbak (this will be overriden?) 
 
     
 







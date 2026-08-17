    /*--- ctrl-alt-R reads this line and saves the program at the path below 
    save "c:/utl/utl-chapter-I-configuration-and-ultraedit-setup-for-sas-compatible-systems.sas"
    ---*/     

    Chapter-I-configuration-and-ultraedit-setup-for-sas-compatible-systems  
    
    Note:  C:\slc\current.lst, c:\slc\current.sas, and  c:\slc\current.log are a sandbox.                  
    When you want save production code. Press Ctl+Alt+2 to save your program in  the path in line 2 of the editor. 
    The objective is to clone SAS DMS editor using UltraEdit.
 
    This documents users of UltraEdit Version 2025.1.0.31 64-bit.
    The top ribbon must look like this to use this documentation (this is the contemporary menu (not the traditional menu))
 
    File  Home  EDIT  Format  View  Coding  Project  Layout  Window  Advanced 
   
    Although UltraEdit does not have a command line, UltraEdit has powerful scripting.
    Basically a weaker version of sas command macros?
   
       1  macro record (recording commands and assigning to a multi-key action)
       2  JavaScript scripting with just UltraEdit commands
       3  JavaScript combines scripting with external programs, like SAS, slc or Jenner Analytics
 
     Also, if you submit a program without making any changes, nothing will happen.
  
     Too long to post; see GitHub
     https://github.com/rogerjdeangelis/utl-chapter-I-configuration-and-ultraedit-setup-for-sas-compatible-systems
    
     CONFIGURATIONS
     ULTRAEDIT

     TABLE OF CONTENTS

     I. SLC CONFIGURATION WIN 11 64bit
     
      1. Create environment variable
      2. Create path environment variable
      3. Create folder structures (these form a sandbox)
      4. Key files
      5. Create c:/wpsoto/autoexec.sas
     
     II ULTRAEDIT CONFIGURATION WIN 11 64bit
       
      1. Download and install UltraEdit. 
      2. Make the Windows clipboard your default clipboard in UltraEdit.
      3. Create SAS DMS window vertical layout
     
     III RUN A SIMPLE AS COMPATIBLE PROGRAM 
      1.  Turn line numbers on 
      2.  Run the program 
      3.  Immediate output 
      4.  Save  all user customizations

   I. SLC CONFIGURATION WIN 11 64bit

      1. Create environment variable

          a. In the Windows 11 search box, type
             type 'environment variables'

          b. Select 'Edit environment variables'

          c. User variables > select Edit/Add

          d. Enter this  in the variable and value fields
             VARIABLE              VALUE

             ALTAIRSLC_CONFIG      C:\wpscfg\altairslc_local.cfg

          e. Refresh environment variable
             
             Open Task Manager (Ctrl+Alt+Delete)
             Type Ctrl to freeze Task Manager
             find 'windows explorer' 
             right-click on windows explorer
             Restart (this activates the path)
             close 
             If you have UE open, you need to close and restart for 
             for the path to be active. 
 
          f  check the environment variable,
             open a DOS command window (cmd.exe)
             enter
             echo %ALTAIRSLC_CONFIG%
             You should see
             C:\wpscfg\altairslc_local.cfg
             
      2. Create a path enviroment variable

          a. In the Windows 11 search box, type
             type 'environment variables'

          b. Select 'edit environment variables'

          c. Select 'Environment variables'
          
          d. Click on 'Path' in System variables
             Edit environment variable> New
             add
             C:\Program Files\Altair\SLC\2026\bin
             ok>apply
             
          Open Task Manager (Ctrl+Alt+Delete)
             Type Ctrl to freeze Task Manager
             find 'windows explorer' 
             Right-click on Windows Explorer
             Restart (this activates the path)
             close 
             If you have UE open, you need to close and restart it 
             for the path to be active. 
                         
       3 Create folder structures (these form a sandbox)

          a  c:/slc/
              current.sas for frozen left panel in UltraEdit
              current.log for frozen center panel in UltraEdit
              current.lst for frozen right panel in UltraEdit

          b  c:/wpsoto    for autocall macros

          c  c:/wpscfg for config file

          d  d:/wpswrk for temporary work directory

          e  d:/wpswrkx for permanent work directory

       4  Key files

          a  COPY C:\Program Files\Altair\SLC\2026\altairslc.cfg
             To
             C:\wpscfg\altairslc_local.cfg

          b  Edt C:\wpscfg\altairslc_local.cfg user config file given by the environment variable ALTAIRSLC_CONFIG

            -WORK 'd:\wpswrk'
            -set SASAUTOS ('!wpshome\sasmacro' 'c:/wpsoto')
            -SASAUTOS (SASAUTOS)
            -AUTOEXEC 'c:/wpsoto/autoexec.sas'
            -SASUSER 'd:/wpsusr'

       5  Create c:/wpsoto/autoexec.sas

         a.  autoexec file                                 
           
            data _null_;
              putlog "autexec started" currtime;
            run;
            
            data _null_;
              file print;
              curr_time = put(time(), time8.);
              put    "LIST: "  curr_time;
              putlog "LOG:  "  curr_time;
            run;
            
            options sasautos=("c:/otojnr");
            run;
            
            libname workx "d:\wpswrkx";
            libname sasuser "c:/etc";
              
         b  data _null_;
              putlog "autexec completed" currtime;
            run;      

    II  ULTRAEDIT CONFIGURATION WIN 11 64bit       

        1 Download and install UltraEdit. I installed the free 7-day trial and later purchased a
          $99 yearly subscription.
          If you install the free 7-day trial, you can later activate it using just the license
          key in the verification email.
          https://www.ultraedit.com/catalog-product/ultraedit-sub/
      
        
        2. Make the Windows clipboard your default clipboard in UltraEdit.
          You need the Windows clipboard so you can copy and paste to other applications
         
          File>open
          c:/slc/current.sas
          
          In the ":/slc/current.sas" window
          Ctrl+0 (control zero actives windows clipboard. note ctrl+1-9 activated UE clipboards)
          click on the UE icon (very top on the left)
          click on Close
          
          when you reopen UE to make the chage permanent 
          you'll see C0 in c:/slc/current.sas window
                    
          /**************************/
          /* c:\slc\current.sas     */
          /* ...                    */
          /**************************/ 
          /*  ln1,col1,C0 DOS utf-8 */  At the very bootom of the widow
          /**************************/ 
          
        3 Create SAS DMS window vertical layout  
        
          Open 
          c:/slc/
             current.sas for frozen left panel in UltraEdit
             current.log for frozen center panel in UltraEdit
             current.lst for frozen right panel in UltraEdit
             
          The three files will appear in cascade layout do the following to tile vertically   
          
          advanced>settings>keymapping>tile vertical>commands>tile vertical
          Enter Ctrl+Alt+T into 'press new multi-key'
          Click on the Yellow UE icon and select Close
        
         Now you can convert the cascade into vertical tiles
        
         /**********************************************************************************/
         /*    C:\slc\current.lst     |     c:\slc\current.sas    |    c:\slc\current.log  */
         /*                           |                           |                        */
         /* ..                        |                           |                        */
         /**********************************************************************************/
                                        ln1,col1,C0 DOS utf-8
        
    III.  Run a simple as compatible program program    
        
       1.  Turn line numbers on  
           view>line numbers 
      
           Go to Advanced> ('hammer icon')>user tools>configuration.
           Fill in

           Menu Item Name::
           SLC

           Command Line: (you can add other options)                                                                                                                              
           wps %f -sasautos "c:/otojnr" -log "%p%n.log" -print "%p%n.lst" -work "d:/wpswrk"  -sasuser c:\etc -autoexec c:/otojnr/autoexec.sas                                                                                                                              
                                                                                                                                         
           Working directory:                                                                                                                              
           c:/slc                                                                                                                              
                                                                                                                                         
           If slc is the first tool, then                                                                                                                              
           Menu Item Name 'SLC' is mapped to 'User Tool 1' in advanced > settings (the gear icon)>key mapping                                                                                                                              
           If you add another menu item, it will be mapped to "User Tool 2"                                                                                                                              
                                                                                                                                         
           Go to advanced > settings (the gear icon)  > toolbar/menu > key mappings                                                                                                                              
                                                                                                                                         
           Select 'User Tool 1'                                                                                                                                      
           Ctrl+Alt+J  (in the press new key box to run the jenner CLI)                                                                                                                              
           Click on the Yellow UE icon and select Close                                                                                                                              
           For Jenner analytics use                                                                                                                              
                                                                                                                                         
        2  Run the program    
        
           /**********************************************************************************/ 
           /*    C:\slc\current.lst     |     c:\slc\current.sas    |    c:\slc\current.log  */
           /*                           |                           |                        */
           /*                           |   data tst;               |                        */
           /*                           |     x=2;                  |                        */
           /*                           |   run;                    |                        */
           /*                           |                           |                        */
           /*                           |   proc print data=tst;    |                        */
           /*                           |   run                     |                        */
           /*                           |                           |                        */
           /*                           |                           |                        */
           /*                           |                           |                        */
           /*                           |                           |                        */
           /*                           |                           |                        */
           /*                           |                           |                        */
           /*                           |                           |                        */
           /**********************************************************************************/
          
                                                                                                                                      
           Change focus to c:\slc\current.sas                                                                                                             
                                                                                                                                           
           Ctrl+Alt+J   (runs the program)                                                                                                                  
                                                                                                                                           
       3  Immediate output                                                                                                                
                                                                                                                                           
                                                                                                                        
           /***********************************************************************************************************************/                                                                                             
           /*    C:\slc\current.lst     |     c:\slc\current.sas    |  c:\slc\current.log                                         */                                                                                            
           /*                           |                           |                                                             */                                                                                            
           /*  obs   x                  |   data tst;               |  NOTE: Copyright (c) 2026 Jenner Analytics Ltd ,London      */                                                                            
           /* ----   -                  |     x=2;                  |                                                             */                                                                                            
           /*   1    2                  |   run;                    |   autexec started.                                          */                                   
           /*                           |                           |                                                             */                   
           /*                           |   proc print data=tst;    |   NOTE: Wrote _null_ (0 rows, 0 columns).                   */                                                          
           /*                           |   run                     |   NOTE: DATA elapsed:                                       */                                      
           /*                           |                           |     wall  0.00 seconds                                      */                                                                 
           /*                           |                           |     cpu   0.00 seconds                                      */                                                               
           /*                           |                           |   NOTE: DATA _null_                                         */                                                               
           /*                           |                           |                                                             */                                                               
           /*                           |                           |   LOG:  14:19:29                                            */                                                               
           /*                           |                           |   NOTE: DATA _null_ completed. Output written to FILE PRINT */                                                               
           /*                           |                           |   NOTE: Option SASAUTOS changed to c:/otojnr.               */                                                               
           /*                           |                           |   NOTE: Library WORKX assigned path=d:\wpswrkx.             */                                                               
           /*                           |                           |   NOTE: Library SASUSER assigned path=c:/etc.               */                                                               
           /*                           |                           |   NOTE: DATA _null_                                         */                                                                 
           /*                           |                           |                                                             */                                                           
           /*                           |                           |   autexec completed.                                        */                                                           
           /*                           |                           |                                                             */                                                           
           /*                           |                           |   NOTE: Wrote tst (1 rows, 1 columns).                      */                              
           /*                           |                           |   NOTE: DATA elapsed:                                       */             
           /*                           |                           |     wall  0.00 seconds                                      */
           /*                           |                           |     cpu   0.00 seconds                                      */
           /*                           |                           |   NOTE: PROC PRINT data=tst                                 */
           /*                           |                           |                                                             */
           /*                           |                           |   NOTE: PROC PRINT completed: 1 observations printed        */
           /*                           |                           |                                                             */
           /*                           |                           |                                                             */
           /*                           |                           |                                                             */  
           /***********************************************************************************************************************/                 
    
    
       4  Save  all user customizations
    
          advanced>backup settings>backup>select all>  
          Backup Directory: c:/ver     
          
          Click backup box 
          
          When done 
          
          right-click on yellow UE and close
            
 /*--- end ---*/


 


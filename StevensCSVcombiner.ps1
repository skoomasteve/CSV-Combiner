Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName Microsoft.VisualBasic


write-host "

=================   csv File combiner  =====================


   

Important Notes: 

--  This utility will accept multiple csv files and combine them into one csv 

--  The first file's headings will be kept, all others will be skipped




-  The output file will be written to the same path chosen as the input directory




==================================================================
 

----  MIT LICENSE Copyright 2019 ---  Author:  Steven Soward  |  v1.0

     "



######_______ makes a log of activities:

start-transcript -Path $outputpath\csvlog.txt -Append


$date = Get-Date -Format 'MM-dd-yy hh.mmtt'

#####_________this "add-type" line has to be added ad the beginning of the script to use "messagebox" in regular powershell execution, otherwise the script will only work in ps ise.



Add-Type -AssemblyName PresentationFramework



#--------------------------------------------------------------
#####________ Shows the intro message box:


$userresponse=[System.Windows.MessageBox]::Show('--This utility will import all .CSV files in the chosen directory and combine them into one .CSV file.



 -- Only the column headings of the first file processed will be kept


 
 -Press OK to choose the input directory', 'OBU CSV File Combiner','okcancel')
if ($UserResponse -eq "ok" ) 
{

#Yes activity (script will move on since this is null)

} 

else 

{ 
write-host "cleaning-up temp files and closing"
exit

} 

#--------------------------------------------------------------
########_________________this opens the choose file dialogue: 



    $dest = [System.Windows.Forms.FolderBrowserDialog]::new()
    $dest.ShowDialog()
    
### set the variable for the destination path

$selectedpath = $dest.SelectedPath



#--------------------------------------------------------------
#get-childItem "$selectedpath\*.csv" | foreach {[System.IO.File]::AppendAllText("$selectedpath\combinedCSV-$date.csv", [System.IO.File]::ReadAllText($_.FullName))}

#Import-Csv -Path  (Get-ChildItem -Path $selectedpath -Filter '*.csv').FullName |  Set-Content  -Path "$selectedpath\EmployeeReport.csv"

$includefirstLine = $true

get-childItem "$selectedpath\*.csv" | foreach {
    $csvfile = $_
    $lines = Get-Content $csvfile  
    $outputlines = switch($includefirstline) {
           $true  {$lines}
           $false {$lines | Select -Skip 1}
    }
    $includefirstline = $false
    Add-Content "$selectedpath\CombinedCSV-$date.csv" $outputlines
    }


$userresponseend=[System.Windows.MessageBox]::Show("The .CSV file has been generated and placed in:

 $selectedpath
 ", 'csv File combiner','ok')
if ($UserResponseend -eq "ok")
{
ii $selectedpath
#Yes activity
write-host "cleaning-up temp files and closing"
stop-transcript
exit
} 


stop-transcript
exit

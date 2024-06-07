# CSV-Combiner
A graphical PowerShell Script and executable to combine CSV files.


--Important Notes: 

-  This utility will accept multiple csv files and combine them into one csv 

-  The first file's headings will be kept, all others will be skipped

-  The output file will be written to the same path chosen as the input directory


![image](https://user-images.githubusercontent.com/43890114/139602608-2aaebd69-b8e9-4bc2-b903-de6dc0d16bf2.png)

==================================================================
 
 How to use:
  - run the .exe or .ps1 and choose the path where your files exist
  - notice the new output file in the same directory as the source file
 
 Considerations:
 - the combiner does not delete or modify the source csv files 
 - the content from each source file will be appended to the end of the previous file within a new file
 - the combiner uses the column headings of the first(alphabetical) csv file processed in the directory you pick, so either make sure each file has the same column headings OR place a dash or underscore at the beginning of the filename you'd like to use as the heading authority. 
 _--Because of this behaviour, the file can also be used as a tool to apply headings to multiple heading-less .csv files._
 



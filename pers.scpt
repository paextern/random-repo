-- AppleScript to create a different set of folders & files on the Desktop depending on persona choice

-- Step 1: Prompt user to choose a persona
set personaList to {"Creative Professional", "Corporate Professional", "Student / Researcher"}
set chosenPersona to (choose from list personaList with prompt "Which persona do you want to simulate on this Mac Desktop?") as text

if chosenPersona is "Creative Professional" then
    set folderNames to {"Client_Projects", "Video_Editing", "Moodboards"}
    set fileNames to {"BrandGuidelines_v2.pdf", "LogoConcepts.ai", "ClientA_Promo_Clip.mp4", "Storyboard_Sketches.psd", "Portfolio_2025_InProgress.indd"}

else if chosenPersona is "Corporate Professional" then
    set folderNames to {"Finance", "Q1_Reports", "Client_Contracts"}
    set fileNames to {"Meeting_Notes_Jan.docx", "Quarterly_Budget.xlsx", "ClientProposal_ABC.pdf", "Team_Roster_2025.xlsx", "Monthly_Sales_Update.pptx"}

else if chosenPersona is "Student / Researcher" then
    set folderNames to {"Assignments", "Research_Papers", "Lecture_Notes", "Thesis_Work"}
    set fileNames to {"LectureNotes_2025-01-15.pdf", "ResearchBibliography.bib", "Thesis_Outline.docx", "Lab_DataAnalysis.xlsx", "ProjectPresentation.pptx"}

else
    display dialog "No persona selected. Exiting." buttons {"OK"} default button 1
    return
end if

tell application "Finder"
    set desktopFolder to path to desktop folder
    
    -- Step 2: Create the persona-specific folders on the Desktop
    repeat with fName in folderNames
        if not (exists folder fName of desktopFolder) then
            make new folder at desktopFolder with properties {name:fName}
        end if
    end repeat
    
    -- Step 3: Create typical files for that persona on the Desktop
    repeat with docName in fileNames
        -- We'll just create empty files using 'touch'
        do shell script "touch " & quoted form of (POSIX path of desktopFolder) & docName
    end repeat
end tell

display dialog ("Done! You are now simulating the " & chosenPersona & " persona on your Desktop.") buttons {"OK"} default button 1

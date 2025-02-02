-- AppleScript to create more folders & files for three different personas
-- Each persona has at least 6 folders and 18 files on the Desktop.

-- 1) Choose Persona
set personaList to {"Creative Professional", "Corporate Professional", "Student / Researcher"}
set chosenPersona to (choose from list personaList with prompt "Which persona do you want to simulate?") as text

-- 2) Define folders and files for each persona
if chosenPersona is "Creative Professional" then
    set folderNames to {"Client_Projects", "Video_Editing", "Moodboards", "Photography", "Social_Media_Assets", "BrandAssets"}
    set fileNames to {¬
        "BrandGuidelines_v3.pdf", ¬
        "LogoConcepts.ai", ¬
        "Storyboard_Sketches_v2.psd", ¬
        "Portfolio_2025_vFinal.indd", ¬
        "ClientA_Promo_Clip.mp4", ¬
        "SocialCampaign_Post1.jpg", ¬
        "SocialCampaign_Post2.jpg", ¬
        "Moodboard_Colors.jpg", ¬
        "Moodboard_Texture.png", ¬
        "Photography_Showcase1.jpg", ¬
        "Photography_Showcase2.jpg", ¬
        "Animated_Intro.mov", ¬
        "ColorPalette_Final.ase", ¬
        "InspirationQuotes.txt", ¬
        "Artwork_Collage1.psd", ¬
        "MotionGraphics_Test.aep", ¬
        "BrandingProposal_ClientB.pdf", ¬
        "EditingWorkflow_Checklist.md" ¬
    }

else if chosenPersona is "Corporate Professional" then
    set folderNames to {"Finance", "Q1_Reports", "Client_Contracts", "HR_Documents", "Marketing", "Operations"}
    set fileNames to {¬
        "Meeting_Notes_Jan.docx", ¬
        "Meeting_Notes_Feb.docx", ¬
        "Meeting_Notes_Mar.docx", ¬
        "Quarterly_Budget.xlsx", ¬
        "Annual_Budget_Projection.xlsx", ¬
        "ClientProposal_ABC.pdf", ¬
        "Team_Roster_2025.xlsx", ¬
        "Monthly_Sales_Update.pptx", ¬
        "Strategy_Plan_2025.pptx", ¬
        "Employee_Handbook.pdf", ¬
        "HR_Policies_Update.docx", ¬
        "Performance_Review_Template.docx", ¬
        "Contract_Template.docx", ¬
        "NonDisclosureAgreement_ClientZ.pdf", ¬
        "Marketing_Calendar.xlsx", ¬
        "Competitive_Analysis_Q1.pdf", ¬
        "Product_Pricing_Model.xlsx", ¬
        "Sales_Call_Script.docx" ¬
    }

else if chosenPersona is "Student / Researcher" then
    set folderNames to {"Assignments", "Research_Papers", "Lecture_Notes", "Thesis_Work", "Lab_Results", "Group_Projects"}
    set fileNames to {¬
        "LectureNotes_2025-01-15.pdf", ¬
        "LectureNotes_2025-01-22.pdf", ¬
        "LectureNotes_2025-01-29.pdf", ¬
        "ResearchBibliography.bib", ¬
        "Thesis_Outline.docx", ¬
        "Lab_DataAnalysis.xlsx", ¬
        "ProjectPresentation.pptx", ¬
        "LiteratureReviewDraft.docx", ¬
        "Experiment_Results2025.csv", ¬
        "Abstract_Submission.pdf", ¬
        "Thesis_Proposal_Chapter1.docx", ¬
        "Thesis_Proposal_Chapter2.docx", ¬
        "CourseSyllabus_Spring2025.pdf", ¬
        "PeerReviewComments.docx", ¬
        "Study_Guide_FinalExam.pdf", ¬
        "Collaboration_Notes_GroupB.md", ¬
        "BookReview_MachineLearning.docx", ¬
        "SPSS_DataSet2025.sav" ¬
    }

else
    display dialog "No persona selected. Exiting." buttons {"OK"} default button 1
    return
end if

-- 3) Create folders and files on Desktop
tell application "Finder"
    set desktopFolder to path to desktop folder
    
    -- Create the persona-specific folders
    repeat with fName in folderNames
        if not (exists folder fName of desktopFolder) then
            make new folder at desktopFolder with properties {name:fName}
        end if
    end repeat
    
    -- Create files (0-byte placeholders)
    repeat with docName in fileNames
        do shell script "touch " & quoted form of (POSIX path of desktopFolder) & docName
    end repeat
end tell

-- 4) Confirmation
display dialog ("Done! You are now simulating the " & chosenPersona & " persona with folders and files on your Desktop.") buttons {"OK"} default button 1

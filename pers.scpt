-- AppleScript to create folders & files for three distinct personas on the Desktop.
-- Each persona has at least 6 folders and 18 files.

-- 1) Ask which persona to simulate
set personaList to {"Music Producer", "Freelance Web Developer", "Digital Marketer"}
set chosenPersona to (choose from list personaList with prompt "Which persona do you want to simulate on your Desktop?") as text

-- 2) Define the folders and files for each persona
if chosenPersona is "Music Producer" then
    
    set folderNames to {"Projects", "Samples", "Mixdowns", "Collaborations", "Mastered_Tracks", "Promos"}
    set fileNames to {¬
        "Beat_Concept1.wav", ¬
        "Beat_Concept2.wav", ¬
        "FinalMix_TrackA.mp3", ¬
        "Guitar_RiffV1.aif", ¬
        "Vocal_Recording_SingerA.wav", ¬
        "Vocal_Recording_SingerB.wav", ¬
        "MasteredSong_EP1.mp3", ¬
        "MasteredSong_EP2.mp3", ¬
        "Collab_ProducerX_SongDraft.flp", ¬
        "Collab_ProducerX_SongDraft2.flp", ¬
        "DrumLoopKit.zip", ¬
        "Bassline_Tracks.mid", ¬
        "PromoSnippet1.mp4", ¬
        "PromoSnippet2.mp4", ¬
        "LyricSheet_TrackA.txt", ¬
        "LyricSheet_TrackB.txt", ¬
        "Contract_Studio2025.pdf", ¬
        "ReleasePlan_Single2025.docx" ¬
    }

else if chosenPersona is "Freelance Web Developer" then
    
    set folderNames to {"Clients", "Templates", "Assets", "Deployments", "Documentation", "Testing"}
    set fileNames to {¬
        "index_homepage.html", ¬
        "contact_us.html", ¬
        "style_global.css", ¬
        "style_theme_dark.css", ¬
        "script_main.js", ¬
        "script_validation.js", ¬
        "client_A_wireframe.pdf", ¬
        "client_B_siteplan.docx", ¬
        "landing_page_template.html", ¬
        "react_app_build.zip", ¬
        "deployment_notes_prod.txt", ¬
        "testing_log_jan2025.xlsx", ¬
        "api_documentation_endpoints.md", ¬
        "security_audit_report.pdf", ¬
        "favicon_assets.zip", ¬
        "package.json", ¬
        "readme_projectA.md", ¬
        "dev_operations_checklist.xlsx" ¬
    }

else if chosenPersona is "Digital Marketer" then
    
    set folderNames to {"Campaigns", "Analytics", "ContentCalendar", "SocialMedia", "EmailMarketing", "SEO"}
    set fileNames to {¬
        "CampaignPlan_Q1_2025.docx", ¬
        "CampaignBudget_Q1_2025.xlsx", ¬
        "AnalyticsReport_Jan2025.pdf", ¬
        "CustomerPersonaGuides.pdf", ¬
        "ContentCalendar_Feb2025.xlsx", ¬
        "SocialMediaPosts_Feb2025.docx", ¬
        "AdCreative_Instagram.png", ¬
        "AdCreative_Facebook.png", ¬
        "Newsletter_Template.html", ¬
        "EmailCampaign_Feb2025.csv", ¬
        "Keyword_Research_2025.xlsx", ¬
        "SEO_Audit_ClientX.pdf", ¬
        "SEO_BacklinksReport.csv", ¬
        "Website_TrafficAnalysis.pptx", ¬
        "MarketingPitch_Deck.pdf", ¬
        "CompetitorAnalysis_Jan2025.docx", ¬
        "Influencer_Collaboration_Plan.xlsx", ¬
        "WeeklyTracking_Sheet.docx" ¬
    }

else
    display dialog "No persona selected. Exiting." buttons {"OK"} default button 1
    return
end if

-- 3) Create the folders and files on the Desktop
tell application "Finder"
    set desktopFolder to path to desktop folder
    
    -- Create persona-specific folders
    repeat with folderName in folderNames
        if not (exists folder folderName of desktopFolder) then
            make new folder at desktopFolder with properties {name:folderName}
        end if
    end repeat
    
    -- Create 0-byte placeholder files on the Desktop
    repeat with thisFile in fileNames
        do shell script "touch " & quoted form of (POSIX path of desktopFolder) & thisFile
    end repeat
end tell

-- 4) Confirmation dialog
display dialog ("Done! You are now simulating the " & chosenPersona & " persona with new folders and files on your Desktop.") buttons {"OK"} default button 1

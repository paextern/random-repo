-- AppleScript to create folders/files and place them at random positions on Desktop
tell application "Finder"
    set desktopFolder to (path to desktop folder) as alias
    
    -- Turn off any auto-arrange or sort in Finder (only sets local preference; user might still need to adjust in Finder's "View" menu)
    set currentView to icon view options of desktop
    set arrangement of currentView to not arranged
    
    -- 1) Create 8 folders if they don't exist
    set folderNames to {"Reports", "Invoices", "Contracts", "Projects", "Archive", "HR", "Marketing", "Finance"}
    repeat with folderName in folderNames
        if not (exists folder folderName of desktopFolder) then
            make new folder at desktopFolder with properties {name:folderName}
        end if
    end repeat
    
    -- 2) Create 30 files (with multiple extensions)
    set fileNames to {"financial_summary", "project_plan", "marketing_overview", "annual_report", "invoice_jan", ¬
        "invoice_feb", "invoice_mar", "performance_metrics", "team_roster", "client_proposal", ¬
        "sales_forecast", "contract_template", "cost_analysis", "budget_overview", "design_spec", ¬
        "brand_guidelines", "user_research", "quarterly_review", "supplier_agreement", "stakeholder_feedback", ¬
        "strategy_outline", "competitor_analysis", "press_release", "content_calendar", "recruitment_plan", ¬
        "policy_update", "meeting_notes", "invoice_apr", "invoice_may", "final_presentation"}
    
    -- We'll cycle through docx, xlsx, pdf for variety
    set fileExtensions to {"docx", "xlsx", "pdf"}
    set extCount to (count of fileExtensions)
    
    repeat with i from 1 to (count of fileNames)
        set thisName to item i of fileNames
        set thisExt to item ((i mod extCount) + 1) of fileExtensions
        -- Create an empty file via shell
        do shell script "touch " & quoted form of (POSIX path of desktopFolder) & thisName & "." & thisExt
        
        -- Reference that newly created file as a Finder item
        set newFilePath to (desktopFolder as text) & thisName & "." & thisExt
        set newFile to alias newFilePath
        
        -- Set a random position (X, Y); adjust range to fit your screen
        set randomX to (random number from 100 to 1000)
        set randomY to (random number from 100 to 600)
        set position of item newFile to {randomX, randomY}
    end repeat
end tell

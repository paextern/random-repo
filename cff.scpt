tell application "Finder"
    set desktopFolder to path to desktop folder
    
    -- 1) Create 8 folders if they don't exist
    set folderNames to {"Reports", "Invoices", "Contracts", "Projects", "Archive", "HR", "Marketing", "Finance"}
    repeat with folderName in folderNames
        if not (exists folder folderName of desktopFolder) then
            make new folder at desktopFolder with properties {name:folderName}
        end if
    end repeat
    
    -- 2) Create 30 empty files with multiple extensions
    set fileNames to {"financial_summary", "project_plan", "marketing_overview", "annual_report", "invoice_jan", ¬
        "invoice_feb", "invoice_mar", "performance_metrics", "team_roster", "client_proposal", ¬
        "sales_forecast", "contract_template", "cost_analysis", "budget_overview", "design_spec", ¬
        "brand_guidelines", "user_research", "quarterly_review", "supplier_agreement", "stakeholder_feedback", ¬
        "strategy_outline", "competitor_analysis", "press_release", "content_calendar", "recruitment_plan", ¬
        "policy_update", "meeting_notes", "invoice_apr", "invoice_may", "final_presentation"}
        
    -- We'll cycle through docx, xlsx, pdf for variety
    set fileExtensions to {"docx", "xlsx", "pdf"}
    set extCount to count of fileExtensions
    
    repeat with i from 1 to count of fileNames
        set thisName to item i of fileNames
        set thisExt to item ((i mod extCount) + 1) of fileExtensions
        do shell script "touch " & quoted form of (POSIX path of desktopFolder) & thisName & "." & thisExt
    end repeat
end tell

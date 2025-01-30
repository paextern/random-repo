tell application "Finder"
    set desktopFolder to path to desktop folder
    
    -- 1) Create 8 folders (replace or rename as you like)
    set folderNames to {"Movies", "Manga", "Trailers", "Anime", "Archive", "Projects", "Graphics", "Downloads"}
    repeat with folderName in folderNames
        if not (exists folder folderName of desktopFolder) then
            make new folder at desktopFolder with properties {name:folderName}
        end if
    end repeat
    
    -- 2) Create 30 files with MP4, MKV, and PDF extensions
    --    We’ll cycle through mp4 -> mkv -> pdf (in that order).
    set fileNames to {¬
        "AzureSky_Episode1", "AzureSky_Episode2", "SpaceOdyssey_Trailer", ¬
        "FallenKingdom_Chapter1", "FallenKingdom_Chapter2", "PirateKing_Chapter10", ¬
        "PirateKing_Chapter11", "CityOfGlass_OfficialClip", "BeyondTheSea_Recap", ¬
        "DragonSword_Vol1", "DragonSword_Vol2", "DragonSword_Vol3", ¬
        "DragonSword_Vol4", "DragonSword_Vol5", "GalacticRiders_Preview", ¬
        "Moonlight_SpecialEdition", "CyberNinja_Vol7", "MythicBeasts_Vol8", ¬
        "SilentEcho_Teaser", "ParallelWorld_BehindScenes", "RedHorizon_SpecialClip", ¬
        "AdventuresInTime_Ep4", "MysticTales_Vol9", "KingdomHearts_Chapter2", ¬
        "WanderingSoul_Series1", "TempestBlade_Vol3", "Documentary_Wildlife", ¬
        "RetroCartoon_Special", "StarSamurai_Vol5", "DragonQuest_Vol1"}
    
    -- These three extensions will be cycled through in order
    set fileExtensions to {"mp4", "mkv", "pdf"}
    set extCount to count of fileExtensions
    
    -- Creates 30 empty files on the Desktop
    repeat with i from 1 to count of fileNames
        set baseName to item i of fileNames
        set thisExt to item ((i mod extCount) + 1) of fileExtensions
        
        -- Use 'touch' to create a 0-byte file
        do shell script "touch " & quoted form of (POSIX path of desktopFolder) & baseName & "." & thisExt
    end repeat
end tell

set cliclickPath to "/opt/homebrew/bin/cliclick" -- Make sure this is correct
set fileNames to {"RandomFile1.txt", "RandomFile2.txt", "RandomFile3.txt"}
set desktopPath to POSIX path of (path to desktop)

-- Function to generate random screen coordinates (adjust based on screen size)
on randomCoordinate(minX, maxX, minY, maxY)
	set randX to (random number from minX to maxX)
	set randY to (random number from minY to maxY)
	return {randX, randY}
end randomCoordinate

-- Create three files on the Desktop
repeat with fileName in fileNames
	set filePath to desktopPath & "/" & fileName
	do shell script "echo 'This is a test file' > " & quoted form of filePath
end repeat

delay 1 -- Allow Finder to refresh

-- Move each file randomly
repeat with fileName in fileNames
	tell application "Finder"
		activate
		delay 1
		select file fileName of desktop
	end tell
	
	-- Generate random position
	set {randX, randY} to randomCoordinate(100, 1200, 200, 700)
	
	-- Simulate click, drag, and drop using cliclick
	do shell script cliclickPath & " dd:500,500"
	delay 0.2
	do shell script cliclickPath & " m:" & randX & "," & randY
	delay 0.2
	do shell script cliclickPath & " du:" & randX & "," & randY
	delay 0.5
end repeat

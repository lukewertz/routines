set D to display dialog "Good morning, Luke. Start off clean today?" buttons {"Yep", "Nope"} default button "Yep"

# Start the morning off clean, yo!
if (button returned of D) is "Yep" then
	# Exclude Finder and Terminal for ... reasons!
	set excludedApps to {"Finder"}
	
	tell application "System Events"
		set appNames to get name of (processes where background only is false)
	end tell
	
	repeat with appName in appNames
		if appName is not in excludedApps then
			try
				tell application appName to quit saving no
			on error error_message number error_number
				if error_number is equal to -128 then
					--Keep Calm and Carry On
				else
					display dialog error_message
				end if
				delay 2
			end try
		end if
	end repeat
end if

delay 0.5

# Launch Todoist with a countdown. Focus is important.
tell application "Todoist"
	activate
	delay 3
	tell application "System Events" to tell process "Todoist"
		keystroke "m" using {command down, shift down}
	end tell
end tell

set countdown to 60
display dialog "Take a minute to focus on your top tasks for the day." giving up after countdown

# Launch Chrome ... le sigh.
do shell script "open -n -a 'Google Chrome' --args --profile-directory='Profile 1' https://calendar.google.com https://palantiri.harvestapp.com/time https://drive.google.com/drive/"

# Launch Mail
tell application "Mail"
	activate
end tell

# Launch Fantastical
tell application "Fantastical 2"
	activate
	delay 3
	tell application "System Events" to tell process "Fantastical 2"
		keystroke "m" using {command down, shift down}
	end tell
end tell

# Nextiva in case someone tries to ... call me?
tell application "Nextiva App"
	activate
end tell

# Do I have to?
tell application "Slack"
	launch
	delay 8
	tell application "System Events" to tell process "Slack"
		keystroke "m" using {shift down}
	end tell
end tell
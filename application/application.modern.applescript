on run {input, parameters}
  tell application "Finder"
    set dir_path to quoted form of (POSIX path of (folder of the front window as alias))
  end tell
  CD_to(dir_path)
  tell application "iTerm" to activate
end run

on CD_to(theDir)
	if not application "iTerm" is running then
		tell application "iTerm"
			set newWindow to current window
			tell newWindow
				set sesh to current session
			end tell
			tell sesh
				write text "cd " & theDir & ";clear"
			end tell
		end tell
	else
		tell application "iTerm"
			try
				set newWindow to current window
				tell newWindow
					create tab with default profile
					set sesh to current session
				end tell
			on error
				set newWindow to (create window with default profile)
				tell newWindow
					set sesh to current session
				end tell
			end try
			tell sesh
				write text "cd " & theDir & ";clear"
			end tell
		end tell
	end if
end CD_to

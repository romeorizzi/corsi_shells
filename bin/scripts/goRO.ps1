# Launch Google Chrome with specified URLs
Start-Process "chrome.exe" -ArgumentList "--new-window","https://univr.zoom.us/j/87547655553"
Start-Process "chrome.exe" -ArgumentList "https://rizzi.olinfo.it/ro"
Start-Process "chrome.exe" -ArgumentList "https://wbo.ophir.dev/boards/LavagnaRO"
Start-Process "chrome.exe" -ArgumentList "https://etherpad.wikimedia.org/p/RicercaOperativa"
Start-Process "chrome.exe" -ArgumentList "https://etherpad.wikimedia.org/p/RicercaOperativa$((Get-Date).ToString('yyyy-MM-dd'))"
Start-Process "chrome.exe" -ArgumentList "https://repl.it/@RomeoRizziUniVR/ro"

# Display URLs
Write-Host "Zoom Room RO URL: https://univr.zoom.us/j/87547655553"
Write-Host "CMS RO URL: https://rizzi.olinfo.it/ro"
Write-Host "Collaborative WhiteBoard(easy) RO URL: https://wbo.ophir.dev/boards/LavagnaRO"
Write-Host "Collaborative etherpad RO URL: https://etherpad.wikimedia.org/p/RicercaOperativa$((Get-Date).ToString('yyyy-MM-dd'))"
Write-Host "Etherpad RO index URL: https://etherpad.wikimedia.org/p/RicercaOperativa"
Write-Host "replit ro URL: https://repl.it/@RomeoRizziUniVR/ro"

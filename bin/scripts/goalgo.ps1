# Launch Google Chrome with specified URLs
Start-Process "chrome.exe" -ArgumentList "--new-window","https://univr.zoom.us/j/85817283103"
Start-Process "chrome.exe" -ArgumentList "https://rizzi.olinfo.it/algo"
Start-Process "chrome.exe" -ArgumentList "https://wbo.ophir.dev/boards/LavagnaALGO"
Start-Process "chrome.exe" -ArgumentList "https://etherpad.wikimedia.org/p/Algoritmi"
Start-Process "chrome.exe" -ArgumentList "https://etherpad.wikimedia.org/p/Algoritmi$((Get-Date).ToString('yyyy-MM-dd'))"
Start-Process "chrome.exe" -ArgumentList "https://repl.it/@RomeoRizziUniVR/algo"

# Display URLs
Write-Host "Zoom Room ALGO URL: https://univr.zoom.us/j/85817283103"
Write-Host "CMS algo URL: https://rizzi.olinfo.it/algo"
Write-Host "Collaborative WhiteBoard(easy) DODO URL: https://wbo.ophir.dev/boards/LavagnaALGO"
Write-Host "Collaborative etherpad Algoritmi URL: https://etherpad.wikimedia.org/p/Algoritmi$((Get-Date).ToString('yyyy-MM-dd'))"
Write-Host "Etherpad RO index URL: https://etherpad.wikimedia.org/p/Algoritmi"
Write-Host "replit algo URL: https://repl.it/@RomeoRizziUniVR/algo"

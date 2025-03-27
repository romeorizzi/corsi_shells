# Launch Google Chrome with specified URLs
Start-Process "chrome.exe" -ArgumentList "--new-window","https://univr.zoom.us/j/87547655553"
Start-Process "chrome.exe" -ArgumentList "https://wbo.ophir.dev/boards/LavagnaRO$((Get-Date).ToString('yyyy-MM-dd'))_1"
Start-Process "chrome.exe" -ArgumentList "https://etherpad.wikimedia.org/p/RicercaOperativa$((Get-Date).ToString('yyyy'))_indice_incontri"
Start-Process "chrome.exe" -ArgumentList "https://etherpad.wikimedia.org/p/RicercaOperativa$((Get-Date).ToString('yyyy-MM-dd'))"

# Display URLs
Write-Host "Zoom Room RO URL: https://univr.zoom.us/j/87547655553"
Write-Host "CMS RO URL: https://rizzi.olinfo.it/ro"
Write-Host "Collaborative WhiteBoard(easy) URL: https://wbo.ophir.dev/boards/LavagnaRO$((Get-Date).ToString('yyyy-MM-dd'))_1"
Write-Host "Collaborative etherpad URL: https://etherpad.wikimedia.org/p/RicercaOperativa$((Get-Date).ToString('yyyy-MM-dd'))"

# Launch Google Chrome with specified URLs
Start-Process "chrome.exe" -ArgumentList "--new-window","https://univr.zoom.us/j/89889727405"
Start-Process "chrome.exe" -ArgumentList "https://wbo.ophir.dev/boards/LavagnaDODO$((Get-Date).ToString('yyyy-MM-dd'))_1"
Start-Process "chrome.exe" -ArgumentList "https://etherpad.wikimedia.org/p/DiscreteOptimization$((Get-Date).ToString('yyyy'))_indice_incontri"
Start-Process "chrome.exe" -ArgumentList "https://etherpad.wikimedia.org/p/DiscreteOptimization$((Get-Date).ToString('yyyy-MM-dd'))"

# Display URLs
Write-Host "Zoom Room DODO URL: https://univr.zoom.us/j/89889727405"
Write-Host "Collaborative WhiteBoard(easy) URL: https://wbo.ophir.dev/boards/LavagnaDODO$((Get-Date).ToString('yyyy-MM-dd'))_1"
Write-Host "Collaborative etherpad URL: https://etherpad.wikimedia.org/p/DiscreteOptimization$((Get-Date).ToString('yyyy-MM-dd'))"

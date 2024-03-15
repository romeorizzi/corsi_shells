# Launch Google Chrome with specified URLs
Start-Process "chrome.exe" -ArgumentList "--new-window","https://univr.zoom.us/j/8988972740"
Start-Process "chrome.exe" -ArgumentList "https://wbo.ophir.dev/boards/LavagnaDODO"
Start-Process "chrome.exe" -ArgumentList "https://etherpad.wikimedia.org/p/DiscreteOptimization"
Start-Process "chrome.exe" -ArgumentList "https://etherpad.wikimedia.org/p/DiscreteOptimization$((Get-Date).ToString('yyyyMMdd'))"

# Display URLs
Write-Host "Zoom Room DODO URL: https://univr.zoom.us/j/8988972740"
Write-Host "Collaborative WhiteBoard(easy) DODO URL: https://wbo.ophir.dev/boards/LavagnaDODO"
Write-Host "Collaborative etherpad DiscreteOptimization URL: https://etherpad.wikimedia.org/p/DiscreteOptimization$((Get-Date).ToString('yyyyMMdd'))"
Write-Host "Etherpad DODO index URL: https://etherpad.wikimedia.org/p/DiscreteOptimization"

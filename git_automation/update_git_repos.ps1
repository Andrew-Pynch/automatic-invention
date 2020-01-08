#cd users\apynch\Documents\Github
Get-ChildItem -Recurse -Depth 2 -Force | 
 Where-Object { $_.Mode -match "h" -and $_.FullName -like "*\.git" } |
 ForEach-Object {
    Write-Host $_.FullName
    cd $_.FullName
    cd ../
    git pull
    cd ../
 }

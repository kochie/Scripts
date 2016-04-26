Foreach ($folder in Get-ChildItem -Directory){
  Write-Host($folder.name)
  Foreach ($file in Get-ChildItem -File $folder){
    Rename-Item ($folder.name + '\' + $file) ($folder.name + ' - ' + $file.name)
    Move-Item ($folder.name + '\' + $file.name) '.\'
  }
}

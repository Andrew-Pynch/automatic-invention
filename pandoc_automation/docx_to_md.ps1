Get-ChildItem -Recurse -Filter *.docx | ForEach-Object {
  pandoc -o ($_.FullName + '.md') $_.FullName
}
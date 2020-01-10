:: pandoc-docx-md.bat
::
:: Don't show these commands to the user
@ECHO off
:: Set the title of the window
TITLE Convert docx to markdown with Pandoc
:: Select file marker
:selectfile
:: Clear any preexisting filename variables
SET filename=
:: Ask which file we're converting.
SET /p filename=Which file? (Don't include the .docx file extension): 
:: Feedback
ECHO Running pandoc...
:: Run pandoc
CALL pandoc -f docx -t markdown_mmd "%filename%".docx --output="%filename%".md --atx-headers --wrap=none --toc --extract-media=""
:: Feedback
ECHO Done. Ready for another file.
:: Let the user easily run that again
SET repeat=
SET /p repeat=Hit enter to convert another file, or any other key and enter to stop. 
IF "%repeat%"=="" GOTO selectfile
:: Otherwise end
:end
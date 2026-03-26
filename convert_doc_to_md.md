
Pandoc Docs: https://pandoc.org/MANUAL.html  
Helpful Tutorial: https://medium.com/geekculture/how-to-easily-convert-word-to-markdown-with-pandoc-4d60878ccc64

<br />

Install with choco:
```powershell
choco install pandoc
```

<br />

Convert a file:
```powershell
pandoc -f docx -t markdown "word_filename.docx" -o "markdown_filename.md"
 ```

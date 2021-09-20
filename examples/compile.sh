# compile one time with school options
pandoc document.md -t latex --template ../albatross.tex -o school.tex --metadata-file ../school.yaml --biblatex
xelatex school.tex
biber school
xelatex school.tex
xelatex school.tex

# the other time without them
pandoc document.md -t latex --template ../albatross.tex -o output.tex --biblatex
xelatex output.tex
biber output
xelatex output.tex
xelatex output.tex
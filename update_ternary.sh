#! /bin/sh

cd /home/joona/joonalohtander.github.io

Rscript ternary.R

mv ternary.png ./norssi/

git add .

if git diff --cached --quiet; then
	echo "No changes to commit."
else
	git commit -m "Autoupdate ternary"
	git push
fi



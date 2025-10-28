#! /bin/sh

cd /home/joona/joonalohtander.github.io

Rscript ternary.R

mv ternary.png ./norssi/

git add .

git commit -m "Autoupdate ternary"

git push



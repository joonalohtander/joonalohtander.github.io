#! /bin/sh

cd /var/www/joonalohtander.github.io

Rscript ternary.R

mv ternary.png ./sttp/

git add .

git commit -m "Autoupdate ternary"

git push


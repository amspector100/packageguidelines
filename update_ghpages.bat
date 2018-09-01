REM Make sure we're on master branch
git checkout master

REM commit and push
git add .
git commit
git push origin master

REM Update pages
Rscript build_bookdown.R

REM switch branches and pull the data we want
git checkout gh-pages
git rm *.html -rf
git rm *.json -rf
git rm template.gitignore
git rm .\Images\* -rf 
git rm .\libs\* -rf 

REM Move it to the root and remove the docs directory
git checkout master _book
call xcopy .\_book .\ /E
git rm .\_book\* -rf

REM Add and push
git add .
git commit
git push origin gh-pages

REM Switch back to master
git checkout master
echo "# create" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin git@github.com:czylabsonasa/${1}.git
git push -u origin master
…or create a new repository on the command line
echo "# rmsrice" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin git@github.com:shourovrm/rmsrice.git
git push -u origin main
…or push an existing repository from the command line
git remote add origin git@github.com:shourovrm/rmsrice.git
git branch -M main (or master)
git push -u origin main (master)

PAT: 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

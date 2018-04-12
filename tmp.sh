# NOTE: Ctrl + enter sends to terminal (not console) because this is a .sh file.

# TODO: To ignore this file, run this in the R console 
# usethis::use_build_ignore("tmp.sh")
# usethis::use_git_ignore("tmp.sh")

# General
git status
git add .
git commit -a -m "Commit message"
git pull
git push

git remote prune origin
git commit --amend -m "Add instructions"

# master
git checkout master
git merge master

# dev
git checkout dev
git merge dev
git branch -d dev
git push --delete dev


# FEATURE
git checkout FEATURE
git merge FEATURE
git branch -d FEATURE
git push origin --delete FEATURE

# DANGER ZONE
git push --force FEATURE

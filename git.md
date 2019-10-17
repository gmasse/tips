GIT tips

## Reset master branch to upstream version

```
# ensures current branch is master
git checkout master

# pulls all new commits made to upstream/master
git pull upstream master

# this will delete all your local changes to master
git reset --hard upstream/master

# take care, this will delete all your changes on your forked master
git push origin master --force
```
[Ref: https://stackoverflow.com/questions/42332769/how-do-i-reset-the-git-master-branch-to-the-upstream-branch-in-a-forked-reposito]

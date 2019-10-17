# GIT tips

## Adding an upstream repository
```
git remote add upstream https://github.com/ORIGINAL_OWNER/ORIGINAL_REPOSITORY.git
```
([reference](https://help.github.com/en/articles/configuring-a-remote-for-a-fork))

## Syncing a fork
```
git fetch upstream
git checkout master
git merge upstream/master
```
([reference](https://help.github.com/en/articles/syncing-a-fork))

## Reset master branch to upstream version
```
git checkout master
git pull upstream master
git reset --hard upstream/master
git push origin master --force
```
([reference](https://stackoverflow.com/questions/42332769/how-do-i-reset-the-git-master-branch-to-the-upstream-branch-in-a-forked-reposito))

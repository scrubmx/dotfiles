#!/bin/sh
# Sync a local fork of the laravel/framework repository

# Change the output color to green
# http://misc.flogisoft.com/bash/tip_colors_and_formatting#colors
function _print_status() {
    printf "\e[32m> %s\e[0m\n" "$@"
}

# Specify remote upstream repository that will be synced with the fork.
if ! git config remote.upstream.url > /dev/null; then
    git remote add upstream git@github.com:laravel/framework.git
fi

_print_status "Fetching the upstream remote branches..."

# Fetch the branches and their respective commits from the upstream repository.
git fetch upstream

_print_status "Syncing local branches with upstream..."

# Sync master branch with the upstream repository
git checkout master
git merge upstream/master
git push origin master

# Sync 5.2 branch with the upstream repository
git checkout 5.2
git merge upstream/5.2
git push origin 5.2

# Sync 5.1 branch with the upstream repository
git checkout 5.1
git merge upstream/5.1
git push origin 5.1

_print_status "Your fork is now up to date!"

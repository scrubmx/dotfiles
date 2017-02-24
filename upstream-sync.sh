#!/bin/sh
# Sync fork repository with upstream

UPSTREAM="laravel/framework"
declare -a BRANCHES=("master" "5.3" "5.4")

# Set color green for status messages.
function _print_status() {
    printf "\e[32m> %s\e[0m\n" "$@"
}

# Specify remote upstream repository that will be synced with the fork.
if ! git config remote.upstream.url > /dev/null; then
    git remote add upstream "git@github.com:$UPSTREAM.git"
fi

_print_status "Fetching the upstream remote branches..."

# Fetch the branches and their respective commits from the upstream repository.
git fetch upstream

_print_status "Syncing local branches with upstream..."

for BRANCH in "${BRANCHES[@]}"; do
    _print_status "Syncing $BRANCH branch..."
    git branch -D $BRANCH
    git checkout upstream/$BRANCH
    git checkout -b $BRANCH
    git push -f origin $BRANCH
done

_print_status "Your fork is now up to date!"

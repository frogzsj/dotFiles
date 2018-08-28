alias dev='cd ~/dev'
alias es='elasticsearch && kibana'
alias reset='git reset --hard origin/master'
alias getb64='node ~/dev/test/toBase64.js '

upstr() {
    branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/' | xargs)
    git push --set-upstream origin ${branch}
}

installIt() {
    prevPath=$(pwd)
		cd ~/dev/progressly/node
    yarn install
    cd views
    yarn install
    cd $prevPath
}

testIt() {
    prevPath=$(pwd)
    cd ~/dev/progressly
    yarn test
    cd node
    yarn test
    cd views
    yarn test
    cd $prevPath
}

deleteBranches() {
    git branch | grep -v "master" | xargs git branch -D
}

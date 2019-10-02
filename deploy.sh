#!/bin/sh

getOs()
{
    case "$(uname -s)" in
        Darwin)
            echo 'macos'
            ;;
        Linux)
            echo 'linux'
            ;;
        CYGWIN*|MINGW32*|MSYS*)
            echo 'windows'
            ;;
        *)
            echo 'other'
            ;;
    esac
}

set -e         # -x print all command (to debug), -e exit at any command failure

if [ ! -d "./node_modules" ]; then
    npm install --bin-links
fi

npm run build

cd public/
git add -A

os=$(getOs)
if [ "$os" = "macos" ];
then 
    DATE=$(date -u "+%Y-%m-%dT%H:%M:%S%z"); 
elif [ "$os" = "linux" ];
then
    DATE=$(date -Iseconds);
else
    exit 1
fi;

git commit -m "release $DATE"

if [ -n $GITHUB_TOKEN ] && [ -n $GITHUB_USER ];
then
    git remote set-url origin https://$GITHUB_USER:$GITHUB_TOKEN@github.com/Zenika/handson-testcontainers.git
fi

git push origin HEAD:master

# return to parent repository
cd ../

git submodule sync --recursive
git add ./public/

git commit -m "release public folder"

if [ -n $GITHUB_TOKEN ] && [ -n $GITHUB_USER ];
then
    git remote set-url origin https://$GITHUB_USER:$GITHUB_TOKEN@github.com/RouxAntoine/handson-testcontainers.git
fi

git push origin HEAD:master



IN=$1
IFS='/'; arrIN=($IN); unset IFS;
indexes=${#arrIN[@]}

if [ $indexes \> 1 ];
then
    REPO_NAME=${arrIN[indexes-1]}
    OLD_NAME=${arrIN[indexes-2]}
fi

if [ "$REPO_NAME" = "" ]; then
read -p "Enter Github Repository Name: " REPO_NAME
fi

TOKEN="YOUR_TOKEN"

if [ "$OLD_NAME" = "" ]; then
    read -p "Enter Github Original User Name: " OLD_NAME
fi

curl -H "Authorization: token $TOKEN" -d "{\"name\":\"$REPO_NAME\"}" https://api.github.com/user/repos

NEW_NAME="YOUR_NAME"
NEW_EMAIL="YOUR_EMAIL"

git clone --mirror https://github.com/$OLD_NAME/$REPO_NAME.git $REPO_NAME
cd $REPO_NAME
git remote remove origin
git remote add origin https://github.com/$NEW_NAME/$REPO_NAME.git
 
git filter-branch --env-filter '

NEW_NAME="'"$NEW_NAME"'"
NEW_EMAIL="'"$NEW_EMAIL"'"

if [ "$GIT_COMMITTER_EMAIL" != "$NEW_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$NEW_NAME"
    export GIT_COMMITTER_EMAIL="$NEW_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" != "$NEW_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$NEW_NAME"
    export GIT_AUTHOR_EMAIL="$NEW_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags
 
git push --all
git push --tags

cd ..
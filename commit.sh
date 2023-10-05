AZUREPAT=$AZUREPAT
AZUSERNAME=$AZUSERNAME
AZUSER_EMAIL=$AZUSER_EMAIL
AZORG=$AZORG
git clone https://github.com/dariemcarlosdev/eHandbookApp
cd eHandbookApp
rm -rf .git

cd ..

GIT_CMD_REPOSITORY="https://$AZUSERNAME:$AZUREPAT@dev.azure.com/$AZORG/eHandBook/_git/eHandbookapp"
git clone $GIT_CMD_REPOSITORY

cp -r eHandbookApp/* eHandbookApp/

cd TestGitSync

git config --global user.email "$AZUSER_EMAIL"
git config --global user.name "$AZUSERNAME"

git add .
git commit -m "sync from git to azure"

git push

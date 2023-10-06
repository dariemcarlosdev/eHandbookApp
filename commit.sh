AZUREPAT=$AZUREPAT
AZUSERNAME=$AZUSERNAME
AZUSER_EMAIL=$AZUSER_EMAIL
AZORG=$AZORG

# Remove Git information (for fresh git start)
rm -rf eHandbookApp/.git

# Fetch the changes from Azure DevOps to ensure we have latest
git fetch --unshallow

# Pull changes from Azure DevOps if its exiting branch and have commits on it
git pull https://AZUSERNAME:AZUREPAT@dev.azure.com/AZORG/eHandBook/_git/eHandbookApp.git

#git checkout -b $github_to_azure_sync

# Set Git user identity
git config --global user.email "AZUSER_EMAIL"
git config --global user.name "AZUSERNAME"

# Add all changes into stage, commit, and push to Azure DevOps
git add .
git commit -m "Sync from GitHub to Azure DevOps"
git push --force https://AZUSERNAME:AZUREPAT@dev.azure.com/AZORG/eHandBook/_git/eHandbookApp.git

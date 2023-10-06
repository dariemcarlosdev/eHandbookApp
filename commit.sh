AZUREPAT=$AZUREPAT
AZUSERNAME=$AZUSERNAME
AZUSER_EMAIL=$AZUSER_EMAIL
AZORG=$AZORG

# Remove Git information (for fresh git start)
rm -rf eHandbookApp/.git

# Fetch the changes from Azure DevOps to ensure we have latest
git fetch --unshallow

# Pull changes from Azure DevOps if its exiting branch and have commits on it
git pull https://335286@dadeschools.net:twoy32zpktxakmuyzzvhvcopvfc25w3t7mglbcwuarzomfhdu4fa@dev.azure.com/MDPCS/eHandBook/_git/eHandbookApp.git

#git checkout -b $github_to_azure_sync

# Set Git user identity
git config --global user.email "335286@dadeschools.net"
git config --global user.name "335286@dadeschools.net"

# Add all changes into stage, commit, and push to Azure DevOps
git add .
git commit -m "Sync from GitHub to Azure DevOps"
git push --force https://335286@dadeschools.net:twoy32zpktxakmuyzzvhvcopvfc25w3t7mglbcwuarzomfhdu4fa@dev.azure.com/MDPCS/eHandBook/_git/eHandbookApp.git

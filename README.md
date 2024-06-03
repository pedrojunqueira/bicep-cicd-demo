# bicep cicd demo


## Bicep in a CI-CD


# pre-requisites

1. Azure Subscription. Need admin right to create service principal
2. Github account
3. Install Azure CLI 
4. Install Bicep CLI extension
5. VS code
6. Azure VS code extension
7. Bicep VS code Extention

# Steps

1. Test local enviroment if all is working

login to azure

```bash
az login
```
check the account
```bash
az account show
```
check the version of the azure cli
```bash
az --version
```
check the version of the bicep cli. If not installed it will prompt to install
```bash
az bicep version
```

1. Clone the repository

```bash
git clone https://github.com/pedrojunqueira/bicep-cicd.git
```

2. Create a resource group

```bash 
az group create --location <your-region> --name bicep-cicd
```

3. deploy the storage account to test if it is working. Adjust parameters if needed

```bash
az deployment group create \
--subscription Pedro_subscription \
--resource-group bicep-cicd \
--template-file ./bicep/main.bicep \
--parameters ./bicep/main.parameters.json
```

4. Create a Service Principal

```bash
az ad sp create-for-rbac --name bicepcreator \
                         --role contributor \
                         --scopes /subscriptions/<you-subscription-id>/resourceGroups/bicep-cicd
```

6. Delete .git folder and create a new repository in Github

```bash
rm -rf .git
git init
git add .
git commit -m "first commit"
```

6. Create a new repository in GitHub and Add the remote repository to your local and push

```bash
git remote add origin
git push -u origin main
```

7. Add federated credential to your service principal to the repository

[link instructions](https://learn.microsoft.com/en-us/azure/developer/github/connect-from-azure?tabs=azure-portal%2Clinux#add-federated-credentials)

Watch [video](https://www.youtube.com/watch?v=4gVWpU4684I) on my YT channel


8. Create a secret in the Github repository

[link instructions](https://docs.github.com/en/actions/reference/encrypted-secrets)

7. Make changes on the repository and push to main branch

CICD will trigger and deploy the changes to the Azure
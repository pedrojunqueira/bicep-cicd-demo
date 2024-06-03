# pre-requisites

1. Azure Subscription. Need admin right to create service principal
2. Github account
3. Install Azure CLI 
4. Install Bicep CLI extension
5. VS code
6. Azure VS code extension
7. Bicep VS code Extention


1. enviroment check

az login
az account show
az --version
az bicep version


2. Create a repository in github

3. push the repository to github

4. create a simple bicep file without variables to create a storage account
5. create a resource group

az group create --location australiasoutheast --name bicep-cicd

6. deploy the storage account
```bash
az deployment group create \
--subscription Pedro_subscription \
--resource-group bicep-cicd \
--template-file main.bicep \
```
7. Push the code to the repository

8. refactor the bicep to add variables and parameters
9. create a parameter file
10. deploy using parameter file
```bash
az deployment group create \
--subscription Pedro_subscription \
--resource-group bicep-cicd \
--template-file main.bicep \
--parameters main.parameters.json
```
11. Push the code to the repository

12. Make a change to the bicep file and add module
13. create a service principal
az ad sp create-for-rbac --name bicepcreator \
                         --role contributor \
                         --scopes /subscriptions/<you-subscription-id>/resourceGroups/bicep-cicd

14. Delegate authority to the printipal to the repository
15. create a secret in the repository
16. Create a yml file to deploy to azure on push to the dev enviroment
17. Push code and sse deployment

@description('Storage account name')
param storageAccountName string

@allowed([
  'Standard_LRS'
  'Standard_GRS'
])
@description('Storage account sku')
param storageAccountSku string

@description('Storage account location')
param location string = 'australiaeast'

var storageAccountKind = 'StorageV2'
var minimumTlsVersion = 'TLS1_2'

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-04-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: storageAccountSku
  }
  kind: storageAccountKind
  properties:{
    minimumTlsVersion: minimumTlsVersion
    supportsHttpsTrafficOnly: true
    isHnsEnabled: true
  }
}

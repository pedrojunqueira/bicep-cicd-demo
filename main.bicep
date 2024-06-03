

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-04-01' = {
  name: 'bicepstorage42'
  location: 'australiaeast'
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties:{
    minimumTlsVersion: 'TLS1_2'
    supportsHttpsTrafficOnly: true
    isHnsEnabled: true
  }
}

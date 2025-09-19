param location string = 'Sweden Central'
param adminUsername string = 'adminuser'
@secure()
param adminPublicKey string

var vmNames = [
  'tri-lumen-1'
  'tri-lumen-2'
  'tri-lumen-3'
]

var zones = [
  '1'
  '2'
  '3'
]

/* ---------------- Networking ---------------- */
resource vnet 'Microsoft.Network/virtualNetworks@2023-11-01' = {
  name: 'tri-lumen-1-vnet'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'default'
        properties: {
          addressPrefix: '10.0.0.0/24'
        }
      }
    ]
  }
}

resource nsgs 'Microsoft.Network/networkSecurityGroups@2023-11-01' = [for i in range(0, 3): {
  name: '${vmNames[i]}-nsg'
  location: location
  properties: {
    securityRules: [
      {
        name: 'Allow-SSH-${i}'
        properties: {
          priority: 1000
          direction: 'Inbound'
          access: 'Allow'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '22'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
        }
      }
      {
        name: 'Allow-HTTP-${i}'
        properties: {
          priority: 1001
          direction: 'Inbound'
          access: 'Allow'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '80'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
        }
      }
      {
        name: 'Allow-HTTPS-${i}'
        properties: {
          priority: 1002
          direction: 'Inbound'
          access: 'Allow'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '443'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
        }
      }
    ]
  }
}]

/* ---------------- Public IPs ---------------- */
resource publicIPs 'Microsoft.Network/publicIPAddresses@2023-11-01' = [for i in range(0, 3): {
  name: '${vmNames[i]}-ip'
  location: location
  zones: [
    string(i + 1)
  ]
  sku: {
    name: 'Standard'
  }
  properties: {
    publicIPAllocationMethod: 'Static' // ✅ Required for Standard SKU
  }
}]

/* ---------------- NICs ---------------- */
resource nics 'Microsoft.Network/networkInterfaces@2023-11-01' = [for i in range(0, 3): {
  name: '${vmNames[i]}-nic'
  location: location
  properties: {
    networkSecurityGroup: {
      id: nsgs[i].id
    }
    enableAcceleratedNetworking: true
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          subnet: {
            id: resourceId('Microsoft.Network/virtualNetworks/subnets', vnet.name, 'default') // ✅ Correct reference
          }
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: publicIPs[i].id
          }
        }
      }
    ]
  }
}]

/* ---------------- Virtual Machines ---------------- */
resource vms 'Microsoft.Compute/virtualMachines@2023-09-01' = [for i in range(0, 3): {
  name: vmNames[i]
  location: location
  zones: [
    zones[i]
  ]
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_F2s_v2'
    }
    securityProfile: {
      securityType: 'TrustedLaunch'
      uefiSettings: {
        secureBootEnabled: true
        vTpmEnabled: true
      }
    }
    storageProfile: {
      imageReference: {
        publisher: 'Canonical'
        offer: 'ubuntu-24_04-lts'
        sku: 'server'
        version: 'latest'
      }
      osDisk: {
        createOption: 'FromImage'
        managedDisk: {
          storageAccountType: 'StandardSSD_LRS'
        }
        deleteOption: 'Delete'
      }
    }
    osProfile: {
      computerName: vmNames[i]
      adminUsername: adminUsername
      linuxConfiguration: {
        disablePasswordAuthentication: true
        ssh: {
          publicKeys: [
            {
              path: '/home/${adminUsername}/.ssh/authorized_keys'
              keyData: adminPublicKey
            }
          ]
        }
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: nics[i].id
          properties: {
            deleteOption: 'Delete'
          }
        }
      ]
    }
  }
}]

/* ---------------- Outputs ---------------- */
output vmPublicIPs array = [for i in range(0, 3): publicIPs[i].properties.ipAddress]

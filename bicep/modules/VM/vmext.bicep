param OPNScriptURI string
param ShellScriptName string
param ShellScriptParameters string
param ScriptName string


resource vmext 'Microsoft.Compute/virtualMachines/extensions@2015-06-15' = {
  name: ScriptName
  location: resourceGroup().location
  properties: {
    publisher: 'Microsoft.OSTCExtensions'
    type: 'CustomScriptForLinux'
    typeHandlerVersion: '1.4'
    autoUpgradeMinorVersion: false
    settings:{
      fileUris: [
        '${OPNScriptURI}${ShellScriptName}'
      ]
      commandToExecute: 'sh ${ShellScriptName} ${ShellScriptParameters}'
    }
  }
}
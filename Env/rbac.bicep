// Assign RBAC role for web app to use signalR service

param principalId string
var signalRAppServerRoleDefinitionId = '/subscriptions/ddd651d9-db06-4e7b-ac67-a2bcf18d6000/providers/Microsoft.Authorization/roleDefinitions/420fcaa2-552c-430f-98ca-3264be4806c7'
var app_to_signalr_role_assignment = '${guid(principalId, signalRAppServerRoleDefinitionId, resourceGroup().id)}'

resource appToSignalRRoleAssignment 'Microsoft.Authorization/roleAssignments@2021-04-01-preview' = {
  name: app_to_signalr_role_assignment
  scope: resourceGroup()
  properties: {
    principalId: principalId
    roleDefinitionId: signalRAppServerRoleDefinitionId
  }
}

function getActiveChromeDevices() { 

  const activeDevices = [];

  let pageToken;

  do {

    const request = AdminDirectory.Chromeosdevices.list("MyCustomer, {
      pageToken: pageToken,
      maxResults: 100

    })

    pageToken = request.nextPageToken

    request.chromeosdevices.forEach(device => {

      var deviceObj = {}

      if (device.status == "ACTIVE"){

        let networkData = device.lastKnownNetwork

        if (device.annotatedAssetId != null && device.annotatedAssetId != "") {

          deviceObj.AssetID = device.annotatedAssetId
          deviceObj.OU = device.orgUnitPath
        
          if (networkData != null) {
        
            deviceObj.IP = networkData[0].ipAddress
            
            }

            else {

              deviceObj.IP = "Unknown"

            }
        }

        else {

          deviceObj.AssetID = device.serialNumber
          deviceObj.OU = device.orgUnitPath
          
          if (networkData != null) {
        
            deviceObj.IP = networkData[0].ipAddress
            
            }

            else {

              deviceObj.IP = "Unknown"

            }
        }

        deviceObj.Model = device.model
        deviceObj.OSVersion = device.osVersion
        deviceObj.LastSync = device.lastSync

        expirationDate = convertToDate(device.autoUpdateExpiration)
        
        deviceObj.EoLDate = expirationDate

        activeDevices.push(deviceObj)

      }
    })

  } while (pageToken)

  writeToSheet(activeDevices)

  return activeDevices

}

function convertToDate(date) {

  var dateVar = new Date(parseInt(date))
  y = dateVar.getFullYear();
  m = dateVar.getMonth() + 1
  d = dateVar.getDate()
  formattedDate = d + "/" + m + "/" + y
  
  return formattedDate

}

function writeToSheet(activeDevices) {

  let count = 2

  var ss = SpreadsheetApp.openById('165ZnqnJfmj87e2F1Q4Iu3OldyGncBTbt34_ehn4K6-k')
  ss.getActiveSheet().getRange('A1').setValue("Asset ID")
  ss.getActiveSheet().getRange('B1').setValue("OU")
  ss.getActiveSheet().getRange('C1').setValue("IP Address")
  ss.getActiveSheet().getRange('D1').setValue("Model")
  ss.getActiveSheet().getRange('E1').setValue("OS Version")
  ss.getActiveSheet().getRange('F1').setValue("Last Sync")
  ss.getActiveSheet().getRange('G1').setValue("EoL Date")

  activeDevices.forEach(device => {

    let aRange = "A" + count
    let bRange = "B" + count
    let cRange = "C" + count
    let dRange = "D" + count
    let eRange = "E" + count
    let fRange = "F" + count
    let gRange = "G" + count
    
    ss.getActiveSheet().getRange(aRange).setValue(device.AssetID)
    ss.getActiveSheet().getRange(bRange).setValue(device.OU)
    ss.getActiveSheet().getRange(cRange).setValue(device.IP)
    ss.getActiveSheet().getRange(dRange).setValue(device.Model)
    ss.getActiveSheet().getRange(eRange).setValue(device.OSVersion)
    ss.getActiveSheet().getRange(fRange).setValue(device.LastSync)
    ss.getActiveSheet().getRange(gRange).setValue(device.EoLDate)

    count++

  })
}

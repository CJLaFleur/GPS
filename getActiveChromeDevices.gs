function getActiveChromeDevices() {
  
  var ss = SpreadsheetApp.openById()
  ss.getActiveSheet().getRange('A1').setValue("Asset ID")
  ss.getActiveSheet().getRange('B1').setValue("OU")

  const activeDevices = [];

  let pageToken;

  do {

    const request = AdminDirectory.Chromeosdevices.list("MyCustomer", {
      pageToken: pageToken,
      maxResults: 100
    })

    pageToken = request.nextPageToken

    request.chromeosdevices.forEach(device => {

      var deviceObj = {}

      if(device.status == "ACTIVE"){

        if (device.annotatedAssetId != null) {

        deviceObj.AssetID = device.annotatedAssetId
        deviceObj.OU = device.orgUnitPath
        activeDevices.push(deviceObj)
        
        }

        else {

          deviceObj.AssetID = device.serialNumber
          deviceObj.OU = device.orgUnitPath
          activeDevices.push(deviceObj)

        }
      }
    })

  } while (pageToken)

  for (let j = 0; j < activeDevices.length; j++) {

    let x = j + 2
    let aRange = "A" + x
    let bRange = "B" + x
    
    let chrbk = activeDevices[j]

    ss.getActiveSheet().getRange(aRange).setValue(chrbk.AssetID)
    ss.getActiveSheet().getRange(bRange).setValue(chrbk.OU)

  }

  return activeDevices

}

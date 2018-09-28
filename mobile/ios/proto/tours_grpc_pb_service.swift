// Autogenerated. Do not modify!
// package: Tours
// file: tours.proto

import Foundation
import SwiftGRPC

@objc(ToursService)
class ToursService: GrpcService {


  @objc func getTours(_ jsReq: [String: Any], resolve: RCTPromiseResolveBlock, reject: RCTPromiseRejectBlock) -> Void {
    let svc = ToursGrpcClient
    var req = Tours_GetToursRequest()

    // request mapping
    req.guardroomID = jsReq["guardroomId"] as? String ?? ""
    // end request mapping

    do {
      let res = try svc.getTours(req)
      var jsRes: [String: Any] = [:]

      // response mapping
      var items$: [[String: Any]] = []
      for item in res.items {
        let _items_Tour = item
        var _items_Tour$: [String: Any] = [:]
        _items_Tour$["id"] = _items_Tour.id
        _items_Tour$["name"] = _items_Tour.name
        _items_Tour$["courseType"] = _items_Tour.courseType
        _items_Tour$["duration"] = _items_Tour.duration
        _items_Tour$["stripName"] = _items_Tour.stripName
        _items_Tour$["isActive"] = _items_Tour.isActive
        items$.append(_items_Tour$)
      }
      jsRes["items"] = items$
      // end response mapping

      resolve(jsRes)
    } catch {
      reject("ERROR", error.localizedDescription, error)
    }
  }

  
  @objc
  static func requiresMainQueueSetup() -> Bool {
    return false
  }
}

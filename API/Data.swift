//
//  Data.swift
//  Program
//
//  Created by 김소원 on 2021/04/12.
//

import Foundation
import SwiftyJSON

struct Data {
    var countryName : String
    var newCase : Int
    
    init(_ json: JSON) {
        countryName = json["countryName"].stringValue
        newCase = json["newCase"].intValue
    }

}

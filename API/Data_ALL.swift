//
//  Data_ALL.swift
//  Program
//
//  Created by 김소원 on 2021/04/12.
//

import Foundation
import SwiftyJSON

struct Data_ALL {
    
    var percentage : Double
    var newCase : Int
    var death : Int
    var newFcase : Int
    var totalCase : Int
    var newCcase : Int
    var recovered : Int
    var countryName : String
    
    init(_ json: JSON) {
        percentage = json["percentage"].doubleValue
        newCase = json["newCase"].intValue
        death = json["death"].intValue
        newFcase = json["newFcase"].intValue
        totalCase = json["totalCase"].intValue
        newCcase = json["newCcase"].intValue
        recovered = json["recovered"].intValue
        countryName = json["countryName"].stringValue
    }
}

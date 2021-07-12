//
//  JsonData.swift
//  JsonEncode
//
//  Created by Tejaswini MR on 02/02/21.
//

import Foundation
struct JsonData:Codable {
    var firstName:String
    var lastName:String
    var gender:String
    var age:Int
    var address:Address
    var phoneNumbers=[PhoneNumber]()
    
}


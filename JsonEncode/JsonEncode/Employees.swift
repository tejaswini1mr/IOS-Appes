//
//  Employees.swift
//  JsonEncode
//
//  Created by Tejaswini MR on 02/02/21.
//

import Foundation
struct Employees:Codable {
    var userId:String
    var jobTitle:String
    var firstName:String
    var lastName:String
    var employeeCode:String
    var region:String
    var phoneNumber:String
    var emailAddress:String
}

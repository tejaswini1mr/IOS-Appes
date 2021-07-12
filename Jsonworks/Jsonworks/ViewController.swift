//
//  ViewController.swift
//  Jsonworks
//
//  Created by Tejaswini MR on 25/01/21.
//

import UIKit
struct User: Codable {
    var first_name: String
    var last_name: String
    var country: String
}

class ViewController: UIViewController {
    let jsonString = """
    {
        "first_name": "John",
        "last_name":  "Doe",
        "country":    "United Kingdom"
    }
"""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    let jsonData=jsonString.data(using: .utf8)
    //let jsonData = jsonString.data(using: .utf8)
    let user = try! JSONDecoder().decode(User.self, from: jsonData)
    print(user.last_name)



}


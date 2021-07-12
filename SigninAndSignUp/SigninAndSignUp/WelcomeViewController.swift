//
//  Welcome.swift
//  SigninAndSignUp
//
//  Created by Tejaswini MR on 02/06/21.
//

import Foundation
import UIKit
class WelcomeViewController: UIViewController {
    var name: String = ""
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = String("welcome \(name) you are sucessefully authorised")

    }
    
    
}

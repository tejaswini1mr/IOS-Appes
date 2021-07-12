//
//  SignUpViewController.swift
//  SigninAndSignUp
//
//  Created by Tejaswini MR on 01/06/21.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {

    
    @IBOutlet weak var UserName: UITextField!
    
    @IBOutlet weak var emailid: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBAction func CreateAccount(_ sender: UIButton) {
        if UserName.text?.isEmpty == true || emailid.text?.isEmpty == true || password.text?.isEmpty == true{
            print("All feild must be filled")
        } else {
            signUp()

        }
    }
    func signUp(){
        
        Auth.auth().createUser(withEmail: emailid.text!, password: password.text!) { (authResult,error) in
            guard let _ = authResult?.user,error == nil else{
                print(error?.localizedDescription as Any)
                return
            }
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyBoard.instantiateViewController(identifier: "detailPage")
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true, completion: nil)
            
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "detail"{
//            if let destVC = segue.destination as? WelcomeViewController{
//                destVC.name = UserName.text!
//            }
//        }
//    }

}

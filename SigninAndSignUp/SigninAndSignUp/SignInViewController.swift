//
//  SignInViewController.swift
//  SigninAndSignUp
//
//  Created by Tejaswini MR on 01/06/21.
//

import UIKit
import Firebase
import FirebaseAuth

class SignInViewController: UIViewController {

    @IBOutlet weak var emailid: UITextField!
    @IBOutlet weak var password: UITextField!

    @IBAction func signInButton(_ sender: UIButton) {

        if emailid.text?.isEmpty == true || password.text?.isEmpty == true {
            print("feild must be filled")
        } else {
            signIn()
        }
    }

    @IBAction func SignUPButton(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "SignUPView")
        vc.modalPresentationStyle = .popover
        self.present(vc, animated: true, completion: nil)
    }
//authenticate user
    func signIn(){
        Auth.auth().signIn(withEmail: emailid.text!, password: password.text!, completion: {
            (authResult,error) in
                guard let _ = authResult?.user,error == nil else{
                    print(error?.localizedDescription as Any)
                    return
                }
            self.checkauthentication()
        })
    }
//check weather current user is deleted or not
    func checkauthentication(){
        if Auth.auth().currentUser != nil {
            print(Auth.auth().currentUser?.uid as Any)

            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyBoard.instantiateViewController(identifier: "detailPage")
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true, completion: nil)
        }
    }
    

}

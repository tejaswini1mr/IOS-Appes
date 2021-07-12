//
//  KnowMoreViewController.swift
//  Its About Me
//
//  Created by Tejaswini MR on 15/12/20.
//

import UIKit

class KnowMoreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Insta(_ sender: UIButton) {
        if let url = NSURL(string: "https://www.instagram.com/tejumr1?r=nametag") {
                   UIApplication.shared.open(url as URL, options:[:], completionHandler:nil)

               }
    }
    
    @IBAction func linkedIn(_ sender: UIButton) {
        if let url = NSURL(string: "https://www.linkedin.com/in/tejaswini-m-r-a78555159") {
                   UIApplication.shared.open(url as URL, options:[:], completionHandler:nil)

               }
    }
    
    @IBAction func faceBook(_ sender: UIButton) {
        if let url = NSURL(string: "https://www.facebook.com") {
                   UIApplication.shared.open(url as URL, options:[:], completionHandler:nil)

               }
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

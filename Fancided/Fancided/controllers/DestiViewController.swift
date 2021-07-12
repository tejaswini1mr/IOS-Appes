//
//  DestiViewController.swift
//  Fancided
//
//  Created by Tejaswini MR on 29/03/21.
//

import UIKit

class DestiViewController: UIViewController {
    var newsdetail: String?
    @IBOutlet weak var display: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        display.text = newsdetail
        // Do any additional setup after loading the view.
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

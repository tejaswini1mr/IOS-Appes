//
//  DidSelectViewController.swift
//  tableView
//
//  Created by Tejaswini MR on 01/02/21.
//

import UIKit

class DidSelectViewController: UIViewController {
    var image:String?

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = image!
        navigationItem.largeTitleDisplayMode  = .never
        if let setimage = image{
            imageView.image = UIImage(named: setimage)
        }
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

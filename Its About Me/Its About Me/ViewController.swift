//
//  ViewController.swift
//  Its About Me
//
//  Created by Tejaswini MR on 15/12/20.
//

import UIKit

class ViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    var imagePicker = UIImagePickerController()

    
    @IBOutlet weak var ProfileImage: UIImageView!
    
    @IBOutlet weak var name: UILabel!

    
    @IBOutlet weak var mailPhoneInfo: UITextView!
    
    
    @IBAction func editMe(_ sender: UIButton) {
        imagePicker.delegate=self
        imagePicker.sourceType=UIImagePickerController.SourceType.photoLibrary
        imagePicker.allowsEditing=true
        self.present(imagePicker,animated: true){
            print("jj")
        }
    
        
    }
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("lol")
        if let image=info[UIImagePickerController.InfoKey.originalImage.rawValue] as? UIImage{
            print(image.size)
            ProfileImage.image=#imageLiteral(resourceName: "download")
        }
        else{
            print("no image sadddd sit and cry")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //ProfileImage.image=#imageLiteral(resourceName: "download")
        ProfileImage.layer.borderWidth = 1
            ProfileImage.layer.masksToBounds = false
            ProfileImage.layer.borderColor = UIColor.black.cgColor
            ProfileImage.layer.cornerRadius = ProfileImage.frame.height/2
            ProfileImage.clipsToBounds = true
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}


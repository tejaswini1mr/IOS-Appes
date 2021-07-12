
//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    let db=Firestore.firestore()
    
    var messages:[Message]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title=Constant.appName
        //tableView.delegate=self
        tableView.dataSource=self
        navigationItem.hidesBackButton=true
        tableView.register(UINib(nibName:Constant.cellNibName, bundle: nil), forCellReuseIdentifier: Constant.cellIdentifier)
        loadMessages()

    }
    func loadMessages(){
        
        db.collection(Constant.FStore.collectionName)
            .order(by: Constant.FStore.dateField)
            .addSnapshotListener{ (querySnapshot, error) in
            
                self.messages=[]
            if let e=error{
                print("\(e)issue in retriving data in db")
            }else{
                if let snapshotDocuments = querySnapshot?.documents{
                    for doc in snapshotDocuments{
                        let data=doc.data()
                        if  let messagesender=data[Constant.FStore.senderField] as? String, let messageBody=data[Constant.FStore.bodyField] as? String{
                            let newMessage=Message(sender: messagesender, body: messageBody)
                            self.messages.append(newMessage)
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                                let indexPath=IndexPath(row:self.messages.count-1,section: 0)
                                self.tableView.scrollToRow(at: indexPath, at: .top, animated: false)
                            }
                            
                            
                        }

                    }
            }
        }
    }
        
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {

        if let messagebody = messageTextfield.text,let messageSender=Auth.auth().currentUser?.email{
            db.collection(Constant.FStore.collectionName).addDocument(data:
                [Constant.FStore.senderField:messageSender,
                Constant.FStore.bodyField:messagebody,
                Constant.FStore.dateField:Date().timeIntervalSince1970])//adding time data feild to message
            { (error) in
                if let e=error{
                    print("There was an issue saving data to firestore,\(e)")
                }else{
                    print("success fully save date")
                    DispatchQueue.main.async {
                        self.messageTextfield.text=""
                    }
                }
            }
        }
        func textFieldShouldReturn(textField: UITextField) -> Bool {
            if let messagebody=messageTextfield.text,let messageSender=Auth.auth().currentUser?.email{
                db.collection(Constant.FStore.collectionName).addDocument(data:
                    [Constant.FStore.senderField:messageSender,
                    Constant.FStore.bodyField:messagebody,
                    Constant.FStore.dateField:Date().timeIntervalSince1970])//adding time data feild to message
                { (error) in
                    if let e=error{
                        print("There was an issue saving data to firestore,\(e)")
                    }else{
                        print("success fully save date")
                        DispatchQueue.main.async {
                            self.messageTextfield.text=""
                        }
                    }
                }
            }
                 
              return true
         }
    }
    
    @IBAction func logOutPressed(_ sender: Any) {
        
    do {
      try Auth.auth().signOut()
        navigationController?.popToRootViewController(animated: true)
        
        
    } catch let signOutError as NSError {
      print ("Error signing out: %@", signOutError)
    }
      
    }
    
}
extension ChatViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message=messages[indexPath.row]
        let cell=tableView.dequeueReusableCell(withIdentifier: Constant.cellIdentifier, for: indexPath)as! MessageCell
        cell.label.text=message.body
        //this message from the current user
        if message.sender==Auth.auth().currentUser?.email{
            cell.leftImageView.isHidden=true
            cell.rightImageView.isHidden=false
            cell.messageBubble.backgroundColor=UIColor(named: Constant.BrandColor.lightPurple)
            cell.label.textColor=UIColor(named: Constant.BrandColor.purple)
        }else{
        //this is for another sender
        cell.leftImageView.isHidden=false
        cell.rightImageView.isHidden=true
        cell.messageBubble.backgroundColor=UIColor(named: Constant.BrandColor.purple)
        cell.label.textColor=UIColor(named: Constant.BrandColor.lightPurple)
        }
        
        return cell
    }
    
    
    
}


//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit


class CalculatorViewController: UIViewController {
    var tip=0.10
    var numberOfPpl=1
    var billTotal=0.0
    var perporsen=""
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var twentyPctButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
    
        zeroPctButton.isSelected=false
        tenPctButton.isSelected=false
        twentyPctButton.isSelected=false
        sender.isSelected=true
        
        let buttontitle=sender.currentTitle!
        let buttonvalue=String(buttontitle.dropLast())
        tip=Double(buttonvalue)!/100
        
        
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text=String(format:"%.0f",sender.value)
        numberOfPpl=Int(sender.value)
        
    }
    
    
    @IBAction func calculateButton(_ sender: UIButton) {
        let bill=billTextField.text!
        if bill != ""{
            billTotal=Double(bill)!
            let result=billTotal*(1+tip)/Double(numberOfPpl)
            perporsen=String(format: "%.2f", result)
            self.performSegue(withIdentifier: "results", sender: self)
            
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="results"{
            let destination=segue.destination as!ResultViewController//if we dont use as it will take destnation in class UIcontroll
            destination.perpersonBill=perporsen
            destination.tip=tip
            destination.numberOfppl=numberOfPpl
        }
    }
    
    
    

}


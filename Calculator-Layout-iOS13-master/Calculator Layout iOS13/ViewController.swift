//
//  ViewController.swift
//  Calculator Layout iOS13
//
//

import UIKit

class ViewController: UIViewController {
    var numberOnScreen:Double=0
    var performingMaths=false
    var previouseNumber:Double=0
    var operation=0
    let kEPSILON = 0.0001

    
    @IBOutlet weak var labelView: UILabel!
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        
        if performingMaths==true{
            labelView.text=String(sender.currentTitle!)
            numberOnScreen=Double(labelView.text!)!
            performingMaths=false
        }
        else{
            labelView.text=labelView.text!+String(sender.currentTitle!)
            
            numberOnScreen=Double(labelView.text!)!
        }
}
    
    @IBAction func buttons(_ sender: UIButton) {
        if labelView.text != "" && sender.tag != 11 && sender.tag != 16{
            previouseNumber=Double(labelView.text!)!
            if sender.tag==12{
                labelView.text="/"
            }
            if sender.tag==13{
                labelView.text="X"
            }
            if sender.tag==14{
                labelView.text="-"
            }
            if sender.tag==15{
                labelView.text="+"
            }
            if sender.tag==18{
                labelView.text="%"
            }
            operation=sender.tag
            performingMaths=true
        }
        else if sender.tag==16{
            if operation==12{
                let ans=previouseNumber/numberOnScreen
                
                if abs(ans-round(ans))<kEPSILON{
                labelView.text=String(Int(round(previouseNumber/numberOnScreen)))
                }
                else{
                    labelView.text=String(previouseNumber/numberOnScreen)
                }
            }
            if operation==13{
                labelView.text=String(previouseNumber*numberOnScreen)
            }
            if operation==14{
                labelView.text=String(previouseNumber-numberOnScreen)
            }
            if operation==15{
                labelView.text=String(previouseNumber+numberOnScreen)
            }
            if operation==18{
                labelView.text=String(Float(previouseNumber).truncatingRemainder(dividingBy: Float(numberOnScreen)))
            }
            if operation==17{
                if previouseNumber.isLess(than:0){
                    labelView.text=String("+\(previouseNumber)")
                }
                else {
                    labelView.text=String("-\(previouseNumber)")
                }
            }
            
        }
        else if sender.tag==11{
            labelView.text=""
            previouseNumber=0
            numberOnScreen=0
            operation=0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


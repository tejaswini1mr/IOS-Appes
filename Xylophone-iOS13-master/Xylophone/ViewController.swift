//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        //        variale_name:VALUE
        sender.alpha=0.5
        print("strt")
        playSound(whichKey:sender.currentTitle!)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            print("end")
            // Bring's sender's opacity back up
            sender.alpha = 1.0}
        
        
    }
    //              variable_name:datatype
    func playSound(whichKey:String) {
        let url = Bundle.main.url(forResource: whichKey, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
}

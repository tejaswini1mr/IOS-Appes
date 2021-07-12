//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    var player: AVAudioPlayer!
    
    let eggTimes=["Soft":5*60,"Medium":7*60,"Hard":12*60]
    var timer=Timer()
    var totalTime=0
    var secondpass=0
    var counter = 1

    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var result: UILabel!
    
    @IBAction func hardnessSelction(_ sender: UIButton) {
        
        timer.invalidate()//to start timer from fresh every time we press
       
        let hardness=sender.currentTitle!
        let result1=hardness
        totalTime=eggTimes[result1]!
        progressBar.progress=0.0
        secondpass=0
        result.text=result1
        
        timer=Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
    }
    
    
    
    
    @objc func updateCounter() {
        //example functionality
        if secondpass < totalTime {
            let percentageprogress=Float(secondpass)/Float(totalTime)
            progressBar.progress=percentageprogress
            secondpass += 1
            
        }
        else{
            timer.invalidate()
            result.text="Done!"
            playSound()
        }
        
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
    
    
}

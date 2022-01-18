//
//  ViewController.swift
//  Stop Watch
//
//  Created by SOMA SEKHAR ANAPARTHI on 12/01/22.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    
    var a: Int = 1
    
    var b: Int = 2
    
    var time: [String:Int] = [ "seconds": 0, "minutes": 0, "hours": 0]
    
    var timerRunning: Bool = false
    
    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var hoursLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var lapButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        timerRunning = false
        
        print("Haii")
        
    }
    
    @IBAction func lapButtonPressed(_ sender: UIButton) {
        
        if(timerRunning){
            print(secondsLabel.text!)
        }else{
            secondsLabel.text = "00"
            lapButton.setTitle("Lap", for: .normal)
            time["seconds"] = 0
            time["minutes"] = 0
            time["hours"] = 0
        }
        
    }
    
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        
        if(timerRunning){
            startButton.setTitle("Start", for: .normal)
            lapButton.setTitle("Reset", for: .normal)
            timer.invalidate()
            timerRunning = false
        } else{
            print("Start Pressed")
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
            timerRunning = true
            startButton.setTitle("Stop", for: .normal)
            lapButton.setTitle("Lap", for: .normal)
        }
        
    }
    
    @objc func updateTimer() {
        
        if(time["seconds"]! >= 59){
            if(time["minutes"]! >= 59){
                time["hours"]! += 1
                time["minutes"]! = 0
            }
            time["minutes"]! += 1
            time["seconds"]! = 0
            secondsLabel.text = String(time["seconds"]!)
            minutesLabel.text = String(time["minutes"]!)
            hoursLabel.text = String(time["hours"]!)
        }
        time["seconds"]! += 1
        secondsLabel.text = String(time["seconds"]!)
        print(time["seconds"]!)
        
    }
    
}


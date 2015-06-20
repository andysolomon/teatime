//
//  StepStoneViewController.swift
//  Teatime
//
//  Created by Andrew Solomon on 6/16/15.
//  Copyright © 2015 teateam. All rights reserved.
//

import UIKit

class StepStoneViewController: UIViewController {

    @IBOutlet var stepNameLabel: UILabel!
    @IBOutlet var stepTimerLabel: UILabel!
    
    var tea: JSON!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let teaName = tea["name"].string!
        stepNameLabel.text = teaName
    }
    
    var timerCount = 200
    var timerRunning = false
    var timer = NSTimer()
    
    
    func counting(){
        timerCount -= 1
        stepTimerLabel.text = "\(timerCount)"
    }
    func stopTimer() {
        if timerRunning == true {
            timer.invalidate()
            timerRunning == false
        }
    }
    func secondsToMinutesSeconds (seconds : Int) -> (Int, Int) {
        return ((seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    @IBAction func toggleTimerStart(sender: UIButton) {
        if timerRunning == false {
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("counting"), userInfo: nil, repeats: true)
            timerRunning = true
        } else {
            timer.invalidate()
            timerRunning = false
        }

    }
    @IBAction func restartTimer(sender: UIButton) {
        timerCount = 200
        stepTimerLabel.text = "200"
        stopTimer()
    }

}

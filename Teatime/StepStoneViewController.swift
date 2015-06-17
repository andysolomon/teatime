//
//  StepStoneViewController.swift
//  Teatime
//
//  Created by Andrew Solomon on 6/16/15.
//  Copyright © 2015 teateam. All rights reserved.
//

import UIKit

class StepStoneViewController: UIViewController {
    
    var timerCount = 0
    var timerRunning = false
    var timer = NSTimer()

    @IBOutlet var stepNameLabel: UILabel!
    @IBOutlet var stepTimerLabel: UILabel!
    
    func counting(){
        timerCount += 1
        stepTimerLabel.text = "\(timerCount)"
    }
    func stopTimer() {
        if timerRunning == true {
            timer.invalidate()
            timerRunning == false
        }
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
        timerCount = 0
        stepTimerLabel.text = "0"
        stopTimer()
    }

}

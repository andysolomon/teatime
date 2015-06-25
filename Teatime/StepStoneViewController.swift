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
    
    var number = 0
    var tea: JSON!
    var timerCount =  200
    var timerRunning = false
    var timer = NSTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let teaName = tea["steps"][number]["stepName"].string!
        var stepDuration = tea["steps"][number]["duration"].int!
        stepNameLabel.text = teaName
        timerCount = stepDuration
        stepTimerLabel.text = "\(timerCount)"
        isFirstStep()
    }
    
    func timePassed() -> Int {
        return timerCount
    }
    func counting(){
        timerCount -= 1
        stepTimerLabel.text = "\(timerCount)"
        determinePercentage()
        moveToNextStep()

    }
    func moveToNextStep() {
        if timerCount == 0 {
            timer.invalidate()
            timerRunning = false
            number++
            viewDidLoad()
        }
    }
    func determinePercentage() {
        var totalDuration = tea["steps"][number]["duration"].int!
        var elapsedTime = totalDuration - timerCount
        var percentageOfTime = elapsedTime / totalDuration
        var realPercentage = Float(elapsedTime) / Float(totalDuration)
        print(realPercentage * 100 * 3.6)
    }
    func startTimer() {
        if timerRunning == false {
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("counting"), userInfo: nil, repeats: true)
            timerRunning = true
        } else {
            timer.invalidate()
            timerRunning = false
        }
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
    func isFirstStep() {
        if number > 0 {
            return startTimer()
        }
    }

    @IBAction func toggleTimerStart(sender: UIButton) {
        return startTimer()
    }
    @IBAction func restartTimer(sender: UIButton) {
        timerCount = tea["steps"][number]["duration"].int!
        stepTimerLabel.text = "\(timerCount)"
        stopTimer()
    }

}

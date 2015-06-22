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
    var timerCount =  200
    var timerRunning = false
    var timer = NSTimer()
    
    //// Color Declarations
    let timerCircle = UIColor(red: 0.020, green: 0.024, blue: 0.031, alpha: 1.000)
    
    //// Oval Drawing
    //var ovalPath = UIBezierPath(ovalInRect: CGRectMake(76, 19, 150, 150))
    //timerCircle.setStroke()
    //ovalPath.lineWidth = 10
    //ovalPath.stroke()
    
    let path = UIBezierPath()
    path.moveToPoint(CGPoint(80, 50))
    path.addLineToPoint(CGPoint(89, 150))
    path.addLineToPoint(CGPoint(10, 150))
    
    path.linewidth = 10.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let teaName = tea["name"].string!
        var stepDuration = tea["steps"][0]["duration"].int!
        stepNameLabel.text = teaName
        timerCount = stepDuration
        stepTimerLabel.text = "\(timerCount)"
    }
    
    
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

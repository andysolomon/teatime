//
//  StepStoneViewController.swift
//  Teatime
//
//  Created by Andrew Solomon on 6/16/15.
//  Copyright © 2015 teateam. All rights reserved.
//

import UIKit

class StepStoneViewController: UIViewController, CircleViewDataSource {

    let transformRotate: CGAffineTransform = CGAffineTransformMakeRotation(-90 * CGFloat(M_PI) / 180)
    @IBOutlet var stepNameLabel: UILabel!
    @IBOutlet var stepTimerLabel: UILabel!
    @IBOutlet var nextStepNameLabel: UILabel!
    @IBOutlet var stepInstructions: UILabel!
    @IBOutlet weak var circleView: CircleView! {
        didSet {
            circleView.dataSource = self
            circleView.transform = transformRotate
        }
    }
    
    // Put these in an initializer
    var tea: JSON!
    var number = 0
    var timerCount = 0
    var timerRunning = false
    var timer = NSTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // Setup View
    func setup() {
        let teaName = tea["steps"][number]["stepName"].string!
        var stepDuration = tea["steps"][number]["duration"].int!
        var nextStep = tea["steps"][number + 1]["stepName"].string!
        var instructions = tea["steps"][number]["instructions"].string!
        timerCount = tea["steps"][number]["duration"].int!
        stepNameLabel.text = teaName
        stepTimerLabel.text = "\(timerCount)"
        nextStepNameLabel.text = nextStep
        stepInstructions.text = instructions
    }
    
    // Utility Functions
    func counting(){
        timerCount--
        stepTimerLabel.text = "\(timerCount)"
        updateUI()
        if timerCount == 0 {
            moveToNextStep()
        }
    }
    private func updateUI() {
        circleView.setNeedsDisplay()
        determinePercentage()
    }
    func moveToNextStep() {
        timerRunning = true
        number++
        setup()
    }
    func moveToPrevStep() {
        timerRunning = true
        number--
        setup()
    }
    func determinePercentage() -> Double {
        var totalDuration = tea["steps"][number]["duration"].int!
        var elapsedTime = totalDuration - timerCount
        var percentageOfTime = elapsedTime / totalDuration
        var realPercentage = Float(elapsedTime) / Float(totalDuration)
        var percentage = realPercentage * 100 * 3.6
        return Double(percentage)
    }
    func startTimer() {
        if timerRunning == false {
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("counting"), userInfo: nil, repeats: true)
            timerRunning = true
        } else {
            timerRunning = false
            if(timerRunning == false) {
            }
            pauseTimer()
            timer.invalidate()
        }
    }
    func pauseTimer() {
        print("pause timer")
        updateUI()
    }
    func stopTimer() {
        if timerRunning == true {
            timer.invalidate()
            timerRunning = false
            updateUI()
        }
    }
    func isFirstStep() {
        if number > 0 {
            return startTimer()
        }
    }

    // IBActions
    @IBAction func toggleTimerStart(sender: UIButton) {
        return startTimer()
    }
    @IBAction func restartTimer(sender: UIButton) {
        timerCount = tea["steps"][number]["duration"].int!
        stepTimerLabel.text = "\(timerCount)"
        stopTimer()
    }
    @IBAction func prevButton(sender: UIButton) {
        if number > 0 {
            stopTimer()
            moveToPrevStep()
        }
    }
    @IBAction func nextButton(sender: UIButton) {
        stopTimer()
        timerCount = tea["steps"][number]["duration"].int!
        stepTimerLabel.text = "\(timerCount)"
        moveToNextStep()
    }
    
    // Delegate Methods
    func isTimerRunning(sender: CircleView) -> Bool? {
        return Bool(timerRunning)
    }
    func progressForCircleView(sender: CircleView) -> Double? {
        return Double(determinePercentage())
    }

}

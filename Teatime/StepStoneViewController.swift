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
    @IBOutlet private weak var stepNameLabel: UILabel!
    @IBOutlet private weak var stepTimerLabel: UILabel!
    @IBOutlet private weak var nextStepNameLabel: UILabel!
    @IBOutlet private weak var stepInstructions: UILabel!
    @IBOutlet private weak var circleView: CircleView! {
        didSet {
            circleView.dataSource = self
            circleView.transform = transformRotate
        }
    }
    
    // Put these in an initializer
    var tea: JSON
    private var number: Int
    private var timerCount: Int
    private var timerRunning: Bool = false
    private var timer: NSTimer

    required init?(coder aDecoder: NSCoder) {
        self.tea = []
        self.number = 0
        self.timerCount = 0
        self.timerRunning = false
        self.timer = NSTimer()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    
    // Setup View
    func setup() {
        let teaName = tea["steps"][number]["stepName"].stringValue
        let nextStep = tea["steps"][number + 1]["stepName"].stringValue
        let instructions = tea["steps"][number]["instructions"].stringValue
        self.timerCount = tea["steps"][number]["duration"].intValue
        stepNameLabel.text = teaName
        stepTimerLabel.text = "\(timerCount)"
        nextStepNameLabel.text = nextStep
        stepInstructions.text = instructions
    }
    
    // Utility Functions
    func counting(timer: NSTimer){
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
        let totalDuration = tea["steps"][number]["duration"].int!
        let elapsedTime = totalDuration - timerCount
        let realPercentage = Float(elapsedTime) / Float(totalDuration)
        let percentage = realPercentage * 100 * 3.6
        return Double(percentage)
    }
    func startTimer() {
        if timerRunning == false {
            timer = NSTimer.scheduledTimerWithTimeInterval(
                1.0,
                target: self,
                selector: Selector("counting:"),
                userInfo: nil,
                repeats: true
            )
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
    func isTimerRunning(sender: CircleView) -> Bool {
        return timerRunning
    }
    func progressForCircleView(sender: CircleView) -> Double? {
        return Double(determinePercentage())
    }

}

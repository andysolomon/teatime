//
//  Stopwatdh.swift
//  Teatime
//
//  Created by Andrew Solomon on 6/21/15.
//  Copyright (c) 2015 teateam. All rights reserved.
//

import Foundation

class Stopwatch {
    
    private var startTime: NSDate?
    
    var elapsedTime: NSTimeInterval {
        if let startTime = self.startTime {
            return -startTime.timeIntervalSinceNow
        } else {
            return 0
        }
    }
    
    var elapsedTimeAsString: String {
        return String(format: "%02d:%02d",
            Int(elapsedTime / 60), Int(elapsedTime % 60))
    }
    
    var isRunning: Bool {
        return startTime != nil
    }
    
    func start() {
        startTime = NSDate()
    }
    
    func stop() {
        startTime = nil
    }
    
}
//
//  CircleView.swift
//  Teatime
//
//  Created by Andrew Solomon on 6/22/15.
//  Copyright (c) 2015 teateam. All rights reserved.
//

import UIKit
import QuartzCore

protocol CircleViewDataSource: class {
    func progressForCircleView(sender: CircleView) -> Double?
    func isTimerRunning(sender: CircleView) -> Bool?
}

@IBDesignable
class CircleView: UIView {
    @IBInspectable
    var lineWidth: CGFloat = 10 { didSet{ setNeedsDisplay()}}
    @IBInspectable
    var color: UIColor = UIColor.blueColor() {didSet {setNeedsDisplay()}}
    @IBInspectable
    var scale: CGFloat = 0.90 { didSet{ setNeedsDisplay()}}
    
    var circleCenter: CGPoint{
        return convertPoint(center, fromView: superview)
    }
    var circleRadius: CGFloat {
        return min(bounds.size.width, bounds.size.height) / 2 * scale
    }
    
    weak var dataSource: CircleViewDataSource?
    
    
    override func drawRect(rect: CGRect) {
        let isTimeLeft: Bool = dataSource?.isTimerRunning(self) ?? true
        var progress: Double = (dataSource?.progressForCircleView(self))! {
            didSet { setNeedsDisplay() }
        }
        
        let facePath = UIBezierPath(arcCenter: circleCenter, radius: circleRadius, startAngle: 0 * CGFloat(M_PI)/180, endAngle: CGFloat(progress) * CGFloat(M_PI)/180, clockwise: true)
        
        facePath.lineWidth = lineWidth
        color.set()
        facePath.stroke()
    }
}
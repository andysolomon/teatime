//
//  CircleView.swift
//  Teatime
//
//  Created by Andrew Solomon on 6/22/15.
//  Copyright (c) 2015 teateam. All rights reserved.
//

import UIKit

@IBDesignable
class CircleView: UIView {
    var lineWidth: CGFloat = 10 { didSet{ setNeedsDisplay()}}
    var color: UIColor = UIColor.blueColor() {didSet {setNeedsDisplay()}}
    var scale: CGFloat = 0.90 { didSet{ setNeedsDisplay()}}
    
    var circleCenter: CGPoint{
        return convertPoint(center, fromView: superview)
    }
    var circleRadius: CGFloat {
        return min(bounds.size.width, bounds.size.height) / 2 * scale
    }
    
    override func drawRect(rect: CGRect) {
        let circlePath = UIBezierPath(arcCenter: circleCenter, radius: circleRadius, startAngle: -90 * CGFloat(M_PI)/180, endAngle: 3.6 * CGFloat(M_PI)/180, clockwise: true)
        circlePath.lineWidth = lineWidth
        color.set()

        circlePath.stroke()
    }
}

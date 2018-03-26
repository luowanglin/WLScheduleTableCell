//
//  WLScheduleCellLineView.swift
//  WLScheduleTableCellDemo
//
//  Created by luowanglin on 2018/3/23.
//  Copyright © 2018年 luowanglin. All rights reserved.
//

import UIKit

public class WLScheduleCellLineView: UIView {
    
    public var themeColor: UIColor = UIColor.colorWithHex(hexColor: 0x999998)
    public var arcColor: UIColor = UIColor.colorWithHex(hexColor: 0x999998)
    public var isHead: Bool?
    public var isTail: Bool?
    public var lineWidht: CGFloat = 2.0
    public var arcRadius: CGFloat = 4.0
    
    override public func draw(_ rect: CGRect) {
        let ctx: CGContext = UIGraphicsGetCurrentContext()!
        ctx.setFillColor((self.backgroundColor?.cgColor)!)
        ctx.fill(rect)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     *Painting for your Image
     ***/
    public func createImageWithColor(color: UIColor)->UIImage {
        UIGraphicsBeginImageContext(self.bounds.size)
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor)
        context.fill(self.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    
    /**
     *Execute draw path
     ***/
    public func drawPath() {
        /***Clear all of sub layer***/
        while self.layer.sublayers?.last != nil {
            self.layer.sublayers?.last?.removeFromSuperlayer()
        }
        let lineLayer: CAShapeLayer = CAShapeLayer.init()
        let linePath: UIBezierPath = UIBezierPath.init()
        let arcLayer: CAShapeLayer = CAShapeLayer.init()
        let arcPath: UIBezierPath = UIBezierPath.init()
        let pointY: CGFloat = (self.bounds.size.height - arcRadius * 2)/2
        let pointX: CGFloat = self.bounds.size.width / 2
        if self.isHead == false {
           linePath.move(to: CGPoint.init(x: pointX, y: 0.0))
           linePath.addLine(to: CGPoint.init(x: pointX, y: pointY))
        }
        arcPath.addArc(withCenter: CGPoint.init(x: pointX, y: pointY + arcRadius), radius: arcRadius, startAngle: calculate(with: -90.0), endAngle: calculate(with: 270.0), clockwise: true)
        arcPath.close()
        if self.isTail == false {
            linePath.move(to: CGPoint.init(x: pointX, y: pointY + arcRadius ))
            linePath.addLine(to: CGPoint.init(x: pointX, y: self.bounds.size.height + 1.0))
            linePath.close()
        }
        lineLayer.path = linePath.cgPath
        lineLayer.lineCap = kCALineCapRound
        lineLayer.lineWidth = lineWidht
        lineLayer.fillColor = themeColor.withAlphaComponent(0.8).cgColor
        lineLayer.strokeColor = themeColor.withAlphaComponent(0.8).cgColor
        
        arcLayer.path = arcPath.cgPath
        arcLayer.fillColor = arcColor.cgColor
        arcLayer.strokeColor = arcColor.cgColor
        
        self.layer.addSublayer(lineLayer)
        self.layer.addSublayer(arcLayer)
    }
    
    /**
     *Arc change to float
     ***/
    private func calculate(with angle:CGFloat)->CGFloat {
       return (angle) / 180.0 * CGFloat.pi
    }
    
}

//
//  WLScheduleCellHeadView.swift
//  WLScheduleTableCellDemo
//
//  Created by luowanglin on 2018/3/23.
//  Copyright © 2018年 luowanglin. All rights reserved.
//

import UIKit

@objc public class WLScheduleCellHeadView: UIView {
    private let widht: CGFloat = UIScreen.main.bounds.width
    @objc public var dayLable: UILabel?
    @objc public var weekLable: UILabel?
    @objc public var monthLable: UILabel?
    @objc public var dayText: String?
    @objc public var monthText: String?
    @objc public var weekText: String?
    @objc public var space: CGFloat = 10.0
    @objc public var dayLableWidth: CGFloat = 34.0
    @objc public var dayFontSize: CGFloat = 15.0
    @objc public var dayTextColor: UIColor = UIColor.white
    @objc public var dayLableBackgroundColor: UIColor = UIColor.colorWithHex(hexColor: 0x565B78)
    @objc public var weekFontSize: CGFloat = 12.0
    @objc public var weekTextColor: UIColor = UIColor.colorWithHex(hexColor: 0x565B78)
    @objc public var monthFontSize: CGFloat = 12.0
    @objc public var monthTextColor: UIColor = UIColor.colorWithHex(hexColor: 0x565B78)
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        //value default at init ...
        self.backgroundColor = UIColor.white
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @objc public func commit() {
        //day label
        dayLable = UILabel.init(frame: CGRect.init(x: space, y: 0.0, width: dayLableWidth, height: dayLableWidth))
        dayLable?.text = dayText
        dayLable?.font = UIFont.systemFont(ofSize: dayFontSize)
        dayLable?.textColor = dayTextColor
        dayLable?.textAlignment = .center
        dayLable?.backgroundColor = dayLableBackgroundColor
        dayLable?.layer.cornerRadius = (dayLable?.frame.width)! / 2
        dayLable?.layer.masksToBounds = true
        dayLable?.center = CGPoint.init(x: (dayLable?.center.x)!, y: self.frame.height / 2)
        self.addSubview(dayLable!)
        //week label
        weekLable = UILabel.init(frame: CGRect.init(x: self.frame.width - 75.0, y: (dayLable?.frame.minY)!, width: 60.0, height: 30.0))
        weekLable?.font = UIFont.systemFont(ofSize: weekFontSize)
        weekLable?.textColor = weekTextColor
        weekLable?.text = weekText
        weekLable?.textAlignment = .right
        weekLable?.center = CGPoint.init(x: (weekLable?.center.x)!, y: self.frame.height / 2)
        self.addSubview(weekLable!)
        //month label
        monthLable = UILabel.init(frame: CGRect.init(x: (dayLable?.frame.maxX)! + 10.0, y: (dayLable?.frame.minY)! + 10.0, width: 60.0, height: 11.0))
        monthLable?.text = monthText
        monthLable?.font = UIFont.systemFont(ofSize: monthFontSize)
        monthLable?.center = CGPoint.init(x: (monthLable?.center.x)!, y: (dayLable?.center.y)!)
        monthLable?.textColor = monthTextColor
        self.addSubview(monthLable!)
        //line
        let line: UIView = UIView.init(frame: CGRect.init(x: (monthLable?.frame.minX)!, y: (monthLable?.frame.maxY)! + 10.0, width: widht-space-dayLableWidth-20.0, height: 1))
        line.backgroundColor = UIColor.colorWithHex(hexColor: 0xF5F4FA)
        self.addSubview(line)
    }
    
}

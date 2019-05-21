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
    @objc public var dayLableWidth: CGFloat = 40.0
    @objc public var dayFontSize: CGFloat = 15.0
    @objc public var dayTextColor: UIColor = UIColor.white
    @objc public var dayLableBackgroundColor: UIColor = UIColor.colorWithHex(hexColor: 0x565B78)
    @objc public var weekFontSize: CGFloat = 12.0
    @objc public var weekLableWidht: CGFloat = 60.0
    @objc public var weekTextColor: UIColor = UIColor.colorWithHex(hexColor: 0x565B78)
    @objc public var monthFontSize: CGFloat = 12.0
    @objc public var monthLableWidht: CGFloat = 60.0
    @objc public var monthTextColor: UIColor = UIColor.colorWithHex(hexColor: 0x565B78)
    
    fileprivate var line: UIView?
    @objc public var underLineColor: UIColor = UIColor.colorWithHex(hexColor: 0xF5F4FA)
    
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
        if dayLable == nil {
            dayLable = UILabel.init()
        }
        dayLable?.text = dayText
        dayLable?.font = UIFont.systemFont(ofSize: dayFontSize)
        dayLable?.textColor = dayTextColor
        dayLable?.textAlignment = .center
        dayLable?.backgroundColor = dayLableBackgroundColor
        dayLable?.layer.cornerRadius = dayLableWidth / 2
        dayLable?.layer.masksToBounds = true
        dayLable?.numberOfLines = 0
        dayLable?.sizeToFit()
        dayLable?.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(dayLable!)
        //week label
        if weekLable == nil {
            weekLable = UILabel.init()
        }
        weekLable?.font = UIFont.systemFont(ofSize: weekFontSize)
        weekLable?.textColor = weekTextColor
        weekLable?.text = weekText
        weekLable?.textAlignment = .right
        weekLable?.numberOfLines = 0
        weekLable?.sizeToFit()
        weekLable?.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(weekLable!)
        //month label
        if monthLable == nil {
            monthLable = UILabel.init()
        }
        monthLable?.text = monthText
        monthLable?.font = UIFont.systemFont(ofSize: monthFontSize)
        monthLable?.textColor = monthTextColor
        monthLable?.numberOfLines = 0
        monthLable?.sizeToFit()
        monthLable?.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(monthLable!)
        //line
        if line == nil {
            line = UIView.init()
        }
        line?.backgroundColor = underLineColor
        line?.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(line!)
        ///add constraint...
        self.layoutConstraint()
    }
    
    ///Add constraint......
    fileprivate func layoutConstraint() {
        let viewsDictionary = [
            "line":line,
            "dayLable":dayLable,
            "weekLable":weekLable,
            "monthLable":monthLable]
        var allConstraints: [NSLayoutConstraint] = []
        
        let iconVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-0-[dayLable]-0-[line(1)]-0-|",
            metrics: nil,
            views: viewsDictionary as [String : Any])
        allConstraints += iconVerticalConstraints
        
        let contentLableVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-[weekLable]-[line(1)]-|",
            metrics: nil,
            views: viewsDictionary as [String : Any])
        allConstraints += contentLableVerticalConstraints

        let subContentLableVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-[monthLable]-[line(1)]-|",
            metrics: nil,
            views: viewsDictionary as [String : Any])
        allConstraints += subContentLableVerticalConstraints
        
        let rowHorizontalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-\(space)-[dayLable(\(dayLableWidth))]-[monthLable(\(monthLableWidht))]-[weekLable]-10-|",
            options:[],
            metrics: nil,
            views: viewsDictionary as [String : Any])
        allConstraints += rowHorizontalConstraints
        
        let rowHorizontalLineConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-[dayLable]-\(space)-[line]-\(space)-|", options: [], metrics: nil, views: viewsDictionary as [String : Any])
        allConstraints += rowHorizontalLineConstraints
        
        self.addConstraints(allConstraints)
    }
    
}

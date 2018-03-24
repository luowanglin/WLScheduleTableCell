//
//  WLScheduleCellHeadView.swift
//  WLScheduleTableCellDemo
//
//  Created by luowanglin on 2018/3/23.
//  Copyright © 2018年 luowanglin. All rights reserved.
//

import UIKit

public class WLScheduleCellHeadView: UIView {
    /********default value*******/
    private var _dayFontSize: CGFloat = 30.0
    private var _dayTextColor: UIColor = UIColor.init(red: 51.0/255.0, green: 102.0/255.0, blue: 204.0/255.0, alpha: 1.0)
    private var _weekFontSize: CGFloat = UIFont.systemFontSize
    private var _weekTextColor: UIColor = UIColor.colorWithHex(hexColor: 0x59AFF6)
    private var _monthFontSize: CGFloat = 18.0
    private var _monthTextColor: UIColor = UIColor.colorWithHex(hexColor: 0x59AFF6)
    /***************************/
    private let widht: CGFloat = UIScreen.main.bounds.width
    public var dayLable: UILabel?
    public var weekLable: UILabel?
    public var monthLable: UILabel?
    public var dayText: String?
    public var space: CGFloat = 10.0
    public var dayLableWidth: CGFloat = 45.0
    public var dayFontSize: CGFloat? {
        get{
            return _dayFontSize
        }
        set{
            if let value = newValue {
                _dayFontSize = value
            }
        }
    }
    var dayTextColor: UIColor? {
        get{
            return _dayTextColor
        }
        set{
            if let value = newValue {
                _dayTextColor = value
            }
        }
    }
    var weekText: String?
    var weekFontSize: CGFloat? {
        get{
            return _weekFontSize
        }
        set{
            if let value = newValue {
                _weekFontSize = value
            }
        }
    }
    var weekTextColor: UIColor? {
        get{
            return _weekTextColor
        }
        set{
            if let value = newValue {
                _weekTextColor = value
            }
        }
    }
    var monthText: String?
    var monthFontSize: CGFloat? {
        get{
            return _monthFontSize
        }
        set{
            if let value = newValue {
                _monthFontSize = value
            }
        }
    }
    var monthTextColor: UIColor? {
        get{
            return _monthTextColor
        }
        set{
            if let value = newValue {
                _monthTextColor = value
            }
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        //value default at init ...
        self.backgroundColor = UIColor.white
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func beginLaoutForElement() {
        
        //day label
        dayLable = UILabel.init(frame: CGRect.init(x: space, y: 0.0, width: dayLableWidth, height: 50))
        dayLable?.text = dayText
        dayLable?.font = UIFont.systemFont(ofSize: dayFontSize!)
        dayLable?.textColor = dayTextColor
        self.addSubview(dayLable!)
        //week label
        weekLable = UILabel.init(frame: CGRect.init(x: widht - 75.0, y: (dayLable?.frame.minY)! + 10.0, width: 60.0, height: 30.0))
        weekLable?.font = UIFont.systemFont(ofSize: weekFontSize!)
        weekLable?.textColor = weekTextColor
        weekLable?.textAlignment = .right
        self.addSubview(weekLable!)
        //month label
        monthLable = UILabel.init(frame: CGRect.init(x: (dayLable?.frame.maxX)!, y: (dayLable?.frame.minY)! + 10.0, width: 60.0, height: 30.0))
        monthLable?.text = monthText
        monthLable?.font = UIFont.systemFont(ofSize: monthFontSize!)
        monthLable?.textColor = monthTextColor
        self.addSubview(monthLable!)
        //line
        let line: UIView = UIView.init(frame: CGRect.init(x: (dayLable?.frame.maxX)!, y: (monthLable?.frame.maxY)!, width: widht-space-dayLableWidth-20.0, height: 1))
        line.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        self.addSubview(line)
        
        
    }

}

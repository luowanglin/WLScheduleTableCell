//
//  WLExtensionColor.swift
//  WLScheduleTableCellDemo
//
//  Created by luowanglin on 2018/3/23.
//  Copyright © 2018年 luowanglin. All rights reserved.
//
import UIKit

extension UIColor {
    
    static public func colorWithHex(hexColor:CLong)->UIColor {
        return UIColor.colorWithHex(hexColor: hexColor, alpha: 1.0)
    }
    
    static public func colorWithHex(hexColor:CLong, alpha opacity:CGFloat)->UIColor {
        let red:CGFloat = CGFloat((hexColor & 0xff0000) >> 16) / 255.0
        let green:CGFloat = CGFloat((hexColor & 0xFF00) >> 8) / 255.0
        let blue:CGFloat = CGFloat((hexColor & 0xFF)) / 255.0
        return UIColor.init(red: red, green: green, blue: blue, alpha: opacity)
    }
    
}

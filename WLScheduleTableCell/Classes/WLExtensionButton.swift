//
//  WLExtensionButton.swift
//  WLScheduleTableCellDemo
//
//  Created by luowanglin on 2018/3/23.
//  Copyright © 2018年 luowanglin. All rights reserved.
//

import UIKit


@objc public extension UIButton {
    
    private struct AssociatedKeys {
        static var indexPath:IndexPath?
    }
    
    @objc var indexPath:IndexPath? {
        get{
            return objc_getAssociatedObject(self, &AssociatedKeys.indexPath) as? IndexPath
        }
        set{
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedKeys.indexPath, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
}

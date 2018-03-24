//
//  WLScheduleTableViewCell.swift
//  WLScheduleTableCellDemo
//
//  Created by luowanglin on 2018/3/23.
//  Copyright © 2018年 luowanglin. All rights reserved.
//

import UIKit

public protocol WLScheduleTableViewCellDelegate {
    /*
     *展开列表
     **/
    func didSelect(at index:IndexPath)
    
}

public class WLScheduleTableViewCell: UITableViewCell {

    public var scheduleDelegate: WLScheduleTableViewCellDelegate?
    
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

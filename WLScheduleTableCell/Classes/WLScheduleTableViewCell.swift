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
    public var indexPath: IndexPath?
    public var isFirstCell: Bool = false
    public var isLastCell: Bool = false
    public var marginLeft: CGFloat = 0.0
    public var contentText: String = ""
    public var contentFontSize: CGFloat = 12.0
    public var contentTextColor: UIColor = UIColor.colorWithHex(hexColor: 0x565B78)
    public var contentLable: UILabel?
    
    public var subContentText: String = ""
    public var subContentFontSize: CGFloat = 12.0
    public var subContentTextColor: UIColor = UIColor.colorWithHex(hexColor: 0x565B78)
    public var subContentLable: UILabel?
    
    public var timeText: String = ""
    public var timeFontSize: CGFloat = 12.0
    public var timeColor: UIColor = UIColor.colorWithHex(hexColor: 0x565B78)
    public var timeLable: UILabel?
    
    public var isShowBtn: Bool = false
    public var isShowPicture: Bool = false
    public var isShowVideo: Bool = false
    public var isExpand: Bool = false
    public var circleColor: UIColor = UIColor.colorWithHex(hexColor: 0x565B78)
    public var expandBtn: UIButton?
    public var videoBtn: UIButton?
    public var pictureBtn: UIButton?
    
    public var line: WLScheduleCellLineView?
    
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        self.selectionStyle = .none
    }
    
    public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.white
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func beginForElementLayout() {
        let height: CGFloat = self.frame.size.height
        /***Line***/
        if line == nil {
            line = WLScheduleCellLineView.init(frame: CGRect.init(x: marginLeft, y: 0.0, width: 20.0, height: height))
            line?.arcRadius = 3.0
            line?.lineWidht = 1.0
            line?.backgroundColor = UIColor.white
        }
        line?.isHead = self.isFirstCell
        line?.isTail = self.isLastCell
        line?.arcColor = self.circleColor
        line?.pathDraw()
        self.contentView.addSubview(line!)
        /***Time***/
        if timeLable == nil {
            timeLable = UILabel.init(frame: CGRect.init(x: (line?.frame.maxX)!, y: (line?.frame.minY)!, width: 60.0, height: height))
        }
        timeLable?.text = timeText
        timeLable?.font = UIFont.systemFont(ofSize: timeFontSize)
        timeLable?.textColor = self.timeColor
        self.contentView.addSubview(timeLable!)
        /***Content Title***/
        if contentLable == nil {
            contentLable = UILabel.init()
        }
        let contentSize: CGSize = contentText.size(withAttributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: contentFontSize)])
        if isExpand {
            contentLable?.frame = CGRect.init(x: (timeLable?.frame.maxX)! - 15.0, y: (timeLable?.frame.minY)!, width: contentSize.width, height: height)
        }else{
            contentLable?.frame = CGRect.init(x: (timeLable?.frame.maxX)!, y: (timeLable?.frame.minY)!, width: contentSize.width, height: height)
        }
        contentLable?.text = contentText
        contentLable?.font = UIFont.systemFont(ofSize: contentFontSize)
        contentLable?.textColor = contentTextColor
        contentLable?.sizeToFit()
        contentLable?.center = CGPoint.init(x: (contentLable?.center.x)!, y: (timeLable?.center.y)!)
        self.contentView.addSubview(contentLable!)
        /***Sub Content***/
        if subContentLable == nil {
            subContentLable = UILabel.init()
        }
        subContentLable?.frame = CGRect.init(x: (contentLable?.frame.maxX)! + 6.0, y: (contentLable?.frame.minY)!, width: 0.0, height: 0.0)
        subContentLable?.text = self.subContentText
        subContentLable?.textColor = self.subContentTextColor
        subContentLable?.font = UIFont.systemFont(ofSize: self.subContentFontSize)
        subContentLable?.sizeToFit()
        self.contentView.addSubview(subContentLable!)
    }
    
}

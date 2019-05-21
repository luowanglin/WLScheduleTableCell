//
//  WLScheduleTableViewCell.swift
//  WLScheduleTableCellDemo
//
//  Created by luowanglin on 2018/3/23.
//  Copyright © 2018年 luowanglin. All rights reserved.
//

import UIKit

@objc public protocol WLScheduleTableViewCellDelegate: NSObjectProtocol {
    @objc optional func didSelectedExpand(at index: IndexPath)
    @objc optional func didSelectedVideo(at index: IndexPath)
    @objc optional func didSelectedPicture(at index: IndexPath)
}

public class WLScheduleTableViewCell: UITableViewCell {
    @objc public var scheduleDelegate: WLScheduleTableViewCellDelegate?
    @objc public var isTimeLineBegin: Bool = false
    @objc public var isTimeLineEnd: Bool = false
    @objc public var indexPath: IndexPath?
    @objc public var marginLeft: CGFloat = 0.0
    @objc public var contentText: String = ""
    @objc public var contentFontSize: CGFloat = 12.0
    @objc public var contentTextColor: UIColor = UIColor.colorWithHex(hexColor: 0x565B78)
    @objc public var contentLabelMarginLeft: CGFloat = 0.0
    @objc public var contentLableMarginRight: CGFloat = 6.0
    @objc private var contentLable: UILabel?
    
    @objc public var subContentText: String = ""
    @objc public var subContentFontSize: CGFloat = 12.0
    @objc public var subContentTextColor: UIColor = UIColor.colorWithHex(hexColor: 0x565B78)
    private var subContentLable: UILabel?
    
    @objc public var timeText: String = ""
    @objc public var timeFontSize: CGFloat = 12.0
    @objc public var timeColor: UIColor = UIColor.colorWithHex(hexColor: 0x565B78)
    private var timeLable: UILabel?
    
    @objc public var isShowExpandBtn: Bool = false
    @objc public var isShowPicture: Bool = false
    @objc public var isShowVideo: Bool = false
    @objc public var isExpand: Bool = false
    
    @objc public var circleColor: UIColor = UIColor.colorWithHex(hexColor: 0x565B78)
    @objc public var expandBtnImage: String = "e-down.png"
    @objc public var expandBtn: UIButton?
    @objc public var videoBtnImage: String = "lwl_video.png"
    @objc public var videoBtn: UIButton?
    @objc public var pictureBtnImage: String = "lwl_picture.png"
    @objc public var pictureBtn: UIButton?
    @objc public var expandBtnTitle: String = "展开"
    @objc public var expandBtnTitleFontSize: CGFloat = 12.0
    @objc public var contentHeight: CGFloat = 44.0
    
    @objc public var line: WLScheduleCellLineView?
    
    
    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        self.selectionStyle = .none
    }
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.white
        self.clipsToBounds = false
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @objc public func commit() {
        /***Clear all of subviews***/
        while self.contentView.subviews.last != nil {
            self.contentView.subviews.last?.removeFromSuperview()
        }
        /***Hide all of separator line***/
        self.separatorInset = UIEdgeInsets.init(top: 0.0, left: UIScreen.main.bounds.width, bottom: 0.0, right: 0.0)
        /***Line***/
        if line == nil {
            line = WLScheduleCellLineView.init()
            line?.backgroundColor = UIColor.white
        }
        line?.frame = CGRect.init(x: marginLeft, y: 0.0, width: 20.0, height: contentHeight)
        line?.translatesAutoresizingMaskIntoConstraints = false
        line?.arcColor = self.circleColor
        line?.isHead = self.isTimeLineBegin
        line?.isTail = self.isTimeLineEnd
        line?.drawPath()
        self.contentView.addSubview(line!)
        
        /***Time***/
        if timeLable == nil {
            timeLable = UILabel.init()
        }
        timeLable?.translatesAutoresizingMaskIntoConstraints = false
        timeLable?.text = timeText
        timeLable?.font = UIFont.systemFont(ofSize: timeFontSize)
        timeLable?.textColor = self.timeColor
        self.contentView.addSubview(timeLable!)
        
        /***Content Title***/
        if contentLable == nil {
            contentLable = UILabel.init()
        }
        if isExpand {
            contentLabelMarginLeft = -15.0
        }else{
            contentLabelMarginLeft = 0.0
        }
        contentLable?.translatesAutoresizingMaskIntoConstraints = false
        contentLable?.text = contentText
        contentLable?.font = UIFont.systemFont(ofSize: contentFontSize)
        contentLable?.textColor = contentTextColor
        contentLable?.sizeToFit()
        self.contentView.addSubview(contentLable!)
        
        /***Sub Content***/
        if subContentLable == nil {
            subContentLable = UILabel.init()
        }
        subContentLable?.translatesAutoresizingMaskIntoConstraints = false
        subContentLable?.text = self.subContentText
        subContentLable?.textColor = self.subContentTextColor
        subContentLable?.font = UIFont.systemFont(ofSize: self.subContentFontSize)
        subContentLable?.sizeToFit()
        self.contentView.addSubview(subContentLable!)
        
        ///ExpandBtn......
        if expandBtn == nil {
            expandBtn = UIButton.init(type: UIButton.ButtonType.custom)
        }
        expandBtn?.translatesAutoresizingMaskIntoConstraints = false
        expandBtn?.setTitle(expandBtnTitle, for: UIControl.State.normal)
        expandBtn?.imageView?.contentMode = .scaleAspectFit
        expandBtn?.setImage(UIImage.init(named: expandBtnImage), for: UIControl.State.normal)
        expandBtn?.titleLabel?.font = UIFont.systemFont(ofSize: expandBtnTitleFontSize)
        expandBtn?.setTitleColor(subContentTextColor, for: UIControl.State.normal)
        expandBtn?.isEnabled = false
        expandBtn?.addTarget(self, action: #selector(expandAction(sender:)), for: UIControl.Event.touchUpInside)
        assert(indexPath != nil, "Set property of indexPath,Please!")
        expandBtn?.indexPath = indexPath
        self.contentView.addSubview(expandBtn!)
        if isShowExpandBtn {
            expandBtn?.isHidden = false
        }else{
            expandBtn?.isHidden = true
        }
        
        ///Video Btn
        if videoBtn == nil {
            videoBtn = UIButton.init(type: UIButton.ButtonType.custom)
        }
        videoBtn?.translatesAutoresizingMaskIntoConstraints = false
        videoBtn?.imageView?.contentMode = .scaleAspectFit
        videoBtn?.setImage(UIImage.init(named: videoBtnImage), for: UIControl.State.normal)
        videoBtn?.addTarget(self, action: #selector(videoAction(sender:)), for: UIControl.Event.touchUpInside)
        self.contentView.addSubview(videoBtn!)
        videoBtn?.indexPath = indexPath
        if isShowVideo {
            videoBtn?.isHidden = false
        }else{
            videoBtn?.isHidden = true
        }
      
        ///Pictrue Btn
        if pictureBtn == nil {
            pictureBtn = UIButton.init(type: UIButton.ButtonType.custom)
        }
        pictureBtn?.translatesAutoresizingMaskIntoConstraints = false
        pictureBtn?.imageView?.contentMode = .scaleAspectFit
        pictureBtn?.setImage(UIImage.init(named: pictureBtnImage), for: UIControl.State.normal)
        pictureBtn?.addTarget(self, action: #selector(pictureAction(sender:)), for: UIControl.Event.touchUpInside)
        pictureBtn?.indexPath = indexPath
        self.contentView.addSubview(pictureBtn!)
        if isShowPicture {
            pictureBtn?.isHidden = false
        }else{
            pictureBtn?.isHidden = true
        }
        
        layoutConstraint()
    }
    
    ///Add constraint......
    fileprivate func layoutConstraint() {
        let viewsDictionary = [
            "line":line,
            "timeLable":timeLable,
            "contentLable":contentLable,
            "subContentLable":subContentLable,
            "expandBtn":expandBtn,
            "videoBtn":videoBtn,
            "pictrueBtn":pictureBtn]
        var allConstraints: [NSLayoutConstraint] = []
  
        let iconVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-0-[line]-0-|",
            metrics: nil,
            views: viewsDictionary as [String : Any])
        allConstraints += iconVerticalConstraints
        
        let nameLabelVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-[timeLable]-|",
            metrics: nil,
            views: viewsDictionary as [String : Any])
        allConstraints += nameLabelVerticalConstraints
        
        let contentLableVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-[contentLable]-|",
            metrics: nil,
            views: viewsDictionary as [String : Any])
        allConstraints += contentLableVerticalConstraints
        
        let subContentLableVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-[subContentLable]-|",
            metrics: nil,
            views: viewsDictionary as [String : Any])
        allConstraints += subContentLableVerticalConstraints
        
        let expandBtnVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-[expandBtn]-|",
            metrics: nil,
            views: viewsDictionary as [String : Any])
        allConstraints += expandBtnVerticalConstraints
        
        let videoBtnVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-7.5-[videoBtn]-7.5-|",
            metrics: nil,
            views: viewsDictionary as [String : Any])
        allConstraints += videoBtnVerticalConstraints
        
        let pictureBtnVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-7.5-[pictrueBtn]-7.5-|",
            metrics: nil,
            views: viewsDictionary as [String : Any])
        allConstraints += pictureBtnVerticalConstraints
        
        let rowHorizontalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-\(marginLeft)-[line(20)]-[timeLable(60)]-(\(contentLabelMarginLeft))-[contentLable]-\(contentLableMarginRight)-[subContentLable]-[expandBtn]-[videoBtn(25)]-[pictrueBtn(25)]",
            options:[],
            metrics: nil,
            views: viewsDictionary as [String : Any])
        allConstraints += rowHorizontalConstraints
        
        self.contentView.addConstraints(allConstraints)
    }
    
    @objc fileprivate func expandAction(sender: UIButton) {
        if self.scheduleDelegate != nil && (self.scheduleDelegate?.responds(to: #selector(WLScheduleTableViewCellDelegate.didSelectedExpand(at:)))) != nil {
            self.scheduleDelegate?.didSelectedExpand?(at: sender.indexPath!)
        }
    }
    
    @objc fileprivate func videoAction(sender: UIButton) {
        if self.scheduleDelegate != nil && (self.scheduleDelegate?.responds(to: #selector(WLScheduleTableViewCellDelegate.didSelectedVideo(at:)))) != nil {
            self.scheduleDelegate?.didSelectedVideo?(at: sender.indexPath!)
        }
    }
    
    @objc fileprivate func pictureAction(sender: UIButton) {
        if self.scheduleDelegate != nil && (self.scheduleDelegate?.responds(to: #selector(WLScheduleTableViewCellDelegate.didSelectedPicture(at:)))) != nil {
            self.scheduleDelegate?.didSelectedPicture?(at: sender.indexPath!)
        }
    }
    
}


//
//  LWLTableViewCell.h
//  LWLScheduleListDemo
//
//  Created by luowanglin on 2017/3/30.
//  Copyright © 2017年 luowanglin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LWLTableViewCellDelegate <NSObject>
//列表展开响应代理
- (void)expandListAction;
//视频播放响应代理
- (void)videoTouchWithIndex:(NSIndexPath*) indexPath;
//图片展示响应代理
- (void)pictureTouchWithIndex:(NSIndexPath*) indexPath;

@end

@interface LWLTableViewCell : UITableViewCell
    
@property(nonatomic,weak)id<LWLTableViewCellDelegate> delegate;

/**
 *请设置该值，否则将中断运行，关系到图片、视频的取值问题
 */
@property(nonatomic,strong) NSIndexPath *indexPath;

@property BOOL isHead;
@property BOOL isTail;

@property CGFloat spaceValue;

@property(nonatomic)NSString *contentText;
@property CGFloat contentFontSize;
@property(nonatomic)UIColor *contentColor;
@property (nonatomic)UILabel *contentLable;//content text

@property(nonatomic)NSString *subContentText;
@property CGFloat subContentFontSize;
@property(nonatomic)UIColor *subContentColor;
@property(nonatomic)UILabel *subContenView;

@property(nonatomic)NSString *timeText;
@property CGFloat timeFontSize;
@property(nonatomic)UIColor *timeColor;

@property(nonatomic)NSString *imgUrl;
@property(nonatomic)NSString *videoUrl;
    
@property BOOL isShowBtn;//是否有展开按钮
@property BOOL isShowPicture;//是否有图片按钮
@property BOOL isShowVideo;//是否与视频按钮

@property(nonatomic)UIColor *circleColor;

@property(nonatomic,strong)UIButton *expandBtn;

@property(nonatomic)BOOL isExpand;

@property(nonatomic,strong) UIButton *videoBtn;
@property(nonatomic,strong) UIButton *pictureBtn;
@property(nonatomic,strong) UILabel *timeView;


    
-(void)beginForElementLayout;

@end









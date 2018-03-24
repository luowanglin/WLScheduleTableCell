//
//  LWLTableViewCell.m
//  LWLScheduleListDemo
//
//  Created by luowanglin on 2017/3/30.
//  Copyright © 2017年 luowanglin. All rights reserved.
//

#import "LWLTableViewCell.h"
#import "LWLLineView.h"
#import "UIButton+LWLMediaButton.h"
#import "UIColor+Hex.h"

@interface LWLTableViewCell ()
@property(nonatomic,strong) LWLLineView *lineView;
@end

@implementation LWLTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        //Init for value
        [self initForDefaultValue];
        self.backgroundColor = [UIColor whiteColor];
    }
    
    return self;
}

    
-(void)initForDefaultValue{
    
    _contentText = _contentText ? _contentText : @"";
    _contentFontSize = _contentFontSize ? _contentFontSize : [UIFont systemFontSize];
    _contentColor = _contentColor ? _contentColor : [UIColor grayColor];
    
    _subContentText = _subContentText ? _subContentText : @"";
    _subContentFontSize = _subContentFontSize ? _subContentFontSize : [UIFont systemFontSize];
    _subContentColor = _subContentColor ? _subContentColor : [UIColor grayColor];
    
    _timeText = _timeText ? _timeText : @"";
    _timeFontSize = _timeFontSize ? _timeFontSize : [UIFont systemFontSize];
    _timeColor = _timeColor ? _timeColor : [UIColor grayColor];
    
    _imgUrl = _imgUrl ? _imgUrl : @"";
    _videoUrl = _videoUrl ? _videoUrl : @"";
    
    _spaceValue = _spaceValue ? _spaceValue : 60.f;
    
    _circleColor = _circleColor ? _circleColor : [UIColor colorWithHex:0x59AFF6];
    
}

-(void)beginForElementLayout{
    
    CGFloat height = self.frame.size.height;
//    CGFloat width = self.frame.size.width;
    
    //底线
    if (!_lineView) {
       _lineView = [[LWLLineView alloc]initWithFrame:CGRectMake(_spaceValue, 0, 20, height)];
       _lineView.arcRadius = 3.f;
       _lineView.lineWidth = 1.f;
       _lineView.backgroundColor = [UIColor whiteColor];
    }
//    _lineView.tintColor = [UIColor colorWithHex:0x59AFF6];
    _lineView.isTail = _isTail;
    _lineView.isHead = _isHead;
    _lineView.arcColor = _circleColor;
    [_lineView pathDraw];
    [self.contentView addSubview:_lineView];
    //时间
    if (!_timeView) {
//        CGSize timeSize = [_timeText sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:_timeFontSize]}];
        _timeView = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_lineView.frame), CGRectGetMinY(_lineView.frame), 45.f, height)];
    }
    _timeView.text = _timeText;
    _timeView.font = [UIFont systemFontOfSize:_timeFontSize];
    _timeView.textColor = _timeColor;
    [self.contentView addSubview:_timeView];

    //标题
    if (!_contentLable) {
//        CGFloat contentW = WIDTH - (_spaceValue + 20 + 40 + 6 + _spaceValue);
        _contentLable = [[UILabel alloc]init];
    }
    
    CGSize contentSize = [_contentText sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:_contentFontSize]}];
    if (!_isExpand) {
        [_contentLable setFrame:CGRectMake(CGRectGetMaxX(_timeView.frame)-15, CGRectGetMinY(_timeView.frame), contentSize.width, height)];
    }else{
        [_contentLable setFrame:CGRectMake(CGRectGetMaxX(_timeView.frame), CGRectGetMinY(_timeView.frame), contentSize.width, height)];
    }

    _contentLable.text = _contentText;
    _contentLable.font = [UIFont systemFontOfSize:_contentFontSize];
    _contentLable.textColor = _contentColor;
    [_contentLable sizeToFit];
    _contentLable.center = CGPointMake(_contentLable.center.x, _timeView.center.y);
    [self.contentView addSubview:_contentLable];
    
    if (!_subContenView) {
      _subContenView = [[UILabel alloc]init];
    }
    [_subContenView setFrame:CGRectMake(CGRectGetMaxX(_contentLable.frame)+6.f, CGRectGetMinY(_contentLable.frame), 0, 0)];
    _subContenView.text = _subContentText;
    _subContenView.textColor = _subContentColor;
    _subContenView.font = [UIFont systemFontOfSize:_subContentFontSize];
    [_subContenView sizeToFit];
    
    [self.contentView addSubview:_subContenView];
    
    //展开按钮
    if (_expandBtn == nil) {
        _expandBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _expandBtn.frame = CGRectMake(CGRectGetMaxX(_subContenView.frame) - 20.f, CGRectGetMinY(_timeView.frame), 66.f, self.frame.size.height);
        [_expandBtn setTitle:@"展开" forState:(UIControlStateNormal)];
        [_expandBtn.imageView setContentMode:(UIViewContentModeScaleAspectFit)];
        [_expandBtn setImage:[UIImage imageNamed:@"e-down"] forState:(UIControlStateNormal)];//
        _expandBtn.titleLabel.font = [UIFont systemFontOfSize:12.f];
        [_expandBtn setImageEdgeInsets:UIEdgeInsetsMake(14, 50, 14, 0)];
        [_expandBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 16)];
        [_expandBtn setTitleColor:_subContentColor forState:(UIControlStateNormal)];
        _expandBtn.enabled = NO;
        [_expandBtn addTarget:self action:@selector(expandAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    _expandBtn.frame = CGRectMake(CGRectGetMaxX(_subContenView.frame) - 20.f, CGRectGetMinY(_timeView.frame), _expandBtn.frame.size.width, _expandBtn.frame.size.height);
    _expandBtn.center = CGPointMake(_expandBtn.center.x, _timeView.center.y);
    
    if (_isShowBtn) {
        [self.contentView addSubview:_expandBtn];
    }else{
        [_expandBtn removeFromSuperview];
    }
    
    //视频按钮
    if (_videoBtn == nil) {
        _videoBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _videoBtn.frame = CGRectMake(CGRectGetMaxX(_expandBtn.frame), CGRectGetMinY(_timeView.frame), 30.f, self.frame.size.height-15);
        _videoBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [_videoBtn setImage:[UIImage imageNamed:@"lwl_video.png"] forState:(UIControlStateNormal)];
        _videoBtn.imageEdgeInsets = UIEdgeInsetsMake(7, 8, 7, 8);
        [_videoBtn addTarget:self action:@selector(videoAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }else{
        _videoBtn.imageEdgeInsets = UIEdgeInsetsZero;
    }
    
    if (_isShowBtn) {
        _videoBtn.frame = CGRectMake(CGRectGetMaxX(_expandBtn.frame), CGRectGetMinY(_timeView.frame), 30.f, self.frame.size.height-15);
    }else{
        _videoBtn.frame = CGRectMake(CGRectGetMaxX(_subContenView.frame), CGRectGetMinY(_timeView.frame), 30.f, self.frame.size.height-15);
    }
    //indexPath 不能为空......
    NSAssert(_indexPath, @"请设置LWLTableViewCell中的indexPath属性值");
    _videoBtn.indexPath = _indexPath;
    
    _videoBtn.center = CGPointMake(_videoBtn.center.x, _timeView.center.y);
    
    if (_isShowVideo) {
        [self.contentView addSubview:_videoBtn];
    }

    
    //图片按钮
    if (_pictureBtn == nil) {
        _pictureBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _pictureBtn.frame = CGRectMake(CGRectGetMaxX(_videoBtn.frame), CGRectGetMinY(_timeView.frame), 25.f, self.frame.size.height-15);
        _pictureBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [_pictureBtn setImage:[UIImage imageNamed:@"lwl_picture.png"] forState:(UIControlStateNormal)];
        _pictureBtn.imageEdgeInsets = UIEdgeInsetsMake(7, 4, 7, 4);
        [_pictureBtn addTarget:self action:@selector(pictureAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }else{
        _pictureBtn.imageEdgeInsets = UIEdgeInsetsZero;
    }
    
    if (_isShowVideo) {
        _pictureBtn.frame = CGRectMake(CGRectGetMaxX(_videoBtn.frame), CGRectGetMinY(_timeView.frame), 25.f, self.frame.size.height-15);
    }else{
        if (_isShowBtn) {
           _pictureBtn.frame = CGRectMake(CGRectGetMaxX(_expandBtn.frame), CGRectGetMinY(_timeView.frame), 25.f, self.frame.size.height-15);
        }else{
           _pictureBtn.frame = CGRectMake(CGRectGetMaxX(_subContenView.frame), CGRectGetMinY(_timeView.frame), 25.f, self.frame.size.height-15);
        }
    }
    //indexPath 不能为空......
    NSAssert(_indexPath, @"请设置LWLTableViewCell中的indexPath属性值");
    _pictureBtn.indexPath = _indexPath;
    _pictureBtn.center = CGPointMake(_pictureBtn.center.x, _timeView.center.y);
    
    if (_isShowPicture) {
        [self.contentView addSubview:_pictureBtn];
    }
    
}

//MARK:展开事件
- (void)expandAction:(UIButton*)sender{
//    sender.selected = !sender.selected;
//    [self.delegate expandListAction];
}

//MARK:视频播放
- (void)videoAction:(UIButton*)sender{
    
    [self.delegate videoTouchWithIndex:sender.indexPath];
    
}
    
//MARK:图片展示
- (void)pictureAction:(UIButton*)sender{

    [self.delegate pictureTouchWithIndex:sender.indexPath];
    
}

//Get super view contrllor
- (UIViewController*)viewController {
    
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;  
}



@end





















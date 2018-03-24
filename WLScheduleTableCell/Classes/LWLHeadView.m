//
//  LWLHeadView.m
//  LWLScheduleListDemo
//
//  Created by luowanglin on 2017/3/30.
//  Copyright © 2017年 luowanglin. All rights reserved.
//

#import "LWLHeadView.h"
#import "UIColor+Hex.h"

#define TEXT_COLOR 0x59AFF6

@interface LWLHeadView ()

@end

@implementation LWLHeadView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        //value default init...
        [self initForDefaultValue];
    }
    
    return self;
}

- (void)initForDefaultValue{
    //day
    _dayFontSize = _dayFontSize ? _dayFontSize : 30.f;
    _dayTextColor = _dayTextColor ? _dayTextColor : [UIColor colorWithRed:51.0/255.0 green:102.0/255.0 blue:204.0/255.0 alpha:1.0];
    //week
    _weekFontSize = _weekFontSize ? _weekFontSize : [UIFont systemFontSize];
    _weekTextColor = _weekTextColor ? _weekTextColor : [UIColor colorWithHex:TEXT_COLOR];
    //month
    _monthFontSize = _monthFontSize ? _monthFontSize : 18.f;
    _monthTextColor = _monthTextColor ? _monthTextColor : [UIColor colorWithHex:TEXT_COLOR];
    
    self.backgroundColor = [UIColor whiteColor];
    
}


- (void)beginElementLayout{
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
//    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    CGFloat space = 10.f;
    CGFloat dayLableW = 45.f;
    
    //Day Label
    UILabel *dayLable = [[UILabel alloc]initWithFrame:CGRectMake(space, 0, dayLableW,50)];
    dayLable.text = _dayText;
    dayLable.font = [UIFont systemFontOfSize:_dayFontSize];
    dayLable.textColor = _dayTextColor;
    [self addSubview:dayLable];
    //Week Label
    UILabel *weekLable = [[UILabel alloc]initWithFrame:CGRectMake(width-75, CGRectGetMinY(dayLable.frame)+10, 60, 30)];
    weekLable.text = _weekText;
    weekLable.textAlignment = NSTextAlignmentRight;
    weekLable.font = [UIFont systemFontOfSize:_weekFontSize];
    weekLable.textColor = _weekTextColor;
    [self addSubview:weekLable];
    //Month Lable
    UILabel *monthLable = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(dayLable.frame), CGRectGetMinY(dayLable.frame)+10, 60, 30)];
    monthLable.text = _monthText;
    monthLable.font = [UIFont systemFontOfSize:_monthFontSize];
    monthLable.textColor = _monthTextColor;
    [self addSubview:monthLable];
    
    //Under line
    UIView *underlineView = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(dayLable.frame), CGRectGetMaxY(monthLable.frame), width-space-dayLableW-20, 1)];
    underlineView.backgroundColor = [[UIColor grayColor]colorWithAlphaComponent:0.5];
    [self addSubview:underlineView];
    
}


@end








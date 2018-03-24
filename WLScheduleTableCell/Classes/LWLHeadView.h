//
//  LWLHeadView.h
//  LWLScheduleListDemo
//
//  Created by luowanglin on 2017/3/30.
//  Copyright © 2017年 luowanglin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LWLHeadView : UIView

@property(nonatomic)NSString *dayText;
@property CGFloat dayFontSize;
@property(nonatomic)UIColor *dayTextColor;
@property(nonatomic)NSString *weekText;
@property CGFloat weekFontSize;
@property(nonatomic)UIColor *weekTextColor;
@property(nonatomic)NSString *monthText;
@property CGFloat monthFontSize;
@property(nonatomic)UIColor *monthTextColor;

- (void)beginElementLayout;

@end

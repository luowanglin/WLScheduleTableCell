//
//  LWLLineView.h
//  LWLScheduleListDemo
//
//  Created by luowanglin on 2017/3/30.
//  Copyright © 2017年 luowanglin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LWLLineView : UIView

/**
 *@desc tint for line style
 */
@property(nonatomic,strong)UIColor *tintColor;

/**
 *@desc arcColor for circle color
 */
@property(nonatomic,strong)UIColor *arcColor;

/**
 *@desc lineColor for line color
 */
@property(nonatomic,strong)UIColor *lineColor;

/**
 *@desc paint for rang style
 */
@property BOOL isHead;
@property BOOL isTail;

/**
 *@desc width for line style
 */
@property CGFloat lineWidth;

/**
 *@desc radius for circle size
 */
@property CGFloat arcRadius;


/**
 *@desc custom background color image
 */
- (UIImage *)creatImgWithColor:(UIColor *)color;

/**
 *@desc execute draw of custom style
 */
- (void)pathDraw;

@end

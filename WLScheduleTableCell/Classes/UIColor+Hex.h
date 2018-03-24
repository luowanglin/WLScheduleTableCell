//
//  UIColor+Hex.h
//  LampApp
//
//  Created by luowanglin on 16/9/2.
//  Copyright © 2016年 luowanglin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)
+ (UIColor *)colorWithHex:(long)hexColor;
+ (UIColor *)colorWithHex:(long)hexColor alpha:(float)opacity;
@end



//
//  LWLLineView.m
//  LWLScheduleListDemo
//
//  Created by luowanglin on 2017/3/30.
//  Copyright © 2017年 luowanglin. All rights reserved.
//

#import "LWLLineView.h"
#import "UIColor+Hex.h"

#define DEFAULT_WIDTH 2.f
#define DEFAULT_COLOR [UIColor blueColor]
#define DEGREES_RADIUS(angle) ((angle) / 180.0 * M_PI)

@implementation LWLLineView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        //begin custom braw......
        
    }
    
    return self;
}

//Init for All of property assign to default value
- (void)initDefaultValue:(void(^)())finish{
    self.arcRadius = _arcRadius ? _arcRadius : 4.f;
    self.lineWidth = _lineWidth ? _lineWidth : 2.f;
    self.tintColor = _tintColor ? _tintColor : [UIColor colorWithHex:0x999998];
    self.arcColor = _arcColor ? _arcColor : [UIColor colorWithHex:0x999998];
    //invok recall function
    finish();
}



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ctx, self.backgroundColor.CGColor);
    CGContextFillRect(ctx, rect);
}

//begain to drawing function
- (void)pathDraw{
    __weak typeof(self) weakSelf = self;
    [self initDefaultValue:^{
        //default value init after to do...
        
        CAShapeLayer *sp = [[CAShapeLayer alloc]init];//线
        UIBezierPath *bp = [UIBezierPath bezierPath];
        
        CAShapeLayer *arcSp = [[CAShapeLayer alloc]init];//圆
        UIBezierPath *arcBp = [UIBezierPath bezierPath];
        
        CGFloat point_Y = (weakSelf.bounds.size.height - _arcRadius * 2)/2;
        CGFloat point_X = weakSelf.bounds.size.width / 2;
        
        if (!_isHead) {
            [bp moveToPoint:CGPointMake(point_X, 0)];
            [bp addLineToPoint:CGPointMake(point_X, point_Y)];
        }
        
        [arcBp addArcWithCenter:CGPointMake(point_X, point_Y + _arcRadius) radius:_arcRadius startAngle:DEGREES_RADIUS(-90.f) endAngle:DEGREES_RADIUS(270.f) clockwise:1];
        [arcBp closePath];
        
        if (!_isTail) {
            [bp moveToPoint:CGPointMake(point_X, point_Y + _arcRadius*2)];
            [bp addLineToPoint:CGPointMake(point_X,weakSelf.bounds.size.height)];
            [bp closePath];
        }
        
        sp.path = bp.CGPath;
        sp.lineCap = kCALineCapRound;
        sp.lineWidth = _lineWidth;
        sp.fillColor = [_tintColor colorWithAlphaComponent:0.8].CGColor;
        sp.strokeColor = [_tintColor colorWithAlphaComponent:0.8].CGColor;
        
        arcSp.path = arcBp.CGPath;
        arcSp.fillColor = _arcColor.CGColor;
        arcSp.strokeColor = _arcColor.CGColor;
        
        [weakSelf.layer addSublayer:sp];
        [weakSelf.layer addSublayer:arcSp];

    }];
    
}

//braw to background color image for custom
- (UIImage *)creatImgWithColor:(UIColor *)color{
    
    UIGraphicsBeginImageContext(self.bounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, self.bounds);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}



@end

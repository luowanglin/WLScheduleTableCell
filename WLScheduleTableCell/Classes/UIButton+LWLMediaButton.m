//
//  UIButton+LWLMediaButton.m
//  ComputerRoomButler
//
//  Created by luowanglin on 2017/5/17.
//  Copyright © 2017年 luowanglin. All rights reserved.
//

#import "UIButton+LWLMediaButton.h"
#import <objc/runtime.h>

static void *indexKey = &indexKey;

@implementation UIButton (LWLMediaButton)

-(void)setIndexPath:(NSIndexPath *)indexPath
{
    objc_setAssociatedObject(self, &indexKey, indexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


-(NSIndexPath *)indexPath{
    return objc_getAssociatedObject(self, &indexKey);
}

@end

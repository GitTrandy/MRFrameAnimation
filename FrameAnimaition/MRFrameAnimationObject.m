//
//  MRFrameAnimationObject.m
//  MRFrameAnimation
//
//  Created by 阿迪 on 16/3/15.
//  Copyright © 2016年 itrandy.com. All rights reserved.
//

#import "MRFrameAnimationObject.h"

@implementation MRFrameAnimationObject

- (instancetype)initWithView:(UIView *)view
{
    self = [super init];
    if (self) {
        [self setView:view];
    }
    return self;
}

- (void)setView:(UIView *)view
{
    _view = view;
    _frameX = view.frame.origin.x;
    _frameY = view.frame.origin.y;
    _frameW = view.frame.size.width;
    _frameH = view.frame.size.height;
}


@end

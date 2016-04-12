//
//  MRFrameAnimationProperty.m
//  MRFrameAnimation
//
//  Created by trandy on 16/3/20.
//  Copyright © 2016年 itrandy.com. All rights reserved.
//

#import "MRFrameAnimationProperty.h"

@implementation MRFrameAnimationProperty

- (instancetype)initWithView:(UIView *)view
{
    self = [super init];
    if (self) {
        _x = view.frame.origin.x;
        _y = view.frame.origin.y;
        _width = view.frame.size.width;
        _height = view.frame.size.height;
        _transform = view.transform;
    }
    return self;
}

@end

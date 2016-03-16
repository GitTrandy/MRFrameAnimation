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

#pragma mark - Private Method

#pragma mark - Public Method

- (BOOL)nextFrame
{
    [self setCurrentFrame:_currentFrame++];
    return _currentFrame >= _frameCount;
}

#pragma mark - Event Method

#pragma mark - Getter & Setter Method

- (void)setCurrentFrame:(NSInteger)frame
{
    _currentFrame = frame >= _frameCount ? _frameCount : frame;
}



@end

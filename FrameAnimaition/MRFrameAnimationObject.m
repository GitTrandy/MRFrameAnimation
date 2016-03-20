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
        _view = view;
        _originProperty = [[MRFrameAnimationProperty alloc] initWithView:view];
    }
    return self;
}

- (void)setView:(UIView *)view
{
    _view = view;
    _finalProperty = [[MRFrameAnimationProperty alloc] initWithView:view];
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

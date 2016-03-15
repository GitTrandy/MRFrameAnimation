//
//  UIView+MRFrameAnimation.m
//  MRFrameAnimation
//
//  Created by 阿迪 on 16/3/14.
//  Copyright © 2016年 itrandy.com. All rights reserved.
//

#import "UIView+MRFrameAnimation.h"
#import "MRFrameAnimationObject.h"

@implementation UIView (MRFrameAnimation)

- (void)animateWithFrameCount:(NSInteger)frameCount
                        delay:(NSTimeInterval)delay
                      options:(UIViewAnimationOptions)options
                   animations:(void (^)(void))animations
                   completion:(void (^)(BOOL finished))completion
{
    MRFrameAnimationObject *animationObject = [[MRFrameAnimationObject alloc] initWithView:self];
    animationObject.frameCount = frameCount;
    animationObject.setAnimationBlock = animations;
    animationObject.completionAnimationBlock = completion;
    [[MRFrameAnimationManager sharedManager] addAnimationObject:animationObject];
}

- (void)animateWithFrameCount:(NSInteger)frameCount
                   animations:(void (^)(void))animations
                   completion:(void (^)(BOOL finished))completion
{
    
}

- (void)animateWithFrameCount:(NSInteger)frameCount
                   animations:(void (^)(void))animations
{
    
}

@end

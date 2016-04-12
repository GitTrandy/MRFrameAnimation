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


- (void)setMRFrameAnimationProperty:(MRFrameAnimationProperty *)property
{
    self.transform = property.transform;
    self.layer.transform = property.layerTransform;
    self.frame = CGRectMake(property.x, property.y, property.width, property.height);

}

- (MRFrameAnimationObject *)animateWithFrameCount:(NSInteger)frameCount
                        delay:(NSTimeInterval)delay
                      options:(UIViewAnimationOptions)options
                   animations:(void (^)(void))animations
                   completion:(void (^)(BOOL finished))completion
{
    MRFrameAnimationObject *animationObject = [[MRFrameAnimationObject alloc] initWithView:self];
    animationObject.frameCount = frameCount;
    animationObject.setAnimationBlock = animations;
    animations();
    [animationObject setView:self];
    [self setMRFrameAnimationProperty:animationObject.originProperty];
    animationObject.completionAnimationBlock = completion;
//    [[MRFrameAnimationManager sharedManager] addAnimationObject:animationObject];
    
    return animationObject;
}

- (MRFrameAnimationObject *)animateWithFrameCount:(NSInteger)frameCount
                   animations:(void (^)(void))animations
                   completion:(void (^)(BOOL finished))completion
{
    return [self animateWithFrameCount:frameCount delay:0.f options:0 animations:animations completion:completion];
}

- (MRFrameAnimationObject *)animateWithFrameCount:(NSInteger)frameCount
                   animations:(void (^)(void))animations
{
    return [self animateWithFrameCount:frameCount delay:0.f options:0 animations:animations completion:nil];
}

@end

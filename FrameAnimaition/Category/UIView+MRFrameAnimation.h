//
//  UIView+MRFrameAnimation.h
//  MRFrameAnimation
//
//  Created by 阿迪 on 16/3/14.
//  Copyright © 2016年 itrandy.com. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MRFrameAnimationManager.h"
#import "MRFrameAnimationProperty.h"

@interface UIView (MRFrameAnimation)

- (void)setMRFrameAnimationProperty:(MRFrameAnimationProperty *)property;

- (MRFrameAnimationObject *)animateWithFrameCount:(NSInteger)frameCount delay:(NSTimeInterval)delay options:(UIViewAnimationOptions)options animations:(void (^)(void))animations completion:(void (^)(BOOL finished))completion;

- (MRFrameAnimationObject *)animateWithFrameCount:(NSInteger)frameCount animations:(void (^)(void))animations completion:(void (^)(BOOL finished))completion; // delay = 0.0, options = 0

- (MRFrameAnimationObject *)animateWithFrameCount:(NSInteger)frameCount animations:(void (^)(void))animations; // delay = 0.0, options = 0, completion = NULL

@end

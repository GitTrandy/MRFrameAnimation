//
//  UIView+MRFrameAnimation.h
//  MRFrameAnimation
//
//  Created by 阿迪 on 16/3/14.
//  Copyright © 2016年 itrandy.com. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MRFrameAnimationManager.h"

@interface UIView (MRFrameAnimation)

- (void)animateWithFrameCount:(NSInteger)frameCount delay:(NSTimeInterval)delay options:(UIViewAnimationOptions)options animations:(void (^)(void))animations completion:(void (^)(BOOL finished))completion;

- (void)animateWithFrameCount:(NSInteger)frameCount animations:(void (^)(void))animations completion:(void (^)(BOOL finished))completion; // delay = 0.0, options = 0

- (void)animateWithFrameCount:(NSInteger)frameCount animations:(void (^)(void))animations; // delay = 0.0, options = 0, completion = NULL

@end

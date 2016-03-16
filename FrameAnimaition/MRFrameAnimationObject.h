//
//  MRFrameAnimationObject.h
//  MRFrameAnimation
//
//  Created by 阿迪 on 16/3/15.
//  Copyright © 2016年 itrandy.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^SetAnimationBlock)(void);
typedef void (^CompletionAnimationBlock)(BOOL finished);

@interface MRFrameAnimationObject : NSObject
{
    CGFloat     _frameX;
    CGFloat     _frameY;
    CGFloat     _frameW;
    CGFloat     _frameH;
}

@property (nonatomic, weak, setter=setView:) UIView  *view;
@property (nonatomic, assign) NSInteger frameCount;

@property (nonatomic, copy) SetAnimationBlock setAnimationBlock;
@property (nonatomic, copy) CompletionAnimationBlock completionAnimationBlock;

@property (nonatomic, assign,setter=setCurrentFrame:) NSInteger currentFrame;

- (instancetype)initWithView:(UIView *)view;

/**
 *  指定到某一帧动画
 *
 *  @param frame
 */
- (void)setCurrentFrame:(NSInteger)frame;

/**
 *  播放下一帧动画
 *
 *  @return 是否已经到最后一帧
 */
- (BOOL)nextFrame;

@end

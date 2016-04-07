//
//  MRFrameAnimationObject.h
//  MRFrameAnimation
//
//  Created by 阿迪 on 16/3/15.
//  Copyright © 2016年 itrandy.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MRFrameAnimationProperty.h"
#import "MRPropertyArray.h"

typedef void (^SetAnimationBlock)(void);
typedef void (^CompletionAnimationBlock)(BOOL finished);


typedef NS_ENUM(NSInteger,MRFrameAnimationType)
{
    MRFrameAnimationLinear = 0,
};

@interface MRFrameAnimationObject : NSObject
{
    MRFrameAnimationProperty *_originProperty;
    MRFrameAnimationProperty *_finalProperty;
}

@property (nonatomic, weak, setter=setView:) UIView  *view;
@property (nonatomic, assign) NSInteger frameCount;
@property (nonatomic, strong) MRPropertyArray *propertyArray;

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


CG_EXTERN CGRect CGRectReplaceX(CGRect rect, CGFloat x)
CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

CG_EXTERN CGRect CGRectReplaceY(CGRect rect, CGFloat y)
CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

CG_EXTERN CGRect CGRectReplaceW(CGRect rect, CGFloat w)
CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

CG_EXTERN CGRect CGRectReplaceH(CGRect rect, CGFloat h)
CG_AVAILABLE_STARTING(__MAC_10_0, __IPHONE_2_0);

//
//  MRFrameCalculator.m
//  MRFrameAnimation
//
//  Created by 阿迪 on 16/4/6.
//  Copyright © 2016年 itrandy.com. All rights reserved.
//

#import "MRFrameCalculator.h"


@implementation MRFrameCalculator

+ (NSArray *)calculatorOrigin:(float)originValue final:(float)finalValue frameCount:(NSInteger)frameCount
{
    return [MRFrameCalculator calculatorOrigin:originValue final:finalValue frameCount:frameCount type:MRFrameAnimationLinear];
}

+ (NSArray *)calculatorOrigin:(float)originValue final:(float)finalValue frameCount:(NSInteger)frameCount  type:(MRFrameAnimationType)type
{
    NSMutableArray *valueArray = [NSMutableArray array];
    CGFloat offset = finalValue - originValue;
    double dt = (frameCount <= 0) ? offset : offset / frameCount;
    for (NSInteger i = 0; i < frameCount; i++)
    {
        NSNumber *number = [NSNumber numberWithDouble:originValue + dt*i];
        [valueArray addObject:number];
    }
    return valueArray;
}

@end

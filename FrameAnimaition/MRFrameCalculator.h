//
//  MRFrameCalculator.h
//  MRFrameAnimation
//
//  Created by 阿迪 on 16/4/6.
//  Copyright © 2016年 itrandy.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MRFrameAnimationObject.h"

@interface MRFrameCalculator : NSObject

+ (NSArray *)calculatorOrigin:(float)originValue final:(float)finalValue frameCount:(NSInteger)frameCount;

+ (NSArray *)calculatorOrigin:(float)originValue final:(float)finalValue frameCount:(NSInteger)frameCount  type:(MRFrameAnimationType)type;

@end

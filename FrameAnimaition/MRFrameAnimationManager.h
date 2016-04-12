//
//  MRFrameAnimationManager.h
//  MRFrameAnimation
//
//  Created by 阿迪 on 16/3/14.
//  Copyright © 2016年 itrandy.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MRFrameAnimationObject.h"

/**
 *  支持动画的属性有： frame,contentSize,alpha,scale,transform
 */
@interface MRFrameAnimationManager : NSObject

@property (nonatomic, strong, readonly) NSMutableArray *animationArray;

+ (instancetype)sharedManager;

- (void)addAnimationObject:(MRFrameAnimationObject *)object;

@end

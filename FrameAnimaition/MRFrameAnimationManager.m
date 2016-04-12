//
//  MRFrameAnimationManager.m
//  MRFrameAnimation
//
//  Created by 阿迪 on 16/3/14.
//  Copyright © 2016年 itrandy.com. All rights reserved.
//

#import "MRFrameAnimationManager.h"

@implementation MRFrameAnimationManager

+ (instancetype)sharedManager
{
    static MRFrameAnimationManager *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[MRFrameAnimationManager alloc] init];
    });
    
    return _instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {

    }
    return self;
}


- (void)addAnimationObject:(MRFrameAnimationObject *)object
{
    [_animationArray addObject:object];
}


@end

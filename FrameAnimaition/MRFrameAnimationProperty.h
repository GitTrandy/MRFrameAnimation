//
//  MRFrameAnimationProperty.h
//  MRFrameAnimation
//
//  Created by trandy on 16/3/20.
//  Copyright © 2016年 itrandy.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MRFrameAnimationProperty : NSObject

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGAffineTransform transform;
@property (nonatomic, assign) CATransform3D layerTransform;

- (instancetype)initWithView:(UIView *)view;

@end

//
//  MRPropertyArray.h
//  MRFrameAnimation
//
//  Created by 阿迪 on 16/4/6.
//  Copyright © 2016年 itrandy.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MRPropertyArray : NSObject

@property (nonatomic, copy) NSArray<NSNumber *> *xArray;
@property (nonatomic, copy) NSArray<NSNumber *> *yArray;
@property (nonatomic, copy) NSArray<NSNumber *> *widthArray;
@property (nonatomic, copy) NSArray<NSNumber *> *heightArray;
@property (nonatomic, copy) NSArray<NSValue *> *transformArray;
@property (nonatomic, copy) NSArray<NSValue *> *layerTransformArray;

@end

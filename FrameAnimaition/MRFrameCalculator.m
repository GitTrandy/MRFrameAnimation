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

+ (NSArray<NSValue *> *)calculatorTransformOrigin:(CGAffineTransform)originTransform final:(CGAffineTransform)finalTransform frameCount:(NSInteger)frameCount
{
    return [MRFrameCalculator calculatorTransformOrigin:originTransform final:finalTransform frameCount:frameCount type:MRFrameAnimationLinear];
}

+ (NSArray<NSValue *> *)calculatorTransformOrigin:(CGAffineTransform)originTransform final:(CGAffineTransform)finalTransform frameCount:(NSInteger)frameCount  type:(MRFrameAnimationType)type
{
    NSMutableArray *valueArray = [NSMutableArray array];
    CGFloat offsetA = finalTransform.a - originTransform.a;
    CGFloat offsetB = finalTransform.b - originTransform.b;
    CGFloat offsetC = finalTransform.c - originTransform.c;
    CGFloat offsetD = finalTransform.d - originTransform.d;
    CGFloat offsetTx = finalTransform.tx - originTransform.tx;
    CGFloat offsetTy = finalTransform.ty - originTransform.ty;
    double dtA = (frameCount <= 0) ? offsetA : offsetA / frameCount;
    double dtB = (frameCount <= 0) ? offsetB : offsetB / frameCount;
    double dtC = (frameCount <= 0) ? offsetC : offsetC / frameCount;
    double dtD = (frameCount <= 0) ? offsetD : offsetD / frameCount;
    double dtTx = (frameCount <= 0) ? offsetTx : offsetTx / frameCount;
    double dtTy = (frameCount <= 0) ? offsetTy : offsetTy / frameCount;

    for (NSInteger i = 0; i < frameCount; i++)
    {
        CGAffineTransform transform = CGAffineTransformMake(originTransform.a + dtA*i, originTransform.b + dtB*i, originTransform.c + dtC*i, originTransform.d + dtD*i, originTransform.tx + dtTx*i, originTransform.ty + dtTy*i);
        [valueArray addObject:[NSValue valueWithCGAffineTransform:transform]];
    }
    return valueArray;
    
}

+ (NSArray<NSValue *> *)calculatorLayerTransformOrigin:(CATransform3D)originTransform final:(CATransform3D)finalTransform frameCount:(NSInteger)frameCount
{
    return [MRFrameCalculator calculatorLayerTransformOrigin:originTransform final:finalTransform frameCount:frameCount type:MRFrameAnimationLinear];
}

+ (NSArray<NSValue *> *)calculatorLayerTransformOrigin:(CATransform3D)originTransform final:(CATransform3D)finalTransform frameCount:(NSInteger)frameCount  type:(MRFrameAnimationType)type
{
    NSMutableArray *valueArray = [NSMutableArray array];
    CGFloat offset11 = finalTransform.m11 - originTransform.m11;
    CGFloat offset12 = finalTransform.m12 - originTransform.m12;
    CGFloat offset13 = finalTransform.m13 - originTransform.m13;
    CGFloat offset14 = finalTransform.m14 - originTransform.m14;
    CGFloat offset21 = finalTransform.m21 - originTransform.m21;
    CGFloat offset22 = finalTransform.m22 - originTransform.m22;
    CGFloat offset23 = finalTransform.m23 - originTransform.m23;
    CGFloat offset24 = finalTransform.m24 - originTransform.m24;
    CGFloat offset31 = finalTransform.m31 - originTransform.m31;
    CGFloat offset32 = finalTransform.m32 - originTransform.m32;
    CGFloat offset33 = finalTransform.m33 - originTransform.m33;
    CGFloat offset34 = finalTransform.m34 - originTransform.m34;
    CGFloat offset41 = finalTransform.m41 - originTransform.m41;
    CGFloat offset42 = finalTransform.m42 - originTransform.m42;
    CGFloat offset43 = finalTransform.m43 - originTransform.m43;
    CGFloat offset44 = finalTransform.m44 - originTransform.m44;
    double dt11 = (frameCount <= 0) ? offset11 : offset11 / frameCount;
    double dt12 = (frameCount <= 0) ? offset12 : offset12 / frameCount;
    double dt13 = (frameCount <= 0) ? offset13 : offset13 / frameCount;
    double dt14 = (frameCount <= 0) ? offset14 : offset14 / frameCount;
    double dt21 = (frameCount <= 0) ? offset21 : offset21 / frameCount;
    double dt22 = (frameCount <= 0) ? offset22 : offset22 / frameCount;
    double dt23 = (frameCount <= 0) ? offset23 : offset23 / frameCount;
    double dt24 = (frameCount <= 0) ? offset24 : offset24 / frameCount;
    double dt31 = (frameCount <= 0) ? offset31 : offset31 / frameCount;
    double dt32 = (frameCount <= 0) ? offset32 : offset32 / frameCount;
    double dt33 = (frameCount <= 0) ? offset33 : offset33 / frameCount;
    double dt34 = (frameCount <= 0) ? offset34 : offset34 / frameCount;
    double dt41 = (frameCount <= 0) ? offset41 : offset41 / frameCount;
    double dt42 = (frameCount <= 0) ? offset42 : offset42 / frameCount;
    double dt43 = (frameCount <= 0) ? offset43 : offset43 / frameCount;
    double dt44 = (frameCount <= 0) ? offset44 : offset44 / frameCount;
    for (NSInteger i = 0; i < frameCount; i++)
    {
        CATransform3D transform = CATransform3DMakeTranslation(0,0,0);
        transform.m11 = originTransform.m11 + dt11*i;
        transform.m12 = originTransform.m12 + dt12*i;
        transform.m13 = originTransform.m13 + dt13*i;
        transform.m14 = originTransform.m14 + dt14*i;
        transform.m21 = originTransform.m21 + dt21*i;
        transform.m22 = originTransform.m22 + dt22*i;
        transform.m23 = originTransform.m23 + dt23*i;
        transform.m24 = originTransform.m24 + dt24*i;
        transform.m31 = originTransform.m31 + dt31*i;
        transform.m32 = originTransform.m32 + dt32*i;
        transform.m33 = originTransform.m33 + dt33*i;
        transform.m34 = originTransform.m34 + dt34*i;
        transform.m41 = originTransform.m41 + dt41*i;
        transform.m42 = originTransform.m42 + dt42*i;
        transform.m43 = originTransform.m43 + dt43*i;
        transform.m44 = originTransform.m44 + dt44*i;
        [valueArray addObject:[NSValue valueWithCATransform3D:transform]];
    }
    return valueArray;
}
         

@end

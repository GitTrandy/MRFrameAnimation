//
//  MRFrameAnimationObject.m
//  MRFrameAnimation
//
//  Created by 阿迪 on 16/3/15.
//  Copyright © 2016年 itrandy.com. All rights reserved.
//

#import "MRFrameAnimationObject.h"
#import "MRFrameCalculator.h"

CGRect CGRectReplaceX(CGRect rect, CGFloat x)
{
    CGPoint origin = rect.origin;
    origin.x = x;
    rect.origin = origin;
    return rect;
}

CGRect CGRectReplaceY(CGRect rect, CGFloat y)
{
    CGPoint origin = rect.origin;
    origin.y = y;
    rect.origin = origin;
    return rect;
}

CGRect CGRectReplaceW(CGRect rect, CGFloat w)
{
    CGSize size = rect.size;
    size.width = w;
    rect.size = size;
    return rect;
}

CGRect CGRectReplaceH(CGRect rect, CGFloat h)
{
    CGSize size = rect.size;
    size.height = h;
    rect.size = size;
    return rect;
}

@implementation MRFrameAnimationObject

- (instancetype)initWithView:(UIView *)view
{
    self = [super init];
    if (self) {
        _view = view;
        _originProperty = [[MRFrameAnimationProperty alloc] initWithView:view];
    }
    return self;
}

- (void)setView:(UIView *)view
{
    _view = view;
    _finalProperty = [[MRFrameAnimationProperty alloc] initWithView:view];
    [self handlerProperty:_originProperty finalProperty:_finalProperty frameCount:self.frameCount type:MRFrameAnimationLinear];
}

#pragma mark - Private Method
- (void)handlerProperty:(MRFrameAnimationProperty *)originProperty
          finalProperty:(MRFrameAnimationProperty *)finalProperty
             frameCount:(NSInteger )frameCount
                   type:(MRFrameAnimationType )type
{
    MRPropertyArray *propertyArray = [[MRPropertyArray alloc] init];
    if (finalProperty.x != originProperty.x)
    {
        propertyArray.xArray = [MRFrameCalculator calculatorOrigin:originProperty.x final:finalProperty.x frameCount:frameCount type:type];
    }
    else if(finalProperty.y != originProperty.y)
    {
        propertyArray.yArray = [MRFrameCalculator calculatorOrigin:originProperty.y final:finalProperty.y frameCount:frameCount type:type];
    }
    else if(finalProperty.width != originProperty.width)
    {
        propertyArray.widthArray = [MRFrameCalculator calculatorOrigin:originProperty.width final:finalProperty.width frameCount:frameCount type:type];
    }
    else if(finalProperty.y != originProperty.y)
    {
        propertyArray.heightArray = [MRFrameCalculator calculatorOrigin:originProperty.height final:finalProperty.height frameCount:frameCount type:type];
    }
    self.propertyArray = propertyArray;
}

#pragma mark - Public Method

- (BOOL)nextFrame
{
    [self setCurrentFrame:_currentFrame++];
    return _currentFrame >= _frameCount;
}

#pragma mark - Event Method

#pragma mark - Getter & Setter Method

- (void)setCurrentFrame:(NSInteger)frame
{
    _currentFrame = (frame >= _frameCount ? _frameCount : frame);
    CGRect rect = self.view.frame;
    if (self.propertyArray.xArray && [self.propertyArray.xArray count] >= frame)
    {
        rect = CGRectReplaceX(self.view.frame, [self.propertyArray.xArray[frame] floatValue]);
    }
    else if(self.propertyArray.yArray && [self.propertyArray.yArray count] >= frame)
    {
        rect = CGRectReplaceY(self.view.frame, [self.propertyArray.yArray[frame] floatValue]);
    }
    else if(self.propertyArray.widthArray && [self.propertyArray.widthArray count] >= frame)
    {
        rect = CGRectReplaceW(self.view.frame, [self.propertyArray.widthArray[frame] floatValue]);
    }
    else if(self.propertyArray.heightArray && [self.propertyArray.heightArray count] >= frame)
    {
        rect = CGRectReplaceH(self.view.frame, [self.propertyArray.heightArray[frame] floatValue]);
    }
    
}



@end

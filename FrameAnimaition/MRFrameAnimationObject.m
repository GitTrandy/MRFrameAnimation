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
    if(finalProperty.y != originProperty.y)
    {
        propertyArray.yArray = [MRFrameCalculator calculatorOrigin:originProperty.y final:finalProperty.y frameCount:frameCount type:type];
    }
    if(finalProperty.width != originProperty.width)
    {
        propertyArray.widthArray = [MRFrameCalculator calculatorOrigin:originProperty.width final:finalProperty.width frameCount:frameCount type:type];
    }
    if(finalProperty.y != originProperty.y)
    {
        propertyArray.heightArray = [MRFrameCalculator calculatorOrigin:originProperty.height final:finalProperty.height frameCount:frameCount type:type];
    }
    self.propertyArray = propertyArray;
}

#pragma mark - Public Method

- (BOOL)nextFrame
{
    [self setCurrentFrame:++_currentFrame];
    return _currentFrame < _frameCount;
}

- (BOOL)frontFrame
{
    [self setCurrentFrame:--_currentFrame];
    return _currentFrame > 1;
}

#pragma mark - Event Method

#pragma mark - Getter & Setter Method

- (void)setCurrentFrame:(NSInteger)frame
{
    NSLog(@"frame = %ld",frame);
    _currentFrame = (frame >= _frameCount ? _frameCount : frame);
    _currentFrame = (frame < 1 ? 1 : frame);
    NSLog(@"_currentFrame = %ld",_currentFrame);
    CGRect rect = self.view.frame;
    CGFloat x,y,width,height;
    x = rect.origin.x;
    y = rect.origin.y;
    width = rect.size.width;
    height = rect.size.height;
    if (self.propertyArray.xArray && [self.propertyArray.xArray count] >= _currentFrame)
    {
        x = [self.propertyArray.xArray[_currentFrame - 1] floatValue];
    }
    
    if(self.propertyArray.yArray && [self.propertyArray.yArray count] >= _currentFrame)
    {
        x = [self.propertyArray.yArray[_currentFrame - 1] floatValue];
    }
    if(self.propertyArray.widthArray && [self.propertyArray.widthArray count] >= _currentFrame)
    {
        width = [self.propertyArray.widthArray[_currentFrame - 1] floatValue];
    }
    if(self.propertyArray.heightArray && [self.propertyArray.heightArray count] >= _currentFrame)
    {
        height = [self.propertyArray.heightArray[_currentFrame - 1] floatValue];
    }
    _view.frame = CGRectMake(x, y, width, height);
    
}



@end

//
//  NVGradientView.m
//  Gradients
//
//  Created by Brian Novie on 6/9/13.
//  Copyright (c) 2013 NoVie. All rights reserved.
//

#import "NVGradientView.h"
#import <QuartzCore/QuartzCore.h>

@interface NVGradientView ()
@property (strong) CAGradientLayer *lightingLayer;
@end

@implementation NVGradientView

- (id)initWithCoder:(NSCoder *)aDecoder 
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self createLightingLayer];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createLightingLayer];
    }
    return self;
}
- (void) createLightingLayer
{
    if (_lightingLayer == NULL)
    {
        _lightingLayer = [CAGradientLayer new];
        [self.lightingLayer setStartPoint:CGPointMake(0.0, 0.5)];
        [self.lightingLayer setEndPoint:CGPointMake(1.0, 0.5)];
        _lightingLayer.frame = self.bounds;
        _lightingLayer.colors = @[(id)[[UIColor colorWithWhite:1.0f alpha:0.5f] CGColor],
                                  (id)[[UIColor colorWithWhite:1.0f alpha:0.2f] CGColor],
                                  (id)[[UIColor colorWithWhite:0.0f alpha:0.4f] CGColor]];
        _lightingLayer.locations = @[@0.0f, @0.5f, @1.0f];
//        [self.layer addSublayer:_lightingLayer];
        [self.layer insertSublayer:_lightingLayer atIndex:self.layer.sublayers.count];
    }
}

- (void) setHorizontal
{
    [self.lightingLayer setStartPoint:CGPointMake(0.0, 0.5)];
    [self.lightingLayer setEndPoint:CGPointMake(1.0, 0.5)];
    [self.lightingLayer setNeedsDisplay];
}
- (void) setVertical
{
    [self.lightingLayer setStartPoint:CGPointMake(0.5, 0.0)];
    [self.lightingLayer setEndPoint:CGPointMake(0.5, 1.0)];
    [self.lightingLayer setNeedsDisplay];
}
- (void) layoutSubviews
{
    [super layoutSubviews];
    self.lightingLayer.frame = self.bounds;
}

@end

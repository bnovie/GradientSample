//
//  NVGlossyButton.m
//  Gradients
//
//  Created by Brian Novie on 6/9/13.
//  Copyright (c) 2013 NoVie. All rights reserved.
//

#import "NVGlossyButton.h"
#import <QuartzCore/QuartzCore.h>

@interface NVGlossyButton()
@property (strong) CAGradientLayer *lightingLayer;
@property (strong) CAGradientLayer *highlightLayer;
@end

@implementation NVGlossyButton

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupLayer];
        [self createLightingLayer];
        [self createHighlightLayer];
        _highlightLayer.hidden = YES;
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupLayer];
        [self createLightingLayer];
        [self createHighlightLayer];
        _highlightLayer.hidden = YES;
    }
    return self;
}

- (void) setupLayer
{
    self.layer.cornerRadius = 8.0f;
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = 1.0f;
    self.layer.borderColor = [[UIColor colorWithWhite:0.2 alpha:0.8] CGColor];
}
- (void) createLightingLayer
{
    if (_lightingLayer == NULL)
    {
        _lightingLayer = [CAGradientLayer new];
        _lightingLayer.frame = self.bounds;
        _lightingLayer.colors = @[(id)[[UIColor colorWithWhite:1.0f alpha:0.4f] CGColor],
                                  (id)[[UIColor colorWithWhite:1.0f alpha:0.2f] CGColor],
                                  (id)[[UIColor colorWithWhite:0.0f alpha:0.2f] CGColor]];
        _lightingLayer.locations = @[@0.0f, @0.5f, @1.0f];
        [self.layer addSublayer:_lightingLayer];
    }
}
- (void) createHighlightLayer
{
    if (_highlightLayer == NULL)
    {
        _highlightLayer = [CAGradientLayer new];
        _highlightLayer.frame = self.bounds;
        _highlightLayer.colors = @[(id)[[UIColor colorWithWhite:0.0f alpha:0.4f] CGColor],
                                  (id)[[UIColor colorWithWhite:0.0f alpha:0.2f] CGColor]];
        _highlightLayer.locations = @[@0.0f, @1.0f];
        [self.layer addSublayer:_highlightLayer];
    }
}

- (void) setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    self.highlightLayer.hidden = !highlighted;
    self.lightingLayer.hidden = highlighted;
}
- (void) layoutSubviews
{
    [super layoutSubviews];
    self.lightingLayer.frame = self.bounds;
    self.highlightLayer.frame = self.bounds;
}

@end

//
//  NVViewController.m
//  Gradients
//
//  Created by Brian Novie on 6/9/13.
//  Copyright (c) 2013 NoVie. All rights reserved.
//

#import "NVViewController.h"
#import "NVGradientView.h"

@interface NVViewController ()
@property NVGradientView *backgroundView;
@end

@implementation NVViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	_backgroundView = [[NVGradientView alloc] initWithFrame:self.view.bounds];
    _backgroundView.backgroundColor = self.view.backgroundColor;
    [self.view insertSubview:_backgroundView atIndex:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)setVertical:(id)sender
{
    [self.backgroundView setVertical];
}

- (IBAction)setHorizontal:(id)sender
{
    [self.backgroundView setHorizontal];
}

- (IBAction)setColor:(id)sender
{
    UIButton *button = (UIButton *) sender;
    [self.backgroundView setBackgroundColor:button.backgroundColor];
}

@end

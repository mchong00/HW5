//
//  CustomViewController.m
//  mchong00_HW5
//
//  Created by Michael Chong on 2/20/15.
//  Copyright (c) 2015 Michael Chong. All rights reserved.
//

#import "CustomViewController.h"

@interface CustomViewController ()

@end

@implementation CustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.

    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(myTimerAction:) userInfo:nil repeats:YES];
}

    
-(void)myTimerAction:(NSTimer *)timer
{
    [[self dots] setNeedsDisplay:YES];
}
    


@end

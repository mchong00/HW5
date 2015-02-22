//
//  GraphViewController.m
//  mchong00_HW5
//
//  Created by Michael Chong on 2/20/15.
//  Copyright (c) 2015 Michael Chong. All rights reserved.
//

#import "GraphViewController.h"

@interface GraphViewController ()

@end

@implementation GraphViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
}
- (IBAction)refreshButton:(id)sender {

    [[self button] setNeedsDisplay:YES];
}



@end

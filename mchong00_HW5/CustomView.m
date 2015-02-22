//
//  CustomView.m
//  mchong00_HW5
//
//  Created by Michael Chong on 2/20/15.
//  Copyright (c) 2015 Michael Chong. All rights reserved.
//

#import "CustomView.h"
#import <QuartzCore/QuartzCore.h>

@implementation CustomView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    //set background to black
    [[NSColor blackColor] set];
    [NSBezierPath fillRect:self.bounds];
    
    CGFloat xBound = self.frame.size.width;
    CGFloat yBound = self.frame.size.height;
    NSPoint point = {0,0};
    CGFloat hue = 0;
    
    for ( int i=0; i < 2000; i++) {
        
        //random colors
        hue = (CGFloat)(arc4random() % 100) / 100.0;
        [[NSColor colorWithCalibratedHue:hue saturation:1 brightness:1 alpha:1] set];
        
        //random x,y values
        point.x = arc4random() % (int)xBound;
        point.y = arc4random() % (int)yBound;
        
        NSRectFill(NSMakeRect(point.x, point.y, 1.0, 1.0));
        
    }
    
    //pulsating effect
    CABasicAnimation *theAnimation;
    
    //animate only the opacity
    theAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    
    //to give seizures set this to 0.1
    theAnimation.duration = 0.4;
    
    theAnimation.repeatCount = HUGE_VALF;
    theAnimation.autoreverses = YES;
    
    //set opacity
    theAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    theAnimation.toValue = [NSNumber numberWithFloat:0.1];
    [self.layer addAnimation:theAnimation forKey:@"animateOpacity"];
    
    
    NSImage *myImage = [NSImage imageNamed:@"alien.png"];
    NSRect dummyRect = NSMakeRect(xBound/4, yBound/3, xBound/2, yBound/2);
    [myImage drawInRect:dummyRect fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1.0];
    
    }
@end

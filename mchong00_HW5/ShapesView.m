//
//  ShapesView.m
//  mchong00_HW5
//
//  Created by Michael Chong on 2/20/15.
//  Copyright (c) 2015 Michael Chong. All rights reserved.
//

#import "ShapesView.h"

@implementation ShapesView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    //Divide the frame by thirds
    float oneThirdSection = self.frame.size.width / 3;
    
    //Set view color
    [[NSColor colorWithRed:0.1 green:0.3 blue:0.5 alpha:0.1] set];
    
    //Set background color
    [NSBezierPath fillRect:self.bounds];

    //Square
    NSRect myRect = NSMakeRect(0, 0, oneThirdSection, oneThirdSection);
    NSBezierPath *path = [NSBezierPath bezierPathWithRect:myRect];
    [[NSColor greenColor] setFill];
    [path fill];
    
    //Triangle
    NSBezierPath *myTriangle = [NSBezierPath bezierPath];
    [myTriangle moveToPoint:CGPointMake(oneThirdSection, 0)];
    [myTriangle relativeLineToPoint:CGPointMake(oneThirdSection/2,oneThirdSection)];
    [myTriangle relativeLineToPoint:CGPointMake(oneThirdSection/2,(oneThirdSection) * -1 )];
    [myTriangle relativeLineToPoint:CGPointMake((oneThirdSection * -1),0)];
    myTriangle.lineWidth = 2;
    [[NSColor redColor] setStroke];
    [[NSColor blackColor] setFill];
    [myTriangle fill];
    [myTriangle stroke];
    
    //Circle
    NSRect dummyRect = NSMakeRect((oneThirdSection * 2), 0, oneThirdSection, oneThirdSection);
    NSBezierPath *myCircle = [NSBezierPath bezierPath];
    [myCircle appendBezierPathWithOvalInRect:dummyRect];
    NSImage *patternImage = [NSImage imageNamed:@"cats.jpg"];
    NSColor *circleBackground = [NSColor colorWithPatternImage:patternImage];
    [circleBackground set];
    [myCircle fill];
    

}

@end

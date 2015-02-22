//
//  GraphView.m
//  mchong00_HW5
//
//  Created by Michael Chong on 2/20/15.
//  Copyright (c) 2015 Michael Chong. All rights reserved.
//

#import "GraphView.h"
#define ARC4RANDOM_MAX 0x100000000

@implementation GraphView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    
    float sum = 0;
    
    //myArray is 10 objects, values 0 to 1
    NSMutableArray *myArray = [[NSMutableArray alloc] init];
    for ( int i = 0 ; i < 10; i++ ) {
        double val = ((double)arc4random() / ARC4RANDOM_MAX);
        NSNumber *num = [NSNumber numberWithFloat:val];
        [myArray addObject:num];
        sum = sum + val;
    }
    
    //create image pattern
    NSImage *patternImage = [NSImage imageNamed:@"pattern.jpg"];
    [[NSColor colorWithPatternImage:patternImage] set];
    [[NSColor redColor] setStroke];
    
    //[NSBezierPath fillRect:self.bounds];
    
    NSBezierPath *path = [NSBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0,0)];

   
    //First line
    float xFirst =([[myArray objectAtIndex:0] floatValue] / sum ) * self.frame.size.width;
    float yFirst =([[myArray objectAtIndex:0] floatValue] ) * self.frame.size.height;
    [path lineToPoint:CGPointMake(xFirst, yFirst)];
    NSLog(@"object 0: %f,%f", xFirst, yFirst);
    
    //Lines 1 through 9
    float y_sum = 0;
    for ( int i = 1 ; i < 9; i++ ) {
        double xSection = ([[myArray objectAtIndex:i] floatValue] / sum ) * self.frame.size.width;
        
        //Since relative positioning: y position is the next object's y value minus my current y value.
        double ySection = (([[myArray objectAtIndex:i+1] floatValue] / sum) * self.frame.size.height) - (([[myArray objectAtIndex:i] floatValue] / sum ) * self.frame.size.height);
        
        [path relativeLineToPoint:CGPointMake(xSection, ySection)];
        y_sum = y_sum + ySection;
        NSLog(@"object %i: %f,%f", i, xSection, ySection);
    }

    //Last line
    float xLastObject = ([[myArray lastObject] floatValue] / sum ) * self.frame.size.width;

    //In order to return to 0, add up all y values and make it negative
    float yLastObject = (yFirst + y_sum ) * -1;
   
    NSLog(@"lastobject sum %f", yLastObject);
    NSLog(@"Total height is: %f", self.frame.size.height);
    NSLog(@"Total width is: %f", self.frame.size.width);
    
    [path relativeLineToPoint:CGPointMake(xLastObject, yLastObject)];
    [path lineToPoint:CGPointZero];
    
    [path fill];
    [path stroke];
    
}






@end

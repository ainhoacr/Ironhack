//
//  PathView.m
//  Layers
//
//  Created by Ainhoa Calviño Rodriguez on 23/09/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "PathView.h"

@implementation PathView


- (void)drawRect:(CGRect)rect
{
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    bezierPath.lineWidth = 5;
    
    [[UIColor purpleColor] setStroke];
    [[UIColor magentaColor] setFill];
    
    [bezierPath moveToPoint:CGPointMake(100.0, 0.0)];
    
    [bezierPath addLineToPoint:CGPointMake(200.0, 40.0)];
    [bezierPath addLineToPoint:CGPointMake(160, 140)];
    [bezierPath addLineToPoint:CGPointMake(40.0, 140)];
    [bezierPath addLineToPoint:CGPointMake(0.0, 40.0)];
    [bezierPath closePath];
    
    [bezierPath stroke];
    [bezierPath fill];
}

@end

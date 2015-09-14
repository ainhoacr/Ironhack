//
//  MyCustomView.m
//  MyFirstApp
//
//  Created by Ainhoa Calviño Rodriguez on 10/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "MyCustomView.h"

@implementation MyCustomView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGFloat y = self.bounds.size.height / 2;
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(c, 0, y);
    CGContextSetStrokeColorWithColor(c,  [self.lineColor CGColor]);
    CGContextAddLineToPoint(c, self.bounds.size.width, y);
    CGContextStrokePath(c);
}

@end

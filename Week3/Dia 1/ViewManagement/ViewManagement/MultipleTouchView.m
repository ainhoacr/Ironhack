//
//  MultipleTouchView.m
//  ViewManagement
//
//  Created by Ainhoa Calviño Rodriguez on 21/09/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "MultipleTouchView.h"

@implementation MultipleTouchView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.multipleTouchEnabled = YES;
    }
    
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    for (UITouch *touch in touches) {
        UIView *view = [[UIView alloc]init];
        view.backgroundColor = [UIColor redColor];
        CGPoint point = [touch locationInView:self];
        view.frame = CGRectMake(point.x, point.y, 100, 100);
        [self addSubview:view];
    }
}

@end

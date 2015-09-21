//
//  DragView.m
//  ViewManagement
//
//  Created by Ainhoa Calviño Rodriguez on 21/09/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "DragView.h"

@interface DragView ()

@property (nonatomic, weak) UIView *dragView;

@end

@implementation DragView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    if (touches.count == 1)
    {
        UITouch *touch = [touches anyObject];
        UIView *view = [[UIView alloc]init];
        view.backgroundColor = [UIColor redColor];
        CGPoint point = [touch locationInView:self];
        view.frame = CGRectMake(point.x, point.y, 100, 100);
        view.center = point;
        [self addSubview:view];
        self.dragView = view;
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (touches.count == 1)
    {
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView:self];
        self.dragView.center = point;
        [self addSubview:self.dragView];
    }
}

@end

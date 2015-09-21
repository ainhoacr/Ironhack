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
@property (nonatomic, strong) NSMutableArray *mySubViews;

@end

@implementation DragView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
 
    if (touches.count == 1)
    {
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView:self];
        UIView *view = [[UIView alloc]init];

        for (int i=0; i<[self.mySubViews count]; i++) {
        
            UIView *subView = self.mySubViews[i];
            
            if (CGRectContainsPoint(subView.frame, point))
            {
                [self setPreferencesView:subView withPoint:point];
            }
            else
            {
                [self setPreferencesView:view withPoint:point];
                [self.mySubViews addObject:view];
            }
        }
        
        if ([self.mySubViews count] == 0)
        {
            [self setPreferencesView:view withPoint:point];
            [self.mySubViews addObject:view];
        }
    }
}

- (void)setPreferencesView:(UIView *)view withPoint:(CGPoint)point
{
    view.backgroundColor = [UIColor redColor];
    view.frame = CGRectMake(point.x, point.y, 100, 100);
    view.center = point;
    [self addSubview:view];
    self.dragView = view;
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

- (NSMutableArray *)mySubViews
{
    if (!_mySubViews) {
        _mySubViews = [[NSMutableArray alloc]init];
    }
    
    return _mySubViews;
}

@end

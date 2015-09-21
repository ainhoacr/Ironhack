//
//  ViewController.m
//  ViewManagement
//
//  Created by Ainhoa Calviño Rodriguez on 21/09/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "ViewController.h"
#import "MyButton.h"
#import "MultipleTouchView.h"
#import "DragView.h"

#define degreesToRadians(x) (((x) * M_PI) /180.0)

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self initialSubviews];
//    [self ejerciceCGRectUnion];
//    [self ejerciceCGRectDivide];
//    [self ejerciceTransformRotation];
//    [self ejerciceTransformShear];
//    [self ejerciceCustomButton];
//    [self multipleTouches];
    [self drag];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)initialSubviews
{
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 200)];
    view1.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view1];
    
    UIView *subView1 = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 50, 50)];
    subView1.backgroundColor = [UIColor greenColor];
    
    subView1.frame = CGRectInset(view1.frame, 10, 10);
    
    [self.view addSubview:subView1];
    
    NSString *sCenter = NSStringFromCGPoint(view1.center);
    NSLog(@"center %@  x: %f  y: %f", sCenter, view1.center.x, view1.center.y);
    
    CGPoint centerSuperview = [view1 convertPoint:view1.center fromView:view1.superview];
    sCenter = NSStringFromCGPoint(centerSuperview);
    NSLog(@"center %@  x: %f  y: %f", sCenter, centerSuperview.x, centerSuperview.y);
}

- (void)ejerciceCGRectUnion
{
    CGRect frame1 = CGRectMake(0, 0, 150, 240);
    CGRect frame2 = CGRectMake(100, 200, 120, 120);
    CGRect frame3 = CGRectUnion(frame1, frame2);
    
    UIView *view1 = [[UIView alloc]initWithFrame:frame1];
    view1.backgroundColor = [UIColor redColor];
    
    UIView *subView1 = [[UIView alloc]initWithFrame:frame2];
    subView1.backgroundColor = [UIColor orangeColor];
    
    UIView *unionView = [[UIView alloc]initWithFrame:frame3];
    unionView.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:unionView];
    [self.view addSubview:subView1];
    [self.view addSubview:view1];
}

- (void)ejerciceCGRectDivide
{
    CGRect frame = CGRectMake(0, 0, 300, 300);
    CGRect part1;
    CGRect part2;
    CGRectDivide(frame, &part1, &part2, 100.0, CGRectMaxYEdge);
    
    UIView *view1 = [[UIView alloc] initWithFrame:frame];
    [view1 setBackgroundColor:[UIColor grayColor]];
    
    UIView *view2 = [[UIView alloc] initWithFrame:part1];
    [view2 setBackgroundColor:[UIColor orangeColor]];
    
    UIView *view3 = [[UIView alloc] initWithFrame:part2];
    [view3 setBackgroundColor:[UIColor redColor]];
    
    [self.view addSubview:view1];
    [self.view addSubview:view2];
    [self.view addSubview:view3];
}

- (void)ejerciceTransformRotation
{
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(50, 120, 150, 180)];
    view1.backgroundColor = [UIColor blackColor];
    [self.view addSubview:view1];
    
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectInset(view1.bounds, 10, 10)];
    view2.backgroundColor = [UIColor orangeColor];
    [view1 addSubview:view2];
    
    view1.transform = CGAffineTransformMakeRotation(degreesToRadians(45));
    view2.transform = CGAffineTransformTranslate(view1.transform, 100, 0);
    view1.transform = CGAffineTransformIdentity;
}

- (void)ejerciceTransformShear
{
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(100, 120, 150, 180)];
    view1.backgroundColor = [UIColor blackColor];
    [self.view addSubview:view1];
    
    view1.transform = CGAffineTransformMake(1, 0, -0.2, 1, 0, 0);
}

- (void)ejerciceCustomButton
{
    MyButton *buttonPurple = [[MyButton alloc]initWithFrame:CGRectMake(50, 100, 100, 40) withTitle:@"Button1" withBackgroundColor:[UIColor purpleColor]];
    [self.view addSubview:buttonPurple];
    
    MyButton *buttonBlue = [[MyButton alloc]initWithFrame:CGRectMake(30, 200, 200, 40) withTitle:@"Button2" withBackgroundColor:[UIColor blueColor]];
    [self.view addSubview:buttonBlue];
}

- (void)multipleTouches
{
    MultipleTouchView *multipleTouchview = [[MultipleTouchView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:multipleTouchview];
}

- (void)drag
{
    DragView *dragView = [[DragView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:dragView];
}

@end
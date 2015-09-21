//
//  ViewController.m
//  ConversionsView
//
//  Created by Ainhoa Calviño Rodriguez on 21/09/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "ViewController.h"

#define degreesToRadians(x) ((x) * (180.0 / M_PI))

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *subView1;
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIView *subView2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    [self convertViews];
    [self transformViews1];
//    [self transformViews2];
}

- (void)convertViews
{
    CGRect convertFrame = [self.view1 convertRect:self.subView1.frame toView:self.view2];
    NSLog(@"Converted frame: %@", NSStringFromCGRect(convertFrame));
    
    UIView *subSubView1 = [[UIView alloc]init];
    subSubView1.backgroundColor = [UIColor magentaColor];
    subSubView1.frame = CGRectInset(self.subView1.frame, 30, 30);
    [self.subView1 addSubview:subSubView1];
}

- (void)transformViews1
{
    self.view1.transform = CGAffineTransformMakeScale(1.5, 1.5);
    self.view1.transform = CGAffineTransformMakeRotation(degreesToRadians(-30));
}

- (void)transformViews2
{
    self.view1.transform = CGAffineTransformMakeScale(1.5, 1.5);
    self.view1.transform = CGAffineTransformRotate(self.view1.transform, degreesToRadians(-30));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

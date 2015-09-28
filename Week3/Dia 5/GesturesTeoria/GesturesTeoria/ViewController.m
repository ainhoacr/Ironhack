//
//  ViewController.m
//  GesturesTeoria
//
//  Created by Ainhoa Calviño Rodriguez on 25/09/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong)  UIView *viewProtect;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];
    tapGesture.numberOfTapsRequired = 1;
    
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(handlePinch:)];
    pinchGesture.delegate = self;
    
    UIRotationGestureRecognizer *rotationGesture = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(handleRotation:)];
    rotationGesture.delegate = self;
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePan:)];
    panGesture.delegate = self;
    panGesture.minimumNumberOfTouches = 1;
    
    [self.view addGestureRecognizer:tapGesture];
    [self.view addGestureRecognizer:pinchGesture];
    [self.view addGestureRecognizer:rotationGesture];
    [self.view addGestureRecognizer:panGesture];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)handleTap:(UITapGestureRecognizer *)tapGesture
{
    self.imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"betty"]];
    self.imageView.userInteractionEnabled = YES;
    self.imageView.frame = CGRectMake(0, 0, 200, 200);
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.clipsToBounds = YES;
    self.imageView.center = [tapGesture locationInView:self.view];
    [self.view addSubview:self.imageView];
}

- (void)handlePinch:(UIPinchGestureRecognizer *)pinchGesture
{
    self.viewProtect.transform = CGAffineTransformScale(self.viewProtect.transform, pinchGesture.scale, pinchGesture.scale);
    pinchGesture.scale = 1;
}

- (void)handleRotation:(UIRotationGestureRecognizer *)rotationGesture
{
    self.viewProtect.transform = CGAffineTransformRotate(self.viewProtect.transform, rotationGesture.rotation);
    rotationGesture.rotation = 0;
}

- (void)handlePan:(UIPanGestureRecognizer *)panGesture
{
    CGPoint point = [panGesture translationInView:self.viewProtect];
    self.viewProtect.center = CGPointMake(point.x + self.viewProtect.center.x, self.viewProtect.center.y + point.y);
//    self.viewProtect.transform = CGAffineTransformTranslate(self.viewProtect.transform, point.x, point.y);
    [panGesture setTranslation:CGPointZero inView:self.viewProtect];
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    CGPoint point = [gestureRecognizer locationInView:self.view];
    UIView *myView = [self.view hitTest:point withEvent:nil];
    if ([myView isKindOfClass:[UIImageView class]])
    {
        self.viewProtect = myView;
        [self.view bringSubviewToFront:self.viewProtect];
    }
    
    return YES;
}

@end

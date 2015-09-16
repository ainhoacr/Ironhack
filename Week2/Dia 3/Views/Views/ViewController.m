//
//  ViewController.m
//  Views
//
//  Created by Ainhoa Calviño Rodriguez on 16/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *myView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self testViews];
//    [self testContentMode];
    [self testTransform];
}

- (void)testViews
{
    UIView *vista1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    
    vista1.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
    vista1.backgroundColor = [UIColor redColor];
    
    UIView *vista2 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    vista2.center = CGPointMake(self.view.frame.size.width / 2 + 50, self.view.frame.size.height / 2 + 50);
    vista2.backgroundColor = [UIColor blueColor];
    
    UIView *vista3 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    vista3.center = CGPointMake(self.view.frame.size.width / 2 + 25, self.view.frame.size.height / 2 + 25);
    vista3.backgroundColor = [UIColor magentaColor];
    
    [self.view addSubview:vista1];
    [self.view addSubview:vista2];
    [self.view insertSubview:vista3 belowSubview:vista2];
    
    vista1.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    vista2.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    vista3.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleTopMargin;
    
    [UIView animateWithDuration:2.0 animations:^{
        vista3.backgroundColor = [UIColor greenColor];
        vista2.transform = CGAffineTransformMakeRotation(M_PI_2);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:2.0 animations:^{
            vista3.backgroundColor = [UIColor magentaColor];
        }];
    }];
    
    [UIView animateWithDuration:2.0 animations:^{
        vista1.center = CGPointMake(self.view.frame.size.width - 100, self.view.frame.size.height / 2 + 50);
        vista1.backgroundColor = [UIColor orangeColor];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:2.0 animations:^{
            vista1.center = CGPointMake(self.view.frame.size.width - 100, self.view.frame.size.height - 100);
            vista1.backgroundColor = [UIColor redColor];
        }];
    }];
    
    //    [UIView animateWithDuration:10.0 animations:^{
    //        vista2.transform = CGAffineTransformMakeScale(400, 400);
    //    }];

}

- (void)testContentMode
{
    UIImage *image = [UIImage imageNamed:@"bettyBoop.jpeg"];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 300, 300)];
    imageView.backgroundColor = [UIColor redColor];
    imageView.image = image;
    imageView.clipsToBounds = YES;
    
    [self.view addSubview:imageView];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
}

- (void)testTransform
{
    self.myView = [[UIView alloc]initWithFrame:CGRectMake(200, 200, 300, 300)];
    self.myView.backgroundColor = [UIColor magentaColor];
    [self.view addSubview:self.myView];
    
    UISlider *sliderAngle = [[UISlider alloc]initWithFrame:CGRectMake(200, 700, 300, 40)];
    sliderAngle.minimumValue = -M_PI_2;
    sliderAngle.maximumValue = M_PI_2;
    sliderAngle.value = 0;
    
    [sliderAngle addTarget:self action:@selector(angleChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:sliderAngle];
    
    UISlider *sliderScale = [[UISlider alloc]initWithFrame:CGRectMake(200, 800, 300, 40)];
    sliderScale.minimumValue = 0;
    sliderScale.maximumValue = 2;
    sliderScale.value = 1;
    
    [sliderScale addTarget:self action:@selector(scaleChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:sliderScale];
}

- (void)angleChanged:(UISlider *)slider
{
    self.myView.transform = CGAffineTransformMakeRotation(slider.value);
}

- (void)scaleChanged:(UISlider *)slider
{
    self.myView.transform = CGAffineTransformMakeScale(slider.value, slider.value);
}

@end

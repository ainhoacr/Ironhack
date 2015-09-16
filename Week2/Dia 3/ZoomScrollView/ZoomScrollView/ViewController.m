//
//  ViewController.m
//  ZoomScrollView
//
//  Created by Ainhoa Calviño Rodriguez on 16/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myScrollView.delegate = self;
}

- (IBAction)scrollViewDidChange:(UISlider *)slider
{
    self.myScrollView.zoomScale = slider.value;
//    self.myImageView.center = CGPointMake(CGRectGetMidX(self.myScrollView.frame), CGRectGetMidY(self.myScrollView.frame));
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.myImageView;
}
@end

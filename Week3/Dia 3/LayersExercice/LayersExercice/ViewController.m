//
//  ViewController.m
//  LayersExercice
//
//  Created by Ainhoa Calviño Rodriguez on 23/09/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self layers];
    [self scrollLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)layers
{
    CALayer *layerMagenta = [[CALayer alloc]init];
    layerMagenta.bounds = CGRectMake(0, 0, 100, 200);
    layerMagenta.position = CGPointMake(200, 150);
    layerMagenta.anchorPoint = CGPointMake(0.5, 0.5);
    layerMagenta.backgroundColor = [UIColor magentaColor].CGColor;
    
    CALayer *layerRed = [[CALayer alloc]init];
    layerRed.bounds = CGRectMake(0, 0, 150, 350);
    layerRed.position = CGPointMake(150, 275);
    layerRed.anchorPoint = CGPointMake(0.5, 0.5);
    layerRed.backgroundColor = [UIColor redColor].CGColor;
    
    CALayer *layerGreen = [[CALayer alloc]init];
    layerGreen.bounds = CGRectMake(0, 0, 100, 300);
    layerGreen.position = CGPointMake(250, 230);
    layerGreen.anchorPoint = CGPointMake(0.5, 0.5);
    layerGreen.backgroundColor = [UIColor greenColor].CGColor;
    
    CALayer *layerImage = [[CALayer alloc]init];
    layerImage.bounds = CGRectMake(0, 0, 75, 75);
    layerImage.position = CGPointMake(150, 150);
    layerImage.anchorPoint = CGPointMake(0.5, 0.5);
    layerImage.contents = (id) [UIImage imageNamed:@"Icon-60"].CGImage;
    
    [self.view.layer insertSublayer:layerMagenta above:self.view.layer];
    [self.view.layer insertSublayer:layerGreen above:layerMagenta];
    [self.view.layer insertSublayer:layerRed above:layerGreen];
    [self.view.layer insertSublayer:layerImage above:layerRed];
}

- (void)scrollLayer
{
    
}

@end

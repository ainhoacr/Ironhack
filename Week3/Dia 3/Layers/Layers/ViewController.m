//
//  ViewController.m
//  Layers
//
//  Created by Ainhoa Calviño Rodriguez on 23/09/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "ViewController.h"
#import "MyScrollView.h"
#import "PathView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [self firstEjerciceLayers];
//    [self secondEjerciceLayers];
//    [self thirdEjerciceLayers];
    [self path];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)firstEjerciceLayers
{
    CGRect frame = CGRectMake(100, 100, 200, 200);
    
    UIView *view = [[UIView alloc]initWithFrame:frame];
    view.backgroundColor = [UIColor magentaColor];
    
    view.layer.backgroundColor = [UIColor redColor].CGColor;
    view.layer.borderColor = [UIColor blackColor].CGColor;
    view.layer.borderWidth = 2;
    view.layer.cornerRadius = view.frame.size.width / 2.0;
    view.layer.shadowOpacity = 1;
    view.layer.shadowRadius = 10;
    view.layer.shadowColor = [UIColor blackColor].CGColor;
    
    self.view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view];
    
    UIImageView *myImageView = [[UIImageView alloc]initWithFrame:view.bounds];
    myImageView.image = [UIImage imageNamed:@"kyra"];
    myImageView.contentMode = UIViewContentModeScaleAspectFit;
    myImageView.layer.cornerRadius = view.frame.size.width / 2.0;
    myImageView.layer.masksToBounds = YES;
    
    [view addSubview:myImageView];
}

- (void)secondEjerciceLayers
{
    CGRect frameLayer = CGRectMake(0, 0, 100, 100);
    CGRect frame = CGRectMake(100, 100, 200, 200);
    
    UIView *view = [[UIView alloc]initWithFrame:frame];
    view.backgroundColor = [UIColor magentaColor];
    
    CALayer *layer1 = [CALayer layer];
    layer1.backgroundColor = [UIColor blueColor].CGColor;
    layer1.bounds = frameLayer;
    layer1.anchorPoint = CGPointMake(0.7, 0.7);
    layer1.position = CGPointMake(0, 0);
    
    CALayer *layer2 = [CALayer layer];
    layer2.backgroundColor = [UIColor purpleColor].CGColor;
    layer2.bounds = frameLayer;
    layer2.position = CGPointMake(100, 300);
    
    CALayer *layer3 = [CALayer layer];
    layer3.backgroundColor = [UIColor cyanColor].CGColor;
    layer3.bounds = frameLayer;
    layer3.contents = (id) [UIImage imageNamed:@"kyra"].CGImage;
    layer3.position = CGPointMake(100, 500);
    
    [view.layer insertSublayer:layer1 above:view.layer];
    [view.layer insertSublayer:layer2 above:layer1];
    [view.layer insertSublayer:layer3 above:layer2];
    [self.view addSubview:view];
}

- (void)thirdEjerciceLayers
{
    CGRect rect = CGRectMake(8, 50, 350, 350);
    MyScrollView *myScrollView = [[MyScrollView alloc]initWithFrame:rect WithImage:@"kyra"];
    [self.view addSubview:myScrollView];
}

- (void)path
{
    PathView *pathView = [[PathView alloc]initWithFrame:self.view.frame];
    [pathView drawRect:CGRectMake(10, 10, 100, 100)];
    [self.view addSubview:pathView];
}
@end

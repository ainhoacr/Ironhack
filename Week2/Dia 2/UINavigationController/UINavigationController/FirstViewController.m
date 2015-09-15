//
//  FirstViewController.m
//  UINavigationController
//
//  Created by Ainhoa Calviño Rodriguez on 15/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()

@property (nonatomic, strong) UIButton *button;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor purpleColor];
    self.title = @"First";
    [self drawButton];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.barTintColor = [UIColor grayColor];
}

- (void)drawButton
{
    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.button setTitle:@"Siguiente" forState:UIControlStateNormal];
    self.button.frame = CGRectMake(0, 0, 200, 40);
    self.button.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height/2);
    
    [self.button addTarget:self action:@selector(presentNextViewController) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.button];
}

- (void)presentNextViewController
{
    SecondViewController *nextController = [[SecondViewController alloc]init];
    [self.navigationController pushViewController:nextController animated:YES];
}

@end

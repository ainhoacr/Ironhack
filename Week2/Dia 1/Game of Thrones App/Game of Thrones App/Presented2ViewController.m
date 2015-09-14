//
//  Presented2ViewController.m
//  Game of Thrones App
//
//  Created by Ainhoa Calviño Rodriguez on 14/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "Presented2ViewController.h"

@interface Presented2ViewController ()

@property (nonatomic, strong) UIButton *dismissButton;

@end

@implementation Presented2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    
    self.dismissButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.dismissButton.frame = CGRectMake(100, 100, 100, 40);
    [self.dismissButton setTitle:@"Cerrar" forState:UIControlStateNormal];
    
    [self.view addSubview:self.dismissButton];
    [self.dismissButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
}

- (void)dismiss
{
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

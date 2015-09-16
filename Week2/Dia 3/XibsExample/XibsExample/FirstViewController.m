//
//  FisrtViewController.m
//  XibsExample
//
//  Created by Ainhoa Calviño Rodriguez on 16/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonPressed:(UIButton *)button {
    SecondViewController *secondViewController = [[SecondViewController alloc]init];
    
    [self.navigationController pushViewController:secondViewController animated:YES];
}


@end

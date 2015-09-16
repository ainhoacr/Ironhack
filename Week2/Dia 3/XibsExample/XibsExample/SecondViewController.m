//
//  SecondViewController.m
//  XibsExample
//
//  Created by Ainhoa Calviño Rodriguez on 16/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UINib *viewNib = [UINib nibWithNibName:@"CustomView" bundle:[NSBundle mainBundle]];
    UIView *customView = [[viewNib instantiateWithOwner:self options:nil]lastObject];
    
    customView.frame = CGRectMake(20, 80, 200, 200);
    [self.view addSubview:customView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(UIButton *)sender
{
    ThirdViewController *thirdViewController = [[ThirdViewController alloc]initWithNibName:@"DetailThirdView" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:thirdViewController animated:YES];
}

@end

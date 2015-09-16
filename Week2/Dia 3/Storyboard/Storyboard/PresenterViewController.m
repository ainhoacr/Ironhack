//
//  PresenterViewController.m
//  Storyboard
//
//  Created by Ainhoa Calviño Rodriguez on 16/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "PresenterViewController.h"

@interface PresenterViewController ()

@end

@implementation PresenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    if (self.controllerColor)
    {
        self.view.backgroundColor = self.controllerColor;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)done:(UIStoryboardSegue *)sender
{
    
}

@end

//
//  SecondViewController.m
//  UINavigationController
//
//  Created by Ainhoa Calviño Rodriguez on 15/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.navigationController.navigationBar.barTintColor = [UIColor greenColor];
    self.title = @"Second View Controller";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(showToolBar)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showToolBar
{
    UIBarButtonItem *firstItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:nil action:nil];
    
    UIBarButtonItem *secondItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(popNavigationController)];
    
    UIBarButtonItem *separator = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    [self.navigationController setToolbarHidden:NO animated:YES];
    [self setToolbarItems:@[firstItem,separator, secondItem] animated:YES];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Hide" style:UIBarButtonItemStylePlain target:self action:@selector(cancelToolBar)];
}

- (void)cancelToolBar
{
    [self.navigationController setToolbarHidden:YES animated:NO];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(showToolBar)];
}

- (void)popNavigationController
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end

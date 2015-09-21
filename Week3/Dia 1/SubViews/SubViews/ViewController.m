//
//  ViewController.m
//  SubViews
//
//  Created by Ainhoa Calviño Rodriguez on 21/09/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MyView *myView = [[MyView alloc]initWithFrame:self.view.frame withTitle:@"Hola"];
    myView.backgroundColor = [UIColor magentaColor];
    [myView layoutSubviews];
    [self.view addSubview:myView];
    [self.view addSubview:myView.label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

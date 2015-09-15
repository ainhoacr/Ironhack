//
//  FirstViewController.m
//  TabBarViewController
//
//  Created by Ainhoa Calviño Rodriguez on 15/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()

@property (nonatomic, strong) UIButton *buttonAddTabBar;
@property (nonatomic, strong) UITextField *textFieldAddTitle;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor purpleColor];
    self.tabBarItem.title = @"Edit";
    
    [self drawButtonAddTabBar];
    [self drawTextFieldAddTitle];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)drawButtonAddTabBar
{
    self.buttonAddTabBar = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.buttonAddTabBar setTitle:@"Añadir" forState:UIControlStateNormal];
    self.buttonAddTabBar.frame = CGRectMake(0, 0, 200, 40);
    self.buttonAddTabBar.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height/2);
    
    [self.buttonAddTabBar addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.buttonAddTabBar];
}

- (void)buttonPressed:(UIButton *)button
{
    NSString *newTitle = self.textFieldAddTitle.text;
    
    if (newTitle.length != 0)
    {
        self.textFieldAddTitle.text = @"";
        SecondViewController *newViewController = [[SecondViewController alloc]init];
        newViewController.title = newTitle;
        newViewController.tabBarItem.badgeValue = @"3";
        newViewController.tabBarItem.image = [UIImage imageNamed:@"beer"];
        NSMutableArray *viewControllers = [self.tabBarController.viewControllers mutableCopy];
        
        [viewControllers addObject:newViewController];
        [self.tabBarController setViewControllers:viewControllers animated:YES];
    }
}

- (void)drawTextFieldAddTitle
{
    self.textFieldAddTitle = [[UITextField alloc]initWithFrame:CGRectMake(40, 100, 300, 40)];
    self.textFieldAddTitle.borderStyle = UITextBorderStyleRoundedRect;
    
    
    [self.view addSubview:self.textFieldAddTitle];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (NSString *)commonTitle
{
    if (!_commonTitle)
    {
        _commonTitle = @"Edit";
    }
    
    return _commonTitle;
}

@end

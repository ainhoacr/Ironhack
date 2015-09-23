//
//  SecondViewController.m
//  AutoLayoutBasic
//
//  Created by Joan Romano on 8/31/15.
//  Copyright (c) 2015 Ironhack. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (nonatomic, strong) UIView *grayView;
@property (nonatomic, strong) UIView *blueView;
@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UILabel *textLabel;

@end

@implementation SecondViewController

- (void)loadView
{
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.grayView = [[UIView alloc] initWithFrame:CGRectMake(10, 90, 300, 100)];
    self.grayView.backgroundColor = [UIColor lightGrayColor];
    self.grayView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.grayView];
    
    self.blueView = [[UIView alloc] initWithFrame:CGRectMake(230, CGRectGetMaxY(self.grayView.frame) + 20, 80, 80)];
    self.blueView.backgroundColor = [UIColor blueColor];
    self.blueView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.blueView];
    
    self.textLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(self.grayView.frame) + 20, 200, 80)];
    self.textLabel.text = @"I have some longer text here that I want to wrap onto multiple lines.";
    self.textLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.textLabel.numberOfLines = 0;
    [self.view addSubview:self.textLabel];
    
    self.redView = [[UIView alloc] initWithFrame:CGRectMake(125, 400, 70, 70)];
    self.redView.backgroundColor = [UIColor redColor];
    self.redView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.redView];
    
    /*
    // long aproach
    NSLayoutConstraint *leadingConstrait = [NSLayoutConstraint constraintWithItem:self.grayView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:10];
    
    NSLayoutConstraint *trailingConstrait = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.grayView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:10];
    
    NSLayoutConstraint *topConstrait = [NSLayoutConstraint constraintWithItem:self.grayView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:10];
    
    NSLayoutConstraint *bottomConstrait = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.grayView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:10];
    
    [self.view addConstraints:@[leadingConstrait, trailingConstrait, topConstrait, bottomConstrait]];
     */
    
    /*
    // VFL (visual format lenguage
    
    NSDictionary *metrics = @{
                              @"leadingSpace":@10,
                              @"trailingSpace":@10,
                              @"topSpace":@10,
                              @"bottomSpace":@10,
                              @"separation":@20
                              };
    UIView *localGrayView = self.grayView;
    UIView *localBlueView = self.blueView;
    
    NSDictionary *views = NSDictionaryOfVariableBindings(localGrayView, localBlueView);
    NSArray *horizontalConstrait = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-leadingSpace-[localGrayView(==localBlueView)]-separation-[localBlueView]-trailingSpace|" options:0 metrics:metrics views:views];
    [self.view addConstraints:horizontalConstrait];
    
    NSArray *verticalConstraitGreyView = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-topSpace-[localGrayView]-bottomSpace|" options:0 metrics:metrics views:views];
    [self.view addConstraints:verticalConstraitGreyView];
    
    NSArray *verticalConstraitBlueView = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-topSpace-[localBlueView]-bottomSpace|" options:0 metrics:metrics views:views];
    [self.view addConstraints:verticalConstraitBlueView];
    */
    
}

@end

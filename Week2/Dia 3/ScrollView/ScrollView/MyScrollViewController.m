//
//  MyScrollViewController.m
//  ScrollView
//
//  Created by Ainhoa Calviño Rodriguez on 16/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "MyScrollViewController.h"

@interface MyScrollViewController () <UIScrollViewDelegate>

@property (nonatomic, weak) IBOutlet UIScrollView *myScrollView;
@property (nonatomic, strong) UILabel *label1;
@property (nonatomic, strong) UILabel *label2;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *draggingButton;
@property (nonatomic,weak) IBOutlet UIBarButtonItem *deceleratingButton;

@end

@implementation MyScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.label1 = [[UILabel alloc]initWithFrame:CGRectMake(10, 40, 200, 40)];
    self.label1.text = @"Label 1";
    
    self.label2 = [[UILabel alloc]initWithFrame:CGRectMake(10, 900, 200, 40)];
    self.label2.text = @"Label 2";
    
    [self.myScrollView addSubview:self.label1];
    [self.myScrollView addSubview:self.label2];
    
    self.myScrollView.contentSize = CGSizeMake(self.myScrollView.frame.size.width, self.label2.frame.origin.y + self.label2.frame.size.height);
    
    [self configureLabels];
}

- (void)configureLabels
{
    self.myScrollView.delegate = self;
    [self.navigationController setToolbarHidden:NO];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.deceleratingButton.tintColor = [UIColor redColor];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    self.draggingButton.tintColor = [UIColor redColor];
    self.deceleratingButton.tintColor = decelerate ? [UIColor greenColor] : [UIColor redColor];
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    self.deceleratingButton.tintColor = [UIColor greenColor];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    self.draggingButton.tintColor = [UIColor greenColor];
}

- (IBAction)goFirstPressed:(UIBarButtonItem *)sender
{
    [self.myScrollView scrollRectToVisible:self.label1.frame animated:NO];
}

- (IBAction)goSecondPressed:(UIBarButtonItem *)sender
{
    [self.myScrollView scrollRectToVisible:self.label2.frame animated:YES];
}

@end

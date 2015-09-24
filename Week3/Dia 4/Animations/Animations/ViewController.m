//
//  ViewController.m
//  Animations
//
//  Created by Ainhoa Calviño Rodriguez on 24/09/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *myImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadImages];
    self.myImageView.animationDuration = 1;
    self.myImageView.animationRepeatCount = 0;
    [self.myImageView startAnimating];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadImages
{
    NSMutableArray *array = [[NSMutableArray alloc]init];
    for (NSUInteger i=1; i<=16; i++)
    {
        NSString *nameImage = [NSString stringWithFormat:@"win_%ld",i];
        UIImage *image = [UIImage imageNamed:nameImage];
        [array addObject:image];
    }
    self.myImageView.animationImages = [array copy];
    self.myImageView.contentMode = UIViewContentModeScaleAspectFit;
}
@end

//
//  ViewController.m
//  PagingExample
//
//  Created by Ainhoa Calviño Rodriguez on 16/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIScrollView *myScrollView;
@property (nonatomic, strong) NSArray *imagesArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpScrollView];
}

- (void) setUpScrollView
{
    UIImage *alhambra = [UIImage imageNamed:@"alhambra"];
    UIImage *mahou = [UIImage imageNamed:@"mahou"];
    UIImage *estrellaGalicia = [UIImage imageNamed:@"estrella_galicia"];
    UIImage *guinness = [UIImage imageNamed:@"guinness"];
    UIImage *sierraNevada = [UIImage imageNamed:@"sierra_nevada"];
    
    self.imagesArray = @[alhambra, mahou, estrellaGalicia, guinness, sierraNevada];
    
    CGFloat xOffset = 0;
    for (UIImage *image in self.imagesArray) {
        UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
        imageView.frame = CGRectMake(xOffset, 0, self.myScrollView.frame.size.width, self.myScrollView.frame.size.height);
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.clipsToBounds = YES;
        xOffset = xOffset + self.myScrollView.frame.size.width;
        
        [self.myScrollView addSubview:imageView];
    }
    
    self.myScrollView.contentSize = CGSizeMake(xOffset, self.myScrollView.frame.size.height);
}
@end

//
//  ViewController.m
//  Beers
//
//  Created by Ainhoa Calviño Rodriguez on 11/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "AlphaViewController.h"

@interface AlphaViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *image;
@property (nonatomic, assign) BOOL changeImage;

@end

@implementation AlphaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

 - (IBAction)sliderMoved:(id)sender
{
    UISlider *slider = (UISlider *) sender;
 
    self.image.alpha = slider.value;
}

- (IBAction)buttonPressed:(id)sender
{
    if (self.changeImage)
    {
        [self.image setImage:[UIImage imageNamed:@"beer1"]];
    }
    else
    {
        [self.image setImage:[UIImage imageNamed:@"beer2"]];
    }
    
    self.changeImage = !self.changeImage;
}

- (IBAction)downloadPressed:(id)sender {
    NSURL *imageURL = [NSURL URLWithString:@"http://diyfather.com/wp-content/uploads/darth-vader-cat1.jpg"];
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    UIImage *image = [UIImage imageWithData:imageData];
    
    [self.image setImage:image];
}

@end

//
//  EuroConverterViewController.m
//  Beers
//
//  Created by Ainhoa Calviño Rodriguez on 11/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "EuroConverterViewController.h"
#import "EuroConverter.h"

@interface EuroConverterViewController ()

@property (nonatomic, weak) IBOutlet UITextField *textField;

@end

@implementation EuroConverterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonConverterPressed:(id)sender
{
    NSString *text = self.textField.text;
    float euro = [EuroConverter convertFromPesetaToEuro:[text intValue]];
    NSLog(@"Result %f", euro);
}

@end

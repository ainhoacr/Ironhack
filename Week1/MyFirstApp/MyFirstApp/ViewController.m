//
//  ViewController.m
//  MyFirstApp
//
//  Created by Ainhoa Calviño Rodriguez on 08/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIAlertViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate>//<MyProtocol> para implementar el protocolo sin que lo sepan los demas

@end

@implementation ViewController
//- (id) copy
//{
//    return [super copy];
//}
//
//- (id) mutableCopy
//{
//    return [super mutableCopy];
//}



- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

//    NSString *string =@"Alex";
//    NSMutableString *mut = [string mutableCopy];
//    [mut appendString:@" Mola"];
//    id inmut = [mut copy];
//    
//    if ([inmut isKindOfClass:[NSString class]])
//    {
//        
//    }
//    
//    [inmut class];

    [self doThings];
    
    ViewController *vc = [[ViewController alloc] init];
    
    [vc addObserver:self forKeyPath:@"myKVOString" options:kNilOptions context:nil];
    
    vc.myKVOString = @"CAMBIO";
    
    [vc removeObserver:self forKeyPath:@"myKVOString"];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"TITULO" message:@"MENSAJE" delegate:self cancelButtonTitle:@"CANCEL" otherButtonTitles:@"DK", @"OK", nil];
//    
//    [alert show];
    
    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"%@", [alertView buttonTitleAtIndex:buttonIndex]);
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 7;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [NSString stringWithFormat:@"Row %ld", row];
}

- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"FUNCIONA");
}

- (void) doThings
{
    self.doThingsExecuted = YES;
    NSLog(@"DONE!");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonTouch:(id)sender
{
    
}
@end

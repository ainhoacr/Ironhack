//
//  RotatingTableViewController.m
//  GeoIP
//
//  Created by Ainhoa Calviño Rodriguez on 14/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "RotatingTableViewController.h"

@interface RotatingTableViewController ()

@end

@implementation RotatingTableViewController

- (BOOL)shouldAutorotate{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

@end

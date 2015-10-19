//
//  RotatingViewController.m
//  GeoIP
//
//  Created by Ainhoa Calviño Rodriguez on 14/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "RotatingViewController.h"

@interface RotatingViewController ()

@end

@implementation RotatingViewController

- (BOOL)shouldAutorotate{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

@end

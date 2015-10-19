//
//  GeoIPDetailViewController.h
//  GeoIP
//
//  Created by Ainhoa Calviño Rodriguez on 13/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GeoIP.h"
#import "RotatingViewController.h"

@interface GeoIPDetailViewController : RotatingViewController

@property (nonatomic, strong) GeoIP *geoIP;

@end

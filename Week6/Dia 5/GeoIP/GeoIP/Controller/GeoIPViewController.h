//
//  GeoIPController.h
//  GeoIP
//
//  Created by Ainhoa Calviño Rodriguez on 13/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "GeoIP.h"
#import "RotatingTableViewController.h"

@interface GeoIPViewController : RotatingTableViewController

@property (strong, nonatomic) NSManagedObjectContext *parentContext;  //parent
@property (strong, nonatomic) NSManagedObjectContext *childContext; // child -UI

@end

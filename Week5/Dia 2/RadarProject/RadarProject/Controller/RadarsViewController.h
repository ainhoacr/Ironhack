//
//  RadarsViewController.h
//  RadarProject
//
//  Created by Ainhoa Calviño Rodriguez on 06/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "Radar.h"

@interface RadarsViewController : UITableViewController

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end

//
//  FakeRadarGenerator.h
//  RadarProject
//
//  Created by Ainhoa Calviño Rodriguez on 06/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSManagedObjectContext+ACInsertManageObject.h"

@interface FakeRadarGenerator : NSObject

- (void)generateRadarsInContext:(NSManagedObjectContext *)context;

@end

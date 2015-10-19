//
//  JSONRadarMapper.h
//  RadarProject
//
//  Created by Ainhoa Calviño Rodriguez on 08/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Radar.h"
#import "RadarJSON.h"

@interface JSONRadarMapper : NSObject

+ (NSArray<Radar *> *)mapJSONRadars:(NSArray<RadarJSON *> *)jsonRadars inContext:(NSManagedObjectContext *)context;

@end

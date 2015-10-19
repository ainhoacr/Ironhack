//
//  JSONRadarMapper.m
//  RadarProject
//
//  Created by Ainhoa Calviño Rodriguez on 08/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "JSONRadarMapper.h"

@implementation JSONRadarMapper

+ (NSArray<Radar *> *)mapJSONRadars:(NSArray<RadarJSON *> *)jsonRadars inContext:(NSManagedObjectContext *)context
{

    NSMutableArray<Radar *> *radars = [NSMutableArray arrayWithCapacity:jsonRadars.count];
    
    for (RadarJSON *radarJSON in jsonRadars) {
        Radar *radar = [Radar radarWithUser:radarJSON.user andTitle:radarJSON.title inContext:context];
        [radars addObject:radar];
    }
    
    NSError *error;
    [context save:&error];
    if (error) {
        return nil;
    }

    
    return radars;
}

@end

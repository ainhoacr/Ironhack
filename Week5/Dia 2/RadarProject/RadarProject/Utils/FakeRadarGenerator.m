//
//  FakeRadarGenerator.m
//  RadarProject
//
//  Created by Ainhoa Calviño Rodriguez on 06/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "FakeRadarGenerator.h"
#import "Radar.h"

@implementation FakeRadarGenerator

- (void)generateRadarsInContext:(NSManagedObjectContext *)context
{

    for (int i = 0; i < 10; i++)
    {
        Radar *radar = (Radar *) [context inserNewObjectForEntityForName:[Radar description]];
        radar.user = @"ainhoa@ainhoa.com";
        radar.title = @"title";
    }
    
    NSError *error;
    [context save:&error];
}

@end

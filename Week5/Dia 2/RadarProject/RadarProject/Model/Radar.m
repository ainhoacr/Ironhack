//
//  Radar.m
//  RadarProject
//
//  Created by Ainhoa Calviño Rodriguez on 06/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "Radar.h"
#import "NSManagedObjectContext+ACInsertManageObject.h"

@implementation Radar

+ (Radar *)radarWithUser:(NSString *)user andTitle:(NSString *)title inContext:(NSManagedObjectContext *)context
{
    Radar *radar = (Radar *)[context inserNewObjectForEntityForName:[Radar description]];
    radar.user = user;
    radar.title = title;
    
    return radar;
}

+ (NSFetchRequest *)fetchRequestWithFields:(NSArray<NSString *>*)fields andOrders:(NSArray<NSNumber *>*)orders
{
    if (fields.count != orders.count) {
        return nil;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:[Radar description]];
    
    [fetchRequest setFetchBatchSize:20];
    NSMutableArray<NSSortDescriptor *>*sortDescriptors = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < fields.count; i++) {
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:fields[i] ascending:orders[i].boolValue];
        [sortDescriptors addObject:sortDescriptor];
    }
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    return fetchRequest;
}

@end

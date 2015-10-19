//
//  NSManagedObjectContext+ACInsertManageObject.m
//  RadarProject
//
//  Created by Ainhoa Calviño Rodriguez on 06/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "NSManagedObjectContext+ACInsertManageObject.h"

@implementation NSManagedObjectContext (ACInsertManageObject)

- (NSManagedObject *)inserNewObjectForEntityForName:(NSString *)entityName
{
    NSManagedObject *object = [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:self];    
    return object;
}

@end

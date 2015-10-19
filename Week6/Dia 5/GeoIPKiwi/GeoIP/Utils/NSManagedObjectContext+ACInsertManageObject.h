//
//  NSManagedObjectContext+ACInsertManageObject.h
//  RadarProject
//
//  Created by Ainhoa Calviño Rodriguez on 06/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObjectContext (ACInsertManageObject)

- (NSManagedObject *)inserNewObjectForEntityForName:(NSString *)entityName;

@end

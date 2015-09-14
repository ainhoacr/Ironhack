//
//  Hotel.h
//  Beers
//
//  Created by Ainhoa Calviño Rodriguez on 11/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface Hotel : NSObject

- (void)addPerson:(Person *)person;
- (Person *)whichPersonInRoom:(NSString *)room;
- (NSUInteger)occupiedRooms;
- (NSArray *)rooms;
@end

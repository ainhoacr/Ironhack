//
//  Hotel.m
//  Beers
//
//  Created by Ainhoa Calviño Rodriguez on 11/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "Hotel.h"

@interface Hotel()

@property (nonatomic, strong) NSMutableDictionary *hotel;

@end

@implementation Hotel

- (NSMutableDictionary *)hotel
{
    if (!_hotel)
    {
        _hotel = [[NSMutableDictionary alloc]init];
    }
    
    return _hotel;
}

- (void)addPerson:(Person *)person
{
    NSString *room = [NSString stringWithFormat:@"%ld", self.hotel.count];
    self.hotel[room] = person;
}

- (Person *) whichPersonInRoom:(NSString *)room
{
    return self.hotel[room];
}

- (NSUInteger)occupiedRooms
{
    return self.hotel.count;
}

- (NSArray *)rooms
{
    return self.hotel.allKeys;
}
@end

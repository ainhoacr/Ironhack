//
//  Car.h
//  Vehicles
//
//  Created by Ainhoa Calviño Rodriguez on 10/09/15.
//  Copyright (c) 2015 Ironhack. All rights reserved.
//

#import "Vehicle.h"

@interface Car : Vehicle

@property (nonatomic, readonly, assign) NSUInteger numberOfDoors;
@property (nonatomic, readonly, assign, getter=isConvertible) BOOL convertible;
@property (nonatomic, readonly, assign, getter=isHatback) BOOL hatchback;
@property (nonatomic, readonly, assign, getter=hasSunroof) BOOL sunroof;

+ (instancetype)carWithModelYear:(NSUInteger)modelYear powerSource:(NSString *)powerSource brandName:(NSString *)brandName modelName:(NSString *)modelName numberOfDoors:(NSUInteger)numberOfDoors convertible:(BOOL)convertible hatchback:(BOOL)hatchback sunroof:(BOOL)sunroof;

- (instancetype)initWithModelYear:(NSUInteger)modelYear powerSource:(NSString *)powerSource brandName:(NSString *)brandName modelName:(NSString *)modelName numberOfDoors:(NSUInteger)numberOfDoors convertible:(BOOL)convertible hatchback:(BOOL)hatchback sunroof:(BOOL)sunroof;

@end

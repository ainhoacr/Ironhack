//
//  Car.m
//  Vehicles
//
//  Created by Ainhoa Calviño Rodriguez on 10/09/15.
//  Copyright (c) 2015 Ironhack. All rights reserved.
//

#import "Car.h"

@interface Car()

@property (nonatomic, assign) NSUInteger numberOfDoors;
@property (nonatomic, assign, getter=isConvertible) BOOL convertible;
@property (nonatomic, assign, getter=isHatback) BOOL hatchback;
@property (nonatomic, assign, getter=hasSunroof) BOOL sunroof;

@end

@implementation Car

@synthesize numberOfWheels = _numberOfWheels;
@synthesize numberOfDoors = _numberOfDoors;
@synthesize convertible = _convertible;
@synthesize hatchback = _hatchback;
@synthesize sunroof = _sunroof;

#pragma mark Initializers

+ (instancetype)carWithModelYear:(NSUInteger)modelYear powerSource:(NSString *)powerSource brandName:(NSString *)brandName modelName:(NSString *)modelName numberOfDoors:(NSUInteger)numberOfDoors convertible:(BOOL)convertible hatchback:(BOOL)hatchback sunroof:(BOOL)sunroof
{
    return [[self alloc] initWithModelYear:modelYear powerSource:powerSource brandName:brandName modelName:modelName numberOfDoors:numberOfDoors convertible:convertible hatchback:hatchback sunroof:sunroof];
}

- (instancetype)initWithModelYear:(NSUInteger)modelYear powerSource:(NSString *)powerSource brandName:(NSString *)brandName modelName:(NSString *)modelName numberOfDoors:(NSUInteger)numberOfDoors convertible:(BOOL)convertible hatchback:(BOOL)hatchback sunroof:(BOOL)sunroof
{
    self = [super initWithModelYear:modelYear numberOfWheels:4 powerSource:powerSource brandName:brandName modelName:modelName];
    
    if (self)
    {
        _numberOfDoors = numberOfDoors;
        _convertible = convertible;
        _hatchback = hatchback;
        _sunroof = sunroof;
    }
    
    return self;
}

#pragma mark Public Methods

- (NSString *)forward
{
    return [NSString stringWithFormat:@"%@ Gear: %@ \n Depress the gas pedal", [self start], [self changeGear:@"D"]];
}

- (NSString *)backward
{
    return [NSString stringWithFormat:@"%@ Gear: %@ \nCheck your rear view mirror and depress the gas pedal", [self start], [self changeGear:@"R"]];

}

- (NSString *)stopsMoving
{
    return [NSString stringWithFormat:@"%@ Gear: %@ \nBreak pedal and then change gear", [self start], [self changeGear:@"N"]];

}

- (NSString *)makesNoise
{
    return @"BRUMMM! %@";

}

#pragma mark Private Methods

- (NSString *)start
{
    return @"Car power source has started";
}
@end

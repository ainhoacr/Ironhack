//
//  Vehicle.m
//  Vehicles
//
//  Created by Joan Romano on 9/7/15.
//  Copyright (c) 2015 Ironhack. All rights reserved.
//

#import "Vehicle.h"

@interface Vehicle()

@property (nonatomic, assign) NSUInteger modelYear;
@property (nonatomic, assign) NSUInteger numberOfWheels;
@property (nonatomic, copy) NSString *powerSource;
@property (nonatomic, copy) NSString *brandName;
@property (nonatomic, copy) NSString *modelName;

@end

@implementation Vehicle

#pragma mark - Initializers

+ (instancetype)vehicleInitWithModelYear: (NSUInteger)modelYear numberOfWheels:(NSUInteger)numberOfWheels powerSource:(NSString *)powerSource brandName:(NSString *)brandName modelName:(NSString *)modelName
{
    return [[self alloc]initWithModelYear:modelYear numberOfWheels:numberOfWheels powerSource:powerSource brandName:brandName modelName:modelName];
}

- (instancetype)initWithModelYear: (NSUInteger)modelYear numberOfWheels:(NSUInteger)numberOfWheels powerSource:(NSString *)powerSource brandName:(NSString *)brandName modelName:(NSString *)modelName
{
    self = [self init];
    if (self)
    {
        self.modelYear = modelYear;
        self.numberOfWheels = numberOfWheels;
        self.powerSource = powerSource;
        self.brandName = brandName;
        self.modelName = modelName;
    }
    
    return self;
}

#pragma mark - Public Methods

- (NSString *)forward
{
    return [NSString stringWithFormat:@"Vehicle go forward: %@",nil];;
}

- (NSString *)backward
{
    return [NSString stringWithFormat:@"Vehicle go backward: %@",nil];;
}

- (NSString *)stopsMoving
{
    return [NSString stringWithFormat:@"Vehicle stop moving: %@",nil];
}

- (NSString *)makesNoise
{
    return [NSString stringWithFormat:@"Vehicle make noise: %@",nil];
}

- (NSString *)changeGear: (NSString *)newGear
{
    return [NSString stringWithFormat:@"Vehicle change gears: Put %@ into %@ gear", self.modelName, newGear];
}

- (NSString *)turn: (NSUInteger) degrees
{
    return [NSString stringWithFormat:@"Vehicle turn: Turn %ld degreees.",degrees % 360];
}

@end
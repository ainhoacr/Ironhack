//
//  Vehicle.h
//  Vehicles
//
//  Created by Joan Romano on 9/7/15.
//  Copyright (c) 2015 Ironhack. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Vehicle : NSObject

@property (nonatomic, readonly, assign) NSUInteger modelYear;
@property (nonatomic, readonly, assign) NSUInteger numberOfWheels;
@property (nonatomic, readonly, copy) NSString *powerSource;
@property (nonatomic, readonly, copy) NSString *brandName;
@property (nonatomic, readonly, copy) NSString *modelName;

+ (instancetype)vehicleInitWithModelYear: (NSUInteger)modelYear numberOfWheels:(NSUInteger)numberOfWheels powerSource:(NSString *)powerSource brandName:(NSString *)brandName modelName:(NSString *)modelName;

- (instancetype)initWithModelYear: (NSUInteger)modelYear numberOfWheels:(NSUInteger)numberOfWheels powerSource:(NSString *)powerSource brandName:(NSString *)brandName modelName:(NSString *)modelName;

- (NSString *) forward;
- (NSString *) backward;
- (NSString *) stopsMoving;
- (NSString *) makesNoise;

- (NSString *) changeGear: (NSString *)newGear;
- (NSString *) turn: (NSUInteger) degrees;
@end

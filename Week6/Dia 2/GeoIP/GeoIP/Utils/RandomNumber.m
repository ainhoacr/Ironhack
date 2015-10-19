//
//  RandomNumber.m
//  GeoIP
//
//  Created by Ainhoa Calviño Rodriguez on 13/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "RandomNumber.h"

@implementation RandomNumber

+ (NSUInteger)randomNumberBetweenZeroAnd:(NSUInteger)number {
    return arc4random_uniform((u_int32_t) number);
}

@end

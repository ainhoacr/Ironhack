//
//  MapPin.m
//  MapKitHelloWorld
//
//  Created by Ainhoa Calviño Rodriguez on 13/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "MapPin.h"

@interface MapPin ()

@end

@implementation MapPin

- (instancetype)initWithCoordinate:(CLLocationCoordinate2D)coordinate {
    self = [super init];
    if (self) {
        _coordinate = coordinate;
    }
    return self;
}

@end

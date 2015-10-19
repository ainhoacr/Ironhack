//
//  CoreLocationServer.m
//  MapKitHelloWorld
//
//  Created by Ainhoa Calviño Rodriguez on 13/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "CoreLocationServer.h"
#import <CoreLocation/CoreLocation.h>
#import "CoreLocationServer.h"

@implementation CoreLocationServer

+ (BOOL)isLocationServiceAuthorizedByUser {
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    
    if (status == kCLAuthorizationStatusAuthorizedAlways || status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        return YES;
    }
    
    return NO;
}

@end

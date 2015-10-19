//
//  JSONGeoIPMapper.m
//  GeoIP
//
//  Created by Ainhoa Calviño Rodriguez on 13/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "JSONGeoIPMapper.h"

@implementation JSONGeoIPMapper

+ (GeoIP *)mapJSONRadars:(GeoIPJSON *)jsonGeoIPs inContext:(NSManagedObjectContext *)context {
    
    GeoIP *geoIP = [GeoIP geoIPWithIp:jsonGeoIPs.ip country:jsonGeoIPs.country latitude:jsonGeoIPs.latitude andLongitude:jsonGeoIPs.longitude inContext:context];
    
    NSError *error;
    [context save:&error];
    if (error) {
        return nil;
    }
    
    
    return geoIP;
}

@end

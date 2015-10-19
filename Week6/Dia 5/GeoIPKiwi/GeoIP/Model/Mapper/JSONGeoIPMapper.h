//
//  JSONGeoIPMapper.h
//  GeoIP
//
//  Created by Ainhoa Calviño Rodriguez on 13/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GeoIP.h"
#import "GeoIPJSON.h"

@interface JSONGeoIPMapper : NSObject

+ (GeoIP *)mapJSONRadars:(GeoIPJSON *)jsonGeoIPs inContext:(NSManagedObjectContext *)context;

@end

//
//  JSONParser.m
//  GeoIP
//
//  Created by Ainhoa Calviño Rodriguez on 13/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "JSONParser.h"

@implementation JSONParser

+ (GeoIPJSON *)parseJSONString:(NSString *)jsonAsString {
    if (jsonAsString == nil || jsonAsString.length == 0) {
        return nil;
    }
    
    NSData *data = [jsonAsString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    
    if (error || jsonData.count == 1) {
        return nil;
    }
    
    return [self parseRadarJSON:jsonData];
}

+ (GeoIPJSON *)parseRadarJSON:(NSDictionary *)dict
{
    
    GeoIPJSON *geoIP = [[GeoIPJSON alloc]init];
    
    NSString *country = [dict objectForKey:@"country"];
    NSString *ip = [dict objectForKey:@"ip"];
    NSString *latitude = [dict objectForKey:@"latitude"];
    NSString *longitude = [dict objectForKey:@"longitude"];
    NSString *dmaCode = [dict objectForKey:@"dma_code"];
    NSString *asn = [dict objectForKey:@"asn"];
    NSString *countryCode = [dict objectForKey:@"country_code"];
    NSString *isp = [dict objectForKey:@"isp"];
    NSString *areaCode = [dict objectForKey:@"area_code"];
    NSString *continentCode = [dict objectForKey:@"continent_code"];
    NSString *continentCode3 = [dict objectForKey:@"continent_code3"];
    NSString *offset = [dict objectForKey:@"offset"];
    NSString *timeZone = [dict objectForKey:@"timezone"];
    NSString *city = [dict objectForKey:@"city"];
    NSString *postalCode = [dict objectForKey:@"postal_code"];
    NSString *region = [dict objectForKey:@"region"];
    NSString *regionCode = [dict objectForKey:@"region_code"];
    
    geoIP.country = country;
    geoIP.ip = ip;
    geoIP.latitude = [latitude floatValue];
    geoIP.longitude = [longitude floatValue];
    
    return geoIP;
}

@end

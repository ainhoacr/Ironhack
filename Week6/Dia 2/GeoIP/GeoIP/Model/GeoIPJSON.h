//
//  GeoIPJSON.h
//  GeoIP
//
//  Created by Ainhoa Calviño Rodriguez on 13/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GeoIPJSON : NSObject

@property (nonatomic, copy) NSString *country;
@property (nonatomic, copy) NSString *ip;
@property (nonatomic, copy) NSString *dmaCode;
@property (nonatomic, copy) NSString *asn;
@property (nonatomic, copy) NSString *countryCode;
@property (nonatomic, copy) NSString *isp;
@property (nonatomic, copy) NSString *areaCode;
@property (nonatomic, copy) NSString *continentCode;
@property (nonatomic, copy) NSString *continentCode3;
@property (nonatomic, copy) NSString *offset;
@property (nonatomic, copy) NSString *timeZone;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *postalCode;
@property (nonatomic, copy) NSString *region;
@property (nonatomic, copy) NSString *regionCode;
@property (nonatomic, assign) float longitude;
@property (nonatomic, assign) float latitude;


@end

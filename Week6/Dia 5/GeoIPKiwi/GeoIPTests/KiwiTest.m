//
//  KiwiTest.m
//  GeoIP
//
//  Created by Ainhoa Calviño Rodriguez on 16/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "GeoIPJSON.h"

SPEC_BEGIN(GeoIPJson)

describe(@"When using GeoIPJSON objects in memory", ^{
    it(@"after creation it returns a non-nil object", ^{
        
        GeoIPJSON *sut = [[GeoIPJSON alloc]init];
        [[sut shouldNot] beNil];
    });
    
    it(@"should store the IP address", ^{
        GeoIPJSON *sut = [[GeoIPJSON alloc]init];
        sut.ip = @"10.10.10.10";
        
        [[sut.ip shouldNot] beNil];
        [[sut.ip should] equal:@"10.10.10.10"];
    });
});

SPEC_END
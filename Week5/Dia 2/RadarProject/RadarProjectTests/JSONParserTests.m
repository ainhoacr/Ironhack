//
//  JSONParserTests.m
//  RadarProject
//
//  Created by Ainhoa Calviño Rodriguez on 07/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JSONParser.h"
#import "Radar.h"
#import "StubFileUtil.h"

@interface JSONParserTests : XCTestCase

@end

@implementation JSONParserTests

- (void)testJSONParserShouldReturnNilWhenPassedAnEmptyJSONString {
    
    NSArray<RadarJSON *> *radars = [JSONParser parseJSONString:@""];
    XCTAssertNil(radars);
}

- (void)testJSONParserShouldReturnOneRadarWhenPassedAJSONStringWithOneRadar {
    NSString *stub = [StubFileUtil loadStubFileNamed:@"OneRadarResultStub"];
    
    NSArray<RadarJSON *> *radars = [JSONParser parseJSONString:stub];
    XCTAssertNotNil(radars);
    XCTAssertEqual(1, radars.count);
}

- (void)testJSONParserShouldReturnNilWhenPassedAJSONStringWithEmptyRadars {
    NSString *stub = [StubFileUtil loadStubFileNamed:@"EmptyRadarsArrayStub"];
    
    NSArray<RadarJSON *> *radars = [JSONParser parseJSONString:stub];
    XCTAssertEqual(0, radars.count);
}

- (void)testJSONParserShouldReturnOneRadarWhenPassedAnJSONStringWithTenRadars {
    
    NSString *stub = [StubFileUtil loadStubFileNamed:@"TenRadarResultStub"];
    
    NSArray<RadarJSON *> *radars = [JSONParser parseJSONString:stub];
    
    XCTAssertNotNil(radars);
    XCTAssertEqual(10, radars.count);
    
}

@end

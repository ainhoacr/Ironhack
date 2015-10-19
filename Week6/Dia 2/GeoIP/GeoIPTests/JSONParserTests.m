//
//  JSONParserTests.m
//  GeoIP
//
//  Created by Ainhoa Calviño Rodriguez on 14/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JSONParser.h"
#import "GeoIPJSON.h"
#import "StubFileUtil.h"

@interface JSONParserTests : XCTestCase

@end

@implementation JSONParserTests

- (void)testJsonParserReturnNilWithNilInputString {
    GeoIPJSON *sut = [JSONParser parseJSONString:nil];
    XCTAssertNil(sut);
}

- (void)testJsonParserReturnsNilWithEmptyInputString {
    GeoIPJSON *sut = [JSONParser parseJSONString:@""];
    XCTAssertNil(sut);
}

- (void)testJsonParserReturnsCorrectIpJsonWithInputJson {
    NSString *json = [StubFileUtil loadStubFileNamed:@"GeoIPCorrectJSON"];
    
    GeoIPJSON *sut = [JSONParser parseJSONString:json];
    XCTAssertNotNil(sut);
    XCTAssertTrue([sut.ip isEqualToString:@"68.0.2.1"]);
}

@end

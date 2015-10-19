//
//  RandomIPTests.m
//  GeoIP
//
//  Created by Ainhoa Calviño Rodriguez on 13/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RandomIP.h"

@interface RandomIPTests : XCTestCase

@end

@implementation RandomIPTests

- (void)testGenerateARandomIP {
    NSString *ip = [[self randomIP] generateARandomIP];
    XCTAssertNotNil(ip);
    XCTAssertTrue([ip isKindOfClass:[NSString class]]);
    
    NSArray *numbersIP = [ip componentsSeparatedByString:@"."];
    for (NSString *item in numbersIP) {
        XCTAssertNotNil(item);
        
        XCTAssertTrue([item integerValue] >= 0);
        XCTAssertTrue([item integerValue] <= 255);
    }
    
}

- (void)testGenerateRandomIPWithAnyNumber {
    NSArray *ips = [[self randomIP] generateRandomIPs:0];
    XCTAssertNil(ips);
}

- (void)testGenerateOneRamdonIP {
    NSArray *ips = [[self randomIP] generateRandomIPs:1];
    XCTAssertNotNil(ips);
    XCTAssertTrue(ips.count == 1);
    
    for (NSString *ip in ips) {
        XCTAssertNotNil(ip);
        NSArray *numbersIP = [ip componentsSeparatedByString:@"."];
        for (NSString *item in numbersIP) {
            XCTAssertNotNil(item);
            
            XCTAssertTrue([item integerValue] >= 0);
            XCTAssertTrue([item integerValue] <= 255);
        }
    }
}

- (void)testGenerateTenRandomIPs {
    NSArray *ips = [[self randomIP] generateRandomIPs:10];
    XCTAssertNotNil(ips);
    XCTAssertTrue(ips.count == 10);
    
    for (NSString *ip in ips) {
        XCTAssertNotNil(ip);
        NSArray *numbersIP = [ip componentsSeparatedByString:@"."];
        for (NSString *item in numbersIP) {
            XCTAssertNotNil(item);
            
            XCTAssertTrue([item integerValue] >= 0);
            XCTAssertTrue([item integerValue] <= 255);
        }
    }
}

- (RandomIP *)randomIP {
    return [[RandomIP alloc]init];
}

@end

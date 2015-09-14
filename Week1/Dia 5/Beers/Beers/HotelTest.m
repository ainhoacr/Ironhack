//
//  HotelTest.m
//  Beers
//
//  Created by Ainhoa Calviño Rodriguez on 11/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Hotel.h"

@interface HotelTest : XCTestCase

@end

@implementation HotelTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    
    Hotel *hotel = [[Hotel alloc]init];
    Person *person = [[Person alloc]initWithName:@"Iago"];
    Person *person1 = [[Person alloc]initWithName:@"Ainhoa"];
    
    XCTAssertTrue(hotel, @"Hotel is null");
    [hotel addPerson:person];
    [hotel addPerson:person1];
    XCTAssert(hotel.occupiedRooms == 2, @"Hotel not 2 person");
    
    Person *p = [hotel whichPersonInRoom:@"0"];
    XCTAssert([p.name isEqualToString:@"Iago"], @"Which person is not correct");
    p = nil;
    
    Person *p1 = [hotel whichPersonInRoom:@"1"];
    XCTAssert([p1.name isEqualToString:@"Ainhoa"], @"Which person is not correct");
    p1 = nil;
    
    NSArray *keys = [hotel rooms];
    XCTAssert(keys.count == 2, @"Hotel have correct rooms");
    keys = nil;
    
    person = nil;
    person1 = nil;
    hotel = nil;
}

@end

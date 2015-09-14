//
//  PersonTests.m
//  Beers
//
//  Created by Ainhoa Calviño Rodriguez on 11/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Person.h"

@interface PersonTests : XCTestCase

@end

@implementation PersonTests

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
    Person *personTest = [[Person alloc] init];
    XCTAssertTrue(personTest.name == nil, @"Name is not null");
    XCTAssertTrue(personTest.address == nil, @"Address is not null");
    XCTAssertTrue(personTest.age == 0, @"Age is not 0");
    personTest = nil;
    
    Person *personTest1 = [[Person alloc]initWithName:@"Prueba"];
    XCTAssertTrue([personTest1.name isEqualToString:@"Prueba"], @"Name is not Prueba");
    XCTAssertTrue(personTest1.address == nil, @"Address is not null");
    XCTAssertTrue(personTest1.age == 0, @"Age is not 0");
    personTest1=nil;
    
    Person *personTest2 = [[Person alloc]initWithName:@"Prueba" address:@"Calle Brasil"];
    XCTAssertTrue([personTest2.name isEqualToString:@"Prueba"], @"Name is not Prueba");
    XCTAssertTrue([personTest2.address isEqualToString:@"Calle Brasil"], @"Address is Calle Brasil");
    XCTAssertTrue(personTest2.age == 0, @"Age is not 0");
    
    Person *personTest3 =[[Person alloc]initWithName:@"Prueba" address:@"Calle Brasil" age:22];
    XCTAssertTrue([personTest3.name isEqualToString:@"Prueba"], @"Name is not Prueba");
    XCTAssertTrue([personTest3.address isEqualToString:@"Calle Brasil"], @"Address is Calle Brasil");
    XCTAssertTrue(personTest3.age == 22, @"Age is not 22");
}

@end

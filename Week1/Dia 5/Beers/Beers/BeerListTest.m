//
//  BeerListTest.m
//  Beers
//
//  Created by Ainhoa Calviño Rodriguez on 11/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "BeerList.h"

@interface BeerListTest : XCTestCase

@end

@implementation BeerListTest

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
    BeerList *beerList = [[BeerList alloc]init];
    XCTAssert(beerList.count == 0, @"Initializer not correct");
    
    NSNumber *n = [beerList valueForKey:@"count"];
    XCTAssert(n.integerValue == 0, @"Initializer KVC not correct");
    
    [beerList addBeer:@"Estrella Galicia"];
    XCTAssert(beerList.count == 1, @"AddBeer not correct");
    
    [beerList removeBeer:@"Estrella Galicia"];
    XCTAssert(beerList.count == 0, @"RemoveBeer not correct");
    
    [beerList addBeer:@"Estrella Galicia"];
    [beerList addBeer:@"Mahou"];
    [beerList addBeer:@"Paulaner"];
    [beerList addBeer:@"Damn"];
    XCTAssert(beerList.allBeers.count == 4, @"AllBeers not correct");
    
    [beerList removeBeer:@"Estrella Galicia"];
    [beerList removeBeer:@"Mahou"];
    [beerList removeBeer:@"Paulaner"];
    [beerList removeBeer:@"Damn"];
    XCTAssert(beerList.allBeers.count == 0, @"AllBeers not correct");
    
    for (int i=0; i<100; i++) {
        NSString *name = [NSString stringWithFormat:@"Beer%d",i];
        [beerList addBeer:name];
    }
    XCTAssert(beerList.allBeers.count == 100, @"AllBeers not correct");
    
    beerList = nil;
}

@end

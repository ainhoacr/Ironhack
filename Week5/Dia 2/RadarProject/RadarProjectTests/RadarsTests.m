//
//  RadarTest.m
//  RadarProject
//
//  Created by Ainhoa Calviño Rodriguez on 06/10/15.
//  Copyright © 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CoreDataStack.h"
#import "Radar.h"
#import "NSManagedObjectContext+ACInsertManageObject.h"

@interface RadarsTests : XCTestCase

@property (nonnull, nonatomic, strong) CoreDataStack *coreDataStack;
@property (nonnull, nonatomic, strong) NSManagedObjectContext *context;

@end

@implementation RadarsTests

- (void)setUp
{
    self.coreDataStack = [[CoreDataStack alloc] init];
    
    self.context = self.coreDataStack.managedObjectContext;
}

- (void)tearDown
{
    
}

- (void)testCanInsertANewValidRadar
{
    Radar *radar = [self insertRadar];
    XCTAssertNotNil(radar);
    
    NSError *error;
    [self.context save:&error];
    XCTAssertNil(error);
}

- (void)testCantInsertAnInvalidRadarWithWrongEmail
{
    Radar *radar = [self insertRadar];
    radar.user = @"fail://thisisnotanemail.com";
    
    XCTAssertNotNil(radar);
    NSError *error;
    [self.context save:&error];
    XCTAssertNotNil(error);
}

- (void)testCanDeleteAFreshlyInsertedRadar
{
    NSError *error;
    NSArray<Radar *> *result = [self.context executeFetchRequest:[self constructFechtRequest] error:&error];
    NSUInteger countFirst = result.count;
    
    Radar *radar = [self insertRadar];
    XCTAssertNotNil(radar);
    result = nil;
    result = [self.context executeFetchRequest:[self constructFechtRequest] error:&error];
    NSUInteger countAfterInsert = result.count;
    XCTAssertTrue(countFirst + 1 == countAfterInsert);
    
    [self.context deleteObject:radar];
    
    error = nil;
    [self.context save:&error];
    XCTAssertNil(error);
    
    error = nil;
    result = nil;
    result = [self.context executeFetchRequest:[self constructFechtRequest] error:&error];
    XCTAssertNil(error);
    XCTAssertNotNil(result);
    XCTAssertTrue(result.count == countFirst);
    XCTAssertTrue(result.count == countAfterInsert - 1);

}

- (void)testQueryRadar
{
    Radar *radar = [self insertRadar];
    XCTAssertNotNil(radar);
    
    NSError *error;
    [self.context save:&error];
    XCTAssertNil(error);
    
    error = nil;
    NSUInteger count = [self countAllRadars:&error];
    XCTAssertNil(error);
    XCTAssertTrue(count > 0);

}

- (NSUInteger)countAllRadars:(NSError **)radarErrror
{
    NSUInteger radarCount;
    NSFetchRequest *request = [self constructFechtRequest];
    
    NSError *error;
    radarCount = [[self.context executeFetchRequest:request error:&error] count];
    
    *radarErrror = error;
    return radarCount;
}

- (NSFetchRequest *)constructFechtRequest
{
    NSFetchRequest *query = [[NSFetchRequest alloc] initWithEntityName:[Radar description]];
    NSSortDescriptor *orderByEmail = [[NSSortDescriptor alloc] initWithKey:@"user" ascending:YES];
    [query setSortDescriptors:@[orderByEmail]];
    
    return query;
}

- (Radar *)insertRadar
{
    Radar *radar = (Radar *)[self.context inserNewObjectForEntityForName:[Radar description]];
    radar.user = @"ainhoa@ainhoa.com";
    radar.title = @"Title";
    return radar;
}

@end

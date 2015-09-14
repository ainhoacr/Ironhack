//
//  Person.h
//  Beers
//
//  Created by Ainhoa Calviño Rodriguez on 11/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, assign) NSUInteger age;
@property (nonatomic, assign, getter=isMarried) BOOL married;

+ (Person *)createPersonWithName:(NSString *)name;
+ (Person *)createPersonWithName:(NSString *)name address:(NSString *)address;

- (instancetype)initWithName:(NSString *)name address:(NSString *)address age:(NSUInteger)age NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithName:(NSString *)name address:(NSString *)address;
- (instancetype)initWithName:(NSString *)name;
@end

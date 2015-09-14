//
//  Person.m
//  Beers
//
//  Created by Ainhoa Calviño Rodriguez on 11/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithName: (NSString *)name address:(NSString *)address age:(NSUInteger)age
{
    self = [super init];
    
    if (self)
    {
        self.name = name;
        self.address = address;
        self.age = age;
    }
    
    return self;
}

- (instancetype)initWithName:(NSString *)name address:(NSString *)address
{
    return [self initWithName:name address:address age:0];
}

- (instancetype)initWithName:(NSString *)name;
{
    return [self initWithName:name address:nil];
}

- (instancetype)init
{
    return [self initWithName:nil];
}

+ (Person *)createPersonWithName:(NSString *)name;
{
    return [[Person alloc]initWithName:name];
}

+ (Person *)createPersonWithName:(NSString *)name address:(NSString *)address
{
    return [[Person alloc]initWithName:name address:address];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Name %@, address %@, age %ld", self.name, self.address, self.age];
}

@end

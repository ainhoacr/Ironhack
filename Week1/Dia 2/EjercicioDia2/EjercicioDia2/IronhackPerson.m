//
//  IronhackPerson.m
//  EjercicioDia2
//
//  Created by Ainhoa Calviño Rodriguez on 08/09/15.
//  Copyright (c) 2015 Ainhoa Calviño Rodriguez. All rights reserved.
//

#import "IronhackPerson.h"

@implementation IronhackPerson

- (instancetype) init
{
    return [self initWithFirstName:nil lastName:nil birthDate:nil];
}


+ (instancetype)person
{
    return [self personWithFirstName:nil lastName:nil birthDate:nil];
}


+ (instancetype)personWithFirstName:(NSString *)firstName lastName:(NSString *)lastName birthDate:(NSDate *)birth
{
    return [[self alloc] initWithFirstName:firstName lastName:lastName birthDate:birth];
}


- (instancetype)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName birthDate:(NSDate *)birth
{
    self = [super init];
    
    if (self)
    {
        self.firstName = firstName;
        self.lastName = lastName;
        self.birth = birth;
    }
    
    return self;
}

- (NSString *) description
{
    return [NSString stringWithFormat:@"%@ %@",self.firstName, self.lastName];
}

- (void) sayHello
{
    [self saySomething: [NSString stringWithFormat: @"Hello %@", self.firstName]];
}

- (void) saySomething:(NSString *)greeting
{
    NSLog(@"%@", greeting);
}
@end
